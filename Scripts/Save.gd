extends Node
var savePathPreset:String = "res://Presets/"
var savePathCharacter:String = "res://SavedCharacter/"
var ext:String = ".save"

func _ready():
	pass

func _saveCharacter(n:String,data:Dictionary):
	var fileSave = FileAccess.open(savePathCharacter+n+ext,FileAccess.WRITE)
	fileSave.store_line(JSON.stringify(data))
	
func _loadCharacter(n):
	var fileSave = FileAccess.open(savePathCharacter+n+ext,FileAccess.READ)
	var test_json_conv = JSON.new()
	test_json_conv.parse(fileSave.get_line())
	var charData:Dictionary = test_json_conv.get_data()
	return charData

func _savePreset(n:String,data:Dictionary):
	var fileSave = FileAccess.open(savePathPreset+n+ext,FileAccess.WRITE)
	fileSave.store_line(JSON.stringify(data))

func _loadPreset(n):
	var fileSave = FileAccess.open(savePathPreset+n+ext,FileAccess.READ)
	var test_json_conv = JSON.new()
	test_json_conv.parse(fileSave.get_line())
	var charData:Dictionary = test_json_conv.get_data()
	return charData