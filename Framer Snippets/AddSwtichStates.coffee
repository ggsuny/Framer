plugin.run = (contents, options) ->
	"""
#{contents}
xxxxxx.states.add("Front",{   })
xxxxxx.states.add("Back",{   })
xxxxxx.states.animationOptions = {curve:"easy-in", time:0.2}
xxxxxx.states.switchInstant("Front") #Swtich without animation
xxxxxx.states.switch("Front") #Change to Front
xxxxxx.states.next(["Front","Back"]) #only switch between Front and Back
xxxxxx.states.next() #include default state

	"""