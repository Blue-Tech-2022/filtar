<form id="addForm" class="addForm" method="POST" action="{{route('categories.store')}}">
    @csrf

    <div class="form-group">
        <label for="title_ar" class="form-control-label">العنوان</label>
        <input type="text" class="form-control" name="title">
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
        <button type="submit" class="btn btn-primary" id="addButton">اضافة</button>
    </div>
</form>
