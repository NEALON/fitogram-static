$(document).ready ->
	$("#slider-price").slider
	  range: true
	  min: 0
	  max: 3
	  values: [0, 2]
	  slide: (event, ui) ->
	    #do