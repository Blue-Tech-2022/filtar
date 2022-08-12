<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Explanation;
use App\Models\ExplanationTag;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\View\View;
use Yajra\DataTables\DataTables;

class ExplainationController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:عرض الشروحات')->only('index');
        $this->middleware('permission:اضافة شروحات')->only('create','store');
        $this->middleware('permission:حذف شروحات')->only('delete');
    }

    public function index(request $request)
    {
        if($request->ajax()) {
//            <button type="button" data-id="' . $data->id . '" class="btn btn-pill btn-info-light editBtn"><i class="fa fa-edit"></i></button>

            $data = Explanation::latest()->get();
            return Datatables::of($data)
                ->addColumn('action', function ($data) {
                    $checkDelete = (auth()->guard('admin')->user()->can('حذف شروحات')) ? 'display:inline-block' : 'display:none';
                    return '
                            <button style="'.$checkDelete.'" class="btn btn-pill btn-danger-light" data-toggle="modal" data-target="#delete_modal"
                                    data-id="' . $data->id . '" data-title="' . $data->title . '">
                                    <i class="fas fa-trash"></i>
                            </button>
                       ';
                })
                ->addColumn('tags', function ($data) {
                    $html = '';
                    foreach ($data->tags as $tag){
                        $html .= "<span class='tag tag-rounded tag-cyan'>#".$tag->title."</span>"." ";
                    }
                    return "<div class='tags'>".$html."</div>";
                })
                ->editColumn('desc', function ($data) {
                    return Str::limit($data->desc,70);
                })
                ->editColumn('link', function ($data) {
                    return '<a class="btn btn-pill btn-success" target="_blank" href="'.$data->link.'">معاينة <i class="fa fa-play text-white"></i> </a>';
                })
                ->escapeColumns([])
                ->make(true);
        }else{
            return view('Admin/explaination/index');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Application|Factory|View
     */
    public function create(){
        $tags = ExplanationTag::select('title')->get();
        return view('Admin/explaination/parts.create',compact('tags'));
    }

    public function store(request $request)
    {
        $data = $request->validate([
            'link'  => 'required|url',
            'title' => 'required|max:255',
            'desc'  => 'required',
            'tags'  => 'nullable|array',
        ],[
            'link.required'  => 'يرجي اضافة رابط فيديو الشرح',
            'link.url'       => 'رابط الفيديو يجب ان يكون رابط كامل يبدأ ب https',
            'title.required' => 'يرجي اضافة عنوان الشرح',
            'desc.required'  => 'يرجي وصف الشرح',
        ]);

        $data['link'] = $this->getYoutubeEmbedUrl($data['link']);

        unset($data['tags']);

        $row = Explanation::create($data);

        foreach ($request->tags as $tag_title){
            ExplanationTag::create([
                'explanation_id' => $row->id,
                'title'          => $tag_title,
            ]);
        }

        if($row)
            return response()->json(['status'=>200]);
        else
            return response()->json(['status'=>405]);
    }

    public function edit($id){
        $tagsData = ExplanationTag::select('title')->get();
//        $tagsData = ExplanationTag::select('title')->distinct()->get();
        $explanation = Explanation::findOrFail($id);
        $explanationRows = $explanation->tags->pluck('title')->toArray();
        return view('Admin/explaination/parts.edit',compact('tagsData','explanation','explanationRows'));
    }



    public function show($id)
    {
        //
    }

    public function update(request $request)
    {
        $data = $request->validate([
            'link'  => 'required|url',
            'title' => 'required|max:255',
            'desc'  => 'required',
            'tags'  => 'nullable|array',
        ],[
            'link.required'  => 'يرجي اضافة رابط فيديو الشرح',
            'link.url'       => 'رابط الفيديو يجب ان يكون رابط كامل يبدأ ب https',
            'title.required' => 'يرجي اضافة عنوان الشرح',
            'desc.required'  => 'يرجي وصف الشرح',
        ]);

        $data['link'] = $this->getYoutubeEmbedUrl($data['link']);

        unset($data['tags']);

        $row = Explanation::create($data);

        foreach ($request->tags as $tag_title){
            ExplanationTag::create([
                'explanation_id' => $row->id,
                'title'          => $tag_title,
            ]);
        }

        if($row)
            return response()->json(['status'=>200]);
        else
            return response()->json(['status'=>405]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function delete(Request $request)
    {
        $row = Explanation::findOrFail($request->id);
        $row->delete();
        return response(['message'=>'تم الحذف بنجاح','status'=>200],200);
    }

    function getYoutubeEmbedUrl($url)
    {
        $shortUrlRegex = '/youtu.be\/([a-zA-Z0-9_-]+)\??/i';
        $longUrlRegex = '/youtube.com\/((?:embed)|(?:watch))((?:\?v\=)|(?:\/))([a-zA-Z0-9_-]+)/i';

        if (preg_match($longUrlRegex, $url, $matches)) {
            $youtube_id = $matches[count($matches) - 1];
        }

        if (preg_match($shortUrlRegex, $url, $matches)) {
            $youtube_id = $matches[count($matches) - 1];
        }
        return 'https://www.youtube.com/embed/' . $youtube_id ;
    }
}
