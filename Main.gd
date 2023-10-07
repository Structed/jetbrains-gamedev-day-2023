extends Control

var cat_count = 0
var dog_count = 0

func _ready():
	var _error = PlayFabManager.client.connect("api_error", _on_api_error)
	PlayFabManager.client.connect("server_error", _on_api_error)
	PlayFabManager.client.connect("logged_in", _on_login)
	PlayFabManager.client.login_anonymous()


func _on_api_error(api_error_wrapper: ApiErrorWrapper):
	print_debug("API ERROR!" + api_error_wrapper.errorMessage)
	
	
func _on_server_error(_api_error_wrapper):
	print_debug("Server ERROR!")
	

func _on_login(_login_result: LoginResult):
	%LoginStatusLabel.text = "Logged in"
	%LoginStatusLabel.set("theme_override_colors/font_color", Color.WEB_GREEN)


func _on_cats_button_pressed():
	cat_count += 1
	%CatCountLabel.text = str(cat_count)
	send_event("cat", cat_count)	


func _on_dogs_button_pressed():
	dog_count += 1
	%DogsCountLabel.text = str(dog_count)
	send_event("dog", dog_count)


func _on_reset_button_pressed():
	cat_count = 0
	dog_count = 0
	
	%CatCountLabel.text = str(cat_count)
	%DogsCountLabel.text = str(dog_count)


func send_event(animal: String, count: int):
	var payload = {
		animal : count,
	}
	var event_name = "animal_vote"
	
	$PlayFabEvent.write_title_player_playstream_event(event_name, payload, func(response): print_debug("Event sent"))
	

	
