<!-- Start of footer area
    ============================================= -->
<?php
$footer_data = json_decode(config('footer_data'));
?>

<?php if($footer_data != ''): ?>
    <footer>
        <section id="footer-area" class="footer-area-section">
            <div class="container">
                <div class="footer-content pb10">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="footer-widget ">
                                <div class="footer-logo mb35">
                                    <img src="<?php echo e(asset('storage/logos/' . config('logo_b_image'))); ?>" alt="logo">
                                </div>
                                <?php if($footer_data->short_description->status == 1): ?>
                                    <div class="footer-about-text">
                                        <p><?php echo $footer_data->short_description->text; ?> </p>
                                    </div>
                                <?php endif; ?>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <!-- /footer-widget-content -->
                <div class="footer-social-subscribe mb65">
                    <div class="row">
                        <?php if($footer_data->social_links->status == 1 && count($footer_data->social_links->links) > 0): ?>
                            <div class="col-md-4">
                                <div class="footer-social ul-li ">
                                    <h2 class="widget-title"><?php echo app('translator')->get('labels.frontend.layouts.partials.social_network'); ?>
                                    </h2>
                                    <ul>
                                        <?php $__currentLoopData = $footer_data->social_links->links; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <li><a href="<?php echo e($item->link); ?>"><i class="<?php echo e($item->icon); ?>"></i></a>
                                            </li>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                    </ul>
                                </div>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>


                

                <?php if($footer_data->bottom_footer->status == 1): ?>
                    <div class="copy-right-menu">
                        <div class="row">
                            <?php if($footer_data->copyright_text->status == 1): ?>
                                <div class="col-md-6">
                                    <svg viewBox="0 0" fill="none" xmlns="http://www.w3.org/2000/svg"
                                        style="width:45px; height:36px;">
                                        <title>MasterCard</title>
                                        <path d="M17.1841 7.20731H26.2149V23.4371H17.1841L17.1841 7.20731Z"
                                            fill="#FF5F00"></path>
                                        <path
                                            d="M17.757 15.3239C17.7538 12.1565 19.2076 9.16359 21.6993 7.20808C17.4676 3.88208 11.3904 4.36635 7.73872 8.32054C4.08709 12.2747 4.08709 18.3712 7.73872 22.3254C11.3904 26.2796 17.4676 26.7638 21.6993 23.4378C19.2085 21.4825 17.7551 18.4905 17.7579 15.3239H17.757Z"
                                            fill="#EB001B"></path>
                                        <path
                                            d="M38.3998 15.3241C38.3997 19.2758 36.1433 22.8806 32.5889 24.6075C29.0345 26.3344 24.8061 25.8803 21.6995 23.438C24.1895 21.4812 25.6434 18.4896 25.6434 15.3227C25.6434 12.1557 24.1895 9.16411 21.6995 7.20732C24.8061 4.76501 29.0345 4.31088 32.5889 6.03781C36.1433 7.76474 38.3997 11.3695 38.3998 15.3213V15.3241Z"
                                            fill="#F79E1B"></path>
                                    </svg>
                                    <svg viewBox="0 0" fill="none" xmlns="http://www.w3.org/2000/svg"
                                        style="width:45px; height:36px;">
                                        <title>Visa</title>
                                        <path fill-rule="evenodd" clip-rule="evenodd"
                                            d="M22.2913 8.24118L19.4177 21.4277H15.9435L18.8173 8.24118H22.2913ZM36.9094 16.7558L38.7387 11.804L39.7914 16.7558H36.9094ZM40.7861 21.4277H44L41.1956 8.24118H38.2288C37.5625 8.24118 37 8.62191 36.7499 9.20863L31.5372 21.4277H35.1854L35.91 19.4586H40.3677L40.7861 21.4277ZM31.7183 17.1224C31.733 13.6419 26.8155 13.4502 26.8497 11.8954C26.8599 11.4223 27.3191 10.9194 28.3231 10.7906C28.8217 10.7267 30.1928 10.6776 31.7495 11.381L32.3591 8.58477C31.5232 8.28652 30.447 8 29.109 8C25.675 8 23.2574 9.79263 23.2371 12.3594C23.2154 14.2576 24.9625 15.3165 26.2794 15.9478C27.6327 16.5943 28.0876 17.0083 28.0818 17.5862C28.0728 18.4716 27.0018 18.8615 26.0029 18.877C24.2556 18.9041 23.2419 18.4139 22.4337 18.0442L21.804 20.9334C22.6158 21.2997 24.1141 21.6177 25.6686 21.6341C29.3182 21.6341 31.7063 19.8634 31.7183 17.1224V17.1224ZM17.3264 8.24118L11.697 21.4277H8.02371L5.2538 10.9039C5.08539 10.2556 4.93927 10.0186 4.42745 9.74552C3.59333 9.30069 2.21375 8.88322 1 8.62425L1.08301 8.24118H6.9949C7.74839 8.24118 8.42624 8.73351 8.59724 9.58545L10.0604 17.2166L13.6762 8.24118H17.3264V8.24118Z"
                                            fill="#182E66"></path>
                                    </svg>
                                    <svg viewBox="0 0 44 30" fill="none" xmlns="http://www.w3.org/2000/svg"
                                        style="width:45px; height:36px;">
                                        <title>Pay Pal</title>
                                        <path
                                            d="M17.3433 27.3067L17.7766 24.4467H16.7366H11.97L15.2633 3.12668C15.35 2.95335 15.4366 2.86668 15.5233 2.86668H23.67C26.3566 2.86668 28.2633 3.47335 29.2166 4.60002C29.65 5.12002 29.9966 5.64002 30.0833 6.24668C30.2566 6.85335 30.2566 7.63335 30.0833 8.50002V8.58668V9.19335L30.5166 9.45335C30.95 9.62668 31.21 9.80002 31.47 10.1467C31.9033 10.58 32.0766 11.1867 32.25 11.7934C32.3366 12.4867 32.3366 13.2667 32.1633 14.22C31.99 15.26 31.6433 16.2134 31.1233 16.9934C30.69 17.6867 30.17 18.2933 29.5633 18.7267C28.9566 19.16 28.2633 19.5067 27.3966 19.68C26.6166 19.8534 25.75 20.0267 24.71 20.0267H24.1033C23.67 20.0267 23.2366 20.2 22.89 20.46C22.5433 20.72 22.2833 21.1533 22.2833 21.5867L22.1966 21.8467L21.4166 26.96V27.1333C21.4166 27.22 21.4166 27.22 21.33 27.22H21.2433C21.2433 27.3067 17.3433 27.3067 17.3433 27.3067Z"
                                            fill="#253B80"></path>
                                        <path
                                            d="M30.9503 8.67331C30.9503 8.75998 30.9503 8.93331 30.9503 9.10664C29.9103 14.6533 26.1837 16.4733 21.5037 16.4733H19.077C18.4703 16.4733 18.037 16.9066 17.9503 17.4266L16.737 25.14L16.3903 27.3066C16.3037 27.6533 16.5637 27.9133 16.9103 28H16.997H21.2437C21.7637 28 22.197 27.6533 22.2837 27.1333V26.96L23.0637 21.9333L23.1503 21.6733C23.237 21.1533 23.6703 20.8066 24.1903 20.8066H24.797C28.8703 20.8066 32.077 19.16 33.0303 14.3066C33.4637 12.3133 33.2037 10.58 32.1637 9.45331C31.817 9.19331 31.4703 8.84664 30.9503 8.67331Z"
                                            fill="#179BD7"></path>
                                        <path
                                            d="M29.9102 8.24C29.5635 8.06667 29.2169 7.98 28.8702 7.98C28.1769 7.89334 27.4835 7.80667 26.7902 7.80667H20.3769C19.8569 7.80667 19.4235 8.15334 19.3369 8.67334L17.9502 17.2533V17.5133C18.0369 16.9067 18.5569 16.56 19.0769 16.56H21.5035C26.1835 16.56 29.8235 14.6533 30.9502 9.19334C30.9502 8.93334 30.9502 8.76 30.9502 8.67334C30.6902 8.5 30.3435 8.41334 30.0835 8.32667C29.9969 8.24 29.9102 8.24 29.9102 8.24Z"
                                            fill="#222D65"></path>
                                        <path
                                            d="M19.3366 8.67333C19.4233 8.15333 19.8566 7.80667 20.3766 7.80667H26.7899C27.5699 7.80667 28.2633 7.89333 28.8699 7.98C29.3033 8.06667 29.7366 8.15333 30.1699 8.32667C30.5166 8.41333 30.7766 8.58667 31.0366 8.67333C31.3833 6.68 31.0366 5.29333 29.9099 3.99333C28.6966 2.60667 26.5299 2 23.6699 2H15.5233C15.0033 2 14.4833 2.43333 14.3966 2.95333L11.0166 24.4467C10.9299 24.7933 11.1899 25.2267 11.6233 25.2267H11.7099H16.7366L17.9499 17.2533L19.3366 8.67333Z"
                                            fill="#253B80"></path>
                                    </svg>
                                    <svg viewBox="0 0" fill="none" xmlns="http://www.w3.org/2000/svg"
                                        style="width:45px; height:36px;">
                                        <title>American Express</title>
                                        <path
                                            d="M29 0H2C0.89543 0 0 0.89543 0 2V28C0 29.1046 0.89543 30 2 30H29C30.1046 30 31 29.1046 31 28V2C31 0.89543 30.1046 0 29 0Z"
                                            fill="#006FCF"></path>
                                        <path fill-rule="evenodd" clip-rule="evenodd"
                                            d="M26.3959 4.05664L25.3323 6.84909L24.3447 4.13211H18.0394V6.77362L16.8239 4.13211H11.734L6.49219 15.8302H10.6704V25.9434H23.2812L24.9525 24.0566L26.6238 25.9434H31.1053V22.5466L28.6749 20.0566L31.1053 17.6422V14.2453H28.9028V7.60381L28.523 8.73589L26.3959 14.3208H24.4207L22.2936 8.73589L21.8378 7.60381V14.2453H17.1277L16.444 12.5849H12.2658L11.5821 14.2453H9.07511L12.8735 5.71702H15.8363L19.5587 14.0748V5.71702H23.2052L24.8765 10.0189L25.3323 11.2265L25.7881 10.0189L27.4594 5.71702H31.1053V4.05664H26.3959ZM12.4177 24.3585V15.8302L19.5587 15.9057V17.717H14.5448V19.2265H19.4068V21.0378H14.5448V22.5472H19.5587V24.3585H12.4177ZM19.5587 24.3585H22.2936L24.8765 21.5661L27.6113 24.2831H30.4222L26.3959 20.0566L30.4222 15.8302H27.6113L25.0284 18.6227L22.4455 15.8302H19.5587L23.585 20.1321L19.5587 24.3585Z"
                                            fill="white"></path>
                                        <path
                                            d="M14.3929 7.60381L13.9371 8.66041L13.1014 10.8491H15.7603L14.8487 8.66041L14.3929 7.60381Z"
                                            fill="white"></path>
                                    </svg>
                                    <div class="copy-right-text" style="padding-top: 30px;">
                                        <p>All major credit and debit cards accepted securely online.</p>
                                        <p><?php echo $footer_data->copyright_text->text; ?></p>
                                    </div>
                                </div>
                            <?php endif; ?>
                            <?php if($footer_data->bottom_footer_links->status == 1 && count($footer_data->bottom_footer_links->links) > 0): ?>
                                <div class="col-md-6">
                                    <div class="copy-right-menu-item float-right ul-li">
                                        <ul>
                                            <?php $__currentLoopData = $footer_data->bottom_footer_links->links; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <p><a href="<?php echo e($item->link); ?>"><?php echo e($item->label); ?></a></p>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            
                                            
                                        </ul>
                                    </div>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </section>
    </footer>
<?php endif; ?>
<!-- End of footer area
============================================= -->

<?php $__env->startPush('after-scripts'); ?>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <script>
        window.addEventListener('load', function() {
            alertify.set('notifier', 'position', 'top-right');
        });

        function showNotice(type, message) {
            var alertifyFunctions = {
                'success': alertify.success,
                'error': alertify.error,
                'info': alertify.message,
                'warning': alertify.warning
            };

            alertifyFunctions[type](message, 10);
        }
    </script>
    <script src="<?php echo e(asset('js/wishlist.js')); ?>"></script>
    <style>
        .alertify-notifier .ajs-message {
            color: #ffffff;
        }

    </style>
<?php $__env->stopPush(); ?>
<?php /**PATH C:\Users\adria\Desktop\LWS\resources\views/frontend/layouts/partials/footer.blade.php ENDPATH**/ ?>