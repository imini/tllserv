local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink()
    end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
	value1 = getPlayerStorageValue(cid,5055)
	value2 = getPlayerStorageValue(cid,8003)
	value3 = getPlayerStorageValue(cid,8001)
value = getPlayerStorageValue(cid,9882)
value4 = getPlayerStorageValue(cid,9898)
value5 = getPlayerStorageValue(cid,4302)
value20 = getPlayerStorageValue(cid,4327)
value21 = getPlayerStorageValue(cid,4328)

value6 = getPlayerStorageValue(cid,9507)
value7 = getPlayerStorageValue(cid,9508)
value8 = getPlayerStorageValue(cid,9509)
value9 = getPlayerStorageValue(cid,9510)
msg = string.lower(msg)
if value20 == 1 and value21 == -1 and msgcontains(msg,'tower of madness') then
selfSay('I remember that place. I could see it when I was fishing in the discovery bay. I was struck with curiosity so I began study its history and I found out it was quite covered with secrets.')
talk_state = 21

elseif talk_state == 21 and msgcontains(msg,'history') then
selfSay('Well, as far as I know it was originally built as a sacrifical altar for the necromant king Foshnar.')
talk_state = 22

elseif talk_state == 22 and msgcontains(msg,'foshnar') then
selfSay('Yes, and not only did he sacrifice the dead, but also living humans. It was a dark time, when he ruled, I\'ve learnt. His apprentice was the one who built the tower.')
talk_state = 23

elseif talk_state == 23 and msgcontains(msg,'apprentice') then
selfSay('When Foshnar finally was defeated his only apprentice fled to the tower he earlier built, where he could seek immortality in solitude.')
talk_state = 24

elseif talk_state == 24 and msgcontains(msg,'immortality') then
selfSay('I have not found out much more about it, but you could always ask the sheriff in Celeres. He had quite alot trouble with the uprising undead hordes constantly attacking Celeres back then.')
talk_state = 0
setPlayerStorageValue(cid,4328,1)
elseif value21 == 1 and msgcontains(msg,'tower of madness') then
selfSay('Go to the sheriff of Celeres to learn more about the dark times back then. I have told you everything I know already.')
talk_state = 0


elseif msgcontains(msg,'mission') and value6 == -1 then
selfSay('Would you like to embark on an extremely dangerous mission, dear ' .. getPlayerName(cid) .. '?')
talk_state = 55

elseif talk_state == 55 and msgcontains(msg,'no') then
selfSay('Okay.')
talk_state = 0

elseif talk_state == 55 and msgcontains(msg,'yes') then
selfSay('Well, perhaps it\'s not that dangerous, but still... uh, so: I need you to bring a certain potion to my mate Freddy. He lives on a farm in the far east. Will you do this for me?')
talk_state = 56

elseif talk_state == 56 and msgcontains(msg,'no') then
selfSay('Okay.')
talk_state = 0

elseif talk_state == 56 and msgcontains(msg,'yes') then
selfSay('Good. Take this potion and be careful not to drop it.')
doPlayerAddItem(cid,6106,1)
setPlayerStorageValue(cid,9507,1)
setPlayerStorageValue(cid,9508,1)
talk_state = 0

elseif msgcontains(msg,'mission') and value7 == 1 or
msgcontains(msg,'flask') and value7 == 1 or
msgcontains(msg,'potion') and value7 == 1 then
selfSay('As I told you, I wanted you to bring this potion to Freddy the farmer.')
talk_state = 0

elseif msgcontains(msg,'mission') and value8 == 1 then
selfSay('Ah, have you got something in return?')
talk_state = 57

elseif talk_state == 57 and msgcontains(msg,'no') then
selfSay('Okay.')
talk_state = 0

elseif talk_state == 57 and msgcontains(msg,'yes') then
selfSay('Interesting, what might that be? May I have it?')
talk_state = 58

elseif talk_state == 58 and msgcontains(msg,'no') then
selfSay('Okay.')
talk_state = 0

elseif talk_state == 58 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,6108) >= 1 then
doPlayerRemoveItem(cid,6108,1)
setPlayerStorageValue(cid,9509,-1)
setPlayerStorageValue(cid,5055,1)
setPlayerStorageValue(cid,9510,1)
selfSay('Ah, thank you. I bet you want something for all this trouble me and Freddy has caused you. If you want to, you can enter my backyard. You might find something fun to do there.')
talk_state = 0
else
selfSay('No, you don\'t have it, I\'m afraid.')
talk_state = 0
end

elseif value9 == 1 and msgcontains(msg,'mission') then
selfSay('You have already completed my mission, ' .. getPlayerName(cid) .. '.')



elseif getPlayerStorageValue(cid,9543) == 1 and msgcontains(msg,'book') then
selfSay('A fishing cookbook?')
talk_state = 10

elseif talk_state == 10 and msgcontains(msg,'yes') then
selfSay('I do have one, yes. Do you want to buy it?')
talk_state = 11

elseif talk_state == 10 and msgcontains(msg,'no') then
selfSay('Hehe, but you did say it...')
talk_state = 0

elseif talk_state == 11 and msgcontains(msg,'yes') then
selfSay('Shall we say a fair fee of 120 coins?')
talk_state = 12

elseif talk_state == 11 and msgcontains(msg,'no') then
selfSay('Then why did you ask about it?')
talk_state = 0

elseif talk_state == 12 and msgcontains(msg,'yes') then
selfSay('Good. Do you have the money with you?')
talk_state = 13

elseif talk_state == 12 and msgcontains(msg,'no') then
selfSay('You are a cheap little guy.')
talk_state = 0

elseif talk_state == 13 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,2148) >= 120 or
getPlayerItemCount(cid,2152) >= 2 or
getPlayerItemCount(cid,2160) >= 1 then
doPlayerAddItem(cid,2217,1)
doPlayerRemoveMoney(cid,120)
selfSay('Here you go.')
talk_state = 0
else
selfSay('You don\'t have enough money.')
talk_state = 0
end

elseif talk_state == 13 and msgcontains(msg,'no') then
selfSay('Come back when you have them, then.')
talk_state = 0
		
elseif msgcontains(msg,'hat') and value == 1 and value4 == -1 and talk_state ~= 5 and talk_state ~= 6 and talk_state ~= 7 and talk_state ~= 8 and talk_state ~= 9 then
selfSay('What? My hat?? There\'s... nothing special about it! uh, I don\'t even have a hat by the way.')
talk_state = 5

elseif msgcontains(msg,'hat') and talk_state == 5 then
selfSay('Stop bugging me about that hat, do you listen?')
talk_state = 6

elseif msgcontains(msg,'hat') and talk_state == 6 then
selfSay('Hey! Don\'t touch that hat! Leave it alone!!! Don\'t do this!!!!')
talk_state = 7

elseif msgcontains(msg,'hat') and talk_state == 7 then
selfSay('Noooooo! Argh, ok, ok, I guess I can\'t deny it anymore, I am David Brassacres, the magnificent, so what do you want?')
talk_state = 8

elseif msgcontains(msg,'bill') and talk_state == 8 then
selfSay('A bill? Oh boy, so you are delivering another bill to poor me?')
talk_state = 9

elseif msgcontains(msg,'no') and talk_state == 9 then
selfSay('Thank god...')
talk_state = 0

elseif msgcontains(msg,'yes') and talk_state == 9 then
if getPlayerItemCount(cid,2329) >= 1 then
selfSay('Ok, ok, I\'ll take it. I guess I have no other choice anyways. And now leave me alone in my misery please.')
doPlayerRemoveItem(cid,2329,1)
setPlayerStorageValue(cid,9898,1)
talk_state = 0
else
selfSay('Lucky me then, you didn\'t bring any bill.')
talk_state = 0
end

elseif value4 == 1 and msgcontains(msg,'bill') then
selfSay('You\'ve already given me a bill.')
talk_state = 0


end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())