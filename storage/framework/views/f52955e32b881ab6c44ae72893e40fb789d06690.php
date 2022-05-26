
<?php $__env->startSection('title', __('labels.backend.courses.title').' | '.app_name()); ?>

<?php $__env->startPush('after-styles'); ?>
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('plugins/amigo-sorter/css/theme-default.css')); ?>">
    <style>
        ul.sorter > span {
            display: inline-block;
            width: 100%;
            height: 100%;
            background: #f5f5f5;
            color: #333333;
            border: 1px solid #cccccc;
            border-radius: 6px;
            padding: 0px;
        }

        ul.sorter li > span .title {
            padding-left: 15px;
            width: 70%;
        }

        ul.sorter li > span .btn {
            width: 20%;
        }

        @media  screen and (max-width: 768px) {

            ul.sorter li > span .btn {
                width: 30%;
            }

            ul.sorter li > span .title {
                padding-left: 15px;
                width: 70%;
                float: left;
                margin: 0 !important;
            }

        }


    </style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>

    <div class="card">

        <div class="card-header">
            <h3 class="page-title mb-0"><?php echo app('translator')->get('labels.backend.courses.title'); ?></h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.courses.fields.teachers'); ?></th>
                            <td>
                                <?php $__currentLoopData = $course->teachers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $singleTeachers): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <span class="label label-info label-many"><?php echo e($singleTeachers->name); ?></span>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </td>
                        </tr>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.courses.fields.title'); ?></th>
                            <td>
                                <?php if($course->published == 1): ?>
                                    <a target="_blank"
                                       href="<?php echo e(route('courses.show', [$course->slug])); ?>"><?php echo e($course->title); ?></a>
                                <?php else: ?>
                                    <?php echo e($course->title); ?>

                                <?php endif; ?>
                            </td>
                        </tr>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.courses.fields.slug'); ?></th>
                            <td><?php echo e($course->slug); ?></td>
                        </tr>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.courses.fields.category'); ?></th>
                            <td><?php echo e($course->category->name); ?></td>
                        </tr>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.courses.fields.description'); ?></th>
                            <td><?php echo $course->description; ?></td>
                        </tr>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.courses.fields.price'); ?></th>
                            <td><?php echo e(($course->free == 1) ? trans('labels.backend.courses.fields.free') : $course->price.' '.$appCurrency['symbol']); ?></td>
                        </tr>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.courses.fields.course_image'); ?></th>
                            <td><?php if($course->course_image): ?><a
                                        href="<?php echo e(asset('storage/uploads/' . $course->course_image)); ?>"
                                        target="_blank"><img
                                            src="<?php echo e(asset('storage/uploads/' . $course->course_image)); ?>"
                                            height="50px"/></a><?php endif; ?></td>
                        </tr>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.lessons.fields.media_video'); ?></th>
                            <td>
                                <?php if($course->mediaVideo !=  null ): ?>
                                    <p class="form-group mb-0">
                                        <a href="<?php echo e($course->mediaVideo->url); ?>"
                                           target="_blank"><?php echo e($course->mediaVideo->url); ?></a>
                                    </p>
                                <?php else: ?>
                                    <p>No Videos</p>
                                <?php endif; ?>
                            </td>
                        </tr>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.courses.fields.start_date'); ?></th>
                            <td><?php echo e($course->start_date); ?></td>
                        </tr>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.courses.fields.expire_at'); ?></th>
                            <td><?php echo e($course->expire_at); ?></td>
                        </tr>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.courses.fields.published'); ?></th>
                            <td><?php echo e(Form::checkbox("published", 1, $course->published == 1 ? true : false, ["disabled"])); ?></td>
                        </tr>

                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.courses.fields.meta_title'); ?></th>
                            <td><?php echo e($course->meta_title); ?></td>
                        </tr>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.courses.fields.meta_description'); ?></th>
                            <td><?php echo e($course->meta_description); ?></td>
                        </tr>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.courses.fields.meta_keywords'); ?></th>
                            <td><?php echo e($course->meta_keywords); ?></td>
                        </tr>
                    </table>
                </div>
            </div><!-- Nav tabs -->

            <?php if(count($courseTimeline) > 0): ?>
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-12  ">
                        <h4 class=""><?php echo app('translator')->get('labels.backend.courses.course_timeline'); ?></h4>
                        <p class="mb-0"><?php echo app('translator')->get('labels.backend.courses.listing_note'); ?></p>
                        <p class=""><?php echo app('translator')->get('labels.backend.courses.timeline_description'); ?></p>
                        <ul class="sorter d-inline-block">

                            <?php $__currentLoopData = $courseTimeline; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                                <?php if(isset($item->model) && $item->model->published == 1): ?>

                                    <li>
                                        <span data-id="<?php echo e($item->id); ?>" data-sequence="<?php echo e($item->sequence); ?>">
                                    <?php if($item->model_type == 'App\Models\Test'): ?>
                                        <p class="d-inline-block mb-0 btn btn-primary">
                                            <?php echo app('translator')->get('labels.backend.courses.test'); ?>
                                         </p>
                                    <?php elseif($item->model_type == 'App\Models\Lesson'): ?>
                                        <?php if($item->model->live_lesson): ?>
                                            <p class="d-inline-block mb-0 btn btn-info">
                                                <?php echo app('translator')->get('labels.backend.live_lessons.title'); ?>
                                            </p>
                                        <?php else: ?>
                                        <p class="d-inline-block mb-0 btn btn-success">
                                            <?php echo app('translator')->get('labels.backend.courses.lesson'); ?>
                                        </p>
                                        <?php endif; ?>
                                     <?php endif; ?>
                                    <?php if($item->model): ?>
                                    <p class="title d-inline ml-2"><?php echo e($item->model->title); ?></p>
                                    <?php endif; ?>
                                     </span>

                                    </li>
                                <?php endif; ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </ul>
                        <a href="<?php echo e(route('admin.courses.index')); ?>"
                           class="btn btn-default border float-left"><?php echo app('translator')->get('strings.backend.general.app_back_to_list'); ?></a>

                        <a href="#" id="save_timeline"
                           class="btn btn-primary float-right"><?php echo app('translator')->get('labels.backend.courses.save_timeline'); ?></a>

                    </div>

                </div>
            <?php endif; ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('after-scripts'); ?>
    <script src="<?php echo e(asset('plugins/amigo-sorter/js/amigo-sorter.min.js')); ?>"></script>
    <script>
        $(function () {
            $('ul.sorter').amigoSorter({
                li_helper: "li_helper",
                li_empty: "empty",
            });
            $(document).on('click', '#save_timeline', function (e) {
                e.preventDefault();
                var list = [];
                $('ul.sorter li').each(function (key, value) {
                    key++;
                    var val = $(value).find('span').data('id');
                    list.push({id: val, sequence: key});
                });

                $.ajax({
                    method: 'POST',
                    url: "<?php echo e(route('admin.courses.saveSequence')); ?>",
                    data: {
                        _token: '<?php echo e(csrf_token()); ?>',
                        list: list
                    }
                }).done(function () {
                    location.reload();
                });
            })
        });

    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\adria\Desktop\LWS\resources\views/backend/courses/show.blade.php ENDPATH**/ ?>