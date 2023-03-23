extends Node2D

var CurrentIndividualID = null
var CurrentIndividualName = "null name"
var CurrentIndividualPlacment = null

var IndividualsDataFile = "res://Data/IndividualData.cfg"
var file = ConfigFile.new()
var load_file = file.load(IndividualsDataFile)


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
	print(CurrentIndividualID)
	print(CurrentIndividualName)

########## This section is to handel the saving of the event placments ##########

#This saves the running placment of the individual
func SaveRunningPlacment(section, key):
	file.set_value(section, key, CurrentIndividualPlacment)
	file.save(IndividualsDataFile)

#This saves the maths placment of the individual
func SaveMathsPlacment(section, key):
	file.set_value(section, key, CurrentIndividualPlacment)
	file.save(IndividualsDataFile)

#This saves the jumping placment of the individual
func SaveJumpingPlacment(section, key):
	file.set_value(section, key, CurrentIndividualPlacment)
	file.save(IndividualsDataFile)

#This saves the swimming placment of the individual
func SaveSwimmingPlacment(section, key):
	file.set_value(section, key, CurrentIndividualPlacment)
	file.save(IndividualsDataFile)

#This saves the arts and craft placment of the individual
func SaveArtsAndCraftPlacment(section, key):
	file.set_value(section, key, CurrentIndividualPlacment)
	file.save(IndividualsDataFile)

########################################
##########~~~End of section~~~##########
########################################
