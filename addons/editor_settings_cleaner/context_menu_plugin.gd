extends EditorContextMenuPlugin

signal erased()

func _popup_menu(paths: PackedStringArray) -> void:
	var _object_id:String = paths[0]
	var property:String = paths[1]
	
	
	if EditorInterface.get_editor_settings().has_setting(property):
		add_context_menu_item("Remove", event.bind(property), EditorInterface.get_editor_theme().get_icon(&"Remove", &"EditorIcons"))

func event(bug:Node, property:String) -> void:
	EditorInterface.get_editor_settings().erase(property)
	erased.emit()
