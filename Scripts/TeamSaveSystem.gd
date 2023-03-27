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

var TeamDataFile = "res://Data/TeamData.cfg"
var file = ConfigFile.new()
var load_file = file.load(TeamDataFile)

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

func LoadMemebers(section, key, key2, key3, key4):
	Member1ID =file.get_value(section, key)
	Member2ID =file.get_value(section, key2)
	Member3ID =file.get_value(section, key3)
	Member4ID =file.get_value(section, key4)
	
	print(Member1ID)
	print(Member2ID)
	print(Member3ID)
	print(Member4ID)
	
	
	get_node("/root/IndividualSaveSystem").LoadValue(str(Member1ID), "ID", "Name")
	Memeber1Name = get_node("/root/IndividualSaveSystem").CurrentIndividualName
	
	get_node("/root/IndividualSaveSystem").LoadValue(str(Member2ID), "ID", "Name")
	Memeber2Name = get_node("/root/IndividualSaveSystem").CurrentIndividualName
	
	get_node("/root/IndividualSaveSystem").LoadValue(str(Member3ID), "ID", "Name")
	Memeber3Name = get_node("/root/IndividualSaveSystem").CurrentIndividualName
	
	get_node("/root/IndividualSaveSystem").LoadValue(str(Member4ID), "ID", "Name")
	Memeber4Name = get_node("/root/IndividualSaveSystem").CurrentIndividualName
