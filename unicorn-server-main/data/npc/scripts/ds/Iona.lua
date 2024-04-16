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
story = 0
talk_state = 5

elseif story == 3 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0
talk_state = 8

elseif story == 4 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0
talk_state = 0


end
end
return true
end
npcHandler:setCallback(CALLBACK_ONTHINK, callbackOnThink)

function creatureSayCallback(cid, type, msg)
  if(npcHandler.focus ~= cid) then
		return false
end

msg = string.lower(msg)

if msgcontains(msg,'lance') or msgcontains(msg,'tusir') then
selfSay('Those books are full of blasphemy, but nevertheless quite interesting.')
talk_state = 1

elseif talk_state == 1 then
if msgcontains(msg,'blasphemy') then
selfSay('The author, Lance, claims to have faced the devil. It is blasphemy, in my opinion.')
talk_state = 2
else
talk_state = 0
end

elseif talk_state == 2 then
if msgcontains(msg,'devil') then
selfSay('It is very unlikely that Lance tells the truth, but he has a sense for writing and that I enjoy.')
talk_state = 3
else
talk_state = 0
end

elseif talk_state == 3 then
if msgcontains(msg,'truth') then
selfSay('Truth is but what we make of it. How would one know if something was true, unless someone or something else proved it?')
else
talk_state = 0
end

elseif msgcontains(msg,'quest') then
selfSay('For eternity people have sought treasures, and the term quest has become a somewhat naggered expression, which truly means greed.')

elseif msgcontains(msg,'celeres') then
selfSay('Cities are places for people who do not know their right orientation in life. That makes me an ideal citizen.')

elseif msgcontains(msg,'casteldine') then
selfSay('Cities are places for people who do not know their right orientation in life. That makes me an ideal citizen.')

elseif msgcontains(msg,'adanac') then
selfSay('Cities are places for people who do not know their right orientation in life. That makes me an ideal citizen.')

elseif msgcontains(msg,'king arturo') then
selfSay('He is foolish enough to take the responsibility of ruling this entire continent. He can not handle it.')

elseif msgcontains(msg,'job') then
selfSay('Working is not necessary aslong as you do not need money.')

elseif msgcontains(msg,'sheriff') or
msgcontains(msg,'stephanie') or
msgcontains(msg,'steve') or
msgcontains(msg,'johan') or
msgcontains(msg,'rooster') or
msgcontains(msg,'sigiric') or
msgcontains(msg,'reinold') or
msgcontains(msg,'creyo') or
msgcontains(msg,'caroline') or
msgcontains(msg,'andrew') then
selfSay('I do not speak about other people, for gossip is a blasphemy.')

elseif msgcontains(msg,'god') then
selfSay('Gods play the role as guides in life, but in death? I believe you must treat them with respect, for else we will regret it when we have passed away.')

elseif msgcontains(msg,'death') then
selfSay('Death is freedom, aslong as you have treated your gods with the respect they deserve.')

elseif msgcontains(msg,'life') then
selfSay('During life one must not choose the wrong path, for life does not last for an eternity, as death does.')

elseif msgcontains(msg,'name') then
selfSay('I am Iona.')

elseif msgcontains(msg,'iona') then
selfSay('How can I help you, ' .. getPlayerName(cid) .. '.')

elseif msgcontains(msg,'dark magic') then
selfSay('The sheriff of Celeres prohibited the subject, and that he did well. For what a blashemy dark magic is.')

elseif msgcontains(msg,'lithaton') then
selfSay('A land of confusion.')

elseif msgcontains(msg,'offer') then
selfSay('Make an offer to the gods.')

elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9550) == -1 then
selfSay('Do tell me, dear ' .. getPlayerName(cid) .. ', whether you would be interested in helping me, or not.')
talk_state = 4

elseif talk_state == 4 then
if msgcontains(msg,'yes') then
selfSay('How enlighting. You need not worry, dear, for I will give you the payment you deserve if you fulfill what I will ask. ...')
story = 1
talk_state = 0
talk_start = os.clock()
talk_story = os.clock()
storyMessage[1] = 'It is not a big favour that I need from you, but nonetheless quite dangerous. I need you to prepare yourself well, child. ...'
storyMessage[2] = 'Bring to me the scale of a dragon king, and I shall not only give you reward for your struggle, but also show you a secret not very well known these days. Do you understand?'
else
selfSay('That I take as a no.')
talk_state = 0
end

elseif talk_state == 5 then
if msgcontains(msg,'yes') then
if getPlayerLevel(cid) < 23 then
selfSay('Oh, forgive me, darling. I did not see how young you were. Please return when you have grown a little stronger.')
else
selfSay('Good. I will be waiting for you.')
setPlayerStorageValue(cid,9550,1)
end
else
selfSay('I believe this means that you do not understand.')
talk_state = 0
end

elseif getPlayerStorageValue(cid,9550) == 1 and msgcontains(msg,'mission') or 
getPlayerStorageValue(cid,9550) == 1 and msgcontains(msg,'scale') then
selfSay('Have you brought a scale from a dragon king?')
talk_state = 6

elseif talk_state == 6 then
if msgcontains(msg,'yes') then
if getPlayerItemCount(cid,5882) >= 1 then
selfSay('Thank you. Now, here is your reward. Now, do you also want to know what I needed this scale for?')
doPlayerAddItem(cid,2147,5)
setPlayerStorageValue(cid,9550,2)
talk_state = 7
else
selfSay('It appears to me that you lack the very scale I requested, ' .. getPlayerName(cid) .. '.')
end
else
selfSay('That I take as a no.')
talk_state = 0
end

elseif getPlayerStorageValue(cid,9550) == 2 and msgcontains(msg,'mission') or
getPlayerStorageValue(cid,9550) == 2 and msgcontains(msg,'scale') or
getPlayerStorageValue(cid,9550) == 2 and msgcontains(msg,'need') then
selfSay('Do you wish to know what I needed the scale for?')
talk_state = 7

elseif talk_state == 7 then
if msgcontains(msg,'yes') then
selfSay('Forgotten is the power that the dragons and their lords actually wields. I have not forgotten, though, the secrets. ...')
story = 3
talk_state = 0
talk_start = os.clock()
talk_story = os.clock()
storyMessage[3] = 'Tell me, dear ' .. getPlayerName(cid) .. '. Have you forgotten?'
else
selfSay('Fine, then the secret will stay with me.')
talk_state = 0
end

elseif talk_state == 8 then
if msgcontains(msg,'yes') then
selfSay('I will then remind you. The dragons and their scales are imbued with unspeakable magical power. Defensive power. ...')
story = 4
talk_state = 0
talk_start = os.clock()
talk_story = os.clock()
storyMessage[4] = 'It is said that if you combine inferior material cloths with the scales of a dragon lord, and of course with the right magical spell, the cloth will absorb the power of the scale.'
setPlayerStorageValue(cid,9550,3)
else
selfSay('Then there is no need for me to remind you, I suppose.')
talk_state = 0
end

elseif getPlayerStorageValue(cid,9550) >= 3 and msgcontains(msg,'cloth') then 
npcHandler:say('You will need a green piece of cloth, and then together with a dragon lord scale and the right magic, you will be able to enchant it with ancient magical powers.')

elseif getPlayerStorageValue(cid,9550) == 3 and msgcontains(msg,'spell') or
getPlayerStorageValue(cid,9550) == 3 and msgcontains(msg,'magic') then
selfSay('I can teach you the magic craved for when doing this magical transformation. I will even do it for free. Shall I?')
talk_state = 9

elseif talk_state == 9 then
if msgcontains(msg,'yes') then
selfSay('Then recieve my blessing, child, and learn the magical spellwords ashariu. Have the green cloth and a red dragon scale in your backpack when performing the magical transformation.')
doSendMagicEffect(getThingPos(cid),14)
setPlayerStorageValue(cid,9550,4)
talk_state = 0
else
selfSay('Fine.')
talk_state = 0
end

elseif getPlayerStorageValue(cid,9550) > 3 and msgcontains(msg,'spell') or
getPlayerStorageValue(cid,9550) > 3 and msgcontains(msg,'magic') then
selfSay('Use the magical spellwords ashariu when having a green cloth and a red dragon scale in your backpack. Remember, you will only have power to perform the ritual once.')

elseif getPlayerStorageValue(cid,9550) > 3 and msgcontains(msg,'red tunic') then
selfSay('It is imbued with magical protective abilities, you see. By wearing it, you decrease the damage wreacked upon you when hit by fire, energy or poison.')

end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
