<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Models\CleanTimeCondition;
use App\Models\User;
use App\Models\UserFilterCleanTime;
use App\Traits\GeneralTrait;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FilterController extends Controller
{
    use GeneralTrait;

    public function addFilter(request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'candle_number' => 'required|integer|between:1,7',
            'water_type' => 'required|in:good,medium,bad',
            'filter_candle' => 'required|array',
            'filter_candle.*.candle_number' => 'required|between:1,7|distinct',
            'filter_candle.*.last_clean_time' => 'nullable|date_format:Y-m-d'
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(), 400);

        if (count($request->filter_candle) < $request->candle_number)
            return $this->returnError('يجب ارسال جميع الشمعات حتي اذا كنت لا تتذكر تاريخ اخر تغيير ارسل رقم الشمعة', 405);

        $user = User::find($request->user_id);
        $user->update($request->only('water_type', 'candle_number'));
        $user->filter_times()->delete();


        for ($i = 0; $i < $request->candle_number; $i++) {
//            $row  = UserFilterCleanTime::where([['user_id',$request->id],['candle_number',$value['candle_number']]])->first();
            $last_clean = ($request->filter_candle[$i]['last_clean_time']) ?? $user->created_at;
            $days = CleanTimeCondition::where([['water_type', $request->water_type], ['candle_number', $request->filter_candle[$i]['candle_number']]])->first()->change_after;
            $change_after = Carbon::parse($last_clean)->addDays($days);
            UserFilterCleanTime::Create([
                'user_id' => $request->user_id,
                'candle_number' => ($request->filter_candle[$i]['candle_number']) ?? $i,
                'last_clean_time' => ($request->filter_candle[$i]['last_clean_time']) ?? $user->created_at,
                'coming_clean_time' => $change_after
            ]);
        }

        $user = User::with('filter_times')->find($request->user_id);
        return $this->returnData('data', $user);

    }

    public function editFilter(request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id|exists:user_filter_clean_times,user_id',
            'candle_number' => 'required|integer|between:1,7',
            'last_clean_time' => 'nullable|date_format:Y-m-d'
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(), 400);

        $time = UserFilterCleanTime::where([['user_id', $request->user_id], ['candle_number', $request['candle_number']]])->first();
        $user = User::find($request->user_id);


        if (!$time)
            return $this->returnError('هذا المستخدم لديه ' . $user->candle_number . ' شمعات فقط', 405);


        if ($request->has('last_clean_time') && $request->last_clean_time != null)
            $last_clean = $request['last_clean_time'];
        else if ($time->last_clean_time != null)
            $last_clean = $time->last_clean_time;
        else
            $last_clean = $user->created_at;



        $days = CleanTimeCondition::where([['water_type', $user->water_type], ['candle_number', $request->candle_number]])->first()->change_after;
        $change_after = Carbon::parse($last_clean)->addDays($days);
        $time->update([
            'last_clean_time' => $last_clean,
            'coming_clean_time' => $change_after
        ]);

//        $checkForComing = UserFilterCleanTime::where([['user_id',$request->user_id],['candle_number',$request['candle_number']+1]])->first();
//        if($checkForComing){
//            $checkForComing->update([
//                'coming_clean_time' => $change_after
//            ]);
//        }
        $user = User::with('filter_times')->find($request->user_id);
//        return $time;
        return $this->returnData('data', $user);

    }

    public function checkForNotifications()
    {
        // الاشعارات بتوصل قبل يوم وقبل اسبوع وبعد 15 يوم
        $before_15 = Carbon::parse(date('Y-m-d'))->subDays(5);
        $after_week = Carbon::parse(date('Y-m-d'))->addWeek();
        $after_day = Carbon::parse(date('Y-m-d'))->addDay();
        $rows = UserFilterCleanTime::where('coming_clean_time', $before_15)
            ->orWhere('coming_clean_time', $after_week)
            ->orWhere('coming_clean_time', $after_day)
            ->get();
//        return $rows;
        // notify
        foreach ($rows as $row) {
            if ($row->coming_clean_time == $after_day->format('Y-m-d'))
                fireBase($row->user_id, null, 'يرجي الانتباه بأن موعد تغيير الشمعة رقم ' . $row->candle_number . ' بعد يوم', 200, $row->candle_number);
            if ($row->coming_clean_time == $before_15->format('Y-m-d'))
                fireBase($row->user_id, null, 'نذكرك بأن ميعاد تغيير الشمعة رقم ' . $row->candle_number . ' كان يوم ' . $before_15->format('Y-m-d') . ' هل تريد تأكيد التغيير ؟', 300, $row->candle_number, $before_15->format('Y-m-d'));
            if ($row->coming_clean_time == $after_week->format('Y-m-d'))
                fireBase($row->user_id, null, 'يرجي الانتباه بأن موعد تغيير الشمعة رقم ' . $row->candle_number . ' بعد اسبوع', 100, $row->candle_number);
        }
    }

    public function myCleaningTimes(request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id|exists:user_filter_clean_times,user_id',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(), 400);

        $times = UserFilterCleanTime::with('user')->where([['user_id', $request->user_id]])->get();

        foreach ($times as $time) {
            $to = Carbon::createFromFormat('Y-m-d', $time->coming_clean_time);
            $from = Carbon::createFromFormat('Y-m-d', date('Y-m-d'));
            $time['remaining_month'] = $to->diffInMonths($from);
            $time['remaining_days'] = $to->diffInDays($from) % 30;
        }
        return $this->returnData('data', $times, 'get success');
    }

    public function firstCleaningTime(request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id|exists:user_filter_clean_times,user_id',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(), 400);

        $time = UserFilterCleanTime::orderBy('coming_clean_time', 'ASC')
            ->where('user_id', $request->user_id)
//            ->where('coming_clean_time', '>=', date('Y-m-d'))
            ->first();
        if ($time) {
            $data = UserFilterCleanTime::where([['coming_clean_time', $time->coming_clean_time], ['user_id', $request->user_id]])
                ->select('candle_number', 'coming_clean_time')
                ->get();

            foreach ($data as $row) {
                $to = Carbon::createFromFormat('Y-m-d', date('Y-m-d'));
                $from = Carbon::createFromFormat('Y-m-d', $row['coming_clean_time']);
                if ($from > $to) {
                    $row['diff_in_days'] = $to->diffInDays($from) % 30;
                    $row['diff_in_month'] = (int)($to->diffInDays($from) / 30);
                } else {
                    $row['diff_in_days'] = 0;
                    $row['diff_in_month'] = 0;
                }
            }
            return $this->returnData('data', $data, 'get success');
        } else {
            return $this->returnData('data', [], 'no Data');
        }

    }
}
