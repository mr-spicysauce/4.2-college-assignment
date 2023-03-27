extends Node2D

var CurrentIndividualID = null
var CurrentIndividualName = "null name"
var CurrentIndividualPlacment = null
var CurrentIndividualTotalPoints= null

var CurrentRunningPlacment= null
var CurrentMathsPlacment= null
var CurrentSwimmingPlacment= null
var CurrentJummpingPlacment= null
var CurrentArtsAndCraftPlacment= null

var IndividualsDataFile = "user://IndividualData.cfg"
var file = ConfigFile.new()
var load_file = file.load(IndividualsDataFile)

var NumOfIndividuals = null

#This gets the number of individuals from the individuals file so that it can be used in the scoreing system
func _ready():
	var num_sections = file.get_sections()
	NumOfIndividuals = num_sections.size()
	print("NumOfIndividuals:", NumOfIndividuals)

#This saves values from the data file wich contains Indivduals data
#"section" refers the UniqueID that everyone has
#keys are the name of the data so it would be "name=jack" key is just a placeholder for the work name in this example
func SaveValue(section, key, key2):
	file.set_value(section, key, CurrentIndividualID)
	file.set_value(section, key2, CurrentIndividualName)
	file.save(IndividualsDataFile)

#This loads values from the data file wich contains Indivduals data then prints it to commandline for debugging
func LoadValue(section, key, key2):
	CurrentIndividualID = file.get_value(section, key)
	CurrentIndividualName = file.get_value(section, key2)


########## This section is to handel the saving of the event placments ##########

###When looking at this I could prob make a function that cycles through the name with a dictonay.
###This would be more effencent and would look better but its 3:43AM and I cant be asked to do learn somthing new
###This storage system is alreadt new and hard haha

#This saves the running placment of the individual
func SaveRunningPlacment(section, key):
	file.set_value(section, key, CurrentIndividualPlacment)
	file.save(IndividualsDataFile)

#This loads the running placment of the individual
func LoadRunningPlacment(section, key):
	CurrentRunningPlacment= file.get_value(section, key)

#This saves the maths placment of the individual
func SaveMathsPlacment(section, key):
	file.set_value(section, key, CurrentIndividualPlacment)
	file.save(IndividualsDataFile)

#This loads the maths placment of the individual
func LoadMathsPlacment(section, key):
	CurrentMathsPlacment=file.get_value(section, key)

#This saves the jumping placment of the individual
func SaveJumpingPlacment(section, key):
	file.set_value(section, key, CurrentIndividualPlacment)
	file.save(IndividualsDataFile)

#This loads the jumping placment of the individual
func LoadJumpingPlacment(section, key):
	CurrentJummpingPlacment= file.get_value(section, key)

#This saves the swimming placment of the individual
func SaveSwimmingPlacment(section, key):
	file.set_value(section, key, CurrentIndividualPlacment)
	file.save(IndividualsDataFile)

#This loads the swimming placment of the individual
func LoadSwimmingPlacment(section, key):
	CurrentSwimmingPlacment= file.get_value(section, key)

#This saves the arts and craft placment of the individual
func SaveArtsAndCraftPlacment(section, key):
	file.set_value(section, key, CurrentIndividualPlacment)
	file.save(IndividualsDataFile)

#This loads the Arts and Crafts placment of the individual
func LoadArtsAndCraftsPlacment(section, key):
	CurrentArtsAndCraftPlacment= file.get_value(section, key)

func SaveIndividualTotalPoints(section, key):
	file.set_value(section, key, CurrentIndividualTotalPoints)
	file.save(IndividualsDataFile)

########################################
##########~~~End of section~~~##########
########################################
