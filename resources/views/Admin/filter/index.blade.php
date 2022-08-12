@extends('Admin/layouts/master')
@section('title')
    {{($setting->title) ?? ''}} | اعدادات الفلتر
@endsection
@section('page_name') اعدادات الفلتر @endsection
@section('content')
    <div class="row">
        <div class="col-md-12 col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">اعدادات تغيير الشمعات</h3>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--begin::Table-->
                        <table class="table table-striped table-bordered w-100" id="dataTable">
                            <thead>
                            <tr class="fw-bolder text-muted bg-light">
                                <th class="min-w-20px">رقم الشمعة</th>
                                <th class="min-w-20px">جودة المياة</th>
                                <th class="min-w-20px">وقت التغيير</th>
                            </tr>
                            </thead>
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
        var columns = [
            {data: 'candle_number', name: 'candle_number'},
            {data: 'water_type', name: 'water_type'},
            {data: 'change_after', name: 'change_after'},
        ]
        showData('{{route('filterSetting.index')}}', columns);
    </script>
@endsection



