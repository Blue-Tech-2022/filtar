<form id="updateForm" method="POST" action="{{route('governorate.update',$row->id)}}">
    @csrf

    <div class="form-group">
        <label for="governorate_name_ar" class="form-control-label">العنوان</label>
        <input type="text" class="form-control" name="governorate_name_ar" value="{{$row->governorate_name_ar}}">
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
        <button type="submit" class="btn btn-success" id="updateButton">تعديل</button>
    </div>
</form>


<script>
    $('.dropify').dropify()
</script>

