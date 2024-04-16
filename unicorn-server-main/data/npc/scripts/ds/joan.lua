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

	value0 = getPlayerStorageValue(cid,9746)
	value1 = getPlayerStorageValue(cid,9747)
value2 = getPlayerStorageValue(cid,9748)
msg = string.lower(msg)

  if value0 == -1 and msgcontains(msg,'addon') or
value0 == -1 and msgcontains(msg,'outfit') or
value0 == -1 and msgcontains(msg,'backpack') then
selfSay('Isn\'t fancy?')
talk_state = 1

elseif talk_state == 1 and msgcontains(msg,'no') then
selfSay('You\'re lying because you\'re jealous. That\'s all.')
talk_state = 0

elseif talk_state == 1 and msgcontains(msg,'yes') then
selfSay('Yeah, it really is cute. I\'m sure you want one too. Right?')
talk_state = 2

elseif talk_state == 2 and msgcontains(msg,'no') then
selfSay('You\'re lying because you\'re jealous. That\'s all.')
talk_state = 0

elseif talk_state == 2 and msgcontains(msg,'yes') then
selfSay('Yeah! But the problem is that it\'s unique. Only I have one around here. So, who\'s the most fanciest person in the world?')
talk_state = 3

elseif talk_state == 3 and msgcontains(msg,'joan') then
selfSay('Exactly. So, you seem to be a nice person. Would you want me to make you a backpack too?')
talk_state = 4

elseif talk_state == 4 and msgcontains(msg,'no') then
selfSay('Fine with me, then.')
talk_state = 0

elseif talk_state == 4 and msgcontains(msg,'yes') then
selfSay('Well, it\'s made out of rare minotaur leather, so you\'ll have to gather pretty many. 10 will do... hm, no, 50. Eh, let\'s say 100. Okey?')
talk_state = 5

elseif talk_state == 5 and msgcontains(msg,'no') then
selfSay('Fine with me, then.')
talk_state = 0

elseif talk_state == 5 and msgcontains(msg,'yes') then
selfSay('Good, then return to me when you have the 100 minotaur leathers.')
setPlayerStorageValue(cid,9746,1)
setPlayerStorageValue(cid,9747,1)
talk_state = 0


elseif value1 == 1 and msgcontains(msg,'addon') or
value1 == 1 and msgcontains(msg,'outfit') or
value1 == 1 and msgcontains(msg,'leather') or
value1 == 1 and msgcontains(msg,'backpack') then
selfSay('I suppose you have collected 100 minotaur leathers?')
talk_state = 6

elseif talk_state == 6 and msgcontains(msg,'no') then
selfSay('Okay. Come back when you have done so then.')
talk_state = 0

elseif talk_state == 6 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,5878) >= 100 then
selfSay('Good, good. I\'ll take those and in return, here\'s your fancy backpack.')
setPlayerStorageValue(cid,9747,-1)
setPlayerStorageValue(cid,9748,1)
doPlayerRemoveItem(cid,5896,50)
doPlayerRemoveItem(cid,5897,50)
doPlayerAddOutfit(cid,128,1)
doPlayerAddOutfit(cid,136,1)
doPlayerRemoveItem(cid,5878,100)
doSendMagicEffect(getThingPos(cid),13)
talk_state = 0
else
selfSay('You must obtain the items requested before I can make you the outfit')
talk_state = 0
end

elseif value2 == 1 and msgcontains(msg,'addon') or
value2 == 1 and msgcontains(msg,'outfit') or
value2 == 1 and msgcontains(msg,'backpack') then
selfSay('I\'ve given you the unique backpack already.')
talk_state = 0
end
return true
end

  
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
