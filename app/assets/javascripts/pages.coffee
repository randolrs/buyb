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

		$(".dropdown-trigger").click (e) ->
			e.stopPropagation()
			targetID = "#" + $(@).data("dropdown-id")
			$('body').find(targetID).show()

		$(".dropdown-container").click (e) ->
			e.stopPropagation()

		$(document).click (e) ->
			$(".dropdown-container").hide()

		$(".toggle-active").click (e) ->
			if $(@).hasClass("active")
				$(@).removeClass("active")
			else
				$(@).addClass("active")

		$(".toggle-to-activate").click (e) ->
			target_id = "#" + $(@).data("activate-input")
			if $(target_id).val() == "false"
				$(target_id).val(true)
			else
				$(target_id).val(false)

		$(".modal-cta").click (e) ->
			$(@).addClass('active')
			targetId = "#" + $(@).data("modal-id")
			$('body').find(targetId).fadeIn()

		$(".modal-content").click (e) ->
			e.stopPropagation()

		$(".menu-content").click (e) ->
			e.stopPropagation()

		$(".modal-container").click (e) ->
			$(@).hide()

		$(".dismiss-modal").click (e) ->
			$('.modal-container').hide()

		$("#newsletter-signup").submit (e) ->
			e.preventDefault()
			form = $(@)
			formData = {email: $('.signup-email-input').val(), redirect_url: $('.redirect-url-input').val()}
			formUrl = form.attr('action')
			formMethod = form.attr('method') 
			responseMsg = $('#signup-response')
			$.ajax
				url: formUrl
				type: formMethod
				data: formData
				dataType: 'json'
				success: (data) ->
					console.log(data)
					if data.redirect_to_url
						window.location.href = data.redirect_to_url
					else
						$(".signup-container").fadeOut(500)
						$(".main-nav").addClass("active")
						$(".header-container").addClass("fixed")
						$(".header-container-offset").show()
						window.scrollTo(0, 0)

		$("#in-content-newsletter-signup").submit (e) ->
			e.preventDefault()
			form = $(@)
			formData = {email: $('.signup-email-input').val()}
			formUrl = form.attr('action')
			formMethod = form.attr('method') 
			responseMsg = $('#signup-response')
			$.ajax
				url: formUrl
				type: formMethod
				data: formData
				dataType: 'json'
				success: (data) ->
					console.log(data)
					$('.email-cta-content').slideUp()
					$('.email-cta-success').fadeIn()

		$(".update-preferred-category").click (e) ->
			e.preventDefault()
			category_id = $(@).data("category-id")
			$.ajax
				url: "/personal_settings/preferred_category/update/#{category_id}", format: 'js'
				success: (data) ->
					console.log(data)
			
		$(".signup-cta-down-arrow").click (e) ->
			$(".full-screen-popover").fadeOut(500)
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

$(document).on('turbolinks:load', ready)