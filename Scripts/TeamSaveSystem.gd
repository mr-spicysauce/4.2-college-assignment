extends Node2D

var CurrentTeamID = null
var CurrentTeamName = "null name"
var CurrentTeamPlacment = null
var CurrentTeamTotalPoints= null

var Member1ID = null
var Member2ID = null
var Member3ID = null
var Member4ID = null

var Memeber1Name = null
var Memeber2Name = null
var Memeber3Name = null
var Memeber4Name = null

var CurrentRunningPlacment= null
var CurrentMathsPlacment= null
var CurrentSwimmingPlacment= null
var CurrentJummpingPlacment= null
var CurrentArtsAndCraftPlacment= null

var TeamDataFile = "user://TeamData.cfg"
var file = ConfigFile.new()
var load_file = file.load(TeamDataFile)

var NumOfTeams = 0

#This gets the number of Teams from the Teams data file so that it can be used in the scoreing system
func _ready():
	var num_sections = file.get_sections()
	NumOfTeams = num_sections.size()
	print("NumOfTeams:", NumOfTeams)

#This saves values from the data file wich contains Team data
#"section" refers the UniqueID that everyone has
#keys are the name of the data so it would be "name=jack" key is just a placeholder for the work name in this example
func SaveValue(section, key, key2):
	file.set_value(section, key, CurrentTeamName)
	file.save(TeamDataFile)

#This loads values from the data file wich contains Team data
func LoadValue(section, key, key2):
	CurrentTeamID = file.get_value(section, key)
	CurrentTeamName = file.get_value(section, key2)

#This Loads all the members of the team spesified
func LoadMemebers(section, key, key2, key3, key4):
	Member1ID =file.get_value(section, key)
	Member2ID =file.get_value(section, key2)
	Member3ID =file.get_value(section, key3)
	Member4ID =file.get_value(section, key4)
	
	#This set chunk of code gets the members name by using the individuals load/save system
	get_node("/root/IndividualSaveSystem").LoadValue(str(Member1ID), "ID", "Name")
	Memeber1Name = get_node("/root/IndividualSaveSystem").CurrentIndividualName
	get_node("/root/IndividualSaveSystem").LoadValue(str(Member2ID), "ID", "Name")
	Memeber2Name = get_node("/root/IndividualSaveSystem").CurrentIndividualName
	get_node("/root/IndividualSaveSystem").LoadValue(str(Member3ID), "ID", "Name")
	Memeber3Name = get_node("/root/IndividualSaveSystem").CurrentIndividualName
	get_node("/root/IndividualSaveSystem").LoadValue(str(Member4ID), "ID", "Name")
	Memeber4Name = get_node("/root/IndividualSaveSystem").CurrentIndividualName

#This saves the running placment of the individual
func SaveRunningPlacment(section, key):
	file.set_value(section, key, CurrentTeamPlacment)
	file.save(TeamDataFile)

#This loads the running placment of the individual
func LoadRunningPlacment(section, key):
	CurrentRunningPlacment= file.get_value(section, key)

#This saves the maths placment of the individual
func SaveMathsPlacment(section, key):
	file.set_value(section, key, CurrentTeamPlacment)
	file.save(TeamDataFile)

#This loads the maths placment of the individual
func LoadMathsPlacment(section, key):
	CurrentMathsPlacment=file.get_value(section, key)

#This saves the jumping placment of the individual
func SaveJumpingPlacment(section, key):
	file.set_value(section, key, CurrentTeamPlacment)
	file.save(TeamDataFile)

#This loads the jumping placment of the individual
func LoadJumpingPlacment(section, key):
	CurrentJummpingPlacment= file.get_value(section, key)

#This saves the swimming placment of the individual
func SaveSwimmingPlacment(section, key):
	file.set_value(section, key, CurrentTeamPlacment)
	file.save(TeamDataFile)

#This loads the swimming placment of the individual
func LoadSwimmingPlacment(section, key):
	CurrentSwimmingPlacment= file.get_value(section, key)

#This saves the arts and craft placment of the individual
func SaveArtsAndCraftPlacment(section, key):
	file.set_value(section, key, CurrentTeamPlacment)
	file.save(TeamDataFile)

#This loads the Arts and Crafts placment of the individual
func LoadArtsAndCraftsPlacment(section, key):
	CurrentArtsAndCraftPlacment= file.get_value(section, key)

func SaveTeamTotalPoints(section, key):
	file.set_value(section, key, CurrentTeamTotalPoints)
	file.save(TeamDataFile)
