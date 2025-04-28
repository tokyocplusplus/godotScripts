extends Node3D
@onready var winlabel = $"win";
@onready var exit = $"exittimer";
var win = false;
# alert system and stuff
func _on_area_3d_body_entered(_body: Node3D) -> void:
	winlabel.text = "YOU WON !!";
	win = true;
	exit.start();

func _on_area_3d_body_exited(_body: Node3D) -> void:
	pass

func _on_exittimer_timeout() -> void:
	winlabel.text = "";
	get_tree().quit();
