extends Node

# card signals
signal card_drag_starts(card_ui: CardUi)
signal card_drag_ends(card_ui: CardUi)
signal card_aim_starts(card_ui: CardUi)
signal card_aim_ends(card_ui: CardUi)
signal card_played(card: Card)
signal card_tooltip_requested(card: Card)
signal tooltip_hide_requested

# player signals
signal player_hand_draw
signal player_hand_discarded 
signal player_turn_ended
signal player_hit
signal player_died

# enemy signals
signal enemy_action_completed(enemy: Enemy)
signal enemy_turn_ended

# battle signals
signal battle_over_screen_requested(text: String, type: BattleOverPanel.Type)
signal battle_won

# map signals
signal map_exited

# shop signals
signal shop_exited

# campfire signals
signal campfire_exited

# battle reward signals
signal battle_reward_exited

# treasure room signals
signal treasure_room_exited
