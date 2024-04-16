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
	story = 5
	elseif story == 5 then
    
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

	value0 = getPlayerStorageValue(cid,9735)
	value1 = getPlayerStorageValue(cid,9736)
value2 = getPlayerStorageValue(cid,9737)
value3 = getPlayerStorageValue(cid,9738)
value4 = getPlayerStorageValue(cid,9739)
value5 = getPlayerStorageValue(cid,9740)
value6 = getPlayerStorageValue(cid,9741)
value7 = getPlayerStorageValue(cid,9742)
msg = string.lower(msg)
  if value0 == -1 and msgcontains(msg,'addon') or
value0 == -1 and msgcontains(msg,'outfit') or
value0 == -1 and msgcontains(msg,'hat') then
selfSay('Your curiousity amazes me. It\'s just a normal hat. I can make one for you too, if you want?')
talk_state = 1

elseif talk_state == 1 and msgcontains(msg,'no') then
selfSay('No? Okay then.')
talk_state = 0

elseif talk_state == 1 and msgcontains(msg,'yes') then
selfSay('But you understand I cannot do if for free, I suppose. The hat is made out of some ingredients which I must ask you to collect before I can create it. ...')
story = 1
talk_start = os.clock()
talk_story = os.clock()
storyMessage[1] = 'Firstly, we will need a basic hat. In this case, a legion helmet will do perfectly fine. ...'
storyMessage[2] = 'Secondly, I believe I will need 100 chicken feathers... and bring me 50 honeycombs as glue, too. ...'
storyMessage[3] = 'So, have you got that now?'
talk_state = 2

elseif talk_state == 2 and msgcontains(msg,'no') then
selfSay('Well, return when you feel like you can.')
talk_state = 0

elseif talk_state == 2 and msgcontains(msg,'yes') then
selfSay('Fine, then return to me when you have obtained a legion helmet.')
setPlayerStorageValue(cid,9735,1)
setPlayerStorageValue(cid,9736,1)
talk_state = 0

elseif value1 == 1 and msgcontains(msg,'addon') or
value1 == 1 and msgcontains(msg,'outfit') or
value1 == 1 and msgcontains(msg,'legion helmet') or
value1 == 1 and msgcontains(msg,'hat') then
selfSay('Do you have the legion helmet I asked you to obtain?')
talk_state = 3

elseif talk_state == 3 and msgcontains(msg,'no') then
selfSay('Come back with it later, then.')
talk_state = 0

elseif talk_state == 3 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,2480) >= 1 then
selfSay('Good work. Now, the 100 chicken feathers, please.')
setPlayerStorageValue(cid,9736,-1)
setPlayerStorageValue(cid,9737,1)
doPlayerRemoveItem(cid,2480,1)
talk_state = 0
else
talk_state = 0
selfSay('No, you don\'t have it.')
end

elseif value2 == 1 and msgcontains(msg,'addon') or
value2 == 1 and msgcontains(msg,'outfit') or
value2 == 1 and msgcontains(msg,'feather') or
value2 == 1 and msgcontains(msg,'hat') then
selfSay('Have you got the 100 chicken feathers?')
talk_state = 4

elseif talk_state == 4 and msgcontains(msg,'no') then
selfSay('Come back with them later, then.')
talk_state = 0

elseif talk_state == 4 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,5890) >= 100 then
doPlayerRemoveItem(cid,5890,100)
selfSay('Great! Last but not least, the 50 honeycombs, if you don\'t mind.')
setPlayerStorageValue(cid,9737,-1)
setPlayerStorageValue(cid,9738,1)
talk_state = 0
else
talk_state = 0
selfSay('You don\'t have them.')
end

elseif value3 == 1 and msgcontains(msg,'addon') or
value3 == 1 and msgcontains(msg,'outfit') or
value3 == 1 and msgcontains(msg,'honeycomb') or
value3 == 1 and msgcontains(msg,'hat') then
selfSay('So, do you have the 50 honeycombs?')
talk_state = 5

elseif talk_state == 5 and msgcontains(msg,'no') then
selfSay('Come back with them later, then.')
talk_state = 0

elseif talk_state == 5 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,5902) >= 50 then
doPlayerRemoveItem(cid,5902,50)
selfSay('Alright. Then, as I promised, here is your brand new feather hat. Enjoy it.')
setPlayerStorageValue(cid,9738,-1)
setPlayerStorageValue(cid,9739,1)
doPlayerAddOutfit(cid,136,2)
doPlayerAddOutfit(cid,128,2)
doSendMagicEffect(getThingPos(cid),12)
talk_state = 0
else
selfSay('You don\'t have them.')
talk_state = 0
end

elseif value4 == 1 and msgcontains(msg,'addon') or
value4 == 1 and msgcontains(msg,'outfit') or
value4 == 1 and msgcontains(msg,'hat') then
selfSay('I have given you a feather hat, don\'t you remember?')
talk_state = 0

elseif value5 == -1 and msgcontains(msg,'quest') or
value5 == -1 and msgcontains(msg,'mission') then
selfSay('Well, if you really are interested in quests and that kind of stuff, I can gladly allot a mission to you. ...')
story = 4
talk_start = os.clock()
talk_story = os.clock()
storyMessage[4] = 'I have a certain mug, you see, which is unique of its kind here on Flantania Isle. Recently, a pack of evil orcs stole it from me. I need you to locate it in their base in the north-west part of the island. ...'
storyMessage[5] = 'Thereafter, steal it back and bring it to me, and we\'ll see what I can do in return. But I must warn you, you will not be welcome there. Good luck.'
setPlayerStorageValue(cid,9740,1)
setPlayerStorageValue(cid,9741,1)
talk_state = 0


elseif value6 == 1 and msgcontains(msg,'mission') or
value6 == 1 and msgcontains(msg,'mug') or
value6 == 1 and msgcontains(msg,'quest') then
selfSay('Have you located and taken back my unique mug from the orcs?')
talk_state = 6

elseif talk_state == 6 and msgcontains(msg,'no') then
selfSay('Aah, pity.')
talk_state = 0

elseif talk_state == 6 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,3942) >= 1 then
doPlayerRemoveItem(cid,3942,1)
doPlayerAddItem(cid,2456,1)
setPlayerStorageValue(cid,9741,-1)
setPlayerStorageValue(cid,9742,1)
selfSay('Ah, my dear mug. Thank you. And in return, here is an old possession of mine which I believe will come in handy sometimes.')
talk_state = 0
else
selfSay('Sorry, but I can\'t see it. Did you drop it on the way or something?')
talk_state = 0
end
end
return true
end







  
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())