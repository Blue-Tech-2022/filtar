<form id="updateForm" method="POST" action="{{route('categories.update',$category->id)}}">
    @csrf
    @method('PUT')
    <div class="form-group">
        <label for="title_ar" class="form-control-label">العنوان</label>
        <input type="text" class="form-control" name="title" value="{{$category->title}}">
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
        <button type="submit" class="btn btn-success" id="updateButton">تعديل</button>
    </div>
</form>

