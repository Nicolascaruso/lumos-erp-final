@forelse($orders as $order)
	<div class="col-md-3 col-xs-6 order_div">
		<div class="small-box bg-gray">
            <div class="inner">
            	<h4 class="text-center">#{{$order->invoice_no}}</h4>
            	<table class="table no-margin no-border table-slim">
            		<tr><th>Data</th><td>{{@format_date($order->created_at)}} {{ @format_time($order->created_at)}}</td></tr>
            		<!-- <tr><th>Estado</th><td><span class="label @if($order->res_order_status == 'cooked' ) bg-red @elseif($order->res_order_status == 'served') bg-green @else bg-light-blue @endif">@lang('restaurant.order_statuses.' . 'received') </span></td></tr> -->
            		<tr><th>@lang('contact.customer')</th><td>{{$order->customer_name}} </td></tr>
            		<tr><th>@lang('restaurant.table')</th><td>{{$order->table_name}}</td></tr>
            		<tr><th>@lang('sale.location')</th><td>{{$order->business_location}}</td></tr>
            	</table>
            </div>
            @if($orders_for == 'kitchen')
            	<a href="#" class="btn btn-flat small-box-footer bg-yellow mark_as_cooked_btn" data-href="{{action('Restaurant\KitchenController@markAsCooked', [$order->id])}}"><i class="fa fa-check-square-o"></i> Concluido</a>
            @elseif($orders_for == 'waiter' && $order->res_order_status != 'served')
            	<a href="#" class="btn btn-flat small-box-footer bg-yellow mark_as_served_btn" data-href="{{action('Restaurant\OrderController@markAsServed', [$order->id])}}"><i class="fa fa-check-square-o"></i> @lang('restaurant.mark_as_served')</a>
            @else
            	<div class="small-box-footer bg-gray">&nbsp;</div>
            @endif
            	<a href="#" class="btn btn-flat small-box-footer bg-info btn-modal" data-href="{{ action('SellController@show', [$order->id])}}" data-container=".view_modal">Detalhes <i class="fa fa-arrow-circle-right"></i></a>
         </div>
	</div>
	@if($loop->iteration % 4 == 0)
		<div class="hidden-xs">
			<div class="clearfix"></div>
		</div>
	@endif
	@if($loop->iteration % 2 == 0)
		<div class="visible-xs">
			<div class="clearfix"></div>
		</div>
	@endif
@empty
<div class="col-md-12">
	<h4 class="text-center">Nenhum pedido</h4>
</div>
@endforelse