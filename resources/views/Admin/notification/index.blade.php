@extends('Admin/layouts/master')

@section('title')
    {{($setting->title) ?? 'تطبيق الفلتر'}} | اشعار عام
@endsection
@section('page_name') اشعار عام @endsection
@section('content')
    <link href="{{asset('assets/admin')}}/assets/plugins/select2/select2.min.css" rel="stylesheet"/>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="card">
                <div class="inbox card-body">
                    <form action="{{route('postNotifications.post')}}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-row mb-4">
                            <label class="col-sm-2 col-form-label">إلي :</label>
                            <div class="col-sm-10">
                                <select name="user_type" class="form-control select2" id="selectAll" required data-placeholder="اختار المجموعة">
                                    <option value="all">الكل</option>
                                    <option value="providers">التجار</option>
                                    <option value="users">العملاء</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row mb-4">
                            <label class="col-3 col-sm-2 col-md-3 col-lg-2 col-form-label">نص الاشعار</label>
                            <div class="col-9 col-sm-10 col-md-9 col-lg-10">
                                <textarea class="form-control" required name="message" id="message" placeholder="اكتب نص الاشعار ..."></textarea>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div class="row">
                                <div class="col-lg-12 mb-0 col-md-6 col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary btn-space mt-2">ارسال</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div><!-- COL-END -->
    </div>

@endsection
@section('js')
    <script src="{{asset('assets/admin')}}/js/select2.js"></script>
    <script src="{{asset('assets/admin')}}/assets/plugins/select2/select2.full.min.js"></script>
@endsection


