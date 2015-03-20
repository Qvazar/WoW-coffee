define [], ->

	createObjectInstance = (ctorArgs...) ->
		obj = new @ctor(ctorArgs...)
		objDestroyer = obj.destroy
		obj.destroy = =>
			objDestroyer?.apply obj
			@destroyer?.apply obj

			@pool.push obj
			@used -= 1
			return

		return obj

	class ObjectPool
		constructor: (@ctor, @destroyer) ->
			@pool = []
			@used = 0
			Object.defineProperties @,
				free:
					get: -> @pool.length
				total:
					get: -> @used + @free

		@create: (ctor, destroyer) ->
			@ ctor, destroyer

		@getter 'free', -> @pool.length
		@getter 'total', -> @used + @free

		create: (ctorArgs...) ->
			obj = @pool.pop()

			if obj?
				@ctor.apply obj, ctorArgs
			else
				obj = createObjectInstance.apply @, ctorArgs

			@used += 1
			return obj

		reserve: (count) ->
			count = count - @total

			do createObjectInstance().destroy() while count-- > 0
			return