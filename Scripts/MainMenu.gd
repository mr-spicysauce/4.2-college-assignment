extends Node2D

func _on_DarkModeSwitch_pressed():
	Globals.Darkmode =! Globals.Darkmode
	print(Globals.Darkmode)
	
	if Globals.Darkmode:
		$Main/Background/Background/BackgroundTween.interpolate_property($Main/Background/Background,"color",$Main/Background/Background.color,Color(0.23819, 0.243085, 0.273438),0.5,Tween.TRANS_LINEAR)
		$Main/Background/Background/BackgroundTween.start()
	else:
		$Main/Background/Background/BackgroundTween.interpolate_property($Main/Background/Background,"color",$Main/Background/Background.color,Color(0.858824, 0.878431, 1),0.5,Tween.TRANS_LINEAR)
		$Main/Background/Background/BackgroundTween.start()
