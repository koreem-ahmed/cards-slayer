extends Resource


class_name BattleStatsPool

@export var pool: Array[BattleStats]

var total_weights_by_tier := [0.0, 0.0, 0.0]


func get_all_battle_tiers(tier: int) -> Array[BattleStats]:
	return pool.filter(
		func(battle: BattleStats):
			return battle.battle_tier == tier
	)


func set_tiers_weight(tier: int) -> void:
	var battles := get_all_battle_tiers(tier)
	total_weights_by_tier[tier] = 0.0
	
	for battle: BattleStats in battles:
		total_weights_by_tier[tier] += battle.weight
		battle.accumulated_weight = total_weights_by_tier[tier]


func get_random_battle_tier(tier: int) -> BattleStats:
	var roll := randf_range(0.0, total_weights_by_tier[tier])
	var battles := get_all_battle_tiers(tier)
	
	for battle: BattleStats in battles:
		if battle.accumulated_weight > roll:
			return battle
	
	return null


func setup() -> void:
	for i in 3:
		set_tiers_weight(i)
