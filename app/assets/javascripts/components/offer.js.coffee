@Offer = React.createClass
	render: ->
		React.DOM.div
			className: 'table-row'
			React.DOM.div
				className: 'row-image'
				React.DOM.img
					className: 'hero-image'
					src: @props.image_url
			React.DOM.div
				className: 'row-content'
				React.DOM.h2 null, @props.offer.name
				React.DOM.p
					className: 'preview-summary'
					@props.offer.sales_preview_text
				React.DOM.p
					className: 'preview-summary'
					React.DOM.span
						className: 'bold-text'
						'Reason We Recommend: '
					React.DOM.span
						@props.offer.reason_we_recommend
				React.DOM.p
					className: 'preview-summary'
					React.DOM.span
						className: 'bold-text'
						'Chapter to Read: '
					React.DOM.span
						@props.offer.chapter_to_read
				React.DOM.p
					className: 'review-summary'
					React.DOM.a
						className: 'button green-background small cta'
						href: @props.link
						'Get this'
