<link href="{{asset('assets/admin')}}/assets/plugins/select2/select2.min.css" rel="stylesheet"/>

<div class="modal-body">
    <form id="updateForm" method="POST" enctype="multipart/form-data" action="{{route('admins.update',$admin->id)}}" >
    @csrf
        @method('PUT')
        <div class="form-group">
            <label for="name" class="form-control-label">الصورة</label>
            <input type="file" id="testDrop" class="dropify" name="image" data-default-file="{{get_user_file($admin->image)}}"/>
        </div>
        <div class="form-group">
            <label for="name" class="form-control-label">الاسم</label>
            <input type="text" class="form-control" name="name" id="name" value="{{$admin->name}}">
        </div>
        <div class="form-group">
            <label class="form-label">تخصيص أدوار</label>
            <select name="roles[]" class="form-control select2" data-placeholder="تخصيص الصلاحيات" multiple>
                @foreach($roles as $role)
                    <option value="{{$role->id}}" {{in_array($role->id, $rolePermissions) ? 'selected' : ''}}>{{$role->name}}</option>
                @endforeach
            </select>
        </div>
        <div class="form-group">
            <label for="email" class="form-control-label">الايميل</label>
            <input type="text" class="form-control" name="email" id="email" value="{{$admin->email}}">
        </div>
        <div class="form-group">
            <label for="password" class="form-control-label">كلمة المرور</label>
            <input type="password" class="form-control" name="password" id="password" placeholder="********">
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
            <button type="submit" class="btn btn-success" id="updateButton">تحديث</button>
        </div>
    </form>
</div>
<script>
    $('.dropify').dropify()
</script>
<script src="{{asset('assets/admin')}}/assets/js/select2.js"></script>
<script src="{{asset('assets/admin')}}/assets/plugins/select2/select2.full.min.js"></script>
