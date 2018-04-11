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
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require jquery.cookie
//= require etherpad
//= require bootstrap-sprockets
//= require_tree .

jQuery( function($) {
    $('a').tooltip({
    	show: null
    });
});

$(function() {
  // $("#searched_lessons th a").on("click", function() {
  //   $.getScript(this.href);
  //   return false;
  // });
  $("#lessons_search input").keyup(function() {
    $.get($("#lessons_search").attr("action"), $("#lessons_search").serialize(), null, "script");
    return false;
  });
});
