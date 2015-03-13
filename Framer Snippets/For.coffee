plugin.run = (contents, options) ->
	"""
#{contents}
for count in [2..8]
  items = bg["item" + count] 


	"""