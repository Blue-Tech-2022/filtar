<div class="card">
    <div class="card-body">
        <label>اسم المتجر :</label>
        <span>{{$provider->store_name}}</span>

        <br>

        <label>صورة البطاقة الشخصية</label>
        <img onclick="window.open(this.src)" src="{{asset($provider->nationality_id_image)}}" style="width: 100%;height: 200px">

        <br>


        <label>صورة السجل التجاري</label>
        <img onclick="window.open(this.src)" src="{{asset($provider->nationality_id_image)}}" style="width: 100%;height: 200px">

        <br>

        <label>صورة الرقم الضريبي</label>
        <img onclick="window.open(this.src)" src="{{asset($provider->vat_number_image)}}" style="width: 100%;height: 200px">
    </div>
</div>


<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
</div>
