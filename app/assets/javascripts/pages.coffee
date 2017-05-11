# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
		
	jQuery ->

		$(".signup-cta-down-arrow").click (e) ->
			$(".signup-container").slideUp(1000)
			$(".header-container").addClass("fixed")
			$(".header-container-offset").show()
			window.scrollTo(0, 0)

		$(window).scroll (e) ->
			st = $(@).scrollTop()
			bottom = $(".signup-container").height()
			if st > bottom && $(".signup-container").is(":visible")
				$(".signup-container").hide()
				$(".header-container").addClass("fixed")
				$(".header-container-offset").show()
				window.scrollTo(0, 0)


$(document).on('turbolinks:load', ready)