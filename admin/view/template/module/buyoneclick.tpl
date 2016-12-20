<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-buyoneclick" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
	  
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-html" class="form-horizontal">
		
		<div class="tab-pane">
			<ul class="nav nav-tabs" id="language">
				<?php foreach ($languages as $language) { ?>
				<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
				<?php } ?>
			</ul>
			<div class="tab-content">
				<?php foreach ($languages as $language) { ?>
				<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="buyoneclick_name_<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
						<div class="col-sm-10">
							<input type="text" name="buyoneclick_name_<?php echo $language['language_id']; ?>" placeholder="<?php echo $entry_name; ?>" id="buyoneclick_name_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'buyoneclick_name_'.$language['language_id']}) ? ${'buyoneclick_name_'.$language['language_id']} : ''; ?>" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="buyoneclick_preorder_name_<?php echo $language['language_id']; ?>"><?php echo $entry_preorder_name; ?></label>
						<div class="col-sm-10">
							<input type="text" name="buyoneclick_preorder_name_<?php echo $language['language_id']; ?>" placeholder="<?php echo $entry_preorder_name; ?>" id="buyoneclick_preorder_name_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'buyoneclick_preorder_name_'.$language['language_id']}) ? ${'buyoneclick_preorder_name_'.$language['language_id']} : ''; ?>" class="form-control" />
						</div>
					</div>					
				</div>
				<?php } ?>
			</div>
		</div>
		
		<div class="form-group" style="border-top: 1px solid #ccc;">
			<label class="col-sm-2 control-label" for="input-field1_status"><?php echo $field1_title; ?></label>
			<div class="col-sm-6">
				<select name="buyoneclick_field1_status" id="input-field1_status" class="form-control">
					<?php if ($buyoneclick_field1_status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				</select>
			</div>
			<div class="col-sm-4">
				<label>
				<input type="checkbox" name="buyoneclick_field1_required" value="1" <?php echo isset($buyoneclick_field1_required) ? 'checked="checked"' : ''; ?>> <?php echo $field_required; ?>
				</label>					
			</div>
		</div>
		
		<div class="form-group" style="border:none;">	
			<label class="col-sm-2 control-label" for="input-field2_status"><?php echo $field2_title; ?></label>
			<div class="col-sm-6">
				<select name="buyoneclick_field2_status" id="input-field2_status" class="form-control">
					<?php if ($buyoneclick_field2_status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				</select>
			</div>
			<div class="col-sm-4">
				<label>
				<input type="checkbox" name="buyoneclick_field2_required" value="1" <?php echo isset($buyoneclick_field2_required) ? 'checked="checked"' : ''; ?>> <?php echo $field_required; ?>
				</label>					
			</div>
		</div>
		<div class="form-group" style="border:none;">	
			<label class="col-sm-2 control-label" for="input-field3_status"><?php echo $field3_title; ?></label>
			<div class="col-sm-6">
				<select name="buyoneclick_field3_status" id="input-field3_status" class="form-control">
					<?php if ($buyoneclick_field3_status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				</select>
			</div>
			<div class="col-sm-4">
				<label>
				<input type="checkbox" name="buyoneclick_field3_required" value="1" <?php echo isset($buyoneclick_field3_required) ? 'checked="checked"' : ''; ?>> <?php echo $field_required; ?>
				</label>					
			</div>
		</div>
		<div class="form-group" style="border:none;">	
			<label class="col-sm-2 control-label" for="input-field4_status"><?php echo $field4_title; ?></label>
			<div class="col-sm-6">
				<select name="buyoneclick_field4_status" id="input-field4_status" class="form-control">
					<?php if ($buyoneclick_field4_status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				</select>
			</div>
			<div class="col-sm-4">
				<label>
				<input type="checkbox" name="buyoneclick_field4_required" value="1" <?php echo isset($buyoneclick_field4_required) ? 'checked="checked"' : ''; ?>> <?php echo $field_required; ?>
				</label>					
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
			<div class="col-sm-10">
				<select name="buyoneclick_status" id="input-status" class="form-control">
					<?php if ($buyoneclick_status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				</select>
			</div>
		</div>				
				
                <div class="form-group">
					<div class="col-sm-12 text-center h2"><?php echo $ya_form_title; ?></div>
					<label class="col-sm-2" for="ya_counter"><?php echo $ya_counter_title; ?></label>
					<div class="col-sm-10">
					  <input type="text" name="buyoneclick_ya_counter" value="<?php echo $buyoneclick_ya_counter; ?>" placeholder="<?php echo $ya_counter_title; ?>" id="ya_counter" class="form-control" />
					</div>
				</div>
				<div class="form-group" style="border:none;">
					<label class="col-sm-2" for="ya_identificator"><?php echo $ya_identificator_title; ?></label>
					<div class="col-sm-10">
					  <input type="text" name="buyoneclick_ya_identificator" value="<?php echo $buyoneclick_ya_identificator; ?>" placeholder="<?php echo $ya_identificator_title; ?>" id="ya_identificator" class="form-control" />
					</div>				
				</div>
				<div class="form-group" style="border:none;">
					<label class="col-sm-2 control-label" for="yandex_target_status"><?php echo $yandex_target_status_title; ?></label>
					<div class="col-sm-10">
					  <select name="buyoneclick_yandex_status" id="yandex_target_status" class="form-control">
						<?php if ($buyoneclick_yandex_status) { ?>
						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
						<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<?php } ?>
					  </select>
					</div>
                </div>				

        </form>
      </div>
    </div>
<script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script>	
  </div>
<?php echo $footer; ?>