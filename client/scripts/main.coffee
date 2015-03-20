require.config
	baseUrl: 'scripts'

Function::getter = (prop, getterFn) ->
	Object.defineProperty @prototype, prop, get: getterFn, configurable: true

Function::setter = (prop, setterFn) ->
	Object.defineProperty @prototype, prop, set: setterFn, configurable: true

# Start the app
require ['LoaderView', 'ResourceLoader'], (LoaderView, ResourceLoader) ->

	main = document.getElementById 'game-window'

	# Load resources
	loader = ResourceLoader.create 'data/data.json'
	loaderElement = main.querySelector '.loader'
	loaderView = LoaderView.create loaderElement, resourceLoader

	loader.load()
		.done ->
			loaderView.destroy()
			# Start game