/*
* Name: 		PongPaddle
* Last update:	22/10/2018 - 8:42 PM
* Author: 		JustGo
*/

class PongPaddle
	mouseControle = true
	botControle = false
	botSpeed = 10
	playerSpeed = 10

	width = 10
	height = 80
	
	x = 10
	y = 10

	color = GE_COLOR_GREEN
	
	func Move yMouse, oGame
		if botControle = false
			y = clamp(yMouse - height/2, 0, oGame.screen_h - height)
		else
			if Ball.y > y + height/2
				y = clamp(y+botSpeed, y, oGame.screen_h-height)
			elseif Ball.y < y + height/2
				y = clamp(y-botSpeed, 0, y)
			ok
		ok
			
	func Draw
		gl_draw_filled_rectangle(x,y,x+width,y+height,color)
		
func clamp val, vMin, vMax
	if val > vMax
		return vMax
	elseif val < vMin
		return vMin
	else
		return val
	ok
