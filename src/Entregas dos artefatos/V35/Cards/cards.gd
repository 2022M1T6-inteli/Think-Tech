extends Control




func _on_Vision_pressed() -> void:
	get_tree().change_scene("res://Cards/Vision.tscn")



func _on_Roadmap_pressed() -> void:
	get_tree().change_scene("res://Cards/Roadmap.tscn")


func _on_UserKPI_pressed() -> void:
	get_tree().change_scene("res://Cards/UserKPI.tscn")
	

func _on_BusinessKPI_pressed() -> void:
	get_tree().change_scene("res://Cards/BusinessKPI.tscn")
	
	
func _on_Stakeholders_pressed() -> void:
	get_tree().change_scene("res://Cards/Stakeholders.tscn")
	
	
func _on_Backlog_pressed() -> void:
	get_tree().change_scene("res://Cards/Backlog.tscn")
	

func _on_DeploymentKPI_pressed() -> void:
	get_tree().change_scene("res://Cards/Deployment.tscn")

	
func _on_QualityKPI_pressed() -> void:
	get_tree().change_scene("res://Cards/Quality.tscn")


func _on_Data_pressed() -> void:
	get_tree().change_scene("res://Cards/DataDriven.tscn")
