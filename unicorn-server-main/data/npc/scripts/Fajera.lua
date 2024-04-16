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
	
	value0 = getPlayerStorageValue(cid,9821)
	value1 = getPlayerStorageValue(cid,9822)
	value2 = getPlayerStorageValue(cid,9823)
	msg = string.lower(msg)
	if value0 == -1 and msgcontains(msg,'addon') or
	value0 == -1 and msgcontains(msg,'outfit') then
	selfSay('My jewelled belt? Yes, that is a true masterpiece. Of course I could make one for you. A sabre if you are a male, of course. But I have a small request. Would you fulfil a task for me?')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('Alright, it\'s up to you.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Listen, um... I know that a friend has been longing for a certain comb for a long time... not just any comb, but the Comb of Dark Hair. She said it prevents split ends... or something. ...')
	story = 1
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'Do you think you could get one for me so I can give it to her? I really would appreciate it.'
  talk_state = 2
  
  elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Alright, it\'s up to you.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Brilliant! I will wait for you to return with the Comb of Dark Hair then. Ask the local mage, he might help you to locate it.')
	setPlayerStorageValue(cid,9821,1)
	setPlayerStorageValue(cid,9822,1)
	talk_state = 0
	
	elseif value1 == 1 and msgcontains(msg,'addon') or 
	value1 == 1 and msgcontains(msg,'outfit') or
	value1 == 1 and msgcontains(msg,'comb') then
	selfSay('Have you obtained the Comb of Dark Hair?')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Ah, okey. Return later when you have then.')
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5945) >= 1 then
	doPlayerRemoveItem(cid,5945,1)
	doSendMagicEffect(getThingPos(cid),13)
	doPlayerAddOutfit(cid,146,1)
	doPlayerAddOutfit(cid,150,1)
	setPlayerStorageValue(cid,9822,-1)
	setPlayerStorageValue(cid,9823,1)
	selfSay('Very good. Here is the addon as I promised.')
	talk_state = 0
	else
	selfSay('No, you don\'t have such a comb.')
	talk_state = 0
	end
	
	elseif value2 == 1 and msgcontains(msg,'addon') or 
	value2 == 1 and msgcontains(msg,'outfit') or
	value2 == 1 and msgcontains(msg,'comb') then
	selfSay('You have fulfillled my tasks.')
	talk_state = 0
	
	
	
	
	end
	return true
	end
	
	
	
	
	
	
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())