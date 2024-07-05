<?php echo $header; ?><?php echo $column_left; ?>
<?php 
$weight_value_row = 0; 
$boxnow_weight = isset($boxnow_weight) ? $boxnow_weight : '';
$boxnow_weight_type = isset($boxnow_weight_type) ? $boxnow_weight_type : '';
$boxnow_default_weight = isset($boxnow_default_weight) ? $boxnow_default_weight : '';
$boxnow_weight_value = isset($boxnow_weight_value) ? $boxnow_weight_value : array();
?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-shipping" data-toggle="tooltip" title="Save" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel ?>" data-toggle="tooltip" title="Cancel" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
		<h1><?php echo $heading_title; ?></h1>
		<ul class="breadcrumb">
			<?php foreach($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href'] ?>"><?php echo $breadcrumb['text'] ?></a></li>
			<?php } ?>
		</ul>
	  
	  <div class="alert alert-info"><?php echo $heading_help; ?></div>
    </div>
  </div>
  <div class="container-fluid">
	<?php if($error_warning) {?>
    <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>

      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-shipping" class="form-horizontal">

        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_settings; ?></a></li>
          <li><a href="#tab-price" data-toggle="tab"><?php echo $tab_pricing; ?></a></li>
        </ul>
		  
      <div class="tab-pane active" id="tab-general">
    <div class="form-group">
        <div class="col-sm-12" style="text-align: center">
            <img style="max-width: 600px; margin: 0 auto" src="view/image/boxnow_logo.png" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-api_url">
            <?php echo $entry_api_url; ?>
        </label>
        <div class="col-sm-10">
            <input type="text" name="boxnow_api_url" value="<?php echo $boxnow_api_url; ?>"
                placeholder="<?php echo $entry_api_url; ?>" id="input-api_url" class="form-control" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-client_id">
            <?php echo $entry_client_id; ?>
        </label>
        <div class="col-sm-10">
            <input type="text" name="boxnow_client_id" value="<?php echo $boxnow_client_id; ?>"
                placeholder="<?php echo $entry_client_id; ?>" id="input-client_id" class="form-control" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-client_secret">
            <?php echo $entry_client_secret; ?>
        </label>
        <div class="col-sm-10">
            <input type="text" name="boxnow_client_secret" value="<?php echo $boxnow_client_secret; ?>"
                placeholder="<?php echo $entry_client_secret; ?>" id="input-client_secret" class="form-control" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-warehouse_number">
            <?php echo $entry_warehouse_number; ?>
        </label>
        <div class="col-sm-10">
            <textarea name="boxnow_warehouse_number" id="input-warehouse_number" class="form-control" cols="30" rows="3"
                placeholder="<?php echo $entry_warehouse_number; ?>"><?php echo $boxnow_warehouse_number; ?></textarea>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-partner_id">
            <?php echo $entry_partner_id; ?>
        </label>
        <div class="col-sm-10">
            <input type="text" name="boxnow_partner_id" value="<?php echo $boxnow_partner_id; ?>"
                placeholder="<?php echo $entry_partner_id; ?>" id="input-partner_id" class="form-control" />
        </div>
    </div>

        <div class="form-group">
        <label class="col-sm-2 control-label" for="input-partner_name">
            <?php echo $entry_partner_name; ?>
        </label>
        <div class="col-sm-10">
            <input type="text" name="boxnow_partner_name" value="<?php echo $boxnow_partner_name; ?>"
                placeholder="<?php echo $entry_partner_name; ?>" id="input-partner_name" class="form-control" />
        </div>
    </div>

        <div class="form-group">
        <label class="col-sm-2 control-label" for="input-partner_email">
            <?php echo $entry_partner_email; ?>
        </label>
        <div class="col-sm-10">
            <input type="text" name="boxnow_partner_email" value="<?php echo $boxnow_partner_email; ?>"
                placeholder="<?php echo $entry_partner_email; ?>" id="input-partner_email" class="form-control" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-partner_phone">
            <?php echo $entry_partner_phone; ?>
        </label>
        <div class="col-sm-10">
            <input type="text" name="boxnow_partner_phone" value="<?php echo $boxnow_partner_phone; ?>"
                placeholder="+359" id="input-partner_phone" class="form-control" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-geo-zone">
            <?php echo $entry_geo_zone; ?>
        </label>
        <div class="col-sm-10">
            <select name="boxnow_geo_zone_id" id="input-geo-zone" class="form-control">
                <option value="0">
                    <?php echo $text_all_zones; ?>
                </option>
                <?php foreach($geo_zones as $_key => $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $boxnow_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected">
                    <?php echo $geo_zone['name']; ?>
                </option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>">
                    <?php echo $geo_zone['name']; ?>
                </option>
                <?php } ?>
                <?php } ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-status">
            <?php echo $entry_status; ?>
        </label>
        <div class="col-sm-10">
            <select name="boxnow_status" id="input-status" class="form-control">
                <?php if ($boxnow_status) { ?>
                <option value="1" selected="selected">
                    <?php echo $text_enabled; ?>
                </option>
                <option value="0">
                    <?php echo $text_disabled; ?>
                </option>
                <?php } else { ?>
                <option value="1">
                    <?php echo $text_enabled; ?>
                </option>
                <option value="0" selected="selected">
                    <?php echo $text_disabled; ?>
                </option>
                <?php } ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-sort-order">
            <?php echo $entry_sort_order; ?>
        </label>
        <div class="col-sm-10">
            <input type="text" name="boxnow_sort_order" value="<?php echo $boxnow_sort_order; ?>"
                placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
        </div>
    </div>
</div>

<div class="tab-pane" id="tab-price">
    <div class="form-group">
        <div class="col-sm-12" style="text-align:center;">
            <img style="max-width:600px;margin:0 auto;" src="view/image/boxnow_logo.png">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="boxnow_weight">
         <?php echo $entry_banned_weight; ?> 
        </label>
        <div class="col-sm-10">
            <input class="form-control" type="text" id="boxnow_weight" name="boxnow_weight"
                value="<?php echo $boxnow_weight; ?>" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="boxnow_weight_type">
          <?php echo $entry_unit_of_measure; ?>
        </label>
        <div class="col-sm-10">
            <select class="form-control" id="boxnow_weight_type" name="boxnow_weight_type">
                <option value="kilogram"  <?php if (($boxnow_weight_type == 'kilogram')) { ?>selected="selected"<?php } ?>>
                    <?php echo $entry_kilogram; ?>
                </option>
                <option value="gram" <?php if (($boxnow_weight_type == 'gram')) { ?>selected="selected"<?php } ?>>
                    <?php echo $entry_gram; ?>
                </option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="boxnow_default_weight">
            <?php echo $entry_cart_weight; ?>
        </label>
        <div class="col-sm-10">
            <input class="form-control" type="text" id="boxnow_default_weight" name="boxnow_default_weight"
                value="<?php echo $boxnow_default_weight; ?>" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="boxnow_free_shipping">
            <?php echo $entry_free_shipping; ?>
        </label>
        <div class="col-sm-10">
            <input type="text" name="boxnow_free_shipping" value="<?php echo $boxnow_free_shipping; ?>"
                id="boxnow_free_shipping" class="form-control" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-tax-class">
            <?php echo $entry_tax_class ?>
        </label>
        <div class="col-sm-10">
            <select name="boxnow_tax_class_id" id="input-tax-class" class="form-control">
                <option value="0">
                <?php echo $text_none ?>
                </option>
                <?php foreach($tax_classes as $tax_class) { ?>
                {% if tax_class.tax_class_id == boxnow_tax_class_id %}
                <?php if($tax_class['tax_class_id'] == $boxnow_tax_class_id) {?>
                <option value="<?php echo $tax_class['tax_class_id'] ?>" selected="selected">
                    <?php echo $tax_class['title'] ?>
                </option>
                <?php } else { ?>
                <option value="<?php echo $tax_class['tax_class_id'] ?>">
                    <?php echo $tax_class['title'] ?>
                </option>
                <?php } ?>
                <?php } ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-payment_modules">
            <span data-toggle="tooltip" title="<?php echo $help_payment_modules; ?>">
                <?php echo $entry_payment_modules; ?>
            </span>
        </label>
        <div class="col-sm-10">
            <div class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach($payment_modules as $payment_module) { ?>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="boxnow_payment_modules[]"
                            value="<?php echo $payment_module['code']; ?>" 
                            <?php echo (is_array($boxnow_payment_modules) && in_array($payment_module['code'], $boxnow_payment_modules)) ? 'checked="checked"' : ''; ?> />
                        <?php echo $payment_module['name']; ?>
                    </label>
                </div>
                <?php } ?>
            </div>
        </div>
    </div>
        
    <div class="form-group">
        <table id="weight-value" class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <td class="text-left required"><?php echo $entry_weight_from; ?></td>
                    <td class="text-left required"><?php echo $entry_weight_to; ?></td>
                    <td class="text-left required"><?php echo $entry_fixed_price; ?></td>
                    <td></td>
                </tr>
            </thead>
        
            <tbody>									
				<?php foreach ($boxnow_weight_value as $weight_value) { ?>
					<tr id="weight-value-row<?php echo $weight_value_row; ?>">
					 <td class="text-right"><input type="text" name="boxnow_weight_value[<?php echo $weight_value_row; ?>][from]" value="<?php echo $weight_value['from']; ?>" class="form-control" /></td>
					 <td class="text-right"><input type="text" name="boxnow_weight_value[<?php echo $weight_value_row; ?>][to]" value="<?php echo $weight_value['to']; ?>" class="form-control" /></td>
					 <td class="text-right"><input type="text" name="boxnow_weight_value[<?php echo $weight_value_row; ?>][price]" value="<?php echo $weight_value['price']; ?>" class="form-control" /></td>
		
					 <td class="text-right"><button type="button" onclick="$('#weight-value-row<?php echo $weight_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
					</tr>
                    <?php $weight_value_row++; ?>
					<?php } ?>
			</tbody>

			<tfoot>
			    <tr>
			     <td colspan="4"></td>
				 <td class="text-right"><button type="button" id="addWeightButton" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
			    </tr>
			</tfoot>									                  
        </table>

    </div>
</div>		  
        </form>
      </div>
    </div>
  </div>
</div>

<style type="text/css">

.form-horizontal input[type=text], .form-horizontal input[type=email], .form-horizontal input[type=url], .form-horizontal input[type=password], .form-horizontal input[type=search], .form-horizontal input[type=number], .form-horizontal input[type=tel], .form-horizontal input[type=range], .form-horizontal input[type=date], .form-horizontal input[type=month], .form-horizontal input[type=week], .form-horizontal input[type=time], .form-horizontal input[type=datetime], .form-horizontal input[type=datetime-local], .form-horizontal input[type=color], .form-horizontal textarea, .form-horizontal select {
    color: #666;
    border: 1px solid #ebebeb;
    border-radius: 0;
    max-width: 100%;
    color: #333;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    display: block;
    float: none;
    border: 1px solid #ccc;
    padding: 6px 10px;
    width: 100%;
    border-color: black!important;
    border-radius: calc(38 / 2560 * 100vw)!important;
    font-size: 15px;
    border-width: 2px!important;
    min-height: 50px;
    padding-left: 2rem;
    padding-right: 2rem;
}

#input-payment_modules {
	height:150px;
	padding-right:2rem;
}

</style>

<script type="text/javascript">
//Tabs function - start
  jQuery(document).ready(function($) {
        $('.tab-pane').hide();
        $('.tab-pane.active').show();

        $('ul.nav-tabs a').click(function (e) {
            e.preventDefault();

            $('.tab-pane').hide();

            var targetTab = $(this).attr('href');
            $(targetTab).show();

            $('ul.nav-tabs li').removeClass('active');
            $(this).parent('li').addClass('active');
        });
    });
//Tabs function - end
</script>

<script type="text/javascript">

    jQuery(document).ready(function ($) {
        const rows = $("table tbody tr");
        rows.each(function (index, row) {
            const rowIndex = index + 1;
            const className = `row-${rowIndex}`;
            $(row).addClass(className);
        });
 });
    
        var weight_value_row = <?php echo $weight_value_row; ?>;


     function addWeightValue() {
    var html = '<tr id="weight-value-row' + weight_value_row + '">';
    html += ' <td class="text-right"><input type="text" name="boxnow_weight_value[' + weight_value_row + '][from]" value="" placeholder="0.00" class="form-control" /></td>';
    html += ' <td class="text-right"><input type="text" name="boxnow_weight_value[' + weight_value_row + '][to]" value="" placeholder="0.00" class="form-control" /></td>';
    html += ' <td class="text-right"><input type="text" name="boxnow_weight_value[' + weight_value_row + '][price]" value="" placeholder="0.00" class="form-control" /></td>';
  html += ' <td class="text-right"><button type="button" onclick="$(\'#weight-value-row' + weight_value_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
    html += '</tr>';

    $('#weight-value tbody').append(html);

    // Increment the row counter
    weight_value_row++;

}


document.getElementById('addWeightButton').addEventListener('click', addWeightValue);

function deleteRow(button) {
		jQuery(button).closest('tr').remove();
	}

</script>

<script type="text/javascript">
 jQuery(document).ready(function ($) {

 function saveWeightData() {
    var weightData = [];

    // Iterate over the rows and collect data
    $('#weight-value tbody tr').each(function() {
        var from = $(this).find('input[name^="boxnow_weight_value"][name$="[from]"]').val();
        var to = $(this).find('input[name^="boxnow_weight_value"][name$="[to]"]').val();
        var price = $(this).find('input[name^="boxnow_weight_value"][name$="[price]"]').val();

        // Create an object for each row and push it to the weightData array
        weightData.push({
            from: from,
            to: to,
            price: price
        });
    });

    // Convert the weightData array to a JSON string
    var weightDataJson = JSON.stringify(weightData);

    // Add the JSON string as a hidden input field to the form
    $('<input>').attr({
        type: 'hidden',
        name: 'boxnow_weight_values',
        value: weightDataJson
    }).appendTo('#form-shipping');

    $('#form-shipping').submit();
}

$('#save-button').click(saveWeightData);

 });
</script>

<?php echo $footer ?>