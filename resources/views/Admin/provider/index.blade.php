@extends('Admin/layouts/master')
@section('title')
    {{($setting->title) ?? ''}} | التجار
@endsection
@section('page_name')
   قائمة التجار
@endsection
@section('content')
    <div class="row">
        <div class="col-md-12 col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">التجار المسجلين في التطبيق</h3>
                    <div class="text-muted">
                        يمكنك ( حظر \ الغاء حظر ) التاجر من خلال الضغط علي كلمة (مفعل \ محظور)
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--begin::Table-->
                        <table class="table table-striped table-bordered text-nowrap w-100" id="dataTable">
                            <thead>
                            <tr class="fw-bolder text-muted bg-light">
                                <th class="min-w-25px">#</th>
                                <th class="min-w-125px">الاسم</th>
                                <th class="min-w-50px">الهاتف</th>
                                <th class="min-w-50px">العنوان</th>
                                <th class="min-w-50px">العنوان بالتفصيل</th>
                                <th class="min-w-50px">الرقم الضريبي</th>
                                <th class="min-w-50px">الرقم التجاري</th>
                                <th class="min-w-50px">الحالة</th>
{{--                                <th class="min-w-50px">البيانات</th>--}}
                                <th class="min-w-50px rounded-end">العمليات</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL -->
        <div class="modal fade" id="delete_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">حذف بيانات</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input id="delete_id" name="id" type="hidden">
                        <p>هل انت متأكد من حذف بيانات <span id="title" class="text-danger"></span>؟</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="dismiss_delete_modal">تراجع</button>
                        <button type="button" class="btn btn-danger" id="delete_btn">احذف !</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- MODAL CLOSED -->

        <!-- Edit MODAL -->
        <div class="modal fade bd-example-modal-lg" id="editOrCreate" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="example-Modal3">بيانات التاجر</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="modal-body">

                    </div>
                </div>
            </div>
        </div>
        <!-- Edit MODAL CLOSED -->


    </div>
    @include('Admin/layouts/myAjaxHelper')
@endsection
@section('ajaxCalls')
    <script>
        var columns = [
            {data: 'id', name: 'id'},
            {data: 'logo', name: 'logo'},
            {data: 'phone', name: 'phone'},
            {data: 'country_id', name: 'country_id'},
            {data: 'address', name: 'address'},
            {data: 'vat_number', name: 'vat_number'},
            {data: 'commercial_number', name: 'commercial_number'},
            {data: 'status', name: 'status'},
            {data: 'action', name: 'action', orderable: false, searchable: false},
        ]
        showData('{{route('provider.index')}}',columns);
        deleteScript('{{route('delete_provider')}}');
        showEditModal('{{route('provider.show',':id')}}');

        // ِChange Status Using Ajax
        $(document).on('click', '.statusSpan', function (event) {
            var id = $(this).data("id")
            $.ajax({
                type: 'POST',
                url: "{{route('providerActivation')}}",
                data: {
                    '_token': "{{csrf_token()}}",
                    'id': id,
                },
                success: function (data) {
                    if (data.success === true) {
                        $('#dataTable').DataTable().ajax.reload();
                        toastr.success(data.message)
                    }
                    else {
                        toastr.error('هناك خطأ ما ...')
                    }
                }
            });
        });

    </script>
@endsection
