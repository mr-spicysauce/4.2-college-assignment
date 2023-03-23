extends Button

#This swaps the applicaion from the main menu to the main applicaion.
#I kept them seprate to avoid glitchs.
func _on_StartButton_pressed():
	get_tree().change_scene("res://GUIScenes/Main.tscn")

#This quits the applicaion
func _on_QuitButton_pressed():
	get_tree().quit()
