<link href="{{asset('assets/admin')}}/assets/plugins/select2/select2.min.css" rel="stylesheet"/>

<form id="updateForm" method="POST" action="{{route('explanations.update',$explanation->id)}}">
    @csrf
    @method('PUT')


    <div class="form-group">
        <label for="title" class="form-control-label">العنوان</label>
        <input type="text" class="form-control" name="title" value="{{$explanation->title}}">
    </div>
    <div class="form-group">
        <label for="desc" class="form-control-label">الوصف</label>
        <textarea rows="3" type="text" class="form-control" name="desc">{{$explanation->desc}}</textarea>
    </div>
    <div class="form-group">
        <label for="link" class="form-control-label">رابط الفيديو</label>
        <input type="text" class="form-control" name="link" placeholder="https://www.youtube.com/watch?v=video_id" value="{{$explanation->link}}">
    </div>

{{--    <div class="form-group">--}}
{{--        <label class="form-label">كلمات مفتاحية</label>--}}
{{--        <select name="tags[]" class="form-control select2" data-placeholder=" كلمات مفتاحية " multiple>--}}
{{--            @foreach($tagsData as $tag)--}}
{{--                <option {{in_array($tag->title,$explanationRows) ? 'selected' : ''}} value="{{$tag->title}}">{{$tag->title}}</option>--}}
{{--            @endforeach--}}
{{--        </select>--}}
{{--    </div>--}}


    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
        <button type="submit" class="btn btn-success" id="updateButton">تعديل</button>
    </div>
</form>


<script src="{{asset('assets/admin')}}/assets/js/select2.js"></script>
<script src="{{asset('assets/admin')}}/assets/plugins/select2/select2.full.min.js"></script>
