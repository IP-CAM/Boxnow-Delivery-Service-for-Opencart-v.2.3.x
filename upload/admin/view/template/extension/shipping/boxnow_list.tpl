<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<h1><?php echo $heading_title_report; ?></h1>
			<ul class="breadcrumb">
				<?php foreach($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href'] ?>"><?php echo $breadcrumb['text'] ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
  
	<div class="container-fluid">
		<?php if($error) {?>
			<div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i>
				<?php echo $error; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		
		<?php if($success) {?>
			<div class="alert alert-success alert-dismissible"><i class="fa fa-check-circle"></i>
				<?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
            <div class="table-responsive">
              <table class="table table-bordered table-hover">
                <thead>
                  <tr>
					<td style="width:1%"></td>
                    <td class="text-center" style="width:1%">
						<?php echo $column_order_id; ?>
					</td>
                    <td class="text-left"><?php echo $column_customer; ?></td>
                    <td class="text-center" style="width:1%"><?php echo $column_order_status; ?></td>
                    <td class="text-center" style="width:1%"><?php echo $column_total; ?></td>
                    <td class="text-center" style="width:1%"><?php echo $column_total_products; ?></td>
                    <td class="text-center" style="width:1%"><?php echo $column_date_added; ?></td>
                    <td class="text-left"><?php echo $column_vouchers; ?></td>
					<td class="text-center"  style="width:15%"><?php echo $column_info; ?></td>
                    <td class="text-center"  style="width:1%"><?php echo $column_locker_id; ?></td>
                    <td class="text-center" style="width:1%"><?php echo $column_box_now_status; ?></td>
                  </tr>
                </thead>
                <tbody>
                
				<?php if($orders) {?>
				<?php foreach($orders as $order) { ?>
                <tr class="boxnow_row">
					 <td>
						<a href="<?php echo $order['view'] ?>" data-toggle="tooltip" title="<?php echo $text_button_view ?>" class="btn btn-primary">
							<i class="fa fa-eye"></i>
						</a>
					</td> 
					<td class="text-center" data-order-id="<?php echo $column_order_id; ?>">
						<?php echo $order['order_id'] ?>
					</td>
					<td class="text-left"><?php echo $order['customer'] ?></td>
					<td class="text-center"><?php echo $order['order_status'] ?></td>
					<td class="text-center"><?php echo $order['total'] ?></td>
					<td class="text-center"><?php echo $order['products'] ?></td>
					<td class="text-center"><?php echo $order['date_added'] ?></td>
					<td class="text-left parcels-td">
						<?php if($order['boxnow_parcels']) {?>
							<?php foreach($order['boxnow_parcels'] as $boxnow_parcel) { ?>
								<a href="https://track.boxnow.bg/?track=<?php echo $boxnow_parcel['id']; ?>" target="_blank">
									<i class="fa fa-info-circle"></i> <?php echo $boxnow_parcel['id']; ?>
								</a>
							<?php } ?>
						<?php } else { ?>
						<?php } ?>
					</td>
					<td class="text-center">
						<?php echo $order['boxnow_status_message'] ?>
						<?php if($order['boxnow_parcels']) {?>
							<?php foreach($order['boxnow_parcels'] as $boxnow_parcel) { ?>
								<a href="index.php?route=extension/shipping/boxnow/getParcel&parcel_id=<?php echo $boxnow_parcel['id']; ?>&token=<?php echo $token; ?>" target="_blank">
									<i class="fa fa-file"></i> <?php echo $boxnow_parcel['id']; ?>
								</a>
							<?php } ?>
						<?php } else { ?>
						<?php } ?>
					</td>
					<td class="text-center">	
						<?php if($order['boxnow_locker_id']) {?>
							<button title="Locker Id" type="button" class="btn btn-info locker_id_button" onclick="window['selectedOrderId'] = <?php echo $order['order_id']; ?>; document.getElementsByClassName('boxnow-map-widget-button')[0].click();"><?php echo $order['boxnow_locker_id']; ?></button><input type="hidden" class="locker_id" value="<?php echo $order['boxnow_locker_id']; ?>" />
						<?php } else { ?>
							-
						<?php } ?>	
					</td>
					<td class="text-center">
						<?php if($order['boxnow_status'] == 1) {?>
							<span style="color:#398c39"><i class="fa fa-check-circle"></i> <?php echo $text_voucher_success ?></span>
						<?php } elseif($order['boxnow_status'] == 2) {?>
							<div style="min-width:250px;margin-bottom:5px;padding-bottom:5px;color:#1e91cf;"><i class="fa fa-minus-circle"></i> <?php echo $text_voucher_pending; ?></div>
							<div>
								<table class="table table-sm" style="margin-bottom: 0;">
									<tbody>
										<tr>
											<td><label class="text-center">Type Total Vouchers</label></td>
											<td><input class="quantity form-control input-sm" type="number" name="quantity" min="1" value="1" style="width:250px;"></td>
										</tr>
										<tr>
											<td><label class="text-center">Select Warehouse</label></td>
											<td><select class="warehouse_number form-control input-sm" name="warehouse_number" style="width:250px;">
											<?php foreach($warehouse_number as $key => $value) { ?>
												<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
											<?php } ?>
											</select></td>
										</tr>
										<tr>
											<td colspan="2" style="border: none; text-align: right;"><a class="btn btn-info submitVoucher" href="<?php echo $order['boxnow_submit']; ?>" style="min-width:190px;">
												<i class="fa fa-paper-plane"></i> 
												<?php echo $text_voucher_send; ?>
											<a/></td>
										</tr>
									</tbody>
								</table>
							</div>
						<?php } else { ?>
							<span style="color:#c72f1d">
								<i class="fa fa-times-circle"></i> 
								<?php echo $text_voucher_notfound ?>
							</span>
						<?php } ?>	
						
					</td>
                </tr>
                <?php } ?>
				<?php } else { ?>
					<tr>
						<td class="text-center" colspan="11"><?php echo $text_no_results ?></td>
					</tr>
                <?php } ?>
                </tbody>
                
              </table>
            </div>
		</div>
		<div class="row">
			<div class="col-sm-6 text-left"><?php echo $pagination ?></div>
			<div class="col-sm-6 text-right"><?php echo $results ?></div>
		</div>
	</div>
</div>

<div id="boxnowmap"></div>
<a href="javascript:;" class="boxnow-map-widget-button" style="display: none;">Select BoxNow Locker</a>
<script type="text/javascript">
var _bn_map_widget_config = {
	type: "popup",
	partnerId: <?php echo $partner_id; ?>,
	parentElement: "#boxnowmap",
	afterSelect: function(selected){
		if (selected.boxnowLockerId) {
			document.querySelector("[data-order-id=\"" + window["selectedOrderId"] + "\"]").closest("tr").querySelector(".locker_id").value = selected.boxnowLockerId;
			document.querySelector("[data-order-id=\"" + window["selectedOrderId"] + "\"]").closest("tr").querySelector(".locker_id_button").textContent = selected.boxnowLockerId;
		}
	}
};
(function(d){var e = d.createElement("script");e.src = "https://widget-cdn.boxnow.bg/map-widget/client/v4.js";e.async = true;e.defer = true;d.getElementsByTagName("head")[0].appendChild(e);})(document);
</script>

<script>

$('.submitVoucher').on('click',function(e) {
	e.preventDefault();
	
	let href = new URL($(this).attr('href'));

	let quantity = $(this).closest(".boxnow_row").find('.quantity').val(); 
	let warehouse_number = $(this).closest(".boxnow_row").find('.warehouse_number').val(); 
	let locker_id = $(this).closest(".boxnow_row").find('.locker_id').val(); 
	
	href.searchParams.set('quantity', quantity);
	href.searchParams.set('warehouse_number', warehouse_number);
	href.searchParams.set('locker_id', locker_id);
	
	window.location.href = href;
});

$("[type='number']").keypress(function (evt) {
    evt.preventDefault();
});
</script>

<style type="text/css">
	.parcels-td a+a:before {
		content:","
	}
</style>
<?php echo $footer ?>