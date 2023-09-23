extends HBoxContainer

func _ready():
	var baseLevels = get_tree().get_nodes_in_group("base_level")
	
	if (baseLevels.size() > 0 ):
		baseLevels[0].connect("coin_total_changed", self, "on_coin_total_changed")
		update_display(baseLevels[0].totalCoins, baseLevels[0].collectedCoins )
	
func update_display(totalCoins, collectedCoins):
	$CoinLabel.text = str(collectedCoins, "/", totalCoins, "")
	
	
func on_coin_total_changed(totalCoins, collectedCoins):
	update_display(totalCoins, collectedCoins)
