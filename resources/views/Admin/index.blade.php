@extends('Admin/layouts/master')
@section('title')
    {{($setting->title) ?? ''}} | الصفحة الرئيسية
@endsection
@section('page_name')
    الرئـيسية
@endsection
@section('content')
    <link href="{{asset('assets/admin')}}/assets/plugins/morris/morris.css"
          rel="stylesheet"/>
    @can('محتوي الرئيسية')
        <div class="row">
            <div class="card">
                <form action="{{route('adminHome')}}" method="get" style="padding: 20px 25px;justify-content: space-between">
                        <div class="" style="display: inline">
                                <label class="form-control-label">تاريخ البداية</label>
                                <input type="date" required value="{{$startFrom}}" class="custom" name="start_from">
                        </div>
                            <div class="" style="display: inline;margin-right: 20px">
                                <label class="form-control-label">تاريخ النهاية</label>
                                <input type="date" value="{{$endAt}}" required name="end_at" class="custom">
                        </div>
                        <div class="" style="display: inline;margin-right: 20px">
                                <button type="submit" style="width: 120px" class="btn btn-success">بحث</button>
                        </div>
                </form>
            </div>
        </div>
        <style>
            .custom{
                width: 35%;
                height: 38px;
                font-size: 0.875rem;
                line-height: 1.6;
                color: #242e4c !important;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #d3dfef;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
                border-radius: 5px;
                color: #99c1b2;
                opacity: 1;
            }
        </style>
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                <a href="{{route('users.index')}}">
                    <div class="card bg-primary img-card box-primary-shadow">
                        <div class="card-body">
                            <div class="d-flex">
                                <div class="text-white"><h2 class="mb-0 number-font">{{$data['users_count']}}</h2>
                                    <p class="text-white mb-0">عدد العملاء </p></div>
                                <div class="mr-auto"><i class="fe fe-users text-white fs-30 ml-2 mt-2"></i></div>
                            </div>
                        </div>
                    </div>
                </a>
            </div><!-- COL END -->
            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                <a href="{{route('orders.index')}}">
                    <div class="card bg-secondary img-card box-secondary-shadow">
                        <div class="card-body">
                            <div class="d-flex">
                                <div class="text-white"><h2 class="mb-0 number-font">{{$data['orders_sum']}}</h2>
                                    <p class="text-white mb-0">مبيعات المتاجر</p></div>
                                <div class="mr-auto"><i class="fe fe-dollar-sign text-white fs-30 ml-2 mt-2"></i></div>
                            </div>
                        </div>
                    </div>
                </a>
            </div><!-- COL END -->
            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                <a href="{{route('provider.index')}}">
                    <div class="card  bg-success img-card box-success-shadow">
                        <div class="card-body">
                            <div class="d-flex">
                                <div class="text-white"><h2 class="mb-0 number-font">{{$data['provider_count']}}</h2>
                                    <p class="text-white mb-0">عدد التجار</p></div>
                                <div class="mr-auto"><i class="fe fe-shopping-bag text-white fs-30 ml-2 mt-2"></i></div>
                            </div>
                        </div>
                    </div>
                </a>
            </div><!-- COL END -->
            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                <a href="{{route('contact.index')}}">
                    <div class="card bg-info img-card box-info-shadow">
                        <div class="card-body">
                            <div class="d-flex">
                                <div class="text-white"><h2 class="mb-0 number-font">{{$data['contact_count']}}</h2>
                                    <p class="text-white mb-0">طلبات التواصل</p></div>
                                <div class="mr-auto"><i class="fe fe-send text-white fs-30 ml-2 mt-2"></i></div>
                            </div>
                        </div>
                    </div>
                </a>

            </div>
            <!-- COL END -->
        </div>

        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                <div class="card">
                    <div class="card-header text-center"><h2 class="card-title">التجار لكل الدول</h2></div>
                    <div class="card-body">
                        <div id="main4" style="height:400px;"></div>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.3.2/echarts.min.js"></script>
                        <script type="text/javascript">
                            // Initialize the echarts instance based on the prepared dom
                            var myChart = echarts.init(document.getElementById('main4'));

                            // Specify the configuration items and data for the chart
                            option = {
                                tooltip: {
                                    trigger: 'item'
                                },
                                legend: {
                                    top: '5%',
                                    left: 'center'
                                },
                                series: [
                                    {
                                        name: 'عدد التجار',
                                        type: 'pie',
                                        radius: ['40%', '70%'],
                                        avoidLabelOverlap: false,
                                        itemStyle: {
                                            borderRadius: 10,
                                            borderColor: '#fff',
                                            borderWidth: 2
                                        },
                                        label: {
                                            show: false,
                                            position: 'center'
                                        },
                                        emphasis: {
                                            label: {
                                                show: true,
                                                fontSize: '40',
                                                fontWeight: 'bold'
                                            }
                                        },
                                        labelLine: {
                                            show: false
                                        },
                                        data: [
                                                @foreach($countries as $country)
                                            {
                                                @if($startFrom != null)
                                                value: {{\App\Models\Provider::where('country_id',$country->id)->whereBetween('created_at',[Carbon\Carbon::createFromFormat('Y-m-d', $startFrom),Carbon\Carbon::createFromFormat('Y-m-d', $endAt)])->count()}},
                                                @else
                                                value: {{\App\Models\Provider::where('country_id',$country->id)->count()}},
                                                @endif
                                                name: '{{$country->title_ar}}'
                                            },
                                            @endforeach
                                        ]
                                    }
                                ]
                            };

                            // Display the chart using the configuration items and data just specified.
                            myChart.setOption(option);
                        </script>
                    </div>
                </div>
            </div>

            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                <div class="card">
                    <div class="card-header text-center"><h2 class="card-title">طلبات الشهور</h2></div>
                    <div class="card-body">
                        <div id="main2" style="height:400px;"></div>
                        <script type="text/javascript">
                            // Initialize the echarts instance based on the prepared dom
                            var myChart = echarts.init(document.getElementById('main2'));

                            // Specify the configuration items and data for the chart
                            option = {
                                title: {
                                    text: ''
                                },
                                tooltip: {
                                    trigger: 'axis',
                                    axisPointer: {
                                        type: 'shadow'
                                    }
                                },
                                legend: {},
                                grid: {
                                    left: '3%',
                                    right: '4%',
                                    bottom: '3%',
                                    containLabel: true
                                },
                                xAxis: {
                                    type: 'value',
                                    boundaryGap: [0, 0.01]
                                },
                                yAxis: {
                                    type: 'category',
                                    data: [
                                        @for ($m=1; $m<=12; $m++)
                                            '{{date('F', mktime(0,0,0,$m, 1, date('Y')))}}',
                                        @endfor
                                    ]
                                },
                                series: [
                                    {
                                        name: '',
                                        type: 'bar',
                                        data: [
                                            @foreach($clients_orders as $ord)
                                                '{{$ord['count']}}',
                                            @endforeach
                                        ]
                                    },
                                    // {
                                    //     name: '',
                                    //     type: 'bar',
                                    //     data: [19325, 23438, 31000, 121594, 134141, 681807]
                                    // }
                                ]
                            };
                            // Display the chart using the configuration items and data just specified.
                            myChart.setOption(option);
                        </script>
                    </div>
                </div>
            </div>

            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                <div class="card">
                    <div class="card-header text-center"><h2 class="card-title">طلبات المتاجر</h2></div>
                    <div class="card-body">
                        <div id="main" style="height:400px;"></div>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.3.2/echarts.min.js"></script>
                        <script type="text/javascript">
                            // Initialize the echarts instance based on the prepared dom
                            var myChart = echarts.init(document.getElementById('main'));

                            // Specify the configuration items and data for the chart
                            option = {
                                tooltip: {
                                    trigger: 'item'
                                },
                                legend: {
                                    top: '5%',
                                    left: 'center'
                                },
                                series: [
                                    {
                                        name: 'طلبات المتاجر',
                                        type: 'pie',
                                        radius: ['40%', '70%'],
                                        avoidLabelOverlap: false,
                                        itemStyle: {
                                            borderRadius: 10,
                                            borderColor: '#fff',
                                            borderWidth: 2
                                        },
                                        label: {
                                            show: false,
                                            position: 'center'
                                        },
                                        emphasis: {
                                            label: {
                                                show: true,
                                                fontSize: '40',
                                                fontWeight: 'bold'
                                            }
                                        },
                                        labelLine: {
                                            show: false
                                        },
                                        data: [
                                                {{--                                            @foreach($countries as $country)--}}
                                            {
                                                @if($startFrom != null)
                                                value: {{\App\Models\Order::where('status','new')->whereBetween('created_at',[Carbon\Carbon::createFromFormat('Y-m-d', $startFrom),Carbon\Carbon::createFromFormat('Y-m-d', $endAt)])->count()}},
                                                @else
                                                value: {{\App\Models\Order::where('status','new')->count()}},
                                                @endif
                                                name: 'جديدة'
                                            },
                                            {
                                                @if($startFrom != null)
                                                value: {{\App\Models\Order::where('status','accepted_by_provider')->whereBetween('created_at',[Carbon\Carbon::createFromFormat('Y-m-d', $startFrom),Carbon\Carbon::createFromFormat('Y-m-d', $endAt)])->count()}},
                                                @else
                                                value: {{\App\Models\Order::where('status','accepted_by_provider')->count()}},
                                                @endif
                                                name: 'مقبولة'
                                            },
                                            {
                                                @if($startFrom != null)
                                                value: {{\App\Models\Order::where('status','refused_by_provider')->whereBetween('created_at',[Carbon\Carbon::createFromFormat('Y-m-d', $startFrom),Carbon\Carbon::createFromFormat('Y-m-d', $endAt)])->count()}},
                                                @else
                                                value: {{\App\Models\Order::where('status','refused_by_provider')->count()}},
                                                @endif
                                                name: 'مرفوضة'
                                            },
                                            {{--                                        @endforeach--}}
                                        ]
                                    }
                                ]
                            };

                            // Display the chart using the configuration items and data just specified.
                            myChart.setOption(option);
                        </script>
                    </div>
                </div>
            </div>

            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                <div class="card">
                    <div class="card-header text-center"><h2 class="card-title">العملاء لكل الدول</h2></div>
                    <div class="card-body">
                        <div id="main6" style="height:400px;"></div>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.3.2/echarts.min.js"></script>
                        <script type="text/javascript">
                            // Initialize the echarts instance based on the prepared dom
                            var myChart = echarts.init(document.getElementById('main6'));

                            // Specify the configuration items and data for the chart
                            option = {
                                tooltip: {
                                    trigger: 'item'
                                },
                                legend: {
                                    top: '5%',
                                    left: 'center'
                                },
                                series: [
                                    {
                                        name: 'عدد العملاء',
                                        type: 'pie',
                                        radius: ['40%', '70%'],
                                        avoidLabelOverlap: false,
                                        itemStyle: {
                                            borderRadius: 10,
                                            borderColor: '#fff',
                                            borderWidth: 2
                                        },
                                        label: {
                                            show: false,
                                            position: 'center'
                                        },
                                        emphasis: {
                                            label: {
                                                show: true,
                                                fontSize: '40',
                                                fontWeight: 'bold'
                                            }
                                        },
                                        labelLine: {
                                            show: false
                                        },
                                        data: [
                                                @foreach($countries as $country)
                                            {
                                                @if($startFrom != null)
                                                value: {{\App\Models\User::where('country_id',$country->id)->whereBetween('created_at',[Carbon\Carbon::createFromFormat('Y-m-d', $startFrom),Carbon\Carbon::createFromFormat('Y-m-d', $endAt)])->count()}},
                                                @else
                                                value: {{\App\Models\User::where('country_id',$country->id)->count()}},
                                                @endif
                                                name: '{{$country->title_ar}}'
                                            },
                                            @endforeach
                                        ]
                                    }
                                ]
                            };

                            // Display the chart using the configuration items and data just specified.
                            myChart.setOption(option);
                        </script>
                    </div>
                </div>
            </div>


        </div>

        <div class="row">
            <div class="col-xl-4 col-sm-12 p-l-0 p-r-0 col-md-12">
                <div class="card">
                    <div class="card-header text-center"><h2 class="card-title">المنتجات</h2></div>
                    <div class="card-body">
                        <div class="mx-auto chart-circle chart-circle-md mt-3 mb-4 text-center"
                             data-value="{{$data['diff']}}"
                             data-thickness="8" data-color="#1cc5ef">
                            <canvas width="140" height="140" style="height: 112px; width: 112px;"></canvas>
                        </div>
                        <div class="text-center mt-3"><h3>المنتجات</h3>
                            <p class="mb-4">
                                نسبة المنتجات الغير مفعلة الي المتجات المفعلة
                            </p>
                            <div class="col p-1 mt-2">
                                <div class="float-left"><h3 class="ml-5 "><i
                                            class="fa fa-caret-{{($data['inactive_products_count'] <= $data['active_products_count']) ? 'up' : 'down'}} fa-1x text-{{($data['inactive_products_count'] > $data['active_products_count']) ? 'danger' : 'primary'}} ml-1"></i>{{$data['active_products_count']}}
                                        منتج </h3> <h6
                                        class="ml-5 pb-0 mb-0">المفعلة</h6></div>
                                <div class="float-right"><h3 class="mr-5"><i
                                            class="fa fa-caret-{{($data['inactive_products_count'] > $data['active_products_count']) ? 'up' : 'down'}} fa-1x text-{{($data['inactive_products_count'] > $data['active_products_count']) ? 'primary' : 'danger'}} ml-1"></i>{{$data['inactive_products_count']}}
                                        منتج </h3> <h6
                                        class="mr-5 mt-0 mb-0">الغير مفعلة</h6></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {{--        <div class="col-md-12 col-sm-12 col-lg-4">--}}
            {{--            <div class="card">--}}
            {{--                <div class="card-header"><h3 class="card-title">أكثر المنتجات مبيعا</h3></div>--}}
            {{--                <div class="card-body p-2">--}}
            {{--                    <div>--}}
            {{--                        <div class="row img-gallery">--}}
            {{--                            @foreach($best_products as $product)--}}
            {{--                                <div class="col-6"><a href="{{route('products.index')}}" src="{{($product->product->main_image) ?? asset('assets/default/img/empty.png')}}"--}}
            {{--                                                      class="d-block link-overlay">--}}
            {{--                                        <img class="d-block img-fluid rounded" style="height: 120px"--}}
            {{--                                            src="{{($product->product->main_image) ?? asset('assets/default/img/empty.png')}}" alt="">--}}
            {{--                                        <span class="link-overlay-bg rounded"> <i class="fa fa-search"></i> </span> </a>--}}
            {{--                                </div>--}}
            {{--                            @endforeach--}}
            {{--                        </div>--}}
            {{--                    </div>--}}
            {{--                </div>--}}
            {{--            </div>--}}
            {{--        </div><!-- COL END -->--}}

            <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">اكثر المنتجات مبيعا</h3>
                    </div>
                    <div class="card-body">
                        <div class="activity-block">
                            <ul class="task-list user-tasks">
                                @foreach($best_products as $product)
                                    <li>
                                        <span class="avatar avatar-md brround cover-image task-icon1"
                                              data-image-src="{{($product->product->main_image) ?? asset('assets/default/img/empty.png')}}"
                                              style="background: url(&quot;https://laravel.spruko.com/yoha/Sidemenu-Icon-Light-rtl/assets/images/users/1.jpg&quot;) center center;"></span>
                                        <h6>
                                            {{($product->product->title) ?? ''}} <span class="text-orange fw-bolder">[x{{$product->appear}}]</span>
                                            <small class="float-left text-orange tx-11">{{$product->total}} ج.م</small>
                                        </h6>
                                        @if($product->product->provider)
                                            <span
                                                class="text-muted tx-12">{{($product->product->provider->store_name) ?? '--'}}</span>
                                        @else
                                            <span class="text-muted tx-12">--</span>
                                        @endif
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">افضل المتاجر</h3>
                    </div>
                    <div class="card-body">
                        <div class="activity-block">
                            <ul class="task-list user-tasks">
                                @foreach($best_markets as $market)
                                    <li>
                                        <span class="avatar avatar-md brround cover-image task-icon1"
                                              data-image-src="{{($market->provider->image) ?? asset('assets/default/img/empty.png')}}"
                                              style="background: url(&quot;https://laravel.spruko.com/yoha/Sidemenu-Icon-Light-rtl/assets/images/users/1.jpg&quot;) center center;"></span>
                                        <h6>
                                            {{($market->provider->store_name) ?? 'تم حذفه'}}
                                            <small class="float-left text-orange tx-11">{{$market->total_sales}}
                                                ج.م</small>
                                        </h6>
                                        @if($market->provider)
                                            <span
                                                class="text-muted tx-12">{{($market->provider->first_name.' '.$market->provider->last_name) ?? '--'}}</span>
                                        @else
                                            <span class="text-muted tx-12">تم حذفه</span>
                                        @endif
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    @endcan


@endsection
@section('js')

    {{--    <!-- INTERNAL CHARTJS CHART JS -->--}}
    <script src="{{asset('assets/admin')}}/assets/plugins/chart/Chart.bundle.js"></script>
    <script src="{{asset('assets/admin')}}/assets/plugins/chart/utils.js"></script>

    <!-- INTERNAL PIETY CHART JS -->
    <script
        src="{{asset('assets/admin')}}/assets/plugins/peitychart/jquery.peity.min.js"></script>
    <script
        src="{{asset('assets/admin')}}/assets/plugins/peitychart/peitychart.init.js"></script>

    <!-- INTERNAL MORRIS CHART JS -->
    <script src="{{asset('assets/admin')}}/assets/plugins/morris/morris.js"></script>
    <script src="{{asset('assets/admin')}}/assets/plugins/morris/raphael-min.js"></script>
    {{--    <!-- INTERNAL APEXCHART JS -->--}}
    <script src="{{asset('assets/admin')}}/assets/js/apexcharts.js"></script>
    <!--INTERNAL INDEX JS-->
    <script src="{{asset('assets/admin')}}/assets/js/index4.js"></script>
@endsection
