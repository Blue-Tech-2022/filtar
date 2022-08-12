@extends('Admin/layouts/master')
@section('title')
    {{($setting->title) ?? ''}} | شروط وسياسات
@endsection
@section('page_name')
    شروط وسياسات
@endsection
@section('content')
    <form method="POST" action="{{route('privacyUpdate')}}" id="SettingForm">
        @csrf
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">سياسة الخصوصية</div>
                    </div>
                    <div class="card-body">
                        <textarea name="privacy" id="editor">
                        {{($setting->privacy) ?? ''}}
                        </textarea>
                    </div>
                </div>


                <div class="card">
                    <div class="card-header">
                        <div class="card-title">الأحكام والشروط</div>
                    </div>
                    <div class="card-body">
                        <textarea name="terms" id="editor2">
                        {{($setting->terms) ?? ''}}
                        </textarea>
                        <br>
                        <button class="btn btn-lg btn-success" id="btnSubmit" type="submit">تحديث</button>
                    </div>

                </div>
            </div>
        </div>
    </form>
@endsection
@section('js')
    <script>
        $(document).on('submit', 'Form#SettingForm', function (e) {
            var isValid = true;
            $("#SettingForm textarea").each(function() {
                var element = $(this);
                if (element.val() == "<p>&nbsp;</p>") {
                    isValid = false;
                }
            });
            if (!isValid){
                e.preventDefault();
                toastr.error('يرجي ادخال كل البيانات المطلوبة');
            }
        });
    </script>
    <!-- INTERNAL Editor JS -->
    <script src="{{asset('assets/admin')}}/assets/plugins/editor.js"></script>
<script>
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
            console.error( error );
        } );
</script>
<script>
    ClassicEditor
        .create( document.querySelector( '#editor2' ) )
        .catch( error => {
            console.error( error );
        } );
</script>
@endsection
