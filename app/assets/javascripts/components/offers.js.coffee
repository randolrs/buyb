@Offers = React.createClass
	getInitialState: ->
		offers: @props.data
	getDefaultProps: ->
		offers: []
	addOffer: (offer) ->
		offers = @state.offers.slice()
		offers.push offer
		@setState offers: offers
	offerCount: ->
		count = @state.offers
		count.reduce ((prev, curr) ->
			prev + 1
		), 0
	render: ->
		React.DOM.div
			className: 'offers'
			React.DOM.h2
				className: 'title'
				'Offers'
			React.createElement OfferCountBox, count: @offerCount()
			React.createElement OfferForm, handleNewOffer: @addOffer
			React.DOM.div
				className: 'offer-index-table'
				for offer in @state.offers
					React.createElement Offer, key: offer.id, offer: offer, link: offer.affiliate_link