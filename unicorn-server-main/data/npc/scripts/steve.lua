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
	
	value1 = getPlayerStorageValue(cid,9949)
	value2 = getPlayerStorageValue(cid,9950)
	msg = string.lower(msg)
	if value1 == -1 and value2 == -1 and msgcontains(msg,'backpack') or value1 == -1 and value2 == -1 and msgcontains(msg,'outfit') or value1 == -1 and value2 == -1 and msgcontains(msg,'addon') then
	selfSay('Sorry, mate. This backpack I wear is not for sale. It is made of rare minotaur leather.')
	
	elseif value1 == -1 and msgcontains(msg,'minotaur leather') then
	selfSay('Well, if you really like this backpack, I could make you one. I have quite a lot of free time. The only problem is that minotaur leather is hard to come by these days. Are you willing to put some work into this?')
	talk_state = 1
	
  elseif value1 == 1 and value2 == -1 and msgcontains(msg,'minotaur leather') or value1 == 1 and value2 == -1 and msgcontains(msg,'outfit') or value1 == 1 and value2 == -1 and msgcontains(msg,'addon') then
	selfSay('Oh, yes... I almost forgot about this backpack. Have you brought me 100 minotaur leathers as I requested?')
	talk_state = 2
	
	elseif value1 == 1 and value2 == 1 and msgcontains(msg,'backpack') or value1 == 1 and value2 == 1 and msgcontains(msg,'outfit') or value1 == 1 and value2 == 1 and msgcontains(msg,'addon') then
	selfSay('You have already recieved a backpack.')

	elseif talk_state == 1 and msgcontains(msg,'no') then 
	selfSay('Very well...')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then 
	selfSay('Fine then. If you bring me 100 fine minotaur leathers I will see what I can do for you. You will probably have to kill quite many minotaurs, so good luck.')
	setPlayerStorageValue(cid,9949,1)
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'no') then 
	selfSay('Come back later then.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then 
	if getPlayerItemCount(cid,5878) >= 100 then
	selfSay('Great! Alright, here is my old backpack, you can have it. I\'ll make myself a new one with the minotaur leathers you brought.')
	doSendMagicEffect(getThingPos(cid),14)
	setPlayerStorageValue(cid,9950,1)
	doPlayerRemoveItem(cid,5878,100)
	doPlayerAddOutfit(cid, 128, 1)
	doPlayerAddOutfit(cid, 136, 1)
	talk_state = 0
	else
	selfSay('Nah, you haven\'t.')
	talk_state = 0
	
	end
	
	elseif msgcontains(msg,'obsidian knife') then
	selfSay('If you bring me a piece of draconian steel from Will Smith, and an obsidian lance, I\'ll be happy to give you an obsidian knife. Have you got these items?')
	talk_state = 9
	
	elseif msgcontains(msg,'no') and talk_state == 9 then
	selfSay(msg,'Alright then.')
	talk_state = 0
	
	elseif msgcontains(msg,'yes') and talk_state == 9 then
	if getPlayerItemCount(cid,5889) >= 1 and getPlayerItemCount(cid,2425) >= 1 then
	doPlayerRemoveItem(cid,5889,1)
	doPlayerRemoveItem(cid,2425,1)
	doPlayerAddItem(cid,5908,1)
	selfSay(msg,'Fair deal.')
	talk_state = 0
	else
	selfSay('You don\'t have these items.')
	talk_state = 0
	end
	
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())