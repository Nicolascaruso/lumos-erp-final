<div class="modal fade" id="add_booking_modal" tabindex="-1" role="dialog" 
    	aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

		{!! Form::open(['url' => action('Restaurant\BookingController@store'), 'method' => 'post', 'id' => 'add_booking_form' ]) !!}
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">@lang( 'restaurant.add_booking' )</h4>
				</div>

				<div class="modal-body">
					@if(count($business_locations) == 1)
						@php 
							$default_location = current(array_keys($business_locations->toArray())) 
						@endphp
					@else
						@php $default_location = null; @endphp
					@endif
					<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="fa fa-map-marker"></i>
								</span>
								{!! Form::select('location_id', $business_locations, $default_location, ['class' => 'form-control', 'placeholder' => __('purchase.business_location'), 'required', 'id' => 'booking_location_id']); !!}
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="col-sm-6">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="fa fa-user"></i>
								</span>
								{!! Form::select('contact_id', 
									$customers, null, ['class' => 'form-control', 'id' => 'booking_customer_id', 'placeholder' => __('contact.customer'), 'required']); !!}
								<span class="input-group-btn">
									<button type="button" class="btn btn-default bg-white btn-flat add_new_customer" data-name=""  @if(!auth()->user()->can('customer.create')) disabled @endif><i class="fa fa-plus-circle text-primary fa-lg"></i></button>
								</span>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="fa fa-user"></i>
								</span>
								{!! Form::select('correspondent', 
									$correspondents, null, ['class' => 'form-control', 'placeholder' => 'Responsável', 'id' => 'correspondent']); !!}
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<div id="restaurant_module_span"></div>
					<div class="clearfix"></div>
					<div class="col-sm-6">
						<div class="form-group">
						{!! Form::label('status', __('restaurant.start_time') . ':*') !!}
	            			<div class='input-group date' >
	            			<span class="input-group-addon">
	                    		<span class="glyphicon glyphicon-calendar"></span>
	                		</span>
							{!! Form::text('booking_start', null, ['class' => 'form-control','placeholder' => __( 'restaurant.start_time' ), 'required', 'id' => 'start_time', 'readonly']); !!}
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							{!! Form::label('status', 'Hora de finalização' . ':*') !!}
	            			<div class='input-group date' >
	            			<span class="input-group-addon">
	                    		<span class="glyphicon glyphicon-calendar"></span>
	                		</span>
							{!! Form::text('booking_end', null, ['class' => 'form-control','placeholder' => 'Hora de finalização', 'required', 'id' => 'end_time', 'readonly']); !!}
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
						{!! Form::label('booking_note', 'Observação' . ':') !!}
						{!! Form::textarea('booking_note', null, ['class' => 'form-control','placeholder' => 'Observação', 'rows' => 3 ]); !!}
						</div>
					</div>
					<div class="col-sm-12" style="visibility: hidden;">
						<div class="form-group">
						<div class="checkbox">
							{!! Form::checkbox('send_notification', 1, false, ['class' => 'input-icheck', 'id' => 'send_notification']); !!} @lang('restaurant.send_notification_to_customer')
						</div>
					</div>
				</div>
				</div>

				<div class="modal-footer">
				<button type="submit" class="btn btn-primary">@lang( 'messages.save' )</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">@lang( 'messages.close' )</button>
			</div>

		{!! Form::close() !!}

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>