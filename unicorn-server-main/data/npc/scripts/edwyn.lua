local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local lottery = 0
local rand = 0
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 
npcHandler:onThink()
    end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end

value1 = getPlayerStorageValue(cid,7301)
value2 = getPlayerStorageValue(cid,2764)
value3 = getPlayerStorageValue(cid,2765)
value4 = getPlayerStorageValue(cid,2634)
msg = string.lower(msg)
    if value1 == -1 and msgcontains(msg, 'addon') and value3 == -1 or
    value1 == -1 and msgcontains(msg, 'outfit') and value3 == -1 then
    selfSay('Ah! You want my belt!?')
    talk_state = 1
    
    elseif value2 == 1 and msgcontains(msg, 'addon') and value3 == -1 or
    value2 == 1 and msgcontains(msg, 'rat') and value3 == -1 or
    value2 == 1 and msgcontains(msg, 'outfit') and value3 == -1 then
    selfSay('You brought the rats\' corpses and the 300 gold coins?')
    talk_state = 4
    
    elseif value3 == 1 and msgcontains(msg, 'addon') or
		value3 == 1 and msgcontains(msg, 'rat') or
    value3 == 1 and msgcontains(msg, 'outfit') then
    selfSay('You have already won my blood lottery and received the addon.')
    talk_state = 0
    
    elseif talk_state == 1 and msgcontains(msg, 'no') then
    selfSay('Fine then.')
    talk_state = 0
    
    elseif talk_state == 1 and msgcontains(msg, 'yes') then
    selfSay('Haha! Not for free, fool. I will let you have it on one condition. You enter my blood lottery. What do you say?')
    talk_state = 2
    
    elseif talk_state == 2 and msgcontains(msg, 'no') then
    selfSay('Fine then.')
    talk_state = 0
    
    elseif talk_state == 2 and msgcontains(msg, 'yes') then
    selfSay('Very well! Haha! I need you to bring me 4 fresh corpses of rats if you want to spin the wheel. I also want 300 gold coins each time. Is this clear to you?')
    talk_state = 3
    
    elseif talk_state == 3 and msgcontains(msg, 'no') then
    selfSay('Fine then.')
    talk_state = 0
    
    elseif talk_state == 3 and msgcontains(msg, 'yes') then
    selfSay('So go get me the rat corpses. And the money. Now!')
		setPlayerStorageValue(cid,7301,1)
		setPlayerStorageValue(cid,2764,1)
    talk_state = 0

    elseif talk_state == 4 and msgcontains(msg, 'no') then
    selfSay('Fine then.')
    talk_state = 0
		
		elseif talk_state == 4 and msgcontains(msg, 'yes') then
		if getPlayerItemCount(cid,2813) >= 4 and getPlayerItemCount(cid,2152) >= 3 
		or getPlayerItemCount(cid,2813) >= 4 and getPlayerItemCount(cid,2148) >= 300
		or getPlayerItemCount(cid,2813) >= 4 and getPlayerItemCount(cid,2160) >= 1 then
		selfSay('Ah. I’ll take those, and now – are you interested in the result of the blood lottery?')
		doPlayerTakeItem(cid,2813,4)
		doPlayerRemoveMoney(cid,300)
		talk_state = 6
		else
		selfSay('You don\'t have these items, fool.')
		talk_state = 0
		end

    elseif talk_state == 6 and msgcontains(msg,'no') then
    selfSay('Well, fool, I\'m afraid you lost your items then.')
    talk_state = 0

		elseif talk_state == 6 and msgcontains(msg, 'yes') then
		rand = math.random(1,30)
		if rand == 27 then
		selfSay('You won. No more corpses for me then. Anyway, as I promised, here is your fluid belt.')
		setPlayerStorageValue(cid,2765,1)
    doPlayerAddOutfit(cid, 138, 1)
    doPlayerAddOutfit(cid, 133, 1)
	  talk_state = 0
		else
		selfSay('You lost. Want to try again?')
		talk_state = 9		
end
    elseif talk_state == 9 and msgcontains(msg,'yes') then
    selfSay('Bring me the rat\'s corpses and the 300 gold coins, then.')
    talk_state = 0
    elseif talk_state == 9 and msgcontains(msg,'no') then
    selfSay('Suite yourself then, dummie.')
    talk_state = 0
    
    elseif value4 == -1 and msgcontains(msg, 'addon') and value3 == -1 or
    value4 == -1 and msgcontains(msg, 'outfit') and value3 == -1 then
    selfSay('Ah! You want my belt!?')
    talk_state = 1
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())