plugin.run = (contents, options) ->
	"""
#{contents}

#Print switch
printOn = true
np=(PrintContent)->
	if printOn isnt true
		return
	print PrintContent
	"""