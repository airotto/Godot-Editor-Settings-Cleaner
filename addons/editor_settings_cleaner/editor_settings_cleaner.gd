@tool
extends EditorPlugin

const ContextMenuPlugin = preload("uid://bksg7mc0l23bd")
var context_menu_plugin:ContextMenuPlugin

func _enable_plugin() -> void:
	# Add autoloads here.
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	pass
	context_menu_plugin = ContextMenuPlugin.new()
	add_context_menu_plugin(EditorContextMenuPlugin.CONTEXT_SLOT_INSPECTOR_PROPERTY, context_menu_plugin)
	context_menu_plugin
	
	################################################
	################################################
	
	var editor_settings_dialog:Node = EditorInterface.get_base_control().find_child("*EditorSettingsDialog*", false, false)
	var general:Node = editor_settings_dialog.find_child("General", true, false)
	var tree:Tree = general.find_child("Tree", true, false)
	var inspector:EditorInspector = general.find_child("EditorInspector", true, false)
	context_menu_plugin.erased.connect(_on_erase.bind(tree))


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
	
	remove_context_menu_plugin(context_menu_plugin)


################################################
################################################


func _on_erase(tree:Tree) -> void:
	var selected := tree.get_selected()
	tree.deselect_all()
	tree.set_selected(selected, 0)
