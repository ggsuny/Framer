Iplugin.run = (contents, options) ->
	"""
#{contents}
strDeviceType = "IPHONE5S"  # change this attributes before using
_TypeAndScale = 
	NEXUS5:0.6666667
	IPHONE6P:0.6666667
	IPHONE5S:1
	IPHONE5:1
	IPODTOUCH5:1

if Utils.isMobile() is true
	Framer.Device.contentScale = _TypeAndScale[strDeviceType]

	"""