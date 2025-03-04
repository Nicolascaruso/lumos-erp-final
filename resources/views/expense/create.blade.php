@extends('layouts.app')
@section('title', 'Adicionar conta a pagar')

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>Nova conta a pagar</h1>
</section>

<!-- Main content -->
<section class="content">
	{!! Form::open(['url' => action('ExpenseController@store'), 'method' => 'post', 'id' => 'add_expense_form', 'files' => true ]) !!}
	<div class="box box-primary">
		<div class="box-body">
			<div class="row">

				@if(count($business_locations) == 1)
				@php 
				$default_location = current(array_keys($business_locations->toArray())) 
				@endphp
				@else
				@php $default_location = null; @endphp
				@endif
				<div class="col-sm-3">
					<div class="form-group">
						{!! Form::label('location_id', __('purchase.business_location').':*') !!}
						{!! Form::select('location_id', $business_locations, $default_location, ['class' => 'form-control select2', 'placeholder' => __('messages.please_select'), 'required']); !!}
					</div>
				</div>

				<div class="col-sm-4">
					<div class="form-group">
						{!! Form::label('supplier_id', __('purchase.supplier') . ':*') !!}
						<div class="input-group">
							<span class="input-group-addon">
								<i class="fa fa-user"></i>
							</span>
							{!! Form::select('contact_id', [], null, ['class' => 'form-control', 'placeholder' => __('messages.please_select'), 'required', 'id' => 'supplier_id']); !!}
							<span class="input-group-btn">
								<button type="button" class="btn btn-default bg-white btn-flat add_new_supplier" data-name=""><i class="fa fa-plus-circle text-primary fa-lg"></i></button>
							</span>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						{!! Form::label('expense_category_id', 'Categoria:') !!}
						{!! Form::select('expense_category_id', $expense_categories, null, ['class' => 'form-control select2', 'placeholder' => __('messages.please_select')]); !!}
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						{!! Form::label('ref_no', __('purchase.ref_no').':') !!}
						{!! Form::text('ref_no', null, ['class' => 'form-control']); !!}
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						{!! Form::label('transaction_date', __('messages.date') . ':*') !!}
						<div class="input-group">
							<span class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</span>
							{!! Form::text('transaction_date', @format_datetime('now'), ['class' => 'form-control', 'readonly', 'required', 'id' => 'expense_transaction_date']); !!}
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						{!! Form::label('expense_for', 'Conta para:') !!} @show_tooltip('Escolha o usuário para quem a conta está relacionada. (opcional)')
						{!! Form::select('expense_for', $users, null, ['class' => 'form-control select2', 'placeholder' => __('messages.please_select')]); !!}
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						{!! Form::label('document', 'Documento anexo' . ':') !!}
						{!! Form::file('document', ['id' => 'upload_document', 'accept' => implode(',', array_keys(config('constants.document_upload_mimes_types')))]); !!}
						<p class="help-block">@lang('purchase.max_file_size', ['size' => (config('constants.document_size_limit') / 1000000)])
						@includeIf('components.document_help_text')</p>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						{!! Form::label('additional_notes', 'Observação' . ':') !!}
						{!! Form::textarea('additional_notes', null, ['class' => 'form-control', 'rows' => 3]); !!}
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="col-md-4">
					<div class="form-group">
						{!! Form::label('tax_id', __('product.applicable_tax') . ':' ) !!}
						<div class="input-group">
							<span class="input-group-addon">
								<i class="fa fa-info"></i>
							</span>
							{!! Form::select('tax_id', $taxes['tax_rates'], null, ['class' => 'form-control'], $taxes['attributes']); !!}

							<input type="hidden" name="tax_calculation_amount" id="tax_calculation_amount" 
							value="0">
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						{!! Form::label('final_total', __('sale.total_amount') . ':*') !!}
						{!! Form::text('final_total', null, ['class' => 'form-control input_number', 'placeholder' => __('sale.total_amount'), 'required']); !!}
					</div>
				</div>
			</div>
		</div>
	</div> <!--box end-->
	@component('components.widget', ['class' => 'box-primary', 'id' => "payment_rows_div", 'title' => __('purchase.add_payment')])
	<div class="payment_row">
		@include('purchase.partials.payment_row_form', ['row_index' => 0])
		<hr>
		<div class="row">
			<div class="col-sm-12">
				<div class="pull-right">
					<strong>Valor total:</strong>
					<span id="payment_due">{{@num_format(0)}}</span>
				</div>
			</div>
		</div>
	</div>
	@endcomponent
	<div class="col-sm-12">
		<button type="submit" class="btn btn-primary pull-right">@lang('messages.save')</button>
	</div>
	{!! Form::close() !!}
</section>

<div class="modal fade contact_modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	@include('contact.create', ['quick_add' => true])
</div>
@endsection
@section('javascript')
<script type="text/javascript">
	$(document).on('change', 'input#final_total, input.payment-amount', function() {
		calculateExpensePaymentDue();
	});

	function calculateExpensePaymentDue() {
		var final_total = __read_number($('input#final_total'));
		var payment_amount = __read_number($('input.payment-amount'));
		var payment_due = final_total - payment_amount;
		$('#payment_due').text(__currency_trans_from_en(payment_due, true, false));
	}
</script>
<script src="{{ asset('js/purchase.js?v=' . $asset_v) }}"></script>

@endsection