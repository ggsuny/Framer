# This imports all the layers for "Ani" into aniLayers
PSD = Framer.Importer.load "imported/Ani"

for layerGroup of PSD
	window[layerGroup ] = PSD[layerGroup ]
for layerGroup of PSD
	PSD[layerGroup ].originalFrame = window[layerGroup ].frame
bFold = true
bPartial = false
Framer.Device.contentScale = 2

#SelectFromContacts.visible = false
upperlayerOfTagPannel = new Layer
	width:400
	height:0
	y:234
	backgroundColor:"transperant"
TagsPannel.superLayer = upperlayerOfTagPannel
TagsPannel.x = 35
TagsPannel.y = 0

RedTick.states.add
	invisible:{scale:0,opacity:0.4}
	visible:{scale:1,opacity:1}
RedTick.states.animationOptions={
	curve:"spring(200,10,0)" 
}

GreenTick.states.add
	public:{y:100,scale:0.3}
	private:{y:150,scale:0.3}
	partially:{y:200,scale:0.3}
	invisible:{scale:0}

upperlayerOfTagPannel.states.add
	rePosToPartially:{y:244,height:0}
	partially:{y:244,height:113}
	rePosToInvisible:{y:303,height:0}
	invisible:{y:303,height:113}
upperlayerOfTagPannel.states.animationOptions={
	curve:"easy-in"
	time:0.2
}

WhiteBackground.states.add
	fold:{height:212}
	unfold:{height:339}
WhiteBackground.states.animationOptions={
	curve:"easy-in"
	time:0.2
}
Invisible.states.add
	fold:{y:240}
	unfold:{y:365}
Invisible.states.animationOptions={
	curve:"easy-in"
	time:0.2
}
	
LastLine.states.add
	fold:{y:300}
	unfold:{y:426}
LastLine.states.animationOptions={
	curve:"easy-in"
	time:0.2
}

initScreen=()->
	RedTick.states.switchInstant("invisible")
	GreenTick.states.switchInstant("public")	
	WhiteBackground.states.switchInstant("fold")
	Invisible.states.switchInstant("fold")
	LastLine.states.switchInstant("fold")
	GreenTick.scale = 1
initScreen()

List.on Events.Click,->
	partiallyScreen()

partiallyScreen=()->
	
	GreenTick.states.switchInstant("partially")
	GreenTick.animate
		properties:{scale:1}
		curve:"spring(300,15,0)"
	if bFold
		Utils.delay 0.2,->
			upperlayerOfTagPannel.states.switchInstant("rePosToPartially")
			upperlayerOfTagPannel.states.switch("partially")
			WhiteBackground.states.switch("unfold")
			Invisible.states.switch("unfold")
			LastLine.states.switch("unfold")
	else
		RedTick.states.switchInstant("invisible")
		RedTick.opacity = 0
		GreenTick.states.switchInstant("partially")
		GreenTick.animate
			properties:{scale:1,opacity:1}
			curve:"spring(300,15,0)"
			
		Utils.delay 0.4,->
			upperlayerOfTagPannel.states.switch("rePosToInvisible")
			WhiteBackground.states.switch("fold")
			Invisible.states.switch("fold")
			LastLine.states.switch("fold")
			Utils.delay 0.4,->
				upperlayerOfTagPannel.states.switchInstant("rePosToPartially")
				upperlayerOfTagPannel.states.switch("partially")
				WhiteBackground.states.switch("unfold")
				LastLine.states.switch("unfold")
				Invisible.states.switch("unfold")
	bFold = false
	bPartial = true
	

Invisible.on Events.Click,->
	invisibleScreen()

invisibleScreen=()->
	GreenTick.states.switchInstant("invisible")
	if bPartial
		RedTick.y = 386
	else
		RedTick.y = 260
	bFold = false
	RedTick.states.switchInstant("invisible")
	RedTick.states.switch("visible")
	
	Utils.delay 0.4,->
		upperlayerOfTagPannel.states.switch("rePosToPartially")
		WhiteBackground.states.switch("fold")
		Invisible.states.switch("fold")
		LastLine.states.switch("fold")
		RedTick.animate
			properties:{y:260}
			curve:"easy-in"
			time:0.2
			
		Utils.delay 0.2,->
			upperlayerOfTagPannel.states.switchInstant("rePosToInvisible")
			upperlayerOfTagPannel.states.switch("invisible")
			WhiteBackground.states.switch("unfold")
			LastLine.states.switch("unfold")
	