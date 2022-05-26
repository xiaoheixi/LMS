

<?php $__env->startSection('title', __('labels.backend.live_lessons.create').' | '.app_name()); ?>

<?php $__env->startSection('content'); ?>

    <?php echo Form::open(['method' => 'POST', 'route' => ['admin.live-lessons.store'], 'files' => true,]); ?>

    <?php echo Form::hidden('model_id',0,['id'=>'live_lesson_id']); ?>

    <div class="card">
        <div class="card-header">
            <h3 class="page-title float-left mb-0"><?php echo app('translator')->get('labels.backend.live_lessons.create'); ?></h3>
            <div class="float-right">
                <a href="<?php echo e(route('admin.live-lessons.index')); ?>"
                   class="btn btn-success"><?php echo app('translator')->get('labels.backend.live_lessons.view'); ?></a>
            </div>
        </div>
        <div class="card-body">
            <?php echo $__env->make('backend.live-lessons.form',['liveLesson' => optional()], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <div class="row">
                <div class="col-12  text-center form-group">
                    <?php echo Form::submit(trans('strings.backend.general.app_save'), ['class' => 'btn  btn-danger']); ?>

                </div>
            </div>
        </div>
    </div>

    <?php echo Form::close(); ?>


<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\adria\Desktop\LWS\resources\views/backend/live-lessons/create.blade.php ENDPATH**/ ?>