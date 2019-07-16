<?php (defined('BASEPATH')) OR exit('No direct script access allowed'); ?>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title"><?= lang('enter_info'); ?></h3>
                </div>
                <div class="box-body">
                    <div class="col-lg-12">

                        <?php echo form_open_multipart("sellas/add", 'class="validation"'); ?>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <?= lang('code', 'code'); ?>
                                    <?= form_input('code', set_value('code'), 'class="form-control tip" id="code"  required="required"'); ?>
                                </div>
                                <div class="form-group">
                                    <?= lang('name', 'name'); ?>
                                    <?= form_input('name', set_value('name'), 'class="form-control tip" id="name"  required="required"'); ?>
                                </div>
                                <div class="form-group">
                                    <?= lang('sellasvalue', 'sellasvalue'); ?>
                                    <?= form_input('sellasvalue', set_value('sellasvalue'), 'class="form-control tip" id="sellasvalue"  required="required" type="number"'); ?>
                                </div> 
                            </div>
                        </div>

                        <div class="form-group">
                            <?= form_submit('add_sellas', lang('add_sellas'), 'class="btn btn-primary"'); ?>
                        </div>

                        <?php echo form_close();?>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</section>
