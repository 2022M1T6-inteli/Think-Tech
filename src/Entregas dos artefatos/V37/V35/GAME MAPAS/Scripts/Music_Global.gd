extends Node

var music1 = load("res://MUSIC/toby fox - UNDERTALE Soundtrack - 11 Determination.mp3")
var music2 = load("res://MUSIC/toby fox - UNDERTALE Soundtrack - 23 Shop.mp3")
var music3 = load("res://MUSIC/toby fox - UNDERTALE Soundtrack - 17 Snowy.mp3")
var music4 = load("res://MUSIC/toby fox - UNDERTALE Soundtrack - 14 Heartache.mp3")
var music5 = load("res://MUSIC/toby fox - UNDERTALE Soundtrack - 06 Uwa!! So Temperate♫.mp3.mp3")

var is_playing := false

func play_music():
	$Music.stream = music1
	$Music.play()
	is_playing = true
	
func play_music2():
	$Music.stream = music2
	$Music.play()
	is_playing = true
	
func play_music3():
	$Music.stream = music3
	$Music.play()
	is_playing = true
	
func play_music4():
	$Music.stream = music4
	$Music.play()
	is_playing = true
	
func play_music5():
	$Music.stream = music5
	$Music.play()
	is_playing = true
	
	
func stop_music():
	$Music.stop()
	is_playing = false
	

