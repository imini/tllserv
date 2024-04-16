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

	value0 = getPlayerStorageValue(cid,9765)
  value1 = getPlayerStorageValue(cid,9766)
  value2 = getPlayerStorageValue(cid,9767)
  value3 = getPlayerStorageValue(cid,9768)
  value4 = getPlayerStorageValue(cid,9769)
  value5 = getPlayerStorageValue(cid,9770)
  value6 = getPlayerStorageValue(cid,9771)
  value7 = getPlayerStorageValue(cid,9772)
  msg = string.lower(msg)

  if value0 == -1 and msgcontains(msg,'addon') or
value0 == -1 and msgcontains(msg,'outfit') then
selfSay('Such an outfit as I have is perhaps not of great value to a person like you, but living in the forest means a quite hard life. Therefore, my clothes gets torn apart quite often. ...')
story = 1
talk_start = os.clock()
talk_story = os.clock()
storyMessage[1] = 'Hm. Why did you ask about it anyway? Is it of interest to you?'
talk_state = 1

elseif talk_state == 1 and msgcontains(msg,'no') then
selfSay('No? Okay then.')
talk_state = 0

elseif talk_state == 1 and msgcontains(msg,'yes') then
selfSay('Would you like me to make you one, perhaps?')
talk_state = 2

elseif talk_state == 2 and msgcontains(msg,'no') then
selfSay('Well, okay then.')
talk_state = 0

elseif talk_state == 2 and msgcontains(msg,'yes') then
selfSay('Very well, but I need material for it, first. Can you bring me some stuff?')
talk_state = 3

elseif talk_state == 3 and msgcontains(msg,'no') then
selfSay('Well, okay then.')
talk_state = 0

elseif talk_state == 3 and msgcontains(msg,'yes') then
selfSay('Good! I need the following material – first, 20 pieces of brown cloth, like the worn and ragged ghoul clothing. ...')
story = 2
talk_start = os.clock()
talk_story = os.clock()
storyMessage[2] = 'Secondly, 50 pieces of minotaur leather. Third, I need bat wings, maybe 10. And 30 heaven blossoms, the flowers elves cultivate. ...'
storyMessage[3] = 'Have you noted down everything and will help me gather the material?'
talk_state = 4

elseif talk_state == 4 and msgcontains(msg,'no') then
selfSay('Well, okay then.')
talk_state = 0

elseif talk_state == 4 and msgcontains(msg,'yes') then
selfSay('Terrific! What are you waiting for?! Start right away to gather 20 pieces of brown cloth and come back once you have them!')
talk_state = 0
setPlayerStorageValue(cid,9765,1)
setPlayerStorageValue(cid,9766,1)

elseif value1 == 1 and msgcontains(msg,'addon') or
value1 == 1 and msgcontains(msg,'outfit') or
value1 == 1 and msgcontains(msg,'cloth') then
selfSay('Ah! Have you brought me 20 pieces of brown cloth?')
talk_state = 5

elseif talk_state == 5 and msgcontains(msg,'no') then
selfSay('Come back with them later, then.')
talk_state = 0

elseif talk_state == 5 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,5913) >= 20 then
selfSay('Yes, yes, that\'s it! Very well, now I need 50 pieces of minotaur leather to continue.')
setPlayerStorageValue(cid,9766,-1)
setPlayerStorageValue(cid,9767,1)
doPlayerRemoveItem(cid,5913,20)
talk_state = 0
else
talk_state = 0
selfSay('No, you don\'t have them.')
end

elseif value2 == 1 and msgcontains(msg,'addon') or
value2 == 1 and msgcontains(msg,'outfit') or
value2 == 1 and msgcontains(msg,'leather') then
selfSay('Were you able to obtain 50 pieces of minotaur leather?')
talk_state = 6

elseif talk_state == 6 and msgcontains(msg,'no') then
selfSay('Come back with them later, then.')
talk_state = 0

elseif talk_state == 6 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,5878) >= 50 then
doPlayerRemoveItem(cid,5878,50)
selfSay('Great! This leather will suffice. Now, please, the 10 bat wings.')
setPlayerStorageValue(cid,9767,-1)
setPlayerStorageValue(cid,9768,1)
talk_state = 0
else
talk_state = 0
selfSay('You don\'t have them.')
end

elseif value3 == 1 and msgcontains(msg,'addon') or
value3 == 1 and msgcontains(msg,'outfit') or
value3 == 1 and msgcontains(msg,'bat wing') then
selfSay('Did you get me the 10 bat wings?')
talk_state = 7

elseif talk_state == 7 and msgcontains(msg,'no') then
selfSay('Come back with them later, then.')
talk_state = 0

elseif talk_state == 7 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,5894) >= 10 then
doPlayerRemoveItem(cid,5894,10)
selfSay('Fine! These bat wings are ugly enough. Now the last thing: Please bring me 30 heaven blossoms to neutralise the ghoulish stench.')
setPlayerStorageValue(cid,9768,-1)
setPlayerStorageValue(cid,9769,1)
talk_state = 0
else
talk_state = 0
selfSay('You don\'t have them.')
end

elseif value4 == 1 and msgcontains(msg,'addon') or
value4 == 1 and msgcontains(msg,'outfit') or
value4 == 1 and msgcontains(msg,'blossom') then
selfSay('Is this the lovely smell of 30 heaven blossoms?')
talk_state = 8

elseif talk_state == 8 and msgcontains(msg,'no') then
selfSay('Come back with them later, then.')
talk_state = 0

elseif talk_state == 8 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,5921) >= 30 then
doPlayerRemoveItem(cid,5921,30)
selfSay('This is it! Here you are, a brand old outfit!')
setPlayerStorageValue(cid,9769,-1)
setPlayerStorageValue(cid,9770,1)
doPlayerAddOutfit(cid,157,0)
doPlayerAddOutfit(cid,153,0)
doSendMagicEffect(getThingPos(cid),13)
talk_state = 0
else
talk_state = 0
selfSay('You don\'t have them.')
end

elseif value5 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 1 or
value5 == 1 and msgcontains(msg,'outfit') and getPlayerSex(cid) == 1 or
value5 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 1 then
selfSay('Haha, that beard is – well, not fake, but there’s a trick behing it. I noticed people tend to be more generous towards a poor gramps. Want to know my trick?')
talk_state = 9

elseif talk_state == 9 and msgcontains(msg,'no') then
selfSay('Fine.')
talk_state = 0

elseif talk_state == 9 and msgcontains(msg,'yes') then
selfSay('I can mix a secret potion which will increase your facial hair growth enormeously. I call it \'Instabeard\'. However, it requires certain ingredients. ...')
story = 4
talk_start = os.clock()
talk_story = os.clock()
storyMessage[4] = 'For the small fee of 20000 gold pieces I will help you mix this potion. Just bring me 100 pieces of yellow cloth and 30 honeycombs, which are necessary to create this potion. ...'
storyMessage[5] = 'Do we have a deal?'
talk_state = 10

elseif talk_state == 10 and msgcontains(msg,'no') then
selfSay('Fine. Then not.')
talk_state = 0

elseif talk_state == 10 and msgcontains(msg,'yes') then
selfSay('Great! Come back to me once you have the 100 pieces of yellow cloth, the 20000 gold coins and 30 honeycombs and I\'ll do my part of the deal.')
setPlayerStorageValue(cid,9770,-1)
setPlayerStorageValue(cid,9771,1)
talk_state = 0

elseif value6 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 1 or
value6 == 1 and msgcontains(msg,'outfit') and getPlayerSex(cid) == 1 or
value6 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 1 then
selfSay('Have you brought me 100 pieces of yellow cloth, 20000 gold coins and 30 honeycombs?')
talk_state = 11

elseif talk_state == 11 and msgcontains(msg,'no') then
selfSay('Return when you have these items.')
talk_state = 0

elseif talk_state == 11 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,2148) >= 20000 and getPlayerItemCount(cid,5914) >= 100 and getPlayerItemCount(cid,5902) >= 30 or
getPlayerItemCount(cid,2152) >= 200 and getPlayerItemCount(cid,5914) >= 100 and getPlayerItemCount(cid,5902) >= 30 or
getPlayerItemCount(cid,2160) >= 2 and getPlayerItemCount(cid,5914) >= 100 and getPlayerItemCount(cid,5902) >= 30 then
selfSay('Ahh! Very good. Here is the potion.')
doPlayerAddOutfit(cid,153,1)
setPlayerStorageValue(cid,9771,-1)
setPlayerStorageValue(cid,9772,1)
doPlayerRemoveItem(cid,5914,100)
doPlayerRemoveItem(cid,5902,30)
doPlayerRemoveMoney(cid,20000)
doSendMagicEffect(getThingPos(cid),12)
talk_state = 0
else
selfSay('You don\'t have these items, I\'m afraid.')
talk_state = 0
end

elseif value7 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 1 or
value7 == 1 and msgcontains(msg,'outfit') and getPlayerSex(cid) == 1 then
selfSay('You have already finished my missions.')
talk_state = 0


elseif value5 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 0 or
value5 == 1 and msgcontains(msg,'outfit') and getPlayerSex(cid) == 0 or
value5 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 0 then
selfSay('Haha, that beard is – well, not fake, but there’s a trick behing it. I noticed people tend to be more generous towards a poor gramps. Want to know my trick?')
talk_state = 12

elseif talk_state == 12 and msgcontains(msg,'no') then
selfSay('Fine.')
talk_state = 0

elseif talk_state == 12 and msgcontains(msg,'yes') then
selfSay('I can mix a secret potion which will increase your facial hair growth enormeously. I call it \'Instabeard\'. However, I fear it works only for men. ...')
story = 6
talk_start = os.clock()
talk_story = os.clock()
storyMessage[6] = 'Even if it worked on girls, I\'d rather not be responsible for you ruining your pretty face. I have an idea though. If you help me brew one of these potions, I sell something nice to you. ...'
storyMessage[7] = 'I still have a pretty gypsy dress and a pearl necklace somewhere, which you could wear instead of this ragged skirt. For the small fee of 20000 gold pieces, it\'d be yours. ...'
storyMessage[8] = 'You only have to bring me 100 pieces of yellow cloth, 20000 gold coins and 30 honeycombs, so I can brew the potion. Do we have a deal?'
talk_state = 13

elseif talk_state == 13 and msgcontains(msg,'no') then
selfSay('Fine. Then not.')
talk_state = 0

elseif talk_state == 13 and msgcontains(msg,'yes') then
selfSay('Great! Come back to me once you have the 100 pieces of yellow cloth, the 20000 gold coins and 30 honeycombs and I\'ll do my part of the deal.')
setPlayerStorageValue(cid,9770,-1)
setPlayerStorageValue(cid,9771,1)
talk_state = 0

elseif value6 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 0 or
value6 == 1 and msgcontains(msg,'outfit') and getPlayerSex(cid) == 0 or
value6 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 0 then
selfSay('Have you brought me 100 pieces of yellow cloth, 20000 gold coins and 30 honeycombs?')
talk_state = 14

elseif talk_state == 14 and msgcontains(msg,'no') then
selfSay('Return when you have these items.')
talk_state = 0

elseif talk_state == 14 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,2148) >= 20000 and getPlayerItemCount(cid,5914) >= 100 and getPlayerItemCount(cid,5902) >= 30 or
getPlayerItemCount(cid,2152) >= 200 and getPlayerItemCount(cid,5914) >= 100 and getPlayerItemCount(cid,5902) >= 30 or
getPlayerItemCount(cid,2160) >= 2 and getPlayerItemCount(cid,5914) >= 100 and getPlayerItemCount(cid,5902) >= 30 then
selfSay('I almost forgot! Okay, okay... here is your promised dress. I\'m sure it will look so much better on you than on me- I mean, my, err, sister..')
doPlayerAddOutfit(cid,157,2)
setPlayerStorageValue(cid,9771,-1)
setPlayerStorageValue(cid,9772,1)
doPlayerRemoveItem(cid,5914,100)
doPlayerRemoveItem(cid,5902,30)
doPlayerRemoveMoney(cid,20000)
doSendMagicEffect(getThingPos(cid),12)
talk_state = 0
else
selfSay('You don\'t have these items, I\'m afraid.')
talk_state = 0
end

elseif value7 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 0 or
value7 == 1 and msgcontains(msg,'outfit') and getPlayerSex(cid) == 0 then
selfSay('You have already finished my missions.')
talk_state = 0
end
return true
end
  
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())