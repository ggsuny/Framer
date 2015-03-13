plugin.run = (contents, options) ->
	"""
#{contents}
##*****************要保证实例一直显示在界面的最上层*****************
class FingerPoint
	constructor:(@xPos,@yPos) ->
		@Point = new Layer
			x:xPos,y:yPos,width:100,height:100,borderRadius:50,opacity:0.5,backgroundColor:"green",
		
	setPos:(xPos,yPos)->
		@Point.x = xPos-50
		@Point.y = yPos-50
fp = new FingerPoint(100,100)	
fp.Point.bringToFront()
fp.Point.visible = false
###
xxxxxx.on Events.TouchStart,(event)->
	fp.Point.visible = true
	fp.Point.bringToFront()
	fp.setPos(event.pageX,event.pageY)

xxxxxx.on Events.TouchMove,(event)->
	if bDown isnt true
		return
	fp.setPos(event.pageX,event.pageY)	

xxxxxx.on Events.TouchEnd,(event)->
	bDown = false
	fp.Point.visible = false
###

	"""