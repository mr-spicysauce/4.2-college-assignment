extends Node2D

#This is the toggle switch for darkmode
func _on_DarkModeSwitch_pressed():
	Globals.Darkmode =! Globals.Darkmode
	
	#This is just some fancy code so that when =true it will slowly fade from 1 colour to the next and not blind you
	if Globals.Darkmode:
		$Main/Background/Background/BackgroundTween.interpolate_property($Main/Background/Background,"color",$Main/Background/Background.color,Color(0.23819, 0.243085, 0.273438),0.5,Tween.TRANS_LINEAR)
		$Main/Background/Background/BackgroundTween.start()
	else:
		$Main/Background/Background/BackgroundTween.interpolate_property($Main/Background/Background,"color",$Main/Background/Background.color,Color(0.858824, 0.878431, 1),0.5,Tween.TRANS_LINEAR)
		$Main/Background/Background/BackgroundTween.start()
