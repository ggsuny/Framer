plugin.run = (contents, options) ->
	"""
#{contents}
timeStart = (new Date).getTime()
timeEnd = 0
while timeEnd - timeStart < 1000
     timeEnd = (new Date).getTime()    


	"""