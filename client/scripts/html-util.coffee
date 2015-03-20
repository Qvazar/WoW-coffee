define [], ->

	create: (htmlString) ->
		frag = document.createDocumentFragment()
		tmp = document.createElement('body')

		tmp.innerHTML = htmlString
		frag.appendChild(c) while c = tmp.firstChild

		return frag

	find: (selector, root = document) ->
		return root.querySelector selector

	findAll: (selector, root = document) ->
		return root.querySelectorAll selector

	on: (element, event, fn) ->
		element.addEventListener event, fn, false
		return

	off: (element, event, fn) ->
		element.removeEventListener event, fn, false
		return

	appendTo: (element, target) ->
		target.appendChild element
		return

	destroy: (element) ->
		element.parent?.removeChild element
		return

	addClass: (element, cssClass) ->
		element.classList.add cssClass
		return