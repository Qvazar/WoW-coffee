define [], ->

	class Events
		constructor: ->
			@handlers = {}

		@create: -> new @

		on: (event, fn) ->
			(@handlers[event] ?= []).push(fn)
			return

		off: (event, fn) ->
			arr = @handlers[event]
			if arr? and (i = arr.indexOf(fn)) > -1 then arr.slice i, 1
			return

		fire: (event, data) ->
			h(data) for h in hl if (hl = @handlers[event])?
			return
