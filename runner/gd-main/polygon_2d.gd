
extends Polygon2D

func _ready():
	polygon = PackedVector2Array([
		Vector2(-50, -10),
		Vector2(50, -10),
		Vector2(50, 10),
		Vector2(-50, 10)
	])
	color = Color.SADDLE_BROWN
 
