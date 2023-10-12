extends Control

var cat_count = 0
var dog_count = 0


func _on_cats_button_pressed():
	cat_count += 1
	%CatCountLabel.text = str(cat_count)


func _on_dogs_button_pressed():
	dog_count += 1
	%DogsCountLabel.text = str(dog_count)


func _on_reset_button_pressed():
	cat_count = 0
	dog_count = 0

	%CatCountLabel.text = str(cat_count)
	%DogsCountLabel.text = str(dog_count)



