// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation();

  // Close navbar after clicked
  $('.on-page').click(function() {
     $('nav').removeClass('expanded');
     $('body').addClass('f-topbar-fixed')
     $('div.contain-to-grid').addClass('fixed')
  });

  // Sticky footer
  $(window).bind("load", function () {
      var footer = $("#footer");
      var pos = footer.position();
      var height = $(window).height();
      height = height - pos.top;
      height = height - footer.height();
      if (height > 0) {
          footer.css({
              'margin-top': height + 'px'
          });
      }
  });

  // Start smooth scroll
  $('a.smooth').click(function(){
      $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top - 85
      }, 500);
      return false;
  });

  $(window).on("load", function () {
      var urlHash = window.location.href.split("#")[1];
      $('html,body').animate({
          scrollTop: $('#' + urlHash).offset().top - 85
      }, 20);
  });

  //SVG Fallback
  var svg = !!('createElementNS' in document && document.createElementNS('http://www.w3.org/2000/svg','svg').createSVGRect);
    if (!svg){
      jQuery('body').addClass('no-svg');
      jQuery('img').each(function(){
        var $this = jQuery(this);
        var fp = $this.attr('src').split(".");
        var ext = fp.pop();
        if(ext.toLowerCase() == 'svg'){
          if($this.attr('data-svg-fallback') !== undefined){
            $this.attr('src', $this.attr('data-svg-fallback'));
            $this.removeAttr('data-svg-fallback');
          }else{
            $this.attr('src', fp.join('.')+'.png');
          }
        }
      });
    }else{ jQuery('body').addClass('svg'); }

  //Show More / Show Less
  $('.show-links a').click(function(e){
    $(this).parent().next('.show-more').slideToggle('slow');
    $(this).siblings().toggle();
    $(this).toggle();
    e.preventDefault();
  });

  $('input[type=file]').change(function () {
    var input = $(this);
    if (input[0].files && input[0].files[0]) {
      var file = input[0].files[0]
      var reader = new FileReader();
      reader.onload = function (e) {
          $('#image-preview').attr('src', e.target.result);
      };
      reader.readAsDataURL(input[0].files[0]);
      if (file) {
        //Put the file name into a div with id of 'filename'
        $('#filename').html(file.name);
      }
    }
  });

});

// Fire file upload for profiles form
function chooseFile() {
  $("#profile_avatar").click();
  return false;
}