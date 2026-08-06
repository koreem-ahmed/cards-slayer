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
