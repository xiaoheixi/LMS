

<?php $__env->startSection('title', __('labels.backend.access.users.management') . ' | ' . __('labels.backend.access.users.deactivated')); ?>

<?php $__env->startSection('breadcrumb-links'); ?>
    <?php echo $__env->make('backend.auth.user.includes.breadcrumb-links', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="card">
    <div class="card-body">
        <div class="row">
            <div class="col-sm-5">
                <h4 class="card-title mb-0">
                    <?php echo app('translator')->get('labels.backend.access.users.management'); ?>
                    <small class="text-muted"><?php echo app('translator')->get('labels.backend.access.users.deactivated'); ?></small>
                </h4>
            </div><!--col-->
        </div><!--row-->

        <div class="row mt-4">
            <div class="col">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.access.users.table.last_name'); ?></th>
                            <th><?php echo app('translator')->get('labels.backend.access.users.table.first_name'); ?></th>
                            <th><?php echo app('translator')->get('labels.backend.access.users.table.email'); ?></th>
                            <th><?php echo app('translator')->get('labels.backend.access.users.table.confirmed'); ?></th>
                            <th><?php echo app('translator')->get('labels.backend.access.users.table.roles'); ?></th>
                            <th><?php echo app('translator')->get('labels.backend.access.users.table.other_permissions'); ?></th>
                            <th><?php echo app('translator')->get('labels.backend.access.users.table.social'); ?></th>
                            <th><?php echo app('translator')->get('labels.backend.access.users.table.last_updated'); ?></th>
                            <th><?php echo app('translator')->get('labels.general.actions'); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if($users->count()): ?>
                            <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($user->last_name); ?></td>
                                    <td><?php echo e($user->first_name); ?></td>
                                    <td><?php echo e($user->email); ?></td>
                                    <td><?php echo $user->confirmed_label; ?></td>
                                    <td><?php echo $user->roles_label; ?></td>
                                    <td><?php echo $user->permissions_label; ?></td>
                                    <td><?php echo $user->social_buttons; ?></td>
                                    <td><?php echo e($user->updated_at->diffForHumans()); ?></td>
                                    <td><?php echo $user->action_buttons; ?></td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php else: ?>
                            <tr><td colspan="9"><p class="text-center"><?php echo app('translator')->get('strings.backend.access.users.no_deactivated'); ?></p></td></tr>
                        <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div><!--col-->
        </div><!--row-->
        <div class="row">
            <div class="col-7">
                <div class="float-left">
                    <?php echo $users->total(); ?> <?php echo e(trans_choice('labels.backend.access.users.table.total', $users->total())); ?>

                </div>
            </div><!--col-->

            <div class="col-5">
                <div class="float-right">
                    <?php echo $users->render(); ?>

                </div>
            </div><!--col-->
        </div><!--row-->
    </div><!--card-body-->
</div><!--card-->
<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\adria\Desktop\LWS\resources\views/backend/auth/user/deactivated.blade.php ENDPATH**/ ?>