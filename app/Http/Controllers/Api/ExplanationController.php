<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Explanation;
use App\Models\ExplanationTag;
use App\Traits\GeneralTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ExplanationController extends Controller
{
    use GeneralTrait;

    public function latestExplanation()
    {
        $data = Explanation::with('tags')->latest()->first();
        return $this->returnData('data', $data);
    }


    public function allExplanations()
    {
        $data = Explanation::with('tags')->get();
        return $this->returnData('data', $data);
    }

    public function allExplanationsTags()
    {
        $data = ExplanationTag::groupBy('title')->select('id','title')->get();
        return $this->returnData('data', $data);
    }


    public function searchExplanations(request $request)
    {
        $validator = Validator::make($request->all(), [
            'tag_title' => 'required',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(), 400);

        if ($request->tag_title != 'الكل') {
            $data = Explanation::whereHas('tags', function ($query) use ($request) {
                $query->where('title', 'like', '%' . $request->tag_title . '%');
            })->with('tags')->get();
        } else
            $data = Explanation::with('tags')->get();


        return $this->returnData('data', $data);
    }


    public function oneExplanation(request $request)
    {
        $validator = Validator::make($request->all(), [
            'explanation_id' => 'required|exists:explanations,id',
        ]);

        if ($validator->fails())
            return $this->returnError($validator->getMessageBag(), 400);


        $data = Explanation::with('tags')->where('id',$request->explanation_id)->first();


        return $this->returnData('data', $data);
    }

}
