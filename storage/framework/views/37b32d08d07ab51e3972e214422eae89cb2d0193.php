<?php $__env->startComponent('mail::message'); ?>
Hello **<?php echo e(auth()->user()->name); ?>**

You have successfully booked your live lesson **<?php echo e($content->lesson->title); ?>** slot

Zoom Meeting ID **<?php echo e($content->meeting_id); ?>** <br>
Password **<?php echo e($content->password); ?>** <br>
Date **<?php echo e($content->start_at->format('d-m-Y h:i A')); ?> (<?php echo e(config('zoom.timezone')); ?>)** <br>


<?php $__env->startComponent('mail::button', ['url' => 'https://us04web.zoom.us/j/'.$content->meeting_id]); ?>
Join URL
<?php if (isset($__componentOriginalb8f5c8a6ad1b73985c32a4b97acff83989288b9e)): ?>
<?php $component = $__componentOriginalb8f5c8a6ad1b73985c32a4b97acff83989288b9e; ?>
<?php unset($__componentOriginalb8f5c8a6ad1b73985c32a4b97acff83989288b9e); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>

[https://us04web.zoom.us/j/<?php echo e($content->meeting_id); ?>](https://us04web.zoom.us/j/<?php echo e($content->meeting_id); ?>).


Thanks,<br>
<?php echo e(config('app.name')); ?>

<?php if (isset($__componentOriginal2dab26517731ed1416679a121374450d5cff5e0d)): ?>
<?php $component = $__componentOriginal2dab26517731ed1416679a121374450d5cff5e0d; ?>
<?php unset($__componentOriginal2dab26517731ed1416679a121374450d5cff5e0d); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php /**PATH C:\Users\adria\Desktop\LWS\resources\views/emails/studentMeetingSlotMail.blade.php ENDPATH**/ ?>