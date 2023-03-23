extends LinkButton
#This will get the oporating system to open the link I have put in, this is a link to the github page where I have uploaded my code
func _on_GitHubLikeButton_pressed():
	OS.shell_open("https://github.com/mr-spicysauce/4.2-college-assignment")
