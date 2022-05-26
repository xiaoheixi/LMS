<?php $__env->startComponent('mail::message'); ?>
# Hello Admin

In our system new user registered, User details are below

Name **<?php echo e($user->name); ?>** <br>
Email **<?php echo e($user->email); ?>**


Thanks,<br>
<?php echo e(config('app.name')); ?>

<?php if (isset($__componentOriginal2dab26517731ed1416679a121374450d5cff5e0d)): ?>
<?php $component = $__componentOriginal2dab26517731ed1416679a121374450d5cff5e0d; ?>
<?php unset($__componentOriginal2dab26517731ed1416679a121374450d5cff5e0d); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php /**PATH C:\Users\adria\Desktop\LWS\resources\views/emails/adminRegisteredMail.blade.php ENDPATH**/ ?>