<form id="updateForm" class="addForm" method="POST" action="{{route('contact.store')}}">
    @csrf
    <div class="form-group">
        <label for="message" class="form-control-label">ارسال رد الي {{$user->first_name.' '.$user->last_name}}</label>
        <textarea rows="3" required type="text" class="form-control" name="message"></textarea>
        <input type="hidden" value="{{$user->id}}" name="user_id">
        <input type="hidden" value="{{$type}}" name="type">
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
        <button type="submit" class="btn btn-primary" id="updateButton">ارسال</button>
    </div>
</form>
