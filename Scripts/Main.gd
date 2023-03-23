extends Node2D

var TempCurrentIndividualID = str(0)
var TempCurrentIndividualName = "T name"

func _ready():
	if Globals.Darkmode:
		$Main/Background/Background.color = Color(0.23819, 0.243085, 0.273438)
	else:
		$Main/Background/Background.color = Color(0.858824, 0.878431, 1)

func _on_ExistingTeamButton_pressed():
	$Main/HBoxMainReg.hide()
	$Main/HBoxTeamOrIndividual.show()

func _on_RegisterButton_pressed():
	pass # Replace with function body.

func _on_TeamsButton_pressed():
	$Main/HBoxTeamOrIndividual.hide()

func _on_IndividualButton_pressed():
	$Main/HBoxTeamOrIndividual.hide()
	$Main/HBoxIndividualInputs.show()

func _on_EnterUniqeIDText_text_changed(new_text):
	TempCurrentIndividualID = new_text

func _on_SubmitUniqeIDButton_pressed():
	get_node("/root/IndividualSaveSystem").LoadValue(TempCurrentIndividualID, "ID", "Name")
	TempCurrentIndividualName = get_node("/root/IndividualSaveSystem").CurrentIndividualName
	if get_node("/root/IndividualSaveSystem").CurrentIndividualName and get_node("/root/IndividualSaveSystem").CurrentIndividualID != null:
		$Main/HBoxIndividualInputs/VBoxMainBool/VBoxIndividualsName.show()
		$Main/HBoxIndividualInputs/VBoxMainBool/VBoxIndividualsName/OutputUsersName.text = TempCurrentIndividualName
	else:
		$Main/NoUniqueIDErrorBox.popup()

#This is testing code for saveing, its just here to copy paste for later
#func _on_Button_pressed():
#	get_node("/root/IndividualSaveSystem").SaveValue(CurrentIndividualID, "ID", "Name")
