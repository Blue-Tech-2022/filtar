@extends('Admin/layouts/master')
@section('title') {{$setting->title}} | بيانات الشركة @endsection
@section('page_name') بيانات الشركة @endsection
@section('content')
    @if(count($errors) > 0 )
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <ul class="p-0 m-0" style="list-style: none;">
                @foreach($errors->all() as $error)
                    <li><i class="fa fa-times-circle"></i> {{$error}}</li>
                @endforeach
            </ul>
        </div>
    @endif
    <div class="row">
        <div class="col-md-12">
            <form action="{{route('settingUpdate')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="card">
                    <div class="card-header">
                        <h3 class="mb-0 card-title"> بيانات {{($setting->title) ?? ''}}</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">اسم التطبيق</label>
                                    <input type="text" class="form-control" name="title"
                                           placeholder="اسم التطبيق" value="{{($setting->title) ?? ''}}">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">رابط فيسبوك</label>
                                    <input type="text" class="form-control" name="facebook"
                                           placeholder="https://www.facebook.com/your_id"
                                           value="{{($setting->facebook) ?? ''}}">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">رابط سنات شات</label>
                                    <input type="text" class="form-control" name="snapchat"
                                           placeholder="https://www.snapchat.com/snapchat_id"
                                           value="{{($setting->snapchat) ?? ''}}">
                                </div>
                            </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">الضريبة</label>
                                        <input type="text" class="form-control" name="tax"
                                               placeholder="%"
                                               value="{{($setting->tax) ?? ''}}">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">رابط انستجرام</label>
                                        <input type="text" class="form-control" name="insta"
                                               placeholder="https://www.instagram.com/your_id"
                                               value="{{($setting->insta) ?? ''}}">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">رابط تويتر</label>
                                        <input type="text" class="form-control" name="twitter"
                                               placeholder="https://www.twitter.com/your_id"
                                               value="{{($setting->twitter) ?? ''}}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">اسم التطبيق</label>
                                    <input type="text" class="form-control" name="title"
                                           placeholder="اسم التطبيق" value="{{($setting->title) ?? ''}}">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">معلومات للمستخدم</label>
                                    <input type="text" class="form-control" name="user_info"
                                           placeholder="تظهر في صفحة التسجيل"
                                           value="{{($setting->user_info) ?? ''}}">
                                </div>
                            </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="form-label">معلومات لمقدم الخدمة</label>
                                <input type="text" class="form-control" name="provider_info"
                                       placeholder="تظهر في صفحة التسجيل"
                                       value="{{($setting->provider_info) ?? ''}}">
                            </div>
                        </div>
                            <div class="col-md-12 ">
                                <div class="form-group">
                                    <label class="form-label">اللوجو</label>
                                    <input type="file" class="dropify" name="logo"
                                           data-default-file="{{asset($setting->logo)}}"
                                           accept="image/png, image/gif, image/jpeg,image/jpg"/>
                                </div>
                            </div>
                        </div>
                    <div class="card-footer text-left">
                        <button type="submit" class="btn btn-lg btn-primary">تحديث</button>
                    </div>
                    </div>
                </div>
            </form>
        </div>




@endsection
