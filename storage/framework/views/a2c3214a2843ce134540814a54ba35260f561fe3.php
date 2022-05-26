<?php $__env->startComponent('mail::message'); ?>
#Hello <?php echo e(auth()->user()->name); ?>


We have successfully received your request for following:<br>
Order Reference No. <?php echo e($content['reference_no']); ?>

<?php $__currentLoopData = $content['items']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
#<?php echo e($item['number']); ?>. <?php echo e($item['name']); ?> <?php echo e($appCurrency['symbol'].$item['price']); ?>

<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

#Total Amount : <?php echo e($appCurrency['symbol']); ?> <?php echo e($content['total']); ?>


Our representatives will contact you soon regarding order payments.
Happy Shopping.


Thanks,<br>
<?php echo e(config('app.name')); ?>

<?php if (isset($__componentOriginal2dab26517731ed1416679a121374450d5cff5e0d)): ?>
<?php $component = $__componentOriginal2dab26517731ed1416679a121374450d5cff5e0d; ?>
<?php unset($__componentOriginal2dab26517731ed1416679a121374450d5cff5e0d); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php /**PATH C:\Users\adria\Desktop\LWS\resources\views/emails/offlineOrderMail.blade.php ENDPATH**/ ?>