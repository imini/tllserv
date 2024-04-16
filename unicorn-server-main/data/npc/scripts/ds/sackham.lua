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

	if (os.clock() - talk_story) > 9 and story > 0 then
    
        if story == 1 then
    
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
		msg = string.lower(msg)
	value1 = getPlayerStorageValue(cid,9951)
	value2 = getPlayerStorageValue(cid,9952)

	if value1 == -1 and value2 == -1 and msgcontains(msg,'addon') or
	value1 == -1 and value2 == -1 and msgcontains(msg,'outfit') then
	selfSay('My backpack is unique, I got it long ago from a friend of mine. But I seek for a fitting hat, a feather hat to be more precise. How about you, do you look for one too?')
	talk_state = 1
	
	elseif value1 == 1 and value2 == -1 and msgcontains(msg,'addon') or
	value1 == 1 and value2 == -1 and msgcontains(msg,'outfit') then
	selfSay('Oh, you\'re back already? Did you bring a legion helmet, 100 chicken feathers and 50 honeycombs?')
	talk_state = 3
	
	elseif value1 == 1 and value2 == 1 and msgcontains(msg,'addon') or
	value1 == 1 and value2 == 1 and msgcontains(msg,'outfit') then
	selfSay('I have given you the feather hat already.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('I see.')
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('I see.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Very well. Look, I have an idea. You look quite courageous. I know how to create one, but I have not courage enough to collect the items necessary. So if you gather items enough for two hats, I will make one for you and one for me. Okay?')
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Ah, alright then. Tell me if you change your mind.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Good! First, we will need a basic hat of course... I have one already, so if you get one legion helmet for yourself... yes, and then 100 chicken feathers would be good... and 50 honey combs as clue. That’s it, come back when you have collected it all.')
	setPlayerStorageValue(cid,9951,1)
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5902) >= 50 and getPlayerItemCount(cid,5890) >= 100 and getPlayerItemCount(cid,2480) >= 1 then
	selfSay('Great job! That must have taken a lot of work. Okay, you put it like this... then glue like this... here!')
	doPlayerRemoveItem(cid,5902,50)
	doPlayerRemoveItem(cid,5890,100)
	doPlayerRemoveItem(cid,2480,1)
	doPlayerAddOutfit(cid, 128, 2)
	doPlayerAddOutfit(cid, 136, 2)
doPlayerRemoveItem(cid,2480,1)
	doSendMagicEffect(getThingPos(cid),12)
	setPlayerStorageValue(cid,9952,1)
	talk_state = 0
  else
  selfSay('That is not true, you haven\'t got all those items.')
  talk_state = 0
  end
  end
  return true
  end
  
	
	
	
	
	
	
	
	
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'original', 'original'}, 		2109, 65, 	1, 	'original football')
shopModule:addBuyableItem({'advanced', 'original'}, 			2306, 155, 	1, 	'advanced football')
	
	
	
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
