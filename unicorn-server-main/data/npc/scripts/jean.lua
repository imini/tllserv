local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local storyMessage = {}
local story = 0
local talk_story = 0
-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function callbackOnThink()
	if (os.clock() - talk_story) > 11 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0
	elseif story == 2 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

        end
            
    end
    return true
    end
    npcHandler:setCallback(CALLBACK_ONTHINK, callbackOnThink)

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
	
		value0 = getPlayerStorageValue(cid,9501)
		value1 = getPlayerStorageValue(cid,9502)
		value2 = getPlayerStorageValue(cid,9503)
		value3 = getPlayerStorageValue(cid,9504)
		value4 = getPlayerStorageValue(cid,9505)
		value5 = getPlayerStorageValue(cid,9506)
		msg = string.lower(msg)
		if msgcontains(msg,'mission') and value0 == -1 then
		selfSay('I could need some help, indeed. I don\'t want to frighten you off now, but the help I need will require you to travel far, far away. Do you wish to help me in spite of this?')
		talk_state = 1
		
		elseif talk_state == 1 and msgcontains(msg,'no') then
		selfSay('Oh, I see. I can\'t travel either. I have too many other things to do.')
	  talk_state = 0
	  
	  elseif talk_state == 1 and msgcontains(msg,'yes') then
		selfSay('Very nice of you, indeed. Let me then tell you what the whole thing is about. You have perhaps heard of the distant city of Casteldine?')
	  talk_state = 2
		
		elseif talk_state == 2 and msgcontains(msg,'no') then
		selfSay('Oh, I see. It\'s the capital. Anyway, I need you to travel there and seek an old colleague of mine. He\'s working in the castle. Personally, I don\'t know why anyone would like to work so close to the king. ...')
	  story = 1
	  talk_start = os.clock()
    talk_story = os.clock()
    storyMessage[1] = 'However, I need you to bring him a certain cucumber which I have... grown. Will you do this for me?'
	  talk_state = 3
	  
		elseif talk_state == 2 and msgcontains(msg,'yes') then
		selfSay('Good. I need you to travel there and seek an old colleague of mine. He\'s working in the castle. Personally, I don\'t know why anyone would like to work so close to the king. ...')
	  story = 2
	  talk_start = os.clock()
    talk_story = os.clock()
    storyMessage[2] = 'However, I need you to bring him a certain cucumber which I have... grown. Will you do this for me?'
	  talk_state = 3
		
		elseif talk_state == 3 and msgcontains(msg,'no') then
		selfSay('Oh, I see.')
	  talk_state = 0
	  
	  elseif talk_state == 3 and msgcontains(msg,'yes') then
		selfSay('Terrific! Well, then, take this piece of the cucumber and give it to him. Good luck, ' .. getPlayerName(cid) .. '.')
	  setPlayerStorageValue(cid,9501,1)
	  setPlayerStorageValue(cid,9502,1)
	  doPlayerAddItem(cid,7245,1)
	  talk_state = 0
		
		elseif msgcontains(msg,'mission') and value1 == 1 or
		msgcontains(msg,'cucumber') and value1 == 1 then
		selfSay('Travel to the distant city of Casteldine and seek my old colleague who works in the castle and give him the cucumber.')

		talk_state = 0
		
		elseif msgcontains(msg,'have no need for a stupid cucumber') and value2 == 1 or
		msgcontains(msg,'have no need for a stupid cucumber') and value2 == 1 then
		selfSay('WHAT!? Did he really say that? My god, what has he turned into. I bet it\'s the kings fault. Bah, what a fool. Can I have my deer cucumber back then?')
		talk_state = 4
		
		elseif talk_state == 4 and msgcontains(msg,'no') then
		selfSay('Oh, I see.')
	  talk_state = 0
	  
	  elseif talk_state == 4 and msgcontains(msg,'yes') then
	  if getPlayerItemCount(cid,7245) >= 1 then
		selfSay('Thank you. Take these small rarities. I need to reward you somehow for your travelling, I suppose. Too bad it turned out negatively.')
	  talk_state = 0
	  doPlayerRemoveItem(cid,7245,1)
	  bag = doPlayerAddItem(cid,1997,1)
	  doAddContainerItem(bag,7158,1)
		doAddContainerItem(bag,7159,1)
	  setPlayerStorageValue(cid,9504,1)
	  setPlayerStorageValue(cid,9503,-1)
		else
	  selfSay('You don\'t have it, ' .. getPlayerName(cid) .. '.')
	  talk_state = 0
	  end
	  
	  elseif msgcontains(msg,'mission') and value3 == 1 or
		msgcontains(msg,'cucumber') and value3 == 1 then
		selfSay('Nah, I have no more things for you.')
		talk_state = 0
  end
  return true
  end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())