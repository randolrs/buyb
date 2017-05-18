# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
		
	jQuery ->

		$(".sticky").stick_in_parent()

		$(".geocomplete-input").geocomplete()

		$(".click-to-reveal").click (e) ->
			$('.click-to-reveal').removeClass('active')
			$('div.reveal-panel').hide()
			$(@).addClass('active')
			targetId = "#" + $(@).data("reveal-panel-id")
			$('body').find(targetId).fadeIn()
			$('.click-to-reveal').each (index, element) =>
				if $(element).data("reveal-panel-id") == $(@).data("reveal-panel-id")
					$(element).addClass('active')

		$(".modal-cta").click (e) ->
			$(@).addClass('active')
			targetId = "#" + $(@).data("modal-id")
			$('body').find(targetId).fadeIn()

		$(".modal-cta").click (e) ->
			e.stopPropagation()

		$(".modal-container").click (e) ->
			$(@).hide()
			
		$(".signup-cta-down-arrow").click (e) ->
			$(".signup-container").slideUp(1000)
			$(".main-nav").addClass("active")
			$(".header-container").addClass("fixed")
			$(".header-container-offset").show()
			window.scrollTo(0, 0)

		$('.order-offer-update-select').change (e) ->
			order_offer_id = $(@).data("order-offer-id")
			new_quantity = $(@).val()
			$me = $(@)
			$subtotal_text = $(@).parent().parent().find('.order-offer-subtotal')
			$order_total_text = $(@).parent().parent().parent().find('.order-total')
			$.ajax
				url: "/order/order_offer/update_quantity/#{order_offer_id}/#{new_quantity}", format: 'js'
				type: "GET"
				success: (data) ->
					if $subtotal_text
						$subtotal_text.text(data.new_subtotal)
						$order_total_text.text(data.new_order_total)

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