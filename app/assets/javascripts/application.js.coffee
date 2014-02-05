
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
#
#= Swiper Touch Slider
#= require libs/idangerous.swiper-2.4
#
#= require libs/handlebars-v1.3.0
#= require libs/typeahead.bundle.min

$(document).ready ->
	# Init Tooltip
	$('[data-toggle="tooltip"]').tooltip()
	
	# Reset All filters
	$('body').on 'click', '[data-toggle="reset-filters"]', (e) ->
		e.preventDefault()
		form = $(this).parents('form')[0]
		form.reset()
			
		# Reset Price	
		$("#slider-price").slider values: [0, 3]  if $("#slider-price").length
		
		# Reset Btns Group
		$('.btn-group > .btn').removeClass 'active'
		$('.btn-group > .btn:first-child').addClass 'active'
	
	# Init Show/Hide toggles (as on Marketplace page - filters)
	$('body').on 'click', '[data-toggle="show-hide"]', (e) ->
  	e.preventDefault()
  	hideEl = $(this).data('hide')
	  showEl = $(this).data('show')
	  $(hideEl).removeClass("show").addClass "hidden"
  	$(showEl).removeClass("hidden").addClass "show"
 	
 	# Init Provider Gallery Slider
 	providerGallery = undefined
	if $("#provider-gallery").length and $("#provider-gallery .swiper-wrapper .swiper-slide").size() > 4
	  $("#provider-gallery").addClass "active-slideshow"
	  
	  providerGallery = new Swiper("#provider-gallery .swiper-container",
	    loop: true
	    slidesPerView: 4
	    resizeReInit: true
	    grabCursor: true
	    centeredSlides: false
	  )
	
	$('body').on 'click', '#provider-gallery .next-slide', (e) ->
	  e.preventDefault()
	  providerGallery.swipeNext()
	
	# Slider Price Init  
	$("#slider-price").slider
	  range: true
	  min: 0
	  max: 3
	  values: [0, 2]
	  slide: (event, ui) ->
	    #do
	  
	# Init typeahead for Search Form		
	countries = new Bloodhound(
	  datumTokenizer: (d) ->
	    Bloodhound.tokenizers.whitespace d.name
	  queryTokenizer: Bloodhound.tokenizers.whitespace
	  prefetch:
	    url: "/data/countries.json"
	    filter: (list) ->
	      $.map list, (country) ->
	        name: country
	)
	
	countries.initialize()
	
	$("input#in-type").typeahead null,
		name: "populars"
		displayKey: "name"
		source: countries.ttAdapter()
		templates:
			header: '<div class="dropdown-header">Popular Searches...</div>'
			suggestion: Handlebars.compile('<a href="javascript:void(0);">{{name}}</a>')
			# Just as an example.. You can add a condition and possibly get what we need...
			footer: '<div class="more"><a href="#">and 9 more...</a></div>'
	,
		name: "providers"
		displayKey: "name"
		source: countries.ttAdapter()
		templates:
			header: '<div class="dropdown-header">Providers...</div>'
			suggestion: Handlebars.compile('<a href="javascript:void(0);">{{name}}</a>')
			
	$("input#in-country").typeahead null,
		name: "countries"
		displayKey: "name"
		source: countries.ttAdapter()
		templates:
			suggestion: Handlebars.compile('<a href="javascript:void(0);">{{name}}</a>')
			
	
	# Init Provider Calendar
	$("#provider-calendar").fullCalendar {
		firstDay: 1
		defaultView: 'agendaWeek'
		header: {
			left: ''
			center: 'prev, title, next'
			right: ''
		}
		allDaySlot: false
		titleFormat: {
			week: "d[ MMMM][ yyyy]{ '-' d MMMM yyyy}"
		}
		buttonText: {
			prev: 'prev'
			next: 'next'
		}
		columnFormat: {
			week: 'dddd'
		}
		height: 685
	}
	
	# Refresh Modal Conent (when using remote)
	$('body').on 'hidden.bs.modal', '.modal', (e) ->
	  $(this).removeData 'bs.modal'



	
