plugin.run = (contents, options) ->
	"""
#{contents}
#思路是在layer.on "end"-> 函数中增加新的动画，如果动画分为几段还需要做每一段的标志位和判断。
#定义动画函数，以便适时调用
loopAnimate = ->
	##定义第一段动画，启动整个动画。
	Guide.animate
		#First section of action

	LastAni = "Move"   #记录动画的顺序

	Guide.on "end",-> 
		switch LastAni
			when "Fade" # Animation type
				#Animation Here
				
				LastAni = "Scale"
			when "Scale" # Second section of animation
				#Animation Here

				LastAni = "Move"

			when "Move"   # Third section of animation. 
       			#Animation Here

       			LastAni = "Fade"

loopAnimate()  # Start the animation
	"""