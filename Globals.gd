extends Node

enum MainScene {
	MainMenu,
	Game1,
	Game2,
	Game3,
	Game4
}

var game_1 = preload('res://MainScenes/Game1/Game1.tscn').instance()
var game_2 = preload('res://MainScenes/Game2/Game2.tscn').instance()
var game_3 = preload('res://MainScenes/Game3/Game3.tscn').instance()
var game_4 = preload('res://MainScenes/Game4/Game4.tscn').instance()


var current_main_scene = MainScene.MainMenu

func _init():
	print('Initial scene is %s' % MainScene.keys()[current_main_scene])

func switch_scene(new_scene: int):
	if current_main_scene == new_scene:
		return

	print('New scene is %s, old scene was %s' % MainScene.keys()[new_scene],  MainScene.keys()[current_main_scene])

	current_main_scene = new_scene

func _input(_event):
	# Don't execute from here is in release mode
	if not OS.is_debug_build():
		return

	# Very useful while debugging
	if Input.is_action_pressed('ui_cancel'):
		get_tree().quit()

	if Input.is_action_pressed('ui_1'):
		get_tree().get_root().add_child(game_1)

	if Input.is_action_pressed('ui_2'):
		get_tree().get_root().add_child(game_2)

	if Input.is_action_pressed('ui_3'):
		get_tree().get_root().add_child(game_3)

	if Input.is_action_pressed('ui_4'):
		get_tree().get_root().add_child(game_4)
