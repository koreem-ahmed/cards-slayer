extends TextureButton


class_name CardPileOpener

@export var counter: Label
@export var card_pile: CardPile : set = set_card_pile


func set_card_pile(new_value: CardPile) -> void:
	card_pile = new_value
	
	if not card_pile.pile_size_changed.is_connected(on_pile_size_changed):
		card_pile.pile_size_changed.connect(on_pile_size_changed)
		on_pile_size_changed(card_pile.cards.size())
	

func on_pile_size_changed(cards_amount: int) -> void:
	counter.text = str(cards_amount)
