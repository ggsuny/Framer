plugin.run = (contents, options) ->
	"""
#{contents}
HtmlLayer = new Layer
other = "Any text"
HtmlLayer.html = other + '  Any text'
HtmlLayer.style ={
	'fontSize': '35px'
	'textAlign': 'center'
	'lineHeight': '30px'
	'color':'red'}

	"""