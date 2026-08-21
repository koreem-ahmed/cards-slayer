extends Resource


class_name SaveGame

const SAVE_PATH := "user://savegame.tres"

@export var run_stats: RunStats
@export var char_stats: CharacterStats
@export var current_deck: CardPile
@export var current_heal: int
@export var relics: Array[Relic]
@export var map_data: Array[Array]
@export var last_room: Room
@export var floors_climbed: int
@export var was_on_map: bool


func save_data() -> Error:
	return ResourceSaver.save(self, SAVE_PATH)


static func load_data() -> SaveGame:
	if not FileAccess.file_exists(SAVE_PATH):
		return null

	return ResourceLoader.load(
		SAVE_PATH,
		"SaveGame",
		ResourceLoader.CACHE_MODE_IGNORE
	) as SaveGame


static func delete_data() -> Error:
	if not FileAccess.file_exists(SAVE_PATH):
		return OK

	return DirAccess.remove_absolute(ProjectSettings.globalize_path(SAVE_PATH))
