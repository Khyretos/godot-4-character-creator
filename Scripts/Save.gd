extends Node
var savePathPreset:String = "res://Presets/"
var savePathCharacter:String = "res://SavedCharacter/"
var ext:String = ".json"

func _ready():
	pass

func _saveCharacter(n:String,data:Dictionary):
	var fileSave = FileAccess.open(savePathCharacter+n+ext,FileAccess.WRITE)
	fileSave.store_line(JSON.stringify(data))
	
func _loadCharacter(n):
	var fileSave = FileAccess.get_file_as_string(savePathCharacter+n+ext)
	var charData: Dictionary = JSON.parse_string(fileSave)
	return charData

func _savePreset(n:String,data:Dictionary):
	var fileSave = FileAccess.open(savePathPreset+n+ext,FileAccess.WRITE)
	fileSave.store_line(JSON.stringify(data))

func _loadPreset(n):
	var fileSave = FileAccess.get_file_as_string(savePathPreset+n+ext)
	var charData:Dictionary = JSON.parse_string(fileSave)
	return charData