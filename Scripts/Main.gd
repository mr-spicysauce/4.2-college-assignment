extends Node2D

func _ready():
	if Globals.Darkmode:
		$Main/Background/Background.color = Color(0.23819, 0.243085, 0.273438)
	else:
		$Main/Background/Background.color = Color(0.858824, 0.878431, 1)

func _on_ExistingTeamButton_pressed():
	$Main/HBoxMainReg.hide()
	$Main/HBoxTeamBool.show()

func _on_RegisterButton_pressed():
	pass # Replace with function body.

func _on_TeamsButton_pressed():
	$Main/HBoxTeamBool.hide()

func _on_IndividualButton_pressed():
	$Main/HBoxTeamBool.hide()
