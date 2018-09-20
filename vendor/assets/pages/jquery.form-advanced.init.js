/**
 * Theme: Velonic Admin Template
 * Author: Coderthemes
 * Form Advanced
 */


jQuery(document).ready(function () {

    // Select2
    $(".select2").select2();

    $(".select2-limiting").select2({
        maximumSelectionLength: 2
    });
});

//Bootstrap-TouchSpin
$("input[name='demo1']").TouchSpin({
    min: 0,
    max: 100,
    step: 0.1,
    decimals: 2,
    boostat: 5,
    maxboostedstep: 10,
    postfix: '%',
    buttondown_class: 'btn btn-primary',
    buttonup_class: 'btn btn-primary'
});
$("input[name='demo2']").TouchSpin({
    min: -1000000000,
    max: 1000000000,
    stepinterval: 50,
    maxboostedstep: 10000000,
    prefix: '$',
    buttondown_class: 'btn btn-primary',
    buttonup_class: 'btn btn-primary'
});
$("input[name='demo3']").TouchSpin({
    buttondown_class: 'btn btn-primary',
    buttonup_class: 'btn btn-primary'
});
$("input[name='demo3_21']").TouchSpin({
    initval: 40,
    buttondown_class: 'btn btn-primary',
    buttonup_class: 'btn btn-primary'
});
$("input[name='demo3_22']").TouchSpin({
    initval: 40,
    buttondown_class: 'btn btn-primary',
    buttonup_class: 'btn btn-primary'
});

$("input[name='demo5']").TouchSpin({
    prefix: "pre",
    postfix: "post",
    buttondown_class: 'btn btn-primary',
    buttonup_class: 'btn btn-primary'
});
$("input[name='demo0']").TouchSpin({
    buttondown_class: 'btn btn-primary',
    buttonup_class: 'btn btn-primary'
});

// Time Picker
jQuery('#timepicker').timepicker({
    defaultTIme: false,
    icons: {
        up: 'mdi mdi-chevron-up',
        down: 'mdi mdi-chevron-down'
    }
});
jQuery('#timepicker2').timepicker({
    showMeridian: false,
    icons: {
        up: 'mdi mdi-chevron-up',
        down: 'mdi mdi-chevron-down'
    }
});
jQuery('#timepicker3').timepicker({
    minuteStep: 15,
    icons: {
        up: 'mdi mdi-chevron-up',
        down: 'mdi mdi-chevron-down'
    }
});

//colorpicker start

$('.colorpicker-default').colorpicker({
    format: 'hex'
});
$('.colorpicker-rgba').colorpicker();

// Date Picker
jQuery('#datepicker').datepicker();
jQuery('#datepicker-autoclose').datepicker({
    autoclose: true,
    todayHighlight: true
});
jQuery('#datepicker-inline').datepicker();
jQuery('#datepicker-multiple-date').datepicker({
    format: "mm/dd/yyyy",
    clearBtn: true,
    multidate: true,
    multidateSeparator: ","
});
jQuery('#date-range').datepicker({
    toggleActive: true
});