# Simple scroll to anchor up or down the page
scrollToAnchor = (anch) ->
  $("html, body").animate
    scrollTop: $(anch).offset().top
  , "slow", ->
  	window.location.href = anch

$(document).ready ->
	# Init scrolling
	$(document).on "click", ".scroll-to", (e) ->
		e.preventDefault()
		anch = $(this).attr("href")
		scrollToAnchor(anch)