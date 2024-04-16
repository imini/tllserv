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
	if (os.clock() - talk_story) > 13 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 2
	
      elseif story == 2 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 3
	
      elseif story == 3 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
  story = 0
  elseif story == 4 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
  story = 5
  elseif story == 5 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
  story = 6
  elseif story == 6 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
  story = 7
  elseif story == 7 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
  story = 8
  elseif story == 8 then
    
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

if msgcontains(msg, 'depot') then
selfSay('King Arturo had it implented here and I am the one responsible for it. Another burden to carry. Yet, not many people have access to it anyway.')

elseif getPlayerStorageValue(cid,8353) == -1 and msgcontains(msg, 'access') then
selfSay('Anyone who wants to use that depot must pay the king 1200 gold coins. It is a one time fee, and is paid here in this shop. To me.')

elseif getPlayerStorageValue(cid,8353) == -1 and msgcontains(msg, 'pay') then
selfSay('Would you like to make a payment on 1200 gold coins to king Arturo, so that you are able to use the depot upstairs?')
talk_state = 1

elseif getPlayerStorageValue(cid,8353) == 1 and msgcontains(msg, 'access') then
selfSay('Anyone who wants to use that depot must pay the king 1200 gold coins. You have done so already, though.')

elseif getPlayerStorageValue(cid,8353) == 1 and msgcontains(msg, 'pay') then
selfSay('You have already paid, and you are free to use the depot upstairs. Enjoy it.')
talk_state = 1

elseif talk_state == 1 and msgcontains(msg,'no') then
selfSay('Very well.')
talk_state = 0

elseif talk_state == 1 and msgcontains(msg,'yes') then
if doPlayerRemoveMoney(cid,1200) == 1 then
setPlayerStorageValue(cid,8353,1)
npcHandler:say('So it has been done. Very well, you are now welcome to use the depot.')
talk_state = 0
else
selfSay('You need more money, darling.')
talk_state = 0
end
	
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
