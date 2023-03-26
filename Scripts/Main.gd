extends Node2D

#This is where all the variables go, Will be sorted better later!

var TempCurrentIndividualID = ""
var TempCurrentIndividualName = "T name"
var TempIndividualPlacment = null
var MaxScore = 20*4
var Points = 0 
var TempTotalPoints = 0

func _ready():
	#This checks to see if darkmode is enabled and sets the background to darkmode if it is
	if Globals.Darkmode:
		$Main/Background/Background.color = Color(0.23819, 0.243085, 0.273438)
	else:
		$Main/Background/Background.color = Color(0.858824, 0.878431, 1)
	
	#calls the methof "add_items"
	add_IndividualEvents()

#This adds options to the dropdown box in the Individual evebt sections
func add_IndividualEvents():
	$Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.add_item("Running Event")#item 1
	$Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.add_item("Maths Event")#item 2
	$Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.add_item("Jumping Event")#item 3
	$Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.add_item("Swimming Event")#item 4
	$Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.add_item("Arts And Crafts Event")#item 5

#This function hides the current gui and shows the next set of gui
func _on_ExistingTeamButton_pressed():
	$Main/HBoxMainReg.hide()
	$Main/HBoxTeamOrIndividual.show()

#This function hides the current gui and shows the next set of gui
func _on_RegisterButton_pressed():
	pass # Replace with function body.

#This function hides the current gui and shows the next set of gui
func _on_TeamsButton_pressed():
	$Main/HBoxTeamOrIndividual.hide()

#This function hides the current gui and shows the next set of gui
func _on_IndividualButton_pressed():
	$Main/HBoxTeamOrIndividual.hide()
	$Main/HBoxIndividualInputs.show()

########## All this is for finding the Individual ID and loaded the ID, Name etc##########
func _on_EnterUniqeIDText_text_changed(new_text):
	TempCurrentIndividualID = int(new_text)

func _on_SubmitUniqeIDButton_pressed():
	get_node("/root/IndividualSaveSystem").LoadValue(str(TempCurrentIndividualID), "ID", "Name")
	TempCurrentIndividualName = get_node("/root/IndividualSaveSystem").CurrentIndividualName
	if get_node("/root/IndividualSaveSystem").CurrentIndividualName and get_node("/root/IndividualSaveSystem").CurrentIndividualID != null:
		$Main/HBoxIndividualInputs/VBoxMainBool/VBoxIndividualsName.show()
		$Main/HBoxIndividualInputs/VBoxMainBool/VBoxIndividualsName/OutputUsersName.text = TempCurrentIndividualName
	else:
		#This is a popup box telling the user to input or correct the individuals ID
		$Main/NoUniqueIDErrorBox.popup()

#This function hides the current gui and shows the next set of gui
func _on_CorrectIndividualButton_pressed():
	$Main/HBoxIndividualInputs.hide()
	$Main/HBoxWhatEvent.show()

########################################
##########~~~End of section~~~##########
########################################

#This is testing code for saveing, its just here to copy paste for later
#func _on_Button_pressed():
#	get_node("/root/IndividualSaveSystem").SaveValue(CurrentIndividualID, "ID", "Name")

########## This section is for picking the Individuals event and there placment ##########

#This sets sets the temp var to the user input and makes it a int and not a string so there is no data inconsistoncys
func _on_WhatIndividualPlacment_text_changed(new_text):
	TempIndividualPlacment = int(new_text)

func _on_SubmitIndividualPlacementData_pressed():
	
	#sets the current placment of the user
	get_node("/root/IndividualSaveSystem").CurrentIndividualPlacment = TempIndividualPlacment
	#This checks that no data so far is null
	if get_node("/root/IndividualSaveSystem").CurrentIndividualName and get_node("/root/IndividualSaveSystem").CurrentIndividualID and get_node("/root/IndividualSaveSystem").CurrentIndividualPlacment != null:
		
		#Shows the button to continue
		$Main/HBoxWhatEvent/VBoxMainReg/VBoxEventPlacement/ContinueToPlacement.show()
		
		#This checks to see if the dropdown box is slected to 0 (which is running event)
		if $Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.get_selected_id() == 0:
			#This sets the running placment to what the user inputed
			get_node("/root/IndividualSaveSystem").SaveRunningPlacment(str(TempCurrentIndividualID), "RunningPlacment")
			
			#This checks to see if the dropdown box is slected to 1 (which is maths event)
		if $Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.get_selected_id() == 1:
			#This sets the maths placment to what the user inputed
			get_node("/root/IndividualSaveSystem").SaveMathsPlacment(str(TempCurrentIndividualID), "MathsPlacment")
			
			#This checks to see if the dropdown box is slected to 2 (which is jumping event)
		if $Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.get_selected_id() == 2:
			#This sets the jumping placment to what the user inputed
			get_node("/root/IndividualSaveSystem").SaveJumpingPlacment(str(TempCurrentIndividualID), "JummpingPlacment")
			
			#This checks to see if the dropdown box is slected to 3 (which is swimming event)
		if $Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.get_selected_id() == 3:
			#This sets the swimming placment to what the user inputed
			get_node("/root/IndividualSaveSystem").SaveSwimmingPlacment(str(TempCurrentIndividualID), "SwimmingPlacment")
			
			#This checks to see if the dropdown box is slected to 4 (which is arts abd crafts event)
		if $Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.get_selected_id() == 4:
			#This sets the Arts and craft placment to what the user inputed
			get_node("/root/IndividualSaveSystem").SaveArtsAndCraftPlacment(str(TempCurrentIndividualID), "ArtsAndCraftPlacment")
		
	else:
		#This is a popup box telling the user to selcet a event and placment
		$Main/PleaseEnterAPlacment.popup()
		#Its 6am and i have not slept, send help plz
	
	#This sets the placment data back to null after it has been submitted
	get_node("/root/IndividualSaveSystem").CurrentIndividualPlacment = null
	TempIndividualPlacment = null
	$Main/HBoxWhatEvent/VBoxMainReg/VBoxEventPlacement/WhatIndividualPlacment.text = ""

#This funciotn calculates the score based on a input (which is the placemetns)
func CalculateIndividualScore(Placment):
	Points = MaxScore
	var n = 1
	
	while n < Placment:
		Points = Points * 0.85
		n = n + 1
		#this resets the vars back to defult
	TempTotalPoints = TempTotalPoints + Points
	n = -0

#This function hides the current gui and shows the next set of gui
func _on_ContinueToPlacement_pressed():
	$Main/HBoxWhatEvent.hide()
	$Main/HBoxIndividualPoints.show()
	IndividualPointsAndPlacment()

#This function is to pull data from the files and display it on screen. It also calculates the points and displays it
func IndividualPointsAndPlacment():
	
	#This hunk of code is to call functions to load the data (there is a better way to do this but its almost 4am)
	get_node("/root/IndividualSaveSystem").LoadRunningPlacment(str(TempCurrentIndividualID), "RunningPlacment" )
	get_node("/root/IndividualSaveSystem").LoadMathsPlacment(str(TempCurrentIndividualID), "MathsPlacment" )
	get_node("/root/IndividualSaveSystem").LoadSwimmingPlacment(str(TempCurrentIndividualID), "SwimmingPlacment" )
	get_node("/root/IndividualSaveSystem").LoadJumpingPlacment(str(TempCurrentIndividualID), "JummpingPlacment" )
	get_node("/root/IndividualSaveSystem").LoadArtsAndCraftsPlacment(str(TempCurrentIndividualID), "ArtsAndCraftPlacment" )
	#This other chunk of code is to display the data with the correct tags. I think there is a better way to do this but Rich text lables are a pain in godot >;( 
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPlacmentsList/ID.text = "ID: " + str(get_node("/root/IndividualSaveSystem").CurrentIndividualID)
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPlacmentsList/Name.text = "Name: " + str(get_node("/root/IndividualSaveSystem").CurrentIndividualName)
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPlacmentsList/Running.text = "Running Placment = " + str(get_node("/root/IndividualSaveSystem").CurrentRunningPlacment)
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPlacmentsList/Maths.text = "Maths Placment = " + str(get_node("/root/IndividualSaveSystem").CurrentMathsPlacment)
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPlacmentsList/Swimming.text = "Swimming Placment = " + str(get_node("/root/IndividualSaveSystem").CurrentSwimmingPlacment)
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPlacmentsList/Jumping.text = "Jumping Placment = " + str(get_node("/root/IndividualSaveSystem").CurrentJummpingPlacment)
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPlacmentsList/ArtsAndCraft.text = "Arts And Crafts Placment = " + str(get_node("/root/IndividualSaveSystem").CurrentArtsAndCraftPlacment)
	
	#This chuck of code is to run the calculate score function and display it on screen. Could also be made to look better and more effecent
	CalculateIndividualScore(get_node("/root/IndividualSaveSystem").CurrentRunningPlacment)
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPoints/RunningPoints.text = "Running Points = " + str(int(Points))
	Points = MaxScore
	CalculateIndividualScore(get_node("/root/IndividualSaveSystem").CurrentMathsPlacment)
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPoints/MathsPoints.text = "Maths Points = " + str(int(Points))
	Points = MaxScore
	CalculateIndividualScore(get_node("/root/IndividualSaveSystem").CurrentSwimmingPlacment)
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPoints/SwimmingPoints.text = "Swimming Points = " + str(int(Points))
	Points = MaxScore
	CalculateIndividualScore(get_node("/root/IndividualSaveSystem").CurrentJummpingPlacment)
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPoints/JumpingPoints.text = "Jumping Points = " + str(int(Points))
	Points = MaxScore
	CalculateIndividualScore(get_node("/root/IndividualSaveSystem").CurrentArtsAndCraftPlacment)
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPoints/ArtsAndCraftPoints.text = "Arts And Crafts Points = " + str(int(Points))
	Points = MaxScore
	
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPoints/TotalPoints.text = "Total Points = " + str(int(TempTotalPoints))
	
	#This saves the total points to the Indiciduals file
	get_node("/root/IndividualSaveSystem").CurrentIndividualTotalPoints = int(TempTotalPoints)
	get_node("/root/IndividualSaveSystem").SaveIndividualTotalPoints(str(TempCurrentIndividualID), "TotalPoints")
	
	
