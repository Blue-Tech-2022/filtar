@extends('Admin/layouts/master')
@section('title')
    {{($setting->title) ?? ''}} | قائمة المنتجات
@endsection
@section('page_name') قائمة المنتجات @endsection
@section('content')
    <div class="row">
        <div class="col-md-12 col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">المنتجات الموجودة في التطبيق</h3>
                    <div class="text-muted">
                        يمكنك ( تفعيل \ الغاء تفعيل ) المنتج من خلال الضغط علي كلمة (مفعل \ غير مفعل)
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--begin::Table-->
                        <table class="table table-striped table-bordered w-100" id="dataTable">
                            <thead>
                            <tr class="fw-bolder text-muted bg-light">
                                <th class="min-w-25px">#</th>
                                <th class="min-w-20px">الصورة الرئيسية</th>
                                <th class="min-w-20px">التاجر</th>
                                <th class="min-w-20px">العنوان</th>
                                <th class="min-w-20px">القسم</th>
                                <th class="min-w-20px">التفاصيل</th>
                                <th class="min-w-20px">الصور</th>
                                <th class="min-w-20px">الحالة</th>
                                <th class="min-w-50px rounded-end">العمليات</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!--Delete MODAL -->
        <div class="modal fade" id="delete_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
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
                        <p>هل انت متأكد من حذف البيانات التالية <span id="title" class="text-danger"></span>؟</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="dismiss_delete_modal">
                            الغاء
                        </button>
                        <button type="button" class="btn btn-danger" id="delete_btn">حذف !</button>
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
                        <h5 class="modal-title" id="example-Modal3">بيانات المنتج</h5>
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
            {data: 'main_image', name: 'main_image'},
            {data: 'provider_id', name: 'provider_id'},
            {data: 'title', name: 'title'},
            {data: 'category_id', name: 'category_id'},
            {data: 'details', name: 'details'},
            {data: 'images', name: 'images', orderable: false, searchable: false},
            {data: 'status', name: 'status'},
            {data: 'action', name: 'action', orderable: false, searchable: false},
        ]
        showData('{{route('products.index')}}', columns);
        // Delete Using Ajax
        deleteScript('{{route('products.delete')}}');

        // ِChange Status Using Ajax
        $(document).on('click', '.statusSpan', function (event) {
            var id = $(this).data("id")
            $.ajax({
                type: 'POST',
                url: "{{route('productActivation')}}",
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


