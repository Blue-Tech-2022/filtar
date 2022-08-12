@extends('Admin/layouts/master')
@section('title')
    {{($setting->title) ?? ''}} | التقارير
@endsection
@section('page_name')
    التقارير
@endsection
@section('content')
    <div class="row">
        <div class="col-md-12 col-lg-12">
            <div class="card">
                <form action="{{route('filtarByCountry')}}" method="GET">
                    <div class="card-header">
                        <h3 class="card-title">التقارير</h3>
                        <div class="col-4">
                            <select required class="form-control" name="country_id" id="countyId">
                                <option disabled selected>--- اختار الدولة ---</option>
                                @foreach(\App\Models\Country::all() as $country)
                                    <option value="{{$country->id}}"
                                            @if($searchCountry != null)
                                            {{($searchCountry->id == $country->id) ? 'selected' : ''}}
                                            @endif
                                            name="country_id">
                                        {{$country->title_ar}}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-4">
                            <select class="form-control" name="governorate_id" id="governorate_id">
                                <option disabled selected>--- اختار المحافظة ---</option>

                            </select>
                        </div>
                        <div>
                            <button class="btn btn-primary" type="submit">بحث</button>
                        </div>
                    </div>
                </form>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--begin::Table-->
                        <table class="table table-striped table-bordered text-nowrap w-100" id="dataTable">
                            <thead>
                            <tr class="fw-bolder text-muted bg-light">
                                <th class="min-w-25px">#</th>
                                <th class="min-w-50px">الاسم</th>
                                <th class="min-w-125px">المحافظة</th>
                                <th class="min-w-125px">المدينة</th>
                                <th class="min-w-125px">اجمالي المبيعات</th>
                                <th class="min-w-125px">الحالة</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($providers as $provider)
                                <tr>
                                    <td>{{$provider->id}}</td>
                                    <td><a href="{{route('providerProfile',$provider->id)}}">{{($provider->first_name.' '.$provider->last_name) ?? 'محذوف'}}</a> </td>
                                    <td>{{($provider->country->title_ar) ?? '--'}}</td>
                                    <td>{{($provider->governorate->governorate_name_ar) ?? '--'}}</td>
                                    <td>{{\App\Models\Order::where([['status','accepted_by_provider'],['provider_id',$provider->id]])->sum('total')}}
                                        ج.م
                                    </td>
                                    @if($provider->status == '0')
                                        <td><span class="badge badge-danger">محظور</span></td>
                                    @else
                                        <td><span class="badge badge-primary">مفعل</span></td>
                                    @endif
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('Admin/layouts/myAjaxHelper')
@endsection
@section('ajaxCalls')
    <script>
        $('#dataTable').DataTable();
        var cities = JSON.parse('<?php echo json_encode(\App\Models\Country::with('governorate')->get()) ?>');
        $(document).on('change', '#countyId', function () {
            var id = $(this).val();
            var country = cities.filter(oneObject => oneObject.id == id)
            if (country.length > 0) {
                var governorate = country[0].governorate

                $('#governorate_id').html('<option value="" disabled>اختار الدولة</option>')

                $.each(governorate, function (index) {
                    $('#governorate_id').append('<option value="' + governorate[index].id + '"> ' + governorate[index].governorate_name_ar + '</option>')
                })
            }
        })
    </script>
@endsection
