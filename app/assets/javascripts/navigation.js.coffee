###
Author: Eugene Tsurcan 
Front End Developer 
[http://twitter.com/eugenetsurcan]
###

$(document).ready ->
  # Toggle Menu
	$(document).on "click", ".header .toggle-menu, .active-menu .wrapper-content, .active-menu .footer, .menu .close", (e) ->
	  e.preventDefault()
	  $("body").toggleClass "active-menu"