function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

function BFTurn() 
    for i=0,3 do
		tweenFadeIn(i,0,0.5)
		tweenPos(i, _G['defaultStrum'..i..'X'] - 375,getActorY(i),0.5)
    end
	
	for i = 4, 7 do
		tweenFadeIn(i,1,0.5)
		tweenPos(i, _G['defaultStrum'..i..'X'] - 275,getActorY(i),0.5)
	end
end
function SpongTurn() 
    for i=0,3 do
		tweenFadeIn(i,1,0.5)
		tweenPos(i, _G['defaultStrum'..i..'X'] + 375,getActorY(i),0.5)
    end
	for i = 4, 7 do
		tweenFadeIn(i,0,0.5)
	end
end


function start (song)
    print("SPONGSPONGSPONGSPONG")
end

function update (elapsed)
	local currentBeat = (songPos / 1000)*(bpm/30)
	for i=0,7 do
		setActorAngle(getActorAngle(i) + 15, i)
	end
	if curStep >= 256 and curStep < 502 then
		local valuezoom = math.sin(currentBeat * math.pi) /5
		local valueresize = valuezoom*100
		setCamZoom(valuezoom + 1)
	end
	if curStep >= 128 and curStep < 383 then
	for i=0,7 do
		setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.5) * math.pi) *3, i)
		setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.5) * math.pi) *3, i)
	end
	end
end

function beatHit (beat)

end

function stepHit (step)
	if curStep == 512 then
		setDefault()
for i = 4, 7 do -- go to the center
	tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 275,getActorAngle(i) + 360, 0.6, 'setDefault')
end
	end
	if curStep == 511 then
		tweenFadeIn('girlfriend', 0, 0.5)
	    SpongTurn()
	end
	if curStep == 640 then
	    BFTurn()
	end
	if curStep == 383 then
		for i=0,7 do
			tweenPos(i,_G['defaultStrum'..i..'X'], _G['defaultStrum'..i..'Y'],0.3)
		end
	end
end

function keyPressed (key)
	-- do nothing
end