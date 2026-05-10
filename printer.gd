extends Node

func _ready() -> void:
	var file = FileAccess.open("res://a.jsonc", FileAccess.READ)
	var text := file.get_as_text()
	var processed := ""
	for line in text.split("\n"):
		var stripped = line.strip_edges(true, true).get_slice("//", 0)
		if stripped.is_empty():
			continue
		processed += stripped + "\n"
	print("Processed: ",processed)
	var data = JSON.parse_string(processed)
	print(data)
