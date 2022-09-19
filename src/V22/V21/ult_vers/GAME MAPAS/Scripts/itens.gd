extends TileMap

var coin = preload("res://GAME MAPAS/TileItens/Coin.tscn")

func _ready():
	for coins in get_used_cells_by_id(0):
		var newCoin = coin.instance()
		add_child(newCoin)
		newCoin.global_position = map_to_world(coins) + Vector2(0,8)
		set_cellv(coins, -1)
