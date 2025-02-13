extends Node2D

var characters: Array = []

var target: Sprite2D = null
var char_i: AnimatedSprite2D = null
var char_j: AnimatedSprite2D = null

var speed := 30.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(false)
	
	characters.append({"character": $Bart,"value": 3})
	characters.append({"character": $Kelvena,"value": 2})
	characters.append({"character": $Dancer,"value": 4})

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target:
		var char_i_dir = (target.global_position - char_i.global_position).normalized()
		char_i.position += char_i_dir * speed * delta

		var char_j_dir = (target.global_position - char_j.global_position).normalized()
		char_j.position += char_j_dir * speed * delta

func _on_run_pressed() -> void:
	var cur_indexes = [0, 0]
	var found := false
	for i in range(characters.size()):
		if found:
			break
			
		cur_indexes[0] = i
		
		print("i: ", i, " ", characters[i])
		for j in range(characters.size()):
			cur_indexes[1] = j
			
			if j == i:
				continue
			
			if characters[i]["value"] + characters[j]["value"] == int($TargetValue.text):
				print("  j: ", j, " ", characters[j])
				char_i = characters[i]["character"]
				char_j = characters[j]["character"]
				char_i.play("running")
				char_j.play("running")
				
				found = true
				target = $TargetValue/TargetEnergy
	
	set_process(true)
