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
	story = 2
	
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
	
	local value1 = getPlayerStorageValue(cid,9935)
  local value2 = getPlayerStorageValue(cid,9936)
  local value3 = getPlayerStorageValue(cid,9872)
  msg = string.lower(msg)
 
 
  if msgcontains(msg,'stake') and value3 == 1 then
	selfSay('Making a stake from a chair? Are you insane??! I won\'t waste my chairs on you for free! You will have to pay for it, but since I consider your plan a blasphemy, it will cost 5000 gold pieces. Okay?')
	talk_state = 2
	
	elseif msgcontains(msg,'no') and talk_state == 2 then
	selfSay('Not my problem.')
	talk_state = 0

  elseif msgcontains(msg,'yes') and talk_state == 2 then
  if getPlayerItemCount(cid,2148) >= 5000 or getPlayerItemCount(cid,2152) >= 50 or getPlayerItemCount(cid,2160) >= 1 then
	selfSay('Argh... my heart aches! Alright... a promise is a promise. Here - take this wooden stake, and now get lost.')
	doPlayerAddItem(cid,5941,1)
	doPlayerRemoveMoney(cid,5000)
	setPlayerStorageValue(cid,9837,1)
	talk_state = 0
	else
	selfSay('You don\'t have enough money...')
	talk_state = 0
	end 
 
  elseif msgcontains(msg, 'quest') and value1 == -1 and value2 == -1 then
    selfSay('Seriously, I am dealing with food. I am a butcher for heavens sake. What do you expect fr... oh wait a second. You might be exactly what I\'m looking for. ...')
    story = 1
    talk_start = os.clock()
		talk_story = os.clock()
		storyMessage[1] = 'I have been curious for a while, you see, where to obtain these mystic dragon hams. I have heard Chef Churry haven\'t even found himself any examples of the food type. ...'
    storyMessage[2] = 'I beg you to find out, and then return to me with 15 examples, oh, let\'s say 20. Thereby, I will be able to show Churry that I\'m in fact not as useless as he thinks.'
    setPlayerStorageValue(cid,9935,1)
    talk_state = 0
    
    elseif msgcontains(msg, 'quest') and value1 == 1 and value2 == -1 or msgcontains(msg, 'dragon ham') and value1 == 1 and value2 == -1 then
    selfSay('Have you really acquired 20 dragon hams for me?')
    talk_state = 1
    
    elseif talk_state == 1 and msgcontains(msg, 'no') then
    selfSay('Fine, take your time, but return to me when you have obtained them.')
    talk_state = 0
    
    elseif msgcontains(msg, 'quest') and value1 == 1 and value2 == 1 or msgcontains(msg, 'dragon ham') and value1 == 1 and value2 == 1 then
    selfSay('Don\'t you realize how much you already have helped me?')
    talk_state = 0
    
    elseif talk_state == 1 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,2672) >= 20 then
    doPlayerAddItem(cid,2145,3)
    doPlayerRemoveItem(cid,2672,20)
    npcHandler:say('Oh, I can see you really have. Thank you, and here is your salary.')
    setPlayerStorageValue(cid,9936,1)
    talk_state = 0
     else
     npcHandler:say('That\'s not true. You don\'t have any.')
     end
     
     


end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
