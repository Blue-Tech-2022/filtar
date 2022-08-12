<div class="table-responsive">
    <!--begin::Table-->
    <table class="table table-striped table-bordered w-100">
        <thead>
        <tr class="fw-bolder text-muted bg-light">
            <th class="min-w-25px">المنتج</th>
            <th class="min-w-20px">التصنيف</th>
            <th class="min-w-20px">السعر</th>
            <th class="min-w-20px">الكمية</th>
            <th class="min-w-20px">الاجمالي</th>
        </tr>
        </thead>
        <tbody>
        @foreach($order->details as $detail)
        <tr>
            <td>{{($detail->product->title) ?? '--'}}</td>
            <td>{{($detail->product->category->title) ?? '--'}}</td>
            <td>{{$detail->price}}</td>
            <td>{{$detail->qty}}</td>
            <td>{{$detail->total_price}}</td>
        </tr>
        @endforeach
        </tbody>
    </table>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
</div>
