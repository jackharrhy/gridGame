-- Grids
--  by Jack Harrhy
--
-- Inspired by 'GameOfLife' by github user 'miko'

function love.load()
	-- Random Seed
	math.randomseed( os.time() )

	-- Varibles
	rows = 19
	cols = 19
	cellsize = 12

	frame = 0
	hasWon = false
	
	-- Setup Grid
	grid = {
	
		{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
		{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
		{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
		{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}

	}

	-- Player
	p = {
		x = 4, y = cols - 3

	}

end

function love.update()
	frame = frame + 1

	if love.keyboard.isDown('right') then			-- Right
		if grid[p.x + 1][p.y] ~= 1 then
			grid[p.x][p.y] = 0
			p.x = p.x + 1
		end

	elseif love.keyboard.isDown('left') then	-- Left
		if grid[p.x - 1][p.y] ~= 1 then
			grid[p.x][p.y] = 0
			p.x = p.x - 1
		end

	elseif love.keyboard.isDown('up') then		-- Up
		if grid[p.x][p.y - 1] ~= 1 then
			grid[p.x][p.y] = 0
			p.y = p.y - 1
		end

	elseif love.keyboard.isDown('down') then	-- Down
		if grid[p.x][p.y + 1] ~= 1 then
			grid[p.x][p.y] = 0
			p.y = p.y + 1
		end

	end

	-- Update player cords
	grid[p.x][p.y] = 2

end

function love.draw()
	-- Draw Grid
	for c=1, cols do
		for r=1, cols do
			local cell = grid[c][r]

			if cell == 0 then
				love.graphics.setColor(10,10,40)		-- Floor
			elseif cell == 1 then
				love.graphics.setColor(70,70,120)		-- Wall
			elseif cell == 2 then
				love.graphics.setColor(255,255,0)		-- Player
			elseif cell == 3 then
				love.graphics.setColor(255,100,100)	-- Goal
			else
				print("Error: got "..cell.." instead of valid cell id")
			end

			love.graphics.rectangle('fill', (c-1)*cellsize, (r-1)*cellsize, cellsize, cellsize)

		end
	end

	-- Draw debug information
	love.graphics.setColor(255,255,255)

	love.graphics.print(frame, 2, 2)
	love.graphics.print(love.timer.getFPS(), 2, 14)
	
end

