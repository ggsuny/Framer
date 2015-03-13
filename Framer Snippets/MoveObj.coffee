plugin.run = (contents, options) ->
	"""
#{contents}

Layerxxxx = new Layer
bDown = false
bEdge = false
iLastX = 0

Layerxxxx.on Events.TouchStart,(event)->
	iStartTime = (new Date).getTime()
	iStartX = event.pageX
	iLastX = iStartX
	bDown = true
	if (iStartX > 50) and (iStartX < 600)
		bEdge = false
	else
		bEdge = true

Layerxxxx.on Events.TouchMove,(event)->
	if bDown isnt true
		return	
	if bEdge isnt true
		return
	deltaX = event.pageX - iLastX
	####################Start moving code***************
	Detail1.x = Detail1.x + deltaX
	if Detail1.x > xxxx
		deltaX = xxxx - iLastX
	if Detail1.x < yyyy
		Detail1 = yyyy - iLastX
	
	Detail1.x += deltaX
	Layer2.x += deltaX
	
	##############################****************
	iLastX = event.pageX
	
Layerxxxx.on Events.TouchEnd,(event)->
	bDown = false
	"""