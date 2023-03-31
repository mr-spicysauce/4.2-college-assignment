extends Node2D

#This is where all the variables go, Will be sorted better later!

#Individuals varibals
var TempCurrentIndividualID = ""
var TempCurrentIndividualName = "T name"
var TempIndividualPlacment = null

#math variables
var MaxScore = 0
var Points = 0 
var TempTotalPoints = 0

var MaxTeamScore = 0
var TeamPoints = 0
var TeamTempTotalPoints = 0

#Team variables
var TempTeamID = ""
var TempTeamName = "T name"
var TempTeamPlacment = null

func _ready():
	#This calculates the max score
	MaxScore = get_node("/root/IndividualSaveSystem").NumOfIndividuals*4
	
	MaxTeamScore = get_node("/root/TeamSaveSystem").NumOfTeams*4
	
	$Main/IndividualMaxScoreNote/MaxPlaceScore.text = "1st place score = " + str(MaxScore)
	$Main/IndividualMaxScoreNote/NumOfIndiviudals.text = "Number of individuals = " + str(get_node("/root/IndividualSaveSystem").NumOfIndividuals)
	
	#This checks to see if darkmode is enabled and sets the background to darkmode if it is
	if Globals.Darkmode:
		$Main/Background/Background.color = Color(0.23819, 0.243085, 0.273438)
	else:
		$Main/Background/Background.color = Color(0.858824, 0.878431, 1)
	
	#calls the methof "add_items"
	add_IndividualEvents()
	add_TeamEvents()

#This funciotn calculates the score based on a input (which is the placemetns)
func CalculateIndividualScore(Placment):
	Points = MaxScore
	var n = 1
	
	while n < int(Placment):
		Points = Points * 0.85
		n = n + 1
		#this resets the vars back to defult
	TempTotalPoints = TempTotalPoints + Points
	n = -0

#This funciotn calculates the score based on a input (which is the placemetns)
func CalculateTeamScore(Placment):
	TeamPoints = MaxTeamScore
	var n = 1
	
	while n < int(Placment):
		TeamPoints = TeamPoints * 0.85
		n = n + 1
		#this resets the vars back to defult
	TeamTempTotalPoints = TeamTempTotalPoints + TeamPoints
	n = -0

#This adds options to the dropdown box in the Individual evebt sections
func add_IndividualEvents():
	$Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.add_item("Running Event")#item 1
	$Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.add_item("Maths Event")#item 2
	$Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.add_item("Jumping Event")#item 3
	$Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.add_item("Swimming Event")#item 4
	$Main/HBoxWhatEvent/VBoxMainReg/VBoxEventID/IndividualEventDropDown.add_item("Arts And Crafts Event")#item 5

#This adds options to the dropdown box in the Individual evebt sections
func add_TeamEvents():
	$Main/HBoxTeamWhatEvent/VBoxMainReg/VBoxEventID/TeamEventDropDown.add_item("Running Event")#item 1
	$Main/HBoxTeamWhatEvent/VBoxMainReg/VBoxEventID/TeamEventDropDown.add_item("Maths Event")#item 2
	$Main/HBoxTeamWhatEvent/VBoxMainReg/VBoxEventID/TeamEventDropDown.add_item("Jumping Event")#item 3
	$Main/HBoxTeamWhatEvent/VBoxMainReg/VBoxEventID/TeamEventDropDown.add_item("Swimming Event")#item 4
	$Main/HBoxTeamWhatEvent/VBoxMainReg/VBoxEventID/TeamEventDropDown.add_item("Arts And Crafts Event")#item 5

#This function hides the current gui and shows the next set of gui
func _on_ExistingTeamButton_pressed():
	$Main/HBoxMainReg.hide()
	$Main/HBoxTeamOrIndividual.show()

#This function hides the current gui and shows the next set of gui
func _on_TeamsButton_pressed():
	$Main/HBoxTeamOrIndividual.hide()
	$Main/HBoxTeamInputs.show()

#This function hides the current gui and shows the next set of gui
func _on_IndividualButton_pressed():
	$Main/HBoxTeamOrIndividual.hide()
	$Main/HBoxIndividualInputs.show()

##############################################
#########~~~Start of Major section~~~#########
##############################################

########## All this is for finding the Individual ID and loaded the ID, Name etc##########
func _on_EnterUniqeIDText_text_changed(new_text):
	TempCurrentIndividualID = int(new_text)

#This gets and displays the ID and name of the individual
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

##############################################
##########~~~End of Major section~~~##########
##############################################


##############################################
#########~~~Start of Major section~~~#########
##############################################

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

##############################################
##########~~~End of Major section~~~##########
##############################################



##############################################
#########~~~Start of Major section~~~#########
##############################################

########## This section gets all the calculates points from the Individual data file and displays all of it on screen ##########

#This function hides the current gui and shows the next set of gui
func _on_ContinueToPlacement_pressed():
	$Main/HBoxWhatEvent.hide()
	$Main/HBoxIndividualPoints.show()
	$Main/IndividualMaxScoreNote.show()
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
	
	if get_node("/root/IndividualSaveSystem").CurrentRunningPlacment >0:
		CalculateIndividualScore(get_node("/root/IndividualSaveSystem").CurrentRunningPlacment)
		$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPoints/RunningPoints.text = "Running Points = " + str(int(Points))
		Points = MaxScore
	
	if get_node("/root/IndividualSaveSystem").CurrentMathsPlacment >0:
		CalculateIndividualScore(get_node("/root/IndividualSaveSystem").CurrentMathsPlacment)
		$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPoints/MathsPoints.text = "Maths Points = " + str(int(Points))
		Points = MaxScore
	
	if get_node("/root/IndividualSaveSystem").CurrentJummpingPlacment >0:
		CalculateIndividualScore(get_node("/root/IndividualSaveSystem").CurrentJummpingPlacment)
		$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPoints/JumpingPoints.text = "Jumping Points = " + str(int(Points))
		Points = MaxScore
	
	if get_node("/root/IndividualSaveSystem").CurrentSwimmingPlacment >0:
		CalculateIndividualScore(get_node("/root/IndividualSaveSystem").CurrentSwimmingPlacment)
		$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPoints/SwimmingPoints.text = "Swimming Points = " + str(int(Points))
		Points = MaxScore
	
	if get_node("/root/IndividualSaveSystem").CurrentArtsAndCraftPlacment >0:
		CalculateIndividualScore(get_node("/root/IndividualSaveSystem").CurrentArtsAndCraftPlacment)
		$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPoints/ArtsAndCraftPoints.text = "Arts And Crafts Points = " + str(int(Points))
		Points = MaxScore
	
	$Main/HBoxIndividualPoints/VBoxMainReg/VBoxEventPoints/TotalPoints.text = "Total Points = " + str(int(TempTotalPoints))
	
	#This saves the total points to the Indiciduals file
	get_node("/root/IndividualSaveSystem").CurrentIndividualTotalPoints = int(TempTotalPoints)
	get_node("/root/IndividualSaveSystem").SaveIndividualTotalPoints(str(TempCurrentIndividualID), "TotalPoints")
	

##############################################
##########~~~End of Major section~~~##########
##############################################

##############################################
#########~~~Start of Major section~~~#########
##############################################

########## All this is for finding the Teams ID and loaded the ID, Name etc##########

#This gets the ID that is typed into the input box
func _on_EnterTeamUniqeIDText_text_changed(new_text):
	TempTeamID = int(new_text)

#This gets and displays the ID and name of the Team
func _on_SubmitTeamUniqeIDButton_pressed():
	get_node("/root/TeamSaveSystem").LoadValue(str(TempTeamID), "ID", "Name")
	get_node("/root/TeamSaveSystem").LoadMemebers(str(TempTeamID), "Member1", "Member2", "Member3", "Member4")
	TempTeamName = get_node("/root/TeamSaveSystem").CurrentTeamName
	if get_node("/root/TeamSaveSystem").CurrentTeamName and get_node("/root/TeamSaveSystem").CurrentTeamID != null:
		$Main/HBoxTeamInputs/VBoxMainBool/VBoxTeamName.show()
		$Main/HBoxTeamInputs/VBoxMainBool/VBoxTeamName/OutputUsersName.text = "Team Name: " + TempTeamName
		$Main/HBoxTeamInputs/VBoxMainBool/VBoxTeamName/Member1.text = "Member 1: " + str(get_node("/root/TeamSaveSystem").Memeber1Name)
		$Main/HBoxTeamInputs/VBoxMainBool/VBoxTeamName/Member2.text = "Member 2: " + str(get_node("/root/TeamSaveSystem").Memeber2Name)
		$Main/HBoxTeamInputs/VBoxMainBool/VBoxTeamName/Member3.text = "Member 3: " + str(get_node("/root/TeamSaveSystem").Memeber3Name)
		$Main/HBoxTeamInputs/VBoxMainBool/VBoxTeamName/Member4.text = "Member 4: " + str(get_node("/root/TeamSaveSystem").Memeber4Name)
	else:
		#This is a popup box telling the user to input or correct the individuals ID
		$Main/NoUniqueIDErrorBox.popup()

#This function hides the current gui and shows the next set of gui
func _on_CorrectTeamButton_pressed():
	$Main/HBoxTeamInputs.hide()
	$Main/HBoxTeamWhatEvent.show()

##############################################
##########~~~End of Major section~~~##########
##############################################

##############################################
#########~~~Start of Major section~~~#########
##############################################

func _on_WhatTeamPlacment_text_changed(new_text):
	TempTeamPlacment = new_text

func _on_SubmitTeamPlacementData_pressed():
	
	get_node("/root/TeamSaveSystem").CurrentTeamPlacment = TempTeamPlacment
	
	#This checks that no data so far is null
	if get_node("/root/TeamSaveSystem").CurrentTeamName and get_node("/root/TeamSaveSystem").CurrentTeamID and get_node("/root/TeamSaveSystem").CurrentTeamPlacment != null:
		
		#Shows the button to continue
		$Main/HBoxTeamWhatEvent/VBoxMainReg/VBoxEventPlacement/ContinueToTeamPlacement.show()

		#This checks to see if the dropdown box is slected to 0 (which is running event)
		if $Main/HBoxTeamWhatEvent/VBoxMainReg/VBoxEventID/TeamEventDropDown.get_selected_id() == 0:
			#This sets the running placment to what the user inputed
			get_node("/root/TeamSaveSystem").SaveRunningPlacment(str(TempTeamID), "RunningPlacment")
		#This checks to see if the dropdown box is slected to 1 (which is Maths event)
		if $Main/HBoxTeamWhatEvent/VBoxMainReg/VBoxEventID/TeamEventDropDown.get_selected_id() == 1:
			#This sets the running placment to what the user inputed
			get_node("/root/TeamSaveSystem").SaveRunningPlacment(str(TempTeamID), "MathsPlacment")
		#This checks to see if the dropdown box is slected to 2 (which is Jummping event)
		if $Main/HBoxTeamWhatEvent/VBoxMainReg/VBoxEventID/TeamEventDropDown.get_selected_id() == 2:
			#This sets the running placment to what the user inputed
			get_node("/root/TeamSaveSystem").SaveRunningPlacment(str(TempTeamID), "JummpingPlacment")
		#This checks to see if the dropdown box is slected to 3 (which is Swimming event)
		if $Main/HBoxTeamWhatEvent/VBoxMainReg/VBoxEventID/TeamEventDropDown.get_selected_id() == 3:
			#This sets the running placment to what the user inputed
			get_node("/root/TeamSaveSystem").SaveRunningPlacment(str(TempTeamID), "SwimmingPlacment")
		#This checks to see if the dropdown box is slected to 4 (which is Arts and crafts event)
		if $Main/HBoxTeamWhatEvent/VBoxMainReg/VBoxEventID/TeamEventDropDown.get_selected_id() == 4:
			#This sets the running placment to what the user inputed
			get_node("/root/TeamSaveSystem").SaveRunningPlacment(str(TempTeamID), "ArtsAndCraftPlacment")
	else:
		#This is a popup box telling the user to selcet a event and placment
		$Main/PleaseEnterAPlacment.popup()
		#Its 6pm and i have slept well
	
	#This sets the placment data back to null after it has been submitted
	get_node("/root/TeamSaveSystem").CurrentTeamPlacment = null
	TempTeamPlacment = null
	$Main/HBoxTeamWhatEvent/VBoxMainReg/VBoxEventPlacement/WhatTeamPlacment.text = ""

#This function hides the current gui and shows the next set of gui
func _on_ContinueToTeamPlacement_pressed():
	$Main/HBoxTeamWhatEvent.hide()
	$Main/HBoxTeamPoints.show()
	$Main/TeamMaxScoreNote.show()
	TeamPointsAndPlacment()

##############################################
##########~~~End of Major section~~~##########
##############################################

##############################################
#########~~~Start of Major section~~~#########
##############################################

#This function is to pull data from the files and display it on screen. It also calculates the points and displays it
func TeamPointsAndPlacment():
	
	#This hunk of code is to call functions to load the data (there is a better way to do this but its almost 4am)
	get_node("/root/TeamSaveSystem").LoadRunningPlacment(str(TempTeamID), "RunningPlacment" )
	get_node("/root/TeamSaveSystem").LoadMathsPlacment(str(TempTeamID), "MathsPlacment" )
	get_node("/root/TeamSaveSystem").LoadSwimmingPlacment(str(TempTeamID), "SwimmingPlacment" )
	get_node("/root/TeamSaveSystem").LoadJumpingPlacment(str(TempTeamID), "JummpingPlacment" )
	get_node("/root/TeamSaveSystem").LoadArtsAndCraftsPlacment(str(TempTeamID), "ArtsAndCraftPlacment" )
	#This other chunk of code is to display the data with the correct tags. I think there is a better way to do this but Rich text lables are a pain in godot >;( 
	$Main/HBoxTeamPoints/VBoxMainReg/VBoxEventPlacmentsList/ID.text = "ID: " + str(get_node("/root/TeamSaveSystem").CurrentTeamID)
	$Main/HBoxTeamPoints/VBoxMainReg/VBoxEventPlacmentsList/Name.text = "Name: " + str(get_node("/root/TeamSaveSystem").CurrentTeamName)
	$Main/HBoxTeamPoints/VBoxMainReg/VBoxEventPlacmentsList/Running.text = "Running Placment = " + str(get_node("/root/TeamSaveSystem").CurrentRunningPlacment)
	$Main/HBoxTeamPoints/VBoxMainReg/VBoxEventPlacmentsList/Maths.text = "Maths Placment = " + str(get_node("/root/TeamSaveSystem").CurrentMathsPlacment)
	$Main/HBoxTeamPoints/VBoxMainReg/VBoxEventPlacmentsList/Swimming.text = "Swimming Placment = " + str(get_node("/root/TeamSaveSystem").CurrentSwimmingPlacment)
	$Main/HBoxTeamPoints/VBoxMainReg/VBoxEventPlacmentsList/Jumping.text = "Jumping Placment = " + str(get_node("/root/TeamSaveSystem").CurrentJummpingPlacment)
	$Main/HBoxTeamPoints/VBoxMainReg/VBoxEventPlacmentsList/ArtsAndCraft.text = "Arts And Crafts Placment = " + str(get_node("/root/TeamSaveSystem").CurrentArtsAndCraftPlacment)
	#This chuck of code is to run the calculate score function and display it on screen. Could also be made to look better and more effecent
	CalculateTeamScore(get_node("/root/TeamSaveSystem").CurrentRunningPlacment)
	$Main/HBoxTeamPoints/VBoxMainReg/VBoxEventPoints/RunningPoints.text = "Running Points = " + str(int(TeamPoints))
	TeamPoints = MaxTeamScore
	CalculateTeamScore(get_node("/root/TeamSaveSystem").CurrentMathsPlacment)
	$Main/HBoxTeamPoints/VBoxMainReg/VBoxEventPoints/MathsPoints.text = "Maths Points = " + str(int(TeamPoints))
	TeamPoints = MaxTeamScore
	CalculateTeamScore(get_node("/root/TeamSaveSystem").CurrentSwimmingPlacment)
	$Main/HBoxTeamPoints/VBoxMainReg/VBoxEventPoints/SwimmingPoints.text = "Swimming Points = " + str(int(TeamPoints))
	TeamPoints = MaxTeamScore
	CalculateTeamScore(get_node("/root/TeamSaveSystem").CurrentJummpingPlacment)
	$Main/HBoxTeamPoints/VBoxMainReg/VBoxEventPoints/JumpingPoints.text = "Jumping Points = " + str(int(TeamPoints))
	TeamPoints = MaxTeamScore
	CalculateTeamScore(get_node("/root/TeamSaveSystem").CurrentArtsAndCraftPlacment)
	$Main/HBoxTeamPoints/VBoxMainReg/VBoxEventPoints/ArtsAndCraftPoints.text = "Arts And Crafts Points = " + str(int(TeamPoints))
	TeamPoints = MaxTeamScore
	
	$Main/HBoxTeamPoints/VBoxMainReg/VBoxEventPoints/TotalPoints.text = "Total Points = " + str(int(TeamTempTotalPoints))
	
	#This saves the total points to the Indiciduals file
	get_node("/root/TeamSaveSystem").CurrentTeamTotalPoints = int(TeamTempTotalPoints)
	get_node("/root/TeamSaveSystem").SaveTeamTotalPoints(str(TempTeamID), "TotalPoints")
	
	$Main/TeamMaxScoreNote/NumOfTeams.text = "Number of teams = " + str(get_node("/root/TeamSaveSystem").NumOfTeams)
	$Main/TeamMaxScoreNote/MaxPlaceScore.text = "1st place score = " + str(MaxTeamScore)

##############################################
##########~~~End of Major section~~~##########
##############################################

##############################################
#########~~~Start of Major section~~~#########
##############################################

#########This section is to register the individuals#########

#This function hides the current gui and shows the next set of gui
func _on_RegisterButton_pressed():
	$Main/HBoxMainReg.hide()
	$Main/HBoxTeamOrIndividualReg.show()

func _on_TeamsButtonReg_pressed():
	$Main/HBoxTeamOrIndividualReg.hide()

func _on_IndividualButtonReg_pressed():
	$Main/HBoxTeamOrIndividualReg.hide()
	$Main/HBoxRegIndividual.show()

func _on_LineEditIndividualName_text_changed(new_text):
	TempCurrentIndividualName = new_text

func _on_GenIDButton_pressed():
	var RngNumber = 0
	RngNumber = int(rand_range(100, 999))
	CheckID(RngNumber)

func CheckID(RngNumber):
	print(RngNumber)
	get_node("/root/IndividualSaveSystem").DoesIdExsist(str(RngNumber), "ID")
	if get_node("/root/IndividualSaveSystem").DoesIDExsist==true:
		RngNumber = int(rand_range(100, 999))
		CheckID(RngNumber)
		print("ID already exsists")
	else: 
		TempCurrentIndividualID = RngNumber
		get_node("/root/IndividualSaveSystem").CurrentIndividualID = RngNumber
		$Main/HBoxRegIndividual/VBoxMainReg/VBoxRegister/HBoxTypeGenID/NewIDGen.text = "ID: " + str(RngNumber)

func _on_SaveAndGenDataButton_pressed():
	get_node("/root/IndividualSaveSystem").CurrentIndividualName = TempCurrentIndividualName
	get_node("/root/IndividualSaveSystem").RegistarUser(str(TempCurrentIndividualID), "ID", "Name", "IsOnTeam", "RunningPlacment", "MathsPlacment", "JummpingPlacment", "SwimmingPlacment", "ArtsAndCraftPlacment", "TotalPoints")
	$Main/HBoxRegIndividual/VBoxMainReg/VBoxRegister/HBoxTypeGenID/NewIDGen.text = "ID: "
	$Main/HBoxRegIndividual/VBoxMainReg/VBoxRegister/HBoxTypeName/LineEditIndividualName.text = ""
