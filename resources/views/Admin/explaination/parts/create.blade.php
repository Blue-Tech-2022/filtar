<link href="{{asset('assets/admin')}}/assets/plugins/select2/select2.min.css" rel="stylesheet"/>


<form id="addForm" class="addForm" method="POST" action="{{route('explanations.store')}}">
    @csrf

    <div class="form-group">
        <label for="title" class="form-control-label">العنوان</label>
        <input type="text" class="form-control" name="title">
    </div>
    <div class="form-group">
        <label for="desc" class="form-control-label">الوصف</label>
        <textarea rows="3" type="text" class="form-control" name="desc"></textarea>
    </div>
    <div class="form-group">
        <label for="link" class="form-control-label">رابط الفيديو</label>
        <input type="text" class="form-control" name="link" placeholder="https://www.youtube.com/watch?v=video_id">
    </div>

    <div class="form-group">
        <label class="form-label">كلمات مفتاحية</label>
        <select name="tags[]" class="form-control select2" data-placeholder=" كلمات مفتاحية " multiple>
            @foreach($tags as $tag)
                <option value="{{$tag->title}}">{{$tag->title}}</option>
            @endforeach
        </select>
    </div>


    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
        <button type="submit" class="btn btn-primary" id="addButton">اضافة</button>
    </div>
</form>

<script src="{{asset('assets/admin')}}/assets/js/select2.js"></script>
<script src="{{asset('assets/admin')}}/assets/plugins/select2/select2.full.min.js"></script>

