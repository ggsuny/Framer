plugin.run = (contents, options) ->
	"""
class SuperClass
  constructor: (@xxxx) ->
#*************functions here***************#
  #move: (meters) ->
    #print @name + " moved #{meters}m."

class SonClassxxxx extends SuperClass
#*************functions here***************#  
  #move: ->
    #print "Slithering..."
    #super 5  # call funciton in superclass

#Instancexxxx=new SonClassxxxx "Sammy the Python"
#Instancexxxx.move()
	"""