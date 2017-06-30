@OfferForm = React.createClass
	getInitialState: ->
		name: ''
		sales_preview_text: ''
	handleChange: (e) ->
		name = e.target.name
		@setState "#{ name }": e.target.value
	valid: ->
		@state.name && @state.sales_preview_text
	handleSubmit: (e) ->
		e.preventDefault()
		$.post '/offers', { offer: @state }, (data) =>
			@props.handleNewOffer data
			@setState @getInitialState()
		, 'JSON' 
		alert("mercury")
	render: ->
		React.DOM.form
			onSubmit: @handleSubmit
			React.DOM.field
				React.DOM.input
					type: 'text'
					placeholder: 'Name'
					name: 'name'
					value: @state.name
					onChange: @handleChange
			React.DOM.field
				React.DOM.input
					type: 'text'
					placeholder: 'Sales Preview Text'
					name: 'sales_preview_text'
					value: @state.sales_preview_text
					onChange: @handleChange
			React.DOM.field
				React.DOM.input
					type: 'file'
					name: 'image'
					value: @state.image
					onChange: @handleChange
			React.DOM.button
				type: 'submit'
				className: 'btn btn-primary'
				disabled: !@valid()
				'Create Book'

