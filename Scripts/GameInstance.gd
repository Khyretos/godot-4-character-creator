extends Node
var currentScene
var currentPlayer
var nextScene

@onready var mainScene = preload("res://Scenes/MainMenu.tscn")
@onready var player = preload("res://Scenes/MainCharacter.tscn")
@onready var GAME = get_parent().get_node("Game")

func _ready():
	currentScene=mainScene.instantiate()
	GAME.add_child(currentScene)

func _changeScene(path:String):
	print(path)
	nextScene=ResourceLoader.load(path).instantiate()
	currentScene.queue_free()
	currentScene=nextScene
	GAME.add_child(nextScene)

func _spawnPlayer(n:String):
	if currentPlayer:
		currentPlayer.queue_free()
	currentPlayer = player.instantiate()
	currentScene.add_child(currentPlayer)
	currentPlayer.characterData=Save._loadCharacter(n)
	currentPlayer._load(currentPlayer.characterData)
	currentPlayer._loadFeatures()