<form id="updateForm" method="POST" action="{{route('nationalities.update',$row->id)}}">
    @csrf
    @method('PUT')
    <div class="form-group">
        <label for="name" class="form-control-label">الصورة</label>
        <input type="file" class="dropify" name="image" data-default-file="{{$row->image}}" accept="image/png, image/gif, image/jpeg,image/jpg"/>
    </div>
    <div class="form-group">
        <label for="title_ar" class="form-control-label">العنوان</label>
        <input type="text" class="form-control" name="title_ar" value="{{$row->title_ar}}">
    </div>
    <div class="form-group">
        <label for="phone_code" class="form-control-label">رمز الاتصال</label>
        <input type="text" class="form-control" name="phone_code" placeholder="+20" value="{{$row->phone_code}}">
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
        <button type="submit" class="btn btn-success" id="updateButton">تعديل</button>
    </div>
</form>


<script>
    $('.dropify').dropify()
</script>

