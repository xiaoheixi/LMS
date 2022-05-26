

<?php $__env->startSection('title', __('labels.backend.stripe.plan.title').' | '.app_name()); ?>

<?php $__env->startSection('content'); ?>

    <?php echo Form::open(['method' => 'POST', 'route' => ['admin.stripe.plans.store'], 'files' => true]); ?>

    <div class="card">
        <div class="card-header">
            <h3 class="page-title float-left mb-0"><?php echo app('translator')->get('labels.backend.stripe.plan.create'); ?></h3>
            <div class="float-right">
                <a href="<?php echo e(route('admin.stripe.plans.index')); ?>"
                   class="btn btn-success"><?php echo app('translator')->get('labels.backend.stripe.plan.view'); ?></a>
            </div>
        </div>
        <div class="card-body">
            <?php echo $__env->make('backend.stripe.plan.form',['plan' => optional()], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <div class="row">
                <div class="col-12  text-center form-group">
                    <?php echo Form::submit(trans('strings.backend.general.app_save'), ['class' => 'btn  btn-danger']); ?>

                </div>
            </div>
        </div>
    </div>

    <?php echo Form::close(); ?>


<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\adria\Desktop\LWS\resources\views/backend/stripe/plan/create.blade.php ENDPATH**/ ?>