
# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require jquery_nested_form
#= require fullcalendar.min
#= require jquery.ui.draggable
#= require jquery.ui.resizable
#= require jquery.ui.datepicker
#= require jquery.ui.map.min
#= require jquery.ui.autocomplete
#= require jquery.ui.slider
#
#= require navigation
#= require scrolling
#= require slider_price
#=
#= Swiper Touch Slider
#= require libs/idangerous.swiper-2.4.js

$(document).ready ->
	# Init Tooltip
	$('[data-toggle="tooltip"]').tooltip()
	
	# Init Show/Hide toggles (as on Marketplace page - filters)
	$('body').on 'click', '[data-toggle="show-hide"]', ->
  	hideEl = $(this).data('hide')
	  showEl = $(this).data('show')
	  $(hideEl).removeClass("show").addClass "hidden"
  	$(showEl).removeClass("hidden").addClass "show"
 	
 	# Init Provider Gallery Slider
 	providerGallery = new Swiper("#provider-gallery .swiper-container",
	  loop: true,
	  loopAdditionalSlides: 4,
	  slidesPerGroup: 4,
	  slidesPerView: 4,
	  resizeReInit: true,
	  grabCursor: true
	)
	
	$('body').on 'click', '#provider-gallery .next-slide', (e) ->
	  e.preventDefault()
	  providerGallery.swipeNext()


	
