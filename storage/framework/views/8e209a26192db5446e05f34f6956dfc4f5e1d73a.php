<?php $request = app('Illuminate\Http\Request'); ?>

<?php $__env->startSection('title', __('labels.backend.live_lesson_slots.title').' | '.app_name()); ?>

<?php $__env->startSection('content'); ?>

    <div class="card">
        <div class="card-header">
            <h3 class="page-title d-inline"><?php echo app('translator')->get('labels.backend.live_lesson_slots.title'); ?></h3>
            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('live_lesson_slot_create')): ?>
                <div class="float-right">
                    <a href="<?php echo e(route('admin.live-lesson-slots.create')); ?><?php if(request('lesson_id')): ?><?php echo e('?lesson_id='.request('lesson_id')); ?><?php endif; ?>"
                       class="btn btn-success"><?php echo app('translator')->get('strings.backend.general.app_add_new'); ?></a>

                </div>
            <?php endif; ?>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 col-lg-6 form-group">
                    <?php echo Form::label('lesson_id', trans('labels.backend.live_lesson_slots.fields.lesson'), ['class' => 'control-label']); ?>

                    <?php echo Form::select('lesson_id', $liveLessons,  (request('lesson_id')) ? request('lesson_id') : old('lesson_id'), ['class' => 'form-control js-example-placeholder-single select2 ', 'id' => 'lesson_id']); ?>

                </div>
            </div>

            <?php if(request('lesson_id') != "" || request('show_deleted') != ""): ?>
                <div class="table-responsive">

                    <table id="myTable"
                           class="table table-bordered table-striped <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('live_lesson_slot_delete')): ?> <?php if( request('show_deleted') != 1 ): ?> dt-select <?php endif; ?> <?php endif; ?>">
                        <thead>
                        <tr>
                            <th><?php echo app('translator')->get('labels.backend.live_lesson_slots.slot'); ?></th>

                            <th><?php echo app('translator')->get('labels.backend.live_lessons.fields.course'); ?></th>
                            <th><?php echo app('translator')->get('labels.backend.live_lesson_slots.fields.meeting_id'); ?></th>
                            <th><?php echo app('translator')->get('labels.backend.live_lesson_slots.fields.password'); ?></th>
                            <th><?php echo app('translator')->get('labels.backend.live_lesson_slots.fields.duration'); ?></th>
                            <th><?php echo app('translator')->get('labels.backend.live_lesson_slots.fields.date'); ?></th>
                            <th><?php echo app('translator')->get('labels.backend.live_lesson_slots.start_url'); ?></th>
                            <?php if( request('show_deleted') == 1 ): ?>
                                <th><?php echo app('translator')->get('strings.backend.general.actions'); ?> &nbsp;</th>
                            <?php else: ?>
                                <th><?php echo app('translator')->get('strings.backend.general.actions'); ?> &nbsp;</th>
                            <?php endif; ?>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </div>
            <?php endif; ?>

        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('after-scripts'); ?>
    <script>

        $(document).ready(function () {
            var route = '<?php echo e(route('admin.live-lesson-slots.get_data')); ?>';


            <?php
            $show_deleted = (request('show_deleted') == 1) ? 1 : 0;
            $lesson_id = (request('lesson_id') != "") ? request('lesson_id') : 0;
            $route = route('admin.live-lesson-slots.get_data',['show_deleted' => $show_deleted,'lesson_id' => $lesson_id]);
            ?>

            route = '<?php echo e($route); ?>';
            route = route.replace(/&amp;/g, '&');

            <?php if(request('lesson_id') != "" || request('show_deleted') != ""): ?>

            $('#myTable').DataTable({
                processing: true,
                serverSide: true,
                iDisplayLength: 10,
                retrieve: true,
                dom: 'lfBrtip<"actions">',
                buttons: [
                    {
                        extend: 'csv',
                        exportOptions: {
                            columns: [ 1, 2, 3, 4, 5]
                        }
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {
                            columns: [ 1, 2, 3, 4, 5]
                        }
                    },
                    'colvis'
                ],
                ajax: route,
                columns: [
                    {data: "DT_RowIndex", name: 'DT_RowIndex', searchable: false, orderable:false},
                    {data: "course", name: 'course', searchable: false, orderable: false},
                    {data: "meeting_id", name: 'meeting_id', searchable: false, orderable:false},
                    {data: "password", name: 'password', searchable: false, orderable:false},
                    {data: "duration", name: 'duration', searchable: false, orderable:false},
                    {data: "start_at", name: 'start_at', searchable: false, orderable:false},
                    {data: "start_url", name: 'start_url', searchable: false, orderable:false},
                    {data: "actions", name: "actions", searchable: false, orderable:false}
                ],
                <?php if(request('show_deleted') != 1): ?>
                columnDefs: [
                    {"width": "5%", "targets": 0},
                    {"className": "text-center", "targets": [0]}
                ],
                <?php endif; ?>

                createdRow: function (row, data, dataIndex) {
                    $(row).attr('data-entry-id', data.id);
                },
                language:{
                    url : "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/<?php echo e($locale_full_name); ?>.json",
                    buttons :{
                        colvis : '<?php echo e(trans("datatable.colvis")); ?>',
                        pdf : '<?php echo e(trans("datatable.pdf")); ?>',
                        csv : '<?php echo e(trans("datatable.csv")); ?>',
                    }
                }
            });

            <?php endif; ?>

            $(".js-example-placeholder-single").select2({
                placeholder: "<?php echo e(trans('labels.backend.live_lesson_slots.select_lesson')); ?>",
            });
            $(document).on('change', '#lesson_id', function (e) {
                var lesson_id = $(this).val();
                window.location.href = "<?php echo e(route('admin.live-lesson-slots.index')); ?>" + "?lesson_id=" + lesson_id
            });
        });

    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\adria\Desktop\LWS\resources\views/backend/live-lesson-slots/index.blade.php ENDPATH**/ ?>