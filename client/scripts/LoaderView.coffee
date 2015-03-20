define ['html-util'], (html) ->

	destroyAnimationName = 'loader-destroy'

	class LoaderView
		constructor: (@element, @loader) ->
			html.find @element, '.progress'
			@loader.events.on 'progress', @onProgress

		@create: (element, loader) ->
			new @ element, loader

		destroy: ->
			html.on @element, 'animationend', (e) ->
				if e.animationName is destroyAnimationName
					html.destroy(e.target)
					html.addClass @element, 'destroyed'
				return

			html.addClass @element, 'destroy'
			return

		onProgress: (e) =>
