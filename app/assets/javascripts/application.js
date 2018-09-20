// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require assets/modernizr.min
//= require assets/jquery.min

//= require assets/jquery.core

//= require activestorage
//= require jquery3
//= require rails-ujs
//= require popper
//= require bootstrap-sprockets
//= require assets/jquery.slimscroll
//= require assets/metisMenu.min

//= require assets/bootstrap.bundle.min

//= require assets/waves

//= require waypoints/jquery.waypoints.min
//= require counterup/jquery.counterup.min

//= require jquery-sparkline/jquery.sparkline.min

//= require sweet-alert2/sweetalert2.min

//= require morris/morris.min
//= require raphael/raphael-min

//= require assets/pages/jquery.dashboard

//= require assets/pages/jquery.todo
//= require tinymce/tinymce.min
//= require tinymce/jquery.tinymce.min

//= require assets/jquery.app


$(document).ready(function() {
  $('#item_type').on('change', function() {
    if($('#item_type option:selected').val() == 'Article' ){
      $('#article').show();
      $('#category#tab_item_id').name = "item_id";
      $('#category').hide();
      $('#article#tab_item_id').name = "item_id_2";

    }else if($('#item_type option:selected').val() == 'Category'){
      $('#category').show();
      $('#article').hide();
      $('#category').name = "item_id";
      $('#article').name = "item_id_2";

    }
  });
});


$(document).ready(function() {
  $('#item_type_2').on('change', function() {
    alert("dklfkldfkl")
    if($('#item_type_2 option:selected').val() == 'Article' ){
      $('#article').show();
      $('#category#tab_item_id').name = "item_id";
      $('#category').hide();
      $('#article#tab_item_id').name = "item_id_2";

    }else if($('#item_type_2 option:selected').val() == 'Category'){
      $('#category').show();
      $('#article').hide();
      $('#category').name = "item_id";
      $('#article').name = "item_id_2";

    }
  });
});
