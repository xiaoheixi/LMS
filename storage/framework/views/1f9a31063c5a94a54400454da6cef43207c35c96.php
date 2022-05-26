

<?php $__env->startPush('after-styles'); ?>
    
    <link rel="stylesheet" href="https://cdn.plyr.io/3.5.3/plyr.css"/>
    <link href="<?php echo e(asset('plugins/touchpdf-master/jquery.touchPDF.css')); ?>" rel="stylesheet">

    <style>
        .test-form {
            color: #333333;
        }

        .course-details-category ul li {
            width: 100%;
        }

        .sidebar.is_stuck {
            top: 15% !important;
        }

        .course-timeline-list {
            max-height: 300px;
            overflow: scroll;
        }

        .options-list li {
            list-style-type: none;
        }

        .options-list li.correct {
            color: green;

        }

        .options-list li.incorrect {
            color: red;

        }

        .options-list li.correct:before {
            content: "\f058"; /* FontAwesome Unicode */
            font-family: 'Font Awesome\ 5 Free';
            display: inline-block;
            color: green;
            margin-left: -1.3em; /* same as padding-left set on li */
            width: 1.3em; /* same as padding-left set on li */
        }

        .options-list li.incorrect:before {
            content: "\f057"; /* FontAwesome Unicode */
            font-family: 'Font Awesome\ 5 Free';
            display: inline-block;
            color: red;
            margin-left: -1.3em; /* same as padding-left set on li */
            width: 1.3em; /* same as padding-left set on li */
        }

        .options-list li:before {
            content: "\f111"; /* FontAwesome Unicode */
            font-family: 'Font Awesome\ 5 Free';
            display: inline-block;
            color: black;
            margin-left: -1.3em; /* same as padding-left set on li */
            width: 1.3em; /* same as padding-left set on li */
        }

        .touchPDF {
            border: 1px solid #e3e3e3;
        }

        .touchPDF > .pdf-outerdiv > .pdf-toolbar {
            height: 0;
            color: black;
            padding: 5px 0;
            text-align: right;
        }

        .pdf-tabs {
            width: 100% !important;
        }

        .pdf-outerdiv {
            width: 100% !important;
            left: 0 !important;
            padding: 0px !important;
            transform: scale(1) !important;
        }

        .pdf-viewer {
            left: 0px;
            width: 100% !important;
        }

        .pdf-drag {
            width: 100% !important;
        }

        .pdf-outerdiv {
            left: 0px !important;
        }

        .pdf-outerdiv {
            padding-left: 0px !important;
            left: 0px;
        }

        .pdf-toolbar {
            left: 0px !important;
            width: 99% !important;
            height: 30px;
        }

        .pdf-viewer {
            box-sizing: border-box;
            left: 0 !important;
            margin-top: 10px;
        }

        .pdf-title {
            display: none !important;
        }

        @media  screen  and  (max-width: 768px) {

        }

    </style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <!-- Start of breadcrumb section
        ============================================= -->
    <section id="breadcrumb" class="breadcrumb-section relative-position backgroud-style">
        <div class="blakish-overlay"></div>
        <div class="container">
            <div class="page-breadcrumb-content text-center">
                <div class="page-breadcrumb-title">
                    <h2 class="breadcrumb-head black bold">
                        <span><?php echo e($lesson->course->title); ?></span><br> <?php echo e($lesson->title); ?> </h2>
                </div>
            </div>
        </div>
    </section>
    <!-- End of breadcrumb section
        ============================================= -->


    <!-- Start of course details section
        ============================================= -->
    <section id="course-details" class="course-details-section">
        <div class="container ">
            <div class="row main-content">
                <div class="col-md-9">
                    <?php if(session()->has('success')): ?>
                        <div class="alert alert-dismissable alert-success fade show">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <?php echo e(session('success')); ?>

                        </div>
                    <?php endif; ?>
                    <?php echo $__env->make('includes.partials.messages', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

                    <div class="course-details-item border-bottom-0 mb-0">
                        <?php if($lesson->lesson_image != ""): ?>
                            <div class="course-single-pic mb30">
                                <img src="<?php echo e(asset('storage/uploads/'.$lesson->lesson_image)); ?>"
                                     alt="">
                            </div>
                        <?php endif; ?>


                        <?php if($test_exists): ?>
                            <div class="course-single-text">
                                <div class="course-title mt10 headline relative-position">
                                    <h3>
                                        <b><?php echo app('translator')->get('labels.frontend.course.test'); ?>
                                            : <?php echo e($lesson->title); ?></b>
                                    </h3>
                                </div>
                                <div class="course-details-content">
                                    <p> <?php echo $lesson->full_text; ?> </p>
                                </div>
                            </div>
                            <hr/>
                            <?php if(!is_null($test_result)): ?>
                                <div class="alert alert-info"><?php echo app('translator')->get('labels.frontend.course.your_test_score'); ?>
                                    : <?php echo e($test_result->test_result); ?>

                                    <br>
                                    <?php echo app('translator')->get('labels.frontend.course.your_score'); ?> : <?php echo e(number_format($percentage,2)); ?>% <br>
                                    <?php echo app('translator')->get('labels.frontend.course.your_result'); ?> : <?php echo e($test_pass); ?>

                                </div>
                                <?php if(config('retest')): ?>
                                    <form action="<?php echo e(route('lessons.retest',[$test_result->test->slug])); ?>" method="post">
                                        <?php echo csrf_field(); ?>
                                        <input type="hidden" name="result_id" value="<?php echo e($test_result->id); ?>">
                                        <button type="submit" class="btn gradient-bg font-weight-bold text-white"
                                                href="">
                                            <?php echo app('translator')->get('labels.frontend.course.give_test_again'); ?>
                                        </button>
                                    </form>
                                <?php endif; ?>
                                <?php if(count($lesson->questions) > 0  ): ?>
                                    <hr>

                                    <?php $__currentLoopData = $lesson->questions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $question): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                                        <h4 class="mb-0"><?php echo e($loop->iteration); ?>

                                            . <?php echo $question->question; ?>   <?php if(!$question->isAttempted($test_result->id)): ?>
                                                <small class="badge badge-danger"> <?php echo app('translator')->get('labels.frontend.course.not_attempted'); ?></small> <?php endif; ?>
                                        </h4>
                                        <br/>
                                        <ul class="options-list pl-4">
                                            <?php $__currentLoopData = $question->options; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $option): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                                                <li class="<?php if(($option->answered($test_result->id) != null && $option->answered($test_result->id) == 1) || ($option->correct == true)): ?> correct <?php elseif($option->answered($test_result->id) != null && $option->answered($test_result->id) == 2): ?> incorrect  <?php endif; ?>"> <?php echo e($option->option_text); ?>


                                                    <?php if($option->correct == 1 && $option->explanation != null): ?>
                                                        <p class="text-dark">
                                                            <b><?php echo app('translator')->get('labels.frontend.course.explanation'); ?></b><br>
                                                            <?php echo e($option->explanation); ?>

                                                        </p>
                                                    <?php endif; ?>
                                                </li>

                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </ul>
                                        <br/>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                <?php else: ?>
                                    <h3><?php echo app('translator')->get('labels.general.no_data_available'); ?></h3>

                                <?php endif; ?>
                            <?php else: ?>
                                <div class="test-form">
                                    <?php if(count($lesson->questions) > 0  ): ?>
                                        <form action="<?php echo e(route('lessons.test', [$lesson->slug])); ?>" method="post">
                                            <?php echo e(csrf_field()); ?>

                                            <?php $__currentLoopData = $lesson->questions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $question): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <h4 class="mb-0"><?php echo e($loop->iteration); ?>. <?php echo $question->question; ?>  </h4>
                                                <br/>
                                                <?php $__currentLoopData = $question->options; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $option): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio" name="questions[<?php echo e($question->id); ?>]"
                                                                   value="<?php echo e($option->id); ?>"/>
                                                            <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                                                            <?php echo e($option->option_text); ?><br/>
                                                        </label>
                                                    </div>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                <br/>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <input class="btn gradient-bg text-white font-weight-bold" type="submit"
                                                   value=" <?php echo app('translator')->get('labels.frontend.course.submit_results'); ?> "/>
                                        </form>
                                    <?php else: ?>
                                        <h3><?php echo app('translator')->get('labels.general.no_data_available'); ?></h3>

                                    <?php endif; ?>
                                </div>
                            <?php endif; ?>
                            <hr/>
                        <?php else: ?>
                            <div class="course-single-text">
                                <div class="course-title mt10 headline relative-position">
                                    <h3>
                                        <b><?php echo e($lesson->title); ?></b>
                                    </h3>
                                </div>
                                <div class="course-details-content">
                                    <?php if($lesson->live_lesson): ?>
                                        <p><?php echo e($lesson->short_text); ?></p>
                                    <?php else: ?>
                                        <p><?php echo $lesson->full_text; ?></p>
                                    <?php endif; ?>
                                </div>

                                <?php if($lesson->live_lesson): ?>
                                <h4 class="my-4"><?php echo app('translator')->get('labels.frontend.course.available_slots'); ?></h4>
                                <div class="affiliate-market-guide mb65">
                                    <div class="affiliate-market-accordion">
                                        <div id="accordion" class="panel-group">
                                            <?php $count = 0; ?>
                                            <?php $__currentLoopData = $lesson->liveLessonSlots; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $lessonSlot): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php $count++ ?>
                                                <div class="panel position-relative">
                                                    <div class="panel-title" id="headingOne">
                                                        <div class="ac-head">
                                                            <button class="btn btn-link collapsed" data-toggle="collapse"
                                                                    data-target="#collapse<?php echo e($count); ?>" aria-expanded="false"
                                                                    aria-controls="collapse<?php echo e($count); ?>">
                                                                <span><?php echo e(sprintf("%02d", $count)); ?></span>
                                                                <?php echo e($lessonSlot->topic); ?>

                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div id="collapse<?php echo e($count); ?>" class="collapse" aria-labelledby="headingOne"
                                                         data-parent="#accordion">
                                                        <div class="panel-body">
                                                            <?php echo $lessonSlot->description; ?>

                                                            <p class="my-auto"><span class="font-weight-bold"><?php echo app('translator')->get('labels.frontend.course.live_lesson_meeting_date'); ?></span> : <?php echo e($lessonSlot->start_at->format('d-m-Y h:i A')); ?> <strong>(<?php echo e(config('zoom.timezone')); ?>)</strong></p>
                                                            <p class="my-auto"><span class="font-weight-bold"><?php echo app('translator')->get('labels.frontend.course.live_lesson_meeting_duration'); ?></span> : <?php echo e($lessonSlot->duration); ?></p>
                                                           <?php if($lesson->lessonSlotBooking && $lesson->lessonSlotBooking->where('user_id', auth()->user()->id)->count()): ?>
                                                               <?php if(auth()->user()->lessonSlotBookings()->where('live_lesson_slot_id',$lessonSlot->id)->first()): ?>
                                                                    <?php if($lessonSlot->start_at->timezone(config('zoom.timezone'))->gt(\Carbon\Carbon::now(new DateTimeZone(config('zoom.timezone'))))): ?>
                                                                    <p class="my-auto"><span class="font-weight-bold"><?php echo app('translator')->get('labels.frontend.course.live_lesson_meeting_id'); ?></span> : <?php echo e($lessonSlot->meeting_id); ?></p>
                                                                    <p class="my-auto"><span class="font-weight-bold"><?php echo app('translator')->get('labels.frontend.course.live_lesson_meeting_password'); ?></span> : <?php echo e($lessonSlot->password); ?></p>

                                                                    <a class="btn btn-info mt-3"
                                                                       href="<?php echo e($lessonSlot->join_url); ?>" target="_blank">
                                                                        <span class="text-white font-weight-bold "><?php echo app('translator')->get('labels.frontend.course.live_lesson_join_url'); ?></span>
                                                                    </a>
                                                                    <?php endif; ?>
                                                               <?php endif; ?>
                                                           <?php else: ?>
                                                                <?php if($lessonSlot->lessonSlotBookings->count() >= $lessonSlot->student_limit): ?>

                                                                    <span class="btn btn-danger mt-3">
                                                                        <span class="text-white font-weight-bold "><?php echo app('translator')->get('labels.frontend.course.full_slot'); ?></span>
                                                                    </span>
                                                                <?php else: ?>
                                                                    <form method="post" action="<?php echo e(route('lessons.course.book-slot')); ?>">
                                                                        <?php echo csrf_field(); ?>
                                                                        <input type="hidden" value="<?php echo e($lessonSlot->id); ?>" name="live_lesson_slot_id">
                                                                        <input type="hidden" value="<?php echo e($lesson->id); ?>" name="lesson_id">
                                                                        <button class="btn btn-info mt-3"
                                                                        ><?php echo app('translator')->get('labels.frontend.course.book_slot'); ?></button>
                                                                    </form>
                                                                <?php endif; ?>
                                                           <?php endif; ?>
                                                        </div>
                                                    </div>
                                                </div>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </div>
                                    </div>
                                </div>
                                <?php endif; ?>
                            </div>
                        <?php endif; ?>

                        <?php if($lesson->mediaPDF): ?>
                            <div class="course-single-text mb-5">
                                
                                
                                
                                <div id="myPDF"></div>

                            </div>
                        <?php endif; ?>


                        <?php if($lesson->mediaVideo && $lesson->mediavideo->count() > 0): ?>
                            <div class="course-single-text">
                                <?php if($lesson->mediavideo != ""): ?>
                                    <div class="course-details-content mt-3">
                                        <div class="video-container mb-5" data-id="<?php echo e($lesson->mediavideo->id); ?>">
                                            <?php if($lesson->mediavideo->type == 'youtube'): ?>


                                                <div id="player" class="js-player" data-plyr-provider="youtube"
                                                     data-plyr-embed-id="<?php echo e($lesson->mediavideo->file_name); ?>"></div>
                                            <?php elseif($lesson->mediavideo->type == 'vimeo'): ?>
                                                <div id="player" class="js-player" data-plyr-provider="vimeo"
                                                     data-plyr-embed-id="<?php echo e($lesson->mediavideo->file_name); ?>"></div>
                                            <?php elseif($lesson->mediavideo->type == 'upload'): ?>


                                                <video poster="" id="player" class="js-player" playsinline controls>
                                                    <source src="<?php echo e($lesson->mediavideo->url); ?>" type="video/mp4"/>
                                                </video>
                                            <?php elseif($lesson->mediavideo->type == 'embed'): ?>
                                                <?php echo $lesson->mediavideo->url; ?>

                                            <?php endif; ?>
                                        </div>
                                    </div>
                                <?php endif; ?>
                            </div>
                        <?php endif; ?>

                        <?php if($lesson->mediaAudio): ?>                        
                            <div class="course-single-text mb-5">
                                <audio id="audioPlayer" controls>
                                    <source src="<?php echo e($lesson->mediaAudio->url); ?>" type="audio/mpeg"/>
                                </audio>
                            </div>
                        <?php endif; ?>
                        


                        <?php if(($lesson->downloadableMedia != "") && ($lesson->downloadableMedia->count() > 0)): ?>
                            <div class="course-single-text mt-4 px-3 py-1 gradient-bg text-white">
                                <div class="course-title mt10 headline relative-position">
                                    <h4 class="text-white">
                                        <?php echo app('translator')->get('labels.frontend.course.download_files'); ?>
                                    </h4>
                                </div>

                                <?php $__currentLoopData = $lesson->downloadableMedia; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $media): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="course-details-content text-white">
                                        <p class="form-group">
                                            <a href="<?php echo e(route('download',['filename'=>$media->name,'lesson'=>$lesson->id])); ?>"
                                               class="text-white font-weight-bold"><i
                                                        class="fa fa-download"></i> <?php echo e($media->name); ?>

                                                (<?php echo e(number_format((float)$media->size / 1024 , 2, '.', '')); ?> <?php echo app('translator')->get('labels.frontend.course.mb'); ?>
                                                )</a>
                                        </p>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        <?php endif; ?>
                    </div>
                    <!-- /course-details -->

                    <!-- /market guide -->

                    <!-- /review overview -->
                </div>

                <div class="col-md-3">
                    <div id="sidebar" class="sidebar">
                        <div class="course-details-category ul-li">
                            <?php if($previous_lesson): ?>
                                <p><a class="btn btn-block gradient-bg font-weight-bold text-white"
                                      href="<?php echo e(route('lessons.show', [$previous_lesson->course_id, $previous_lesson->model->slug])); ?>"><i
                                                class="fa fa-angle-double-left"></i>
                                        <?php echo app('translator')->get('labels.frontend.course.prev'); ?></a></p>
                            <?php endif; ?>

                            <p id="nextButton">
                                <?php if($next_lesson): ?>
                                    <?php if((int)config('lesson_timer') == 1 && $lesson->isCompleted() ): ?>
                                        <a class="btn btn-block gradient-bg font-weight-bold text-white"
                                           href="<?php echo e(route('lessons.show', [$next_lesson->course_id, $next_lesson->model->slug])); ?>"><?php echo app('translator')->get('labels.frontend.course.next'); ?>
                                            <i class='fa fa-angle-double-right'></i> </a>
                                    <?php else: ?>
                                        <a class="btn btn-block gradient-bg font-weight-bold text-white"
                                           href="<?php echo e(route('lessons.show', [$next_lesson->course_id, $next_lesson->model->slug])); ?>"><?php echo app('translator')->get('labels.frontend.course.next'); ?>
                                            <i class='fa fa-angle-double-right'></i> </a>
                                    <?php endif; ?>
                                <?php endif; ?>
                            </p>
                            
                                    
                                
                                    <!-- Remove the "You're certified" message on the dynamic course page -->
                                    
                                


                            <span class="float-none"><?php echo app('translator')->get('labels.frontend.course.course_timeline'); ?></span>
                            <ul class="course-timeline-list">
                                <?php $__currentLoopData = $lesson->course->courseTimeline()->orderBy('created_at')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php if($item->model && $item->model->published == 1): ?>
                                        
                                        <li class="<?php if($lesson->id == $item->model->id): ?> active <?php endif; ?> ">
                                            <a <?php if(in_array($item->model->id,$completed_lessons)): ?>href="<?php echo e(route('lessons.show',['course_id' => $lesson->course->id,'slug'=>$item->model->slug])); ?>"<?php endif; ?>>
                                                <?php echo e($item->model->title); ?>

                                                <?php if($item->model_type == 'App\Models\Test'): ?>
                                                    <p class="mb-0 text-primary">
                                                        - <?php echo app('translator')->get('labels.frontend.course.test'); ?></p>
                                                <?php endif; ?>
                                                <?php if(in_array($item->model->id,$completed_lessons)): ?> <i
                                                        class="fa text-success float-right fa-check-square"></i> <?php endif; ?>
                                            </a>
                                        </li>
                                    <?php endif; ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </ul>
                        </div>
                        <div class="couse-feature ul-li-block">
                            <ul>
                                <li><?php echo app('translator')->get('labels.frontend.course.chapters'); ?>
                                    <span> <?php echo e($lesson->course->chapterCount()); ?> </span></li>
                                <li><?php echo app('translator')->get('labels.frontend.course.category'); ?> <span><a
                                                href="<?php echo e(route('courses.category',['category'=>$lesson->course->category->slug])); ?>"
                                                target="_blank"><?php echo e($lesson->course->category->name); ?></a> </span></li>
                                <li><?php echo app('translator')->get('labels.frontend.course.author'); ?> <span>

                   <?php $__currentLoopData = $lesson->course->teachers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$teacher): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <?php $key++ ?>
                                            <a href="<?php echo e(route('teachers.show',['id'=>$teacher->id])); ?>" target="_blank">
                           <?php echo e($teacher->full_name); ?><?php if($key < count($lesson->course->teachers )): ?>, <?php endif; ?>
                       </a>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </span>
                                </li>
                                
                                            
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End of course details section
    ============================================= -->

<?php $__env->stopSection(); ?>

<?php $__env->startPush('after-scripts'); ?>
    
    <script src="<?php echo e(asset('plugins/sticky-kit/sticky-kit.js')); ?>"></script>
    <script src="https://cdn.plyr.io/3.5.3/plyr.polyfilled.js"></script>
    <script src="<?php echo e(asset('plugins/touchpdf-master/pdf.compatibility.js')); ?>"></script>
    <script src="<?php echo e(asset('plugins/touchpdf-master/pdf.js')); ?>"></script>
    <script src="<?php echo e(asset('plugins/touchpdf-master/jquery.touchSwipe.js')); ?>"></script>
    <script src="<?php echo e(asset('plugins/touchpdf-master/jquery.touchPDF.js')); ?>"></script>
    <script src="<?php echo e(asset('plugins/touchpdf-master/jquery.panzoom.js')); ?>"></script>
    <script src="<?php echo e(asset('plugins/touchpdf-master/jquery.mousewheel.js')); ?>"></script>
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>


    <script>
        <?php if($lesson->mediaPDF): ?>
        $(function () {
            $("#myPDF").pdf({
                source: "<?php echo e(asset('storage/uploads/'.$lesson->mediaPDF->name)); ?>",
                loadingHeight: 800,
                loadingWidth: 800,
                loadingHTML: ""
            });

        });
                <?php endif; ?>

        var storedDuration = 0;
        var storedLesson;
        storedDuration = Cookies.get("duration_" + "<?php echo e(auth()->user()->id); ?>" + "_" + "<?php echo e($lesson->id); ?>" + "_" + "<?php echo e($lesson->course->id); ?>");
        storedLesson = Cookies.get("lesson" + "<?php echo e(auth()->user()->id); ?>" + "_" + "<?php echo e($lesson->id); ?>" + "_" + "<?php echo e($lesson->course->id); ?>");
        var user_lesson;

        if (parseInt(storedLesson) != parseInt("<?php echo e($lesson->id); ?>")) {
            Cookies.set('lesson', parseInt('<?php echo e($lesson->id); ?>'));
        }


                <?php if($lesson->mediaVideo && $lesson->mediaVideo->type != 'embed'): ?>
        var current_progress = 0;


        <?php if($lesson->mediaVideo->getProgress(auth()->user()->id) != ""): ?>
            current_progress = "<?php echo e($lesson->mediaVideo->getProgress(auth()->user()->id)->progress); ?>";
                <?php endif; ?>



        const player2 = new Plyr('#audioPlayer');

        const player = new Plyr('#player');
        duration = 10;
        var progress = 0;
        var video_id = $('#player').parents('.video-container').data('id');
        player.on('ready', event => {
            player.currentTime = parseInt(current_progress);
            duration = event.detail.plyr.duration;


            if (!storedDuration || (parseInt(storedDuration) === 0)) {
                Cookies.set("duration_" + "<?php echo e(auth()->user()->id); ?>" + "_" + "<?php echo e($lesson->id); ?>" + "_" + "<?php echo e($lesson->course->id); ?>", duration);
            }

        });

        
        
        


        setInterval(function () {
            player.on('timeupdate', event => {
                if ((parseInt(current_progress) > 0) && (parseInt(current_progress) < parseInt(event.detail.plyr.currentTime))) {
                    progress = current_progress;
                } else {
                    progress = parseInt(event.detail.plyr.currentTime);
                }
            });
            if(duration !== 0 || parseInt(progress) !== 0 ) {
                saveProgress(video_id, duration, parseInt(progress));
            }
        }, 3000);


        function saveProgress(id, duration, progress) {
            $.ajax({
                url: "<?php echo e(route('update.videos.progress')); ?>",
                method: "POST",
                data: {
                    "_token": "<?php echo e(csrf_token()); ?>",
                    'video': parseInt(id),
                    'duration': parseInt(duration),
                    'progress': parseInt(progress)
                },
                success: function (result) {
                    if (progress === duration) {
                        location.reload();
                    }
                }
            });
        }


        $('#notice').on('hidden.bs.modal', function () {
            location.reload();
        });

        <?php endif; ?>

        $("#sidebar").stick_in_parent();


        <?php if((int)config('lesson_timer') != 0): ?>
        //Next Button enables/disable according to time

        var readTime, totalQuestions, testTime;
        user_lesson = Cookies.get("user_lesson_" + "<?php echo e(auth()->user()->id); ?>" + "_" + "<?php echo e($lesson->id); ?>" + "_" + "<?php echo e($lesson->course->id); ?>");

        <?php if($test_exists ): ?>
            totalQuestions = '<?php echo e(count($lesson->questions)); ?>'
        readTime = parseInt(totalQuestions) * 30;
        <?php else: ?>
            readTime = parseInt("<?php echo e($lesson->readTime()); ?>") * 60;
        <?php endif; ?>

        <?php if(!$lesson->isCompleted()): ?>
            storedDuration = Cookies.get("duration_" + "<?php echo e(auth()->user()->id); ?>" + "_" + "<?php echo e($lesson->id); ?>" + "_" + "<?php echo e($lesson->course->id); ?>");

            storedLesson = Cookies.get("lesson" + "<?php echo e(auth()->user()->id); ?>" + "_" + "<?php echo e($lesson->id); ?>" + "_" + "<?php echo e($lesson->course->id); ?>");

        if(storedDuration > 0){
             var totalLessonTime = parseInt(storedDuration) ? parseInt(storedDuration) : 0;
        }
        else {
            var totalLessonTime = readTime + (parseInt(storedDuration) ? parseInt(storedDuration) : 0);
        }


        var storedCounter = (Cookies.get("storedCounter_" + "<?php echo e(auth()->user()->id); ?>" + "_" + "<?php echo e($lesson->id); ?>" + "_" + "<?php echo e($lesson->course->id); ?>")) ? Cookies.get("storedCounter_" + "<?php echo e(auth()->user()->id); ?>" + "_" + "<?php echo e($lesson->id); ?>" + "_" + "<?php echo e($lesson->course->id); ?>") : 0;
        var counter;
        if (user_lesson) {
            if (user_lesson === 'true') {
                counter = 1;
            }
        } else {
            if ((storedCounter != 0) && storedCounter < totalLessonTime) {
                counter = storedCounter;
            } else {
                counter = totalLessonTime;
            }
        }
        var interval = setInterval(function () {
            counter--;
            // Display 'counter' wherever you want to display it.
            if (counter >= 0) {
                // Display a next button box
                $('#nextButton').html("<a class='btn btn-block bg-danger font-weight-bold text-white' href='#'><?php echo app('translator')->get('labels.frontend.course.next'); ?> (in " + counter + " seconds)</a>")
                Cookies.set("duration_" + "<?php echo e(auth()->user()->id); ?>" + "_" + "<?php echo e($lesson->id); ?>" + "_" + "<?php echo e($lesson->course->id); ?>", counter);

            }
            if (counter === 0) {
                Cookies.set("user_lesson_" + "<?php echo e(auth()->user()->id); ?>" + "_" + "<?php echo e($lesson->id); ?>" + "_" + "<?php echo e($lesson->course->id); ?>", 'true');
                Cookies.remove('duration');

                <?php if($test_exists && (is_null($test_result))): ?>
                $('#nextButton').html("<a class='btn btn-block bg-danger font-weight-bold text-white' href='#'><?php echo app('translator')->get('labels.frontend.course.complete_test'); ?></a>")
                <?php else: ?>
                <?php if($next_lesson): ?>
                $('#nextButton').html("<a class='btn btn-block gradient-bg font-weight-bold text-white'" +
                    " href='<?php echo e(route('lessons.show', [$next_lesson->course_id, $next_lesson->model->slug])); ?>'><?php echo app('translator')->get('labels.frontend.course.next'); ?><i class='fa fa-angle-double-right'></i> </a>");
                //Remove the Finish Course button
                // <?php else: ?>
                // $('#nextButton').html("<form method='post' action='<?php echo e(route("admin.certificates.generate")); ?>'>" +
                //     "<input type='hidden' name='_token' id='csrf-token' value='<?php echo e(Session::token()); ?>' />" +
                //     "<input type='hidden' value='<?php echo e($lesson->course->id); ?>' name='course_id'> " +
                //     "<button class='btn btn-success btn-block text-white mb-3 text-uppercase font-weight-bold' id='finish'><?php echo app('translator')->get('labels.frontend.course.finish_course'); ?></button></form>");

                <?php endif; ?>

                <?php if(!$lesson->isCompleted()): ?>
                courseCompleted("<?php echo e($lesson->id); ?>", "<?php echo e(get_class($lesson)); ?>");
                <?php endif; ?>
                <?php endif; ?>
                clearInterval(counter);
            }
        }, 1000);

        <?php endif; ?>
        <?php endif; ?>

        // function courseCompleted(id, type) {
        //     $.ajax({
        //         url: "<?php echo e(route('update.course.progress')); ?>",
        //         method: "POST",
        //         data: {
        //             "_token": "<?php echo e(csrf_token()); ?>",
        //             'model_id': parseInt(id),
        //             'model_type': type,
        //         },
        //     });
        // }

    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('frontend.layouts.app'.config('theme_layout'), \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\adria\Desktop\LWS\resources\views/frontend/courses/lesson.blade.php ENDPATH**/ ?>