# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
		
	jQuery ->

		$(".sticky").stick_in_parent()

		$(".geocomplete-input").geocomplete()
		
		$(".signup-cta-down-arrow").click (e) ->
			$(".signup-container").slideUp(1000)
			$(".main-nav").addClass("active")
			$(".header-container").addClass("fixed")
			$(".header-container-offset").show()
			window.scrollTo(0, 0)

		$(window).scroll (e) ->
			if $(".signup-container").is(":visible")
				st = $(@).scrollTop()
				bottom = $(".signup-container").height()
				if st > bottom
					$(".signup-container").hide()
					$(".main-nav").addClass("active")
					$(".header-container").addClass("fixed")
					$(".header-container-offset").show()
					window.scrollTo(0, 0)

$(document).on('turbolinks:load', ready)