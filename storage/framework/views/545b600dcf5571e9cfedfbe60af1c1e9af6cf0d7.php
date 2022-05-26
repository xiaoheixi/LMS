
<?php $__env->startSection('title', __('labels.backend.coupons.title').' | '.app_name()); ?>

<?php $__env->startPush('after-styles'); ?>
    <style>
        .form-control-label {
            line-height: 35px;
        }
        .remove{
            float: right;
            color: red;
            font-size: 20px;
            cursor: pointer;
        }
        .error{
            color: red;
        }

    </style>

<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <?php echo e(html()->form('POST', route('admin.coupons.store'))->id('coupons-create')->class('form-horizontal')->acceptsFiles()->open()); ?>

    <div class="alert alert-danger d-none" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
        </button>
        <div class="error-list">
        </div>
    </div>
    <div class="card">
        <div class="card-header">
            <h3 class="page-title d-inline"><?php echo app('translator')->get('labels.backend.coupons.create'); ?></h3>
            <div class="float-right">
                <a href="<?php echo e(route('admin.coupons.index')); ?>"
                   class="btn btn-success"><?php echo app('translator')->get('labels.backend.coupons.view'); ?></a>

            </div>
        </div>
        <div class="card-body">

            <div class="row form-group">
                <?php echo e(html()->label(__('labels.backend.coupons.fields.name'))->class('col-md-2 form-control-label')->for('first_name')); ?>


                <div class="col-md-10">
                    <?php echo e(html()->text('name')
                        ->class('form-control')
                        ->placeholder(__('labels.backend.coupons.fields.name'))
                    ->autofocus()); ?>


                </div><!--col-->
            </div>
            <div class="row form-group">
                <?php echo e(html()->label(__('labels.backend.coupons.fields.description'))->class('col-md-2 form-control-label')->for('description')); ?>


                <div class="col-md-10">
                    <?php echo e(html()->textarea('description')
                        ->class('form-control')
                        ->placeholder(__('labels.backend.coupons.fields.description'))
                    ->autofocus()); ?>


                </div><!--col-->
            </div>
            <div class="row form-group">
                <?php echo e(html()->label(__('labels.backend.coupons.fields.code'))->class('col-md-2 form-control-label')->for('first_name')); ?>


                <div class="col-md-10">
                    <?php echo e(html()->text('code')
                        ->class('form-control')
                        ->placeholder('Ex: MyShopping50')); ?>


                </div><!--col-->
            </div>

            <div class="row form-group">
                <?php echo e(html()->label(__('labels.backend.coupons.fields.type'))->class('col-md-2 form-control-label')->for('first_name')); ?>


                <div class="col-md-10">
                    <?php echo e(html()->select('type',[1=>__('labels.backend.coupons.discount_rate').' (in %)',2=>__('labels.backend.coupons.flat_rate')])
                        ->class('form-control')); ?>

                    <p class="mb-0"><?php echo app('translator')->get('labels.backend.coupons.type_note'); ?></p>
                </div><!--col-->
            </div>


            <div class="row form-group">
                <?php echo e(html()->label(__('labels.backend.coupons.fields.amount'))->class('col-md-2 form-control-label')->for('amount')); ?>


                <div class="col-md-10">
                    <?php echo e(html()->input('number','amount')
                    ->placeholder(__('labels.backend.coupons.fields.amount'))
                        ->class('form-control')); ?>

                    <p class="mb-0"><?php echo app('translator')->get('labels.backend.coupons.amount_note'); ?></p>

                </div><!--col-->
            </div>

            <div class="row form-group">
                <?php echo e(html()->label( trans('labels.backend.coupons.fields.expires_at'))->class('col-md-2 form-control-label')->for('expires_at')); ?>


                <div class="col-md-10">
                <?php echo Form::text('expires_at', old('expires_at'), ['class' => 'form-control date','pattern' => '(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))','id'=>'expires_at', 'placeholder' => 'yyyy-mm-dd | Ex . 2019-01-01', 'autocomplete' => 'off']); ?>

                </div>
            </div>

            <div class="row form-group">
                <?php echo e(html()->label(__('labels.backend.coupons.fields.min_price'))->class('col-md-2 form-control-label')->for('amount')); ?>


                <div class="col-md-10">
                    <?php echo e(html()->input('number','min_price')
                    ->placeholder(__('labels.backend.coupons.fields.min_price'))
                        ->class('form-control')); ?>


                </div><!--col-->
            </div>


            <div class="row form-group">
                <?php echo e(html()->label(__('labels.backend.coupons.fields.per_user_limit'))->class('col-md-2 form-control-label')->for('per_user_limit')); ?>


                <div class="col-md-10">
                    <?php echo e(html()->input('number','per_user_limit')
                    ->placeholder(__('labels.backend.coupons.fields.per_user_limit'))
                        ->class('form-control')); ?>

                    <p class="mb-0"><?php echo app('translator')->get('labels.backend.coupons.per_user_limit_note'); ?></p>

                </div><!--col-->
            </div>


            <div class="form-group row justify-content-center">
                <div class="col-4">
                    <?php echo e(form_cancel(route('admin.coupons.index'), __('buttons.general.cancel'))); ?>


                    <button class="btn btn-success pull-right" type="submit"><?php echo e(__('buttons.general.crud.create')); ?></button>
                </div>
            </div><!--col-->
        </div>
    </div>
    <?php echo e(html()->form()->close()); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('after-scripts'); ?>
<script>
    $(document).ready(function () {
        $('#expires_at').datepicker({
            autoclose: true,
            minDate:0,
            dateFormat: "<?php echo e(config('app.date_format_js')); ?>"
        });

    });
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\adria\Desktop\LWS\resources\views/backend/coupons/create.blade.php ENDPATH**/ ?>