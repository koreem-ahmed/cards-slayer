# meta-name: Relic
# meta-discription: Create a Relic which can be acuired by the player.
extends Relic

var member_var := 0


func initialize_relic(_owner: RelicUI) -> void:
	print("happens when we gain a new relic")


func activate_relic(_owner: RelicUI) -> void:
	print("this happens based on relic_type property")


func deactivate_relic(_owner: RelicUI) -> void:
	print("this gets called when a RelicUI is exiing the SceneTree i.e getting deleted")
	print("Event-based Relics shoul disconnect from the EventBus here.")


func  get_tooltip() -> String:
	return tooltip
