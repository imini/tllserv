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
	talk_state = 1
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
	
	local value0 = getPlayerStorageValue(cid,7558)
	local value1 = getPlayerStorageValue(cid,7556)
	local value2 = getPlayerStorageValue(cid,7557)
	local value6 = getPlayerStorageValue(cid,7462)
	local value7 = getPlayerStorageValue(cid,9864)
	local value8 = getPlayerStorageValue(cid,9865)
	msg = string.lower(msg)
	value9 = getPlayerStorageValue(cid,9500)
	
	if value0 == -1 and msgcontains(msg,'addon') or
	value0 == -1 and msgcontains(msg,'outfit') then
	selfSay('G-glad someone knows h-how to d-drink. Of cou-course, mate. I h-h-have this old sa-sabre for you. N-non-noones is buying it a-anyway... hicks. ...')
			story = 1
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[1] = 'Oh. You ca-can’t, hicks, have it for f-free though. I n-need a behemoth cl-claw for m-my new necklace. And al-also, hicks, a n-n-nose ring. ...'
			storyMessage[2] = 'It sh-should be clear from w-where you get the b-behemoth claw. A-also, there is, hicks, this h-horned fox who w-wears a, hicks, nose r-ring. ...'
			storyMessage[3] = 'Come back to m-me, hicks, when you have BOTH! G-got that?'

	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('Then n-not.')
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and value9 == -1 then
	selfSay('Heh. Y-you wanna d-do mission? Hicks.')
	talk_state = 13
	
	elseif talk_state == 13 and msgcontains(msg,'no') then
	selfSay('Then n-not.')
	talk_state = 0
	
	elseif talk_state == 13 and msgcontains(msg,'yes') then
	selfSay('O-ok. We-well. S-see this m-map thing? I h-had it from my fa-father once. I think it i-is a treasure m-map. Hicks. ...')
	story = 4
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[4] = 'We-well, I th-think it shows some t-tomb r-rumoured to be directly east o-of that town T-tha\'Reen. But, c-can\'t go there. You c-can have it i-if you want, th-then it would b-be used. W-want?'
	talk_state = 14

	elseif talk_state == 14 and msgcontains(msg,'no') then
	selfSay('Then n-not.')
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and value9 == 1 or
	msgcontains(msg,'map') and value9 == 1 then
	selfSay('I g-gave you th-that map al-already, h-hehe, hicks.')
	talk_state = 0
	
	elseif talk_state == 14 and msgcontains(msg,'yes') then
	setPlayerStorageValue(cid,9500,1)
	doPlayerAddItem(cid,5706,1)
	selfSay('C-cool. Here.')
	talk_state = 0
	
  elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Good. O-off you, hicks, go.')
	setPlayerStorageValue(cid,7558,1)
	setPlayerStorageValue(cid,7556,1)
	talk_state = 0
	

	elseif value1 == 1 and msgcontains(msg,'addon') or
	value1 == 1 and msgcontains(msg,'nose ring') or
	value1 == 1 and msgcontains(msg,'behemoth claw') or
	value1 == 1 and msgcontains(msg,'outfit') then
	selfSay('So, have y-you b-brought me nose ring and behemoth c-claw?')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Come b-back when y-y-you have it. Hicks.')
	talk_state = 0
	
  elseif talk_state == 3 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5930) >= 1 and getPlayerItemCount(cid,5804) >= 1 then
	selfSay('W-w-wonderful! Hicks, g-great work. As I, hicks, p-promised, here’s the sa-sabre.')
	setPlayerStorageValue(cid,7556,-1)
	setPlayerStorageValue(cid,7557,1)
	doPlayerRemoveItem(cid,5930,1)
	doPlayerRemoveItem(cid,5804,1)
	doPlayerAddOutfit(cid,156,2)
	doPlayerAddOutfit(cid,152,2)
	talk_state = 0
	else
	selfSay('You d-don\'t , hicks, have i-it.')
	talk_state = 0
	end
	
	
	elseif value2 == 1 and msgcontains(msg,'outfit') or
	value2 == 1 and msgcontains(msg,'addon') then
	selfSay('You have a-already finished the m-mission.')
	
	elseif value7 == 1 and msgcontains(msg,'helmet') or
	value7 == 1 and msgcontains(msg,'adorn') then
	selfSay('Oh, Z-zacharias sent you, hicks? I s-ee. It will, hicks, be a-a pleasure to a-adorn your, hicks, helmet. Right, th-there you go. Hicks.')
	setPlayerStorageValue(cid,9865,1)
	setPlayerStorageValue(cid,9864,-1)
	doPlayerAddOutfit(cid,131,2)
	doPlayerAddOutfit(cid,139,2)
	doSendMagicEffect(getThingPos(cid),14)
	
	elseif value8 == 1 and msgcontains(msg,'helmet') or
	value8 == 1 and msgcontains(msg,'adorn') then
	selfSay('I ha-have already done this. Hicks.')
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())