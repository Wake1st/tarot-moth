class_name Drink
extends Node2D


signal full

var elements: Array[Element]
var layers: Array[Sprite2D]
var index: int = 0


func add(ingredient: Ingredient) -> void:
	if index < layers.size():
		layers[index].visible = true
		index += 1
		
		elements.push_back(ingredient.element)
		
		if index == layers.size():
			full.emit()


func reset() -> void:
	elements.clear()
	
	for layer in layers:
		layer.visible = false
	index = 0


func _ready() -> void:
	for sprite: Sprite2D in get_children():
		layers.push_back(sprite)
