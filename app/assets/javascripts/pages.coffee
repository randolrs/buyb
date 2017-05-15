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
			st = $(@).scrollTop()
			bottom = $(".signup-container").height()
			if st > bottom && $(".signup-container").is(":visible")
				$(".signup-container").hide()
				$(".main-nav").addClass("active")
				$(".header-container").addClass("fixed")
				$(".header-container-offset").show()
				window.scrollTo(0, 0)

		$(window).scroll (e) ->
			st = $(@).scrollTop()
			bottom = $(".stick-in-parent").offset().top
			parent_height = $(".stick-in-parent").parent().offset().top
			if st > bottom - 80
				$(".stick-in-parent").addClass("fixed")

		$(window).scroll (e) ->
			st = $(@).scrollTop()
			bottom = $(".stick-in-parent").offset().top
			parent_top = $(".stick-in-parent").parent().offset().top
			if parent_top - 80 > st
				if $(".stick-in-parent").hasClass("fixed")
					$(".stick-in-parent").removeClass("fixed")

$(document).on('turbolinks:load', ready)