@extends('Admin/layouts/master')
@section('title')
    {{$provider->first_name.' '.$provider->last_name}}
@endsection
@section('page_name') بيانات التاجر @endsection
@section('content')
    <div class="row">
        <div class="col-lg-4">
            <div class="card">
                <div class="card-body">
                    <div class="wideget-user text-center">
                        <div class="wideget-user-desc">
                            <div class="wideget-user-img">
                                <img class="" src="{{$provider->logo}}" alt="img"></div>
                            <div class="user-wrap"><h4
                                    class="mb-1">{{$provider->first_name.' '.$provider->last_name}}</h4> <h6
                                    class="text-muted mb-4">
                                    وقت الانضمام : {{$provider->created_at->diffForHumans()}}</h6>
                                <a href="tel:{{$provider->phone_code.$provider->phone}}"
                                   class="btn btn-primary mt-2 mb-1"><i
                                        class="fa fa-phone"></i> اتصال </a>
                                @if($provider->status == '1')
                                    <span href="" class="btn btn-secondary mt-2 mb-1"><i
                                            class="fa fa-thumbs-up"></i> مفعل </span>
                                @else
                                    <span href="" class="btn btn-danger mt-2 mb-1"><i
                                            class="fa fa-ban"></i> محظور </span>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <div class="float-left"><h3 class="card-title">بيانات شخصية</h3></div>
                    <div class="clearfix"></div>
                </div>
                <div class="card-body wideget-user-contact">

                    <div class="media mb-5 mt-0">
                        <div class="d-flex ml-3"><span class="user-contact-icon bg-success"><i
                                    class="fa fa-envelope text-white"></i></span></div>
                        <div class="media-body"><a href="#" class="text-dark">الرقم التجاري</a>
                            <div class="text-muted fs-14">{{$provider->commercial_number}}</div>
                        </div>
                    </div>

                    <div class="media mb-5 mt-0">
                        <div class="d-flex ml-3"><span class="user-contact-icon bg-primary"><i
                                    class="fa fa-info text-white"></i></span></div>
                        <div class="media-body"><a href="#" class="text-dark">الرقم الضريبي</a>
                            <div class="text-muted fs-14">{{$provider->vat_number}}</div>
                        </div>
                    </div>
                    {{--                    @foreach($provider->addresses as $address)--}}
                    {{--                        <div class="media mb-5 mt-0">--}}
                    {{--                            <div class="d-flex ml-3"><span class="user-contact-icon bg-secondary"><i--}}
                    {{--                                        class="fa fa-globe text-white"></i></span></div>--}}
                    {{--                            <div class="media-body"><a href="#" class="text-dark">عنوان {{$loop->iteration}}</a>--}}
                    {{--                                <div class="text-muted fs-14">{{$address->address}}</div>--}}
                    {{--                            </div>--}}
                    {{--                        </div>--}}
                    {{--                    @endforeach--}}
                    <div class="media mb-0 mt-0">
                        <div class="d-flex ml-3"><span class="user-contact-icon bg-warning"><i
                                    class="fa fa-phone text-white"></i></span></div>
                        <div class="media-body"><a href="tel:{{$provider->phone_code.$provider->phone}}"
                                                   class="text-dark">الهاتف</a>
                            <div class="text-muted fs-14">{{$provider->phone_code.$provider->phone}}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="card">
                <div class="wideget-user-tab">
                    <div class="tab-menu-heading">
                        <div class="tabs-menu1">
                            <ul class="nav">
                                <li class=""><a href="#tab-51" class="show active" data-toggle="tab">الطلبات <i
                                            class="fa fa-shopping-cart"></i> </a>
                                </li>
                                <li><a href="#tab-61" data-toggle="tab" class="">المتجر <i class="fa fa-store mr-1"></i>
                                    </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-content">
                <div class="tab-pane show active" id="tab-51">
                    <div class="card">
                        <div class="card-body">
                            <div class="example">
                                <ul class="list-group">
                                    <li class="list-group-item justify-content-between"> طلبات جديدة <span
                                            class="badgetext badge badge-warning badge-pill">{{($new_orders) ?? 0}}</span>
                                    </li>
                                    <li class="list-group-item justify-content-between"> طلبات مقبولة <span
                                            class="badgetext badge badge-info badge-pill">{{($ended_orders) ?? 0}}</span>
                                    </li>
                                    <li class="list-group-item justify-content-between"> طلبات مرفوضة <span
                                            class="badgetext badge badge-danger badge-pill">{{($canceled_orders) ?? 0}}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab-61">
                    <div class="card">
                        <div class="card-body">
                            <div id="profile-log-switch">
                                <div class="media-heading">
                                    <h5><strong>تفاصيل المتجر</strong></h5>
                                </div>
                                <div class="table-responsive ">
                                    <table class="table row table-borderless">
                                        <tbody class="col-lg-12 col-xl-6 p-0">
                                        <tr>
                                            <td><strong>الاسم :</strong> {{$provider->store_name}}</td>
                                        </tr>
                                        <tr>
                                            <td><strong>المنتجات المفعلة :</strong> {{$active_pro}}</td>
                                        </tr>
                                        <tr>
                                            <td><strong>الدولة :</strong> {{($provider->country->title_ar) ?? '--'}}</td>
                                        </tr>
                                        </tbody>
                                        <tbody class="col-lg-12 col-xl-6 p-0">
                                        <tr>
                                            <td><strong>اجمالي المبيعات :</strong> {{($provider->total_money) ?? '0'}} ج.م </td>
                                        </tr>
                                        <tr>
                                            <td><strong>المنتجات الغير مفعلة :</strong> {{$unActive_pro}}</td>
                                        </tr>
                                        <tr>
                                            <td><strong>المحافظة :</strong> {{($provider->governorate->governorate_name_ar) ?? '--'}}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                @foreach($allProducts as $pro)
                                <div class="col-lg-4 col-md-6">
                                    <img class="img-fluid rounded mb-5" src="{{get_file($pro->image)}}" alt="">
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- COL-END -->
    </div>
@endsection


