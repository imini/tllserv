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
function callbackOnThink(cid)
	if (os.clock() - talk_story) > 13 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            talk_state = 18
	story = 0
	elseif story == 2 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            talk_state = 19
	story = 0
	elseif story == 3 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            talk_state = 20
	story = 0
	elseif story == 4 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            talk_state = 21
	story = 0
	elseif story == 5 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            talk_state = 39
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

if msgcontains(msg,'riddle') and getPlayerStorageValue(cid,9544) == -1 then
selfSay('So you wish me to ask you a riddle?')
talk_state = 1

elseif talk_state == 1 and msgcontains(msg,'no') then
selfSay('I see.')
talk_state = 0

elseif talk_state == 1 and math.random(1,6) == 1 and msgcontains(msg,'yes') then
selfSay('I am always moving, I never stop. I tell you something, but I never talk.')
talk_state = 2

elseif talk_state == 2 then
if msgcontains(msg,'clock') or msgcontains(msg,'watch') then
selfSay('Impressive. You have surprised me, that was not expected, indeed. Now, can I help you somehow?')
setPlayerStorageValue(cid,9544,1)
talk_state = 0
else
selfSay('Untrue.')
talk_state = 0
end

elseif talk_state == 1 and math.random(1,6) == 2 and msgcontains(msg,'yes') then
selfSay('I am always hungry, I must always be fed. The finger I lick, will soon turn red.')
talk_state = 3

elseif talk_state == 3 then
if msgcontains(msg,'fire') then
selfSay('Impressive. You have surprised me, that was not expected, indeed. Now, can I help you somehow?')
setPlayerStorageValue(cid,9544,1)
talk_state = 0
else
selfSay('Untrue.')
talk_state = 0
end

elseif talk_state == 1 and math.random(1,6) == 3 and msgcontains(msg,'yes') then
selfSay('Glittering points that downward thrust. Sparkling spears that never rust.')
talk_state = 4

elseif talk_state == 4 then
if msgcontains(msg,'icicle') then
selfSay('Impressive. You have surprised me, that was not expected, indeed. Now, can I help you somehow?')
setPlayerStorageValue(cid,9544,1)
talk_state = 0
else
selfSay('Untrue.')
talk_state = 0
end

elseif talk_state == 1 and math.random(1,6) == 4 and msgcontains(msg,'yes') then
selfSay('I have forests without trees, and rivers without water. I have mountains without rocks, and cities without houses.')
talk_state = 5

elseif talk_state == 5 then
if msgcontains(msg,'map') then
selfSay('Impressive. You have surprised me, that was not expected, indeed. Now, can I help you somehow?')
setPlayerStorageValue(cid,9544,1)
talk_state = 0
else
selfSay('Untrue.')
talk_state = 0
end

elseif talk_state == 1 and math.random(1,6) == 5 and msgcontains(msg,'yes') then
selfSay('No legs have I to dance, no lungs have I to breathe, no life have I to live or die, but yet I do all three.')
talk_state = 6

elseif talk_state == 6 then
if msgcontains(msg,'fire') then
selfSay('Impressive. You have surprised me, that was not expected, indeed. Now, can I help you somehow?')
setPlayerStorageValue(cid,9544,1)
talk_state = 0
else
selfSay('Untrue.')
talk_state = 0
end

elseif talk_state == 1 and math.random(1,6) == 6 and msgcontains(msg,'yes') then
selfSay('What is greater than god, more evil than sainten? Poor people have it, rich people dont. and if you eat it or drink it you will die.')
talk_state = 7

elseif talk_state == 7 then
if msgcontains(msg,'nothing') then
selfSay('Impressive. You have surprised me, that was not expected, indeed. Now, can I help you somehow?')
setPlayerStorageValue(cid,9544,1)
talk_state = 0
else
selfSay('Untrue.')
talk_state = 0
end

elseif getPlayerStorageValue(cid,9544) == 1 and msgcontains(msg,'riddle') and getPlayerSex(cid) == 1 then
selfSay('You are a man of wonder, ' .. getPlayerName(cid) .. '. Now, how can I help you?')
talk_state = 0

elseif getPlayerStorageValue(cid,9544) == 1 and msgcontains(msg,'riddle') and getPlayerSex(cid) == 0 then
selfSay('You are a woman of wonder, ' .. getPlayerName(cid) .. '. Now, how can I help you?')
talk_state = 0

elseif talk_state == 3 and msgcontains(msg,'no') then
selfSay('I can.')
talk_state = 0

elseif talk_state == 3 and msgcontains(msg,'yes') then
selfSay('So I can help you?')
talk_state = 8

elseif talk_state == 8 and msgcontains(msg,'no') then
selfSay('I can.')
talk_state = 0

elseif talk_state == 8 and msgcontains(msg,'yes') then
selfSay('With what, is the question.')
talk_state = 0

--Man talking

elseif getPlayerStorageValue(cid,9544) == 1 and msgcontains(msg,'offer') and getPlayerSex(cid) == 1 then
selfSay('For a man as you I can offer excitement!')
talk_state = 0

elseif getPlayerStorageValue(cid,9544) == 1 and msgcontains(msg,'excitement') and getPlayerSex(cid) == 1 then
selfSay('Are you a man, or am I doing a very big mistake here?')
talk_state = 9

elseif talk_state == 9 and msgcontains(msg,'no') then
selfSay('So I am doing a mistake?')
talk_state = 10

elseif talk_state == 9 and msgcontains(msg,'yes') then
selfSay('So I am doing a mistake?')
talk_state = 10

elseif talk_state == 10 and msgcontains(msg,'no') then
selfSay('Do you even know yourself?')
talk_state = 11

elseif talk_state == 10 and msgcontains(msg,'yes') then
selfSay('How... pitiful.')
talk_state = 0

elseif talk_state == 11 and msgcontains(msg,'no') then
selfSay('How... pitiful.')
talk_state = 0

elseif talk_state == 11 and msgcontains(msg,'yes') then
selfSay('So, you are a man after all?')
talk_state = 12

elseif talk_state == 12 and msgcontains(msg,'no') then
selfSay('How... pitiful.')
talk_state = 0

elseif talk_state == 12 and msgcontains(msg,'yes') then
selfSay('Oh, I was quite confused there for a while, myself. Glad we solved it out though.')
setPlayerStorageValue(cid,9544,2)
talk_state = 0
	
--Woman talking
	
elseif getPlayerStorageValue(cid,9544) == 1 and msgcontains(msg,'offer') and getPlayerSex(cid) == 0 then
selfSay('For a beauty as you I can only offer excitement! ... oh, no, not the way you think. Other... excitement.')
talk_state = 13

elseif getPlayerStorageValue(cid,9544) == 1 and msgcontains(msg,'excitement') and getPlayerSex(cid) == 0 then
selfSay('Are you a woman, or is there something hiding down beneath?')
talk_state = 14

elseif talk_state == 14 and msgcontains(msg,'no') then
selfSay('So there is something hiding down beneath?')
talk_state = 15

elseif talk_state == 14 and msgcontains(msg,'yes') then
selfSay('So there is something hiding down beneath?')
talk_state = 15

elseif talk_state == 15 and msgcontains(msg,'no') then
selfSay('Do you even know yourself?')
talk_state = 16

elseif talk_state == 15 and msgcontains(msg,'yes') then
selfSay('How... pitiful.')
talk_state = 0

elseif talk_state == 16 and msgcontains(msg,'no') then
selfSay('How... pitiful.')
talk_state = 0

elseif talk_state == 16 and msgcontains(msg,'yes') then
selfSay('So, you are a woman after all?')
talk_state = 17

elseif talk_state == 17 and msgcontains(msg,'no') then
selfSay('How... pitiful.')
talk_state = 0

elseif talk_state == 17 and msgcontains(msg,'yes') then
selfSay('Oh, I was quite confused there for a while, myself. Glad we solved it out though.')
setPlayerStorageValue(cid,9544,2)
talk_state = 0

--Excitement poetry, woman

elseif getPlayerStorageValue(cid,9544) == 2 and msgcontains(msg,'excitement') and getPlayerSex(cid) == 0 then
selfSay('Oh, I almost forgot. I was a little confused when you started to speak about that gender stuff. Well, as we have that sorted out, for you, mylady, I have excitement in the shape of poverty. ...')
story = 1
talk_start = os.clock()
talk_story = os.clock()
storyMessage[1] = 'Oh, what am I saying? Of course I do not mean poverty, but poetry! Do you wish to listen to some?'

elseif talk_state == 18 and msgcontains(msg,'yes') then
selfSay('It cannot be seen, cannot be felt, cannot be heard, cannot be smelt. It lies behind stars and under hills, and empty holes it fills. It comes first and follows after, ends life, kills laughter. ...')
story = 3
talk_start = os.clock()
talk_story = os.clock()
storyMessage[3] = 'Do you like it?'

elseif talk_state == 18 and msgcontains(msg,'no') then
selfSay('How... pitiful.')
talk_state = 0

elseif talk_state == 20 and msgcontains(msg,'no') then
selfSay('How... pitiful.')
talk_state = 0

elseif talk_state == 20 and msgcontains(msg,'yes') then
selfSay('Yes, me too. It does have a meaning, too.')
setPlayerStorageValue(cid,9544,3)
talk_state = 0

--Excitement poetry, man

elseif getPlayerStorageValue(cid,9544) == 2 and msgcontains(msg,'excitement') and getPlayerSex(cid) == 1 then
selfSay('Oh, I almost forgot. I was a little confused when you started to speak about that gender stuff. Well, as we have that sorted out, for you, mylord, I have excitement in the shape of poverty. ...')
story = 2
talk_start = os.clock()
talk_story = os.clock()
storyMessage[2] = 'Oh, what am I saying? Of course I do not mean poverty, but poetry! Do you wish to listen to some?'

elseif talk_state == 19 and msgcontains(msg,'yes') then
selfSay('It cannot be seen, cannot be felt, cannot be heard, cannot be smelt. It lies behind stars and under hills, and empty holes it fills. It comes first and follows after, ends life, kills laughter. ...')
story = 4
talk_start = os.clock()
talk_story = os.clock()
storyMessage[4] = 'Do you like it?'

elseif talk_state == 19 and msgcontains(msg,'no') then
selfSay('How... pitiful.')
talk_state = 0

elseif talk_state == 21 and msgcontains(msg,'no') then
selfSay('How... pitiful.')
talk_state = 0

elseif talk_state == 21 and msgcontains(msg,'yes') then
selfSay('Yes, me too. It does have a meaning, too.')
setPlayerStorageValue(cid,9544,3)
talk_state = 0

--Excusing

elseif msgcontains(msg,'meaning') and getPlayerStorageValue(cid,9544) == 3 then
selfSay('Nah, you will have to find that out by yourself.')
talk_state = 0

elseif msgcontains(msg,'darkness') and getPlayerStorageValue(cid,9544) == 3 then
selfSay('Is that your final answer?')
talk_state = 22

elseif talk_state == 22 and msgcontains(msg,'no') then
selfSay('You need more time, I see.')
talk_state = 23

elseif talk_state == 22 and msgcontains(msg,'yes') then
selfSay('Really, really?')
talk_state = 23

elseif talk_state == 23 and msgcontains(msg,'no') then
selfSay('You need more time, I see.')
talk_state = 0

elseif talk_state == 23 and msgcontains(msg,'yes') then
selfSay('Really, really, really?')
talk_state = 24

elseif talk_state == 24 and msgcontains(msg,'no') then
selfSay('You need more time, I see.')
talk_state = 0

elseif talk_state == 24 and msgcontains(msg,'yes') then
selfSay('Really, really, really, really?')
talk_state = 25

elseif talk_state == 25 and msgcontains(msg,'no') then
selfSay('You need more time, I see.')
talk_state = 0

elseif talk_state == 25 and msgcontains(msg,'yes') then
selfSay('Are minotaurs orange?')
talk_state = 26

elseif talk_state == 26 and msgcontains(msg,'no') then
selfSay('Oh, you did not fell for that one. Dang! Well, where were I? I kinda lost track of myself.')
setPlayerStorageValue(cid,9544,4)
talk_state = 0

elseif talk_state == 26 and msgcontains(msg,'yes') then
selfSay('GOTCHA!')
talk_state = 0

elseif msgcontains(msg,'darkness') and getPlayerStorageValue(cid,9544) == 4 then
selfSay('Oh, that is right. You found my little hint in the poetry. How interesting. Are you a smart person, ' .. getPlayerName(cid) .. '?')
talk_state = 27

elseif talk_state == 27 and msgcontains(msg,'no') then
selfSay('I can see so.')
talk_state = 0

elseif talk_state == 27 and msgcontains(msg,'yes') then
selfSay('Good, for I am too. I am just a little too enthuiastic sometimes... I kinda, get ahead of myself, it seems. Anyways, do you like me despite that?')
talk_state = 28

elseif talk_state == 28 and msgcontains(msg,'no') then
selfSay('Truly?')
talk_state = 29

elseif talk_state == 28 and msgcontains(msg,'yes') then
selfSay('Yes, that pleases me, but you are not very interesting as you always do as I wish.')
talk_state = 0

elseif talk_state == 29 and msgcontains(msg,'no') then
selfSay('Oh, I thought you was serious. God, my heart is pounding now.')
talk_state = 29

elseif talk_state == 29 and msgcontains(msg,'yes') then
selfSay('That made me sad, ' .. getPlayerName(cid) .. '. Are you gonna say sorry?')
talk_state = 30

elseif talk_state == 30 and msgcontains(msg,'no') then
selfSay('Okay, then...')
talk_state = 0

elseif talk_state == 30 and msgcontains(msg,'yes') then
selfSay('Go ahead, then.')
talk_state = 31

elseif talk_state == 31 then
if msgcontains(msg,'sorry') then
selfSay('Uhuhm... sorry, I did not hear you very well. Can you say it again?')
talk_state = 32
else
talk_state = 0
selfSay('That is not what I wanted to hear.')
end

elseif talk_state == 32 then
if msgcontains(msg,'sorry') then
selfSay('Sorry, I blinked. What did you say?')
talk_state = 33
else
talk_state = 0
selfSay('That is not what I wanted to hear.')
end

elseif talk_state == 33 then
if msgcontains(msg,'sorry') then
selfSay('Did you say something? I think the wind blew past me right at the wrong moment.')
talk_state = 34
else
talk_state = 0
selfSay('That is not what I wanted to hear.')
end

elseif talk_state == 34 then
if msgcontains(msg,'sorry') then
selfSay('Speak up, youngster.')
talk_state = 35
else
talk_state = 0
selfSay('That is not what I wanted to hear.')
end

elseif talk_state == 35 then
if msgcontains(msg,'sorry') then
selfSay('If you say sorry again, I will kill you.')
talk_state = 36
else
talk_state = 0
selfSay('That is not what I wanted to hear.')
end

elseif talk_state == 36 then
if msgcontains(msg,'sorry') then
selfSay('As you wish.')
doSendMagicEffect(getThingPos(cid),4)
doSendAnimatedText(getThingPos(cid),190,180)
doCreatureAddHealth(cid,-190)
talk_state = 0
else
talk_state = 37
selfSay('You are attentive. How interesting. Do you like riddles?')
end

elseif talk_state == 37 and msgcontains(msg,'no') then
selfSay('I do, you do not.')
talk_state = 0

elseif talk_state == 37 and msgcontains(msg,'yes') then
selfSay('Good. Want to hear another?')
talk_state = 38

elseif talk_state == 38 and msgcontains(msg,'no') then
selfSay('I would if I were in your position. Luckily, I am not. But I still want myself to ask you. So it gets quite complicated sometimes.')
talk_state = 0

elseif talk_state == 38 and msgcontains(msg,'yes') then
selfSay('What is life? What is death?')
story = 5
talk_start = os.clock()
talk_story = os.clock()
storyMessage[5] = 'I am just kidding. Want a good hint for how you can please me?'

elseif talk_state == 39 and msgcontains(msg,'no') then
selfSay('Time wasted.')
talk_state = 0

elseif talk_state == 39 and msgcontains(msg,'yes') then
selfSay('I like strawberries.')
setPlayerStorageValue(cid,9544,5)
talk_state = 0

elseif getPlayerStorageValue(cid,9544) == 5 and msgcontains(msg,'strawberr') then
if getPlayerItemCount(cid,2680) >= 1 then
selfSay('Thank you. Bring me some more, when you have time. Preferably more than one.')
talk_state = 0
doPlayerRemoveItem(cid,2680,1)
setPlayerStorageValue(cid,9544,6)
else
talk_state = 0
selfSay('That is not a strawberry. God know what that is.')
end

elseif getPlayerStorageValue(cid,9544) == 6 and msgcontains(msg,'strawberr') then
if getPlayerItemCount(cid,2680) >= 5 then
doPlayerRemoveItem(cid,2680,5)
npcHandler:say('Thank you. They are perfect. Perhaps, together with a plate, I could actually eat them properly.')
talk_state = 0
setPlayerStorageValue(cid,9544,7)
else
talk_state = 0
selfSay('I want strawberries! MANY!')
end

elseif getPlayerStorageValue(cid,9544) == 7 and msgcontains(msg,'plate') then
if getPlayerItemCount(cid,2035) >= 1 then
selfSay('Do you call that a plate?')
talk_state = 40
else
talk_state = 0
selfSay('I think you dropped it.')
end

elseif talk_state == 40 and msgcontains(msg,'no') then
selfSay('No. Bring me a noggin copper shield. That is a real plate, I say.')
setPlayerStorageValue(cid,9544,8)
talk_state = 0

elseif talk_state == 40 and msgcontains(msg,'yes') and getPlayerSex(cid) == 1 then
selfSay('Then you are a madman, ' .. getPlayerName(cid) .. '!')
talk_state = 0

elseif talk_state == 40 and msgcontains(msg,'yes') and getPlayerSex(cid) == 0 then
selfSay('Then you are a madman... woman, ' .. getPlayerName(cid) .. '!')
talk_state = 0
 
elseif getPlayerStorageValue(cid,9544) == 8 and msgcontains(msg,'plate') or
getPlayerStorageValue(cid,9544) == 8 and msgcontains(msg,'copper') then
if getPlayerItemCount(cid,2530) >= 1 then
doPlayerRemoveItem(cid,2530,1)
npcHandler:say('Terrific. I like that. You know what?')
talk_state = 41
setPlayerStorageValue(cid,9544,8)
else
talk_state = 0
selfSay('I think you dropped it.')
end

elseif talk_state == 41 and msgcontains(msg,'no') then
selfSay('Of course you do not! How stupid of you! Well, are you up for some running?')
talk_state = 42

elseif talk_state == 41 and msgcontains(msg,'yes') then
selfSay('Good, then I see no reason to waste my vocal cord.')
talk_state = 0

elseif talk_state == 42 and msgcontains(msg,'no') then
selfSay('You just broke my heart.')
talk_state = 0

elseif talk_state == 42 and msgcontains(msg,'yes') then
selfSay('You see, when I eat I usually wear one of those life rings to make things effecient. Get me one.')
setPlayerStorageValue(cid,9544,9)
talk_state = 0

elseif getPlayerStorageValue(cid,9544) == 9 and msgcontains(msg,'life ring') then
if getPlayerItemCount(cid,2168) >= 1 then
doPlayerRemoveItem(cid,2168,1)
npcHandler:say('Thanks. Now I can eat. I can give you something awesome if you bring me a life crystal.')
talk_state = 0
setPlayerStorageValue(cid,9544,10)
else
talk_state = 0
selfSay('I think you dropped the life ring.')
end

elseif getPlayerStorageValue(cid,9544) == 10 and msgcontains(msg,'life crystal') then
if getPlayerItemCount(cid,2177) >= 1 then
doPlayerRemoveItem(cid,2177,1)
doPlayerAddItem(cid,2168,20)
npcHandler:say('Thanks. You can have the life ring back, since I mistakly confused it with a ring of healing.')
talk_state = 0
setPlayerStorageValue(cid,9544,11)
else
talk_state = 0
selfSay('I think you dropped the life ring.')
end

elseif getPlayerStorageValue(cid,9544) == 11 and msgcontains(msg,'life crystal') then
if getPlayerItemCount(cid,2177) >= 1 then
doPlayerRemoveItem(cid,2177,1)
doPlayerAddItem(cid,2168,20)
npcHandler:say('Thanks. Here is another one of those stupid life rings.')
talk_state = 0
setPlayerStorageValue(cid,9544,12)
else
talk_state = 0
selfSay('I think you dropped the life ring.')
end

elseif getPlayerStorageValue(cid,9544) == 12 and msgcontains(msg,'life crystal') then
if getPlayerItemCount(cid,2177) >= 1 then
doPlayerRemoveItem(cid,2177,1)
doPlayerAddItem(cid,2168,20)
npcHandler:say('Thanks. I have many rings, just keep on trading.')
talk_state = 0
setPlayerStorageValue(cid,9544,13)
else
talk_state = 0
selfSay('I think you dropped the life ring.')
end

elseif getPlayerStorageValue(cid,9544) == 13 and msgcontains(msg,'life crystal') then
if getPlayerItemCount(cid,2177) >= 1 then
doPlayerRemoveItem(cid,2177,1)
doPlayerAddItem(cid,2168,20)
npcHandler:say('Thanks. Here is another life ring.')
talk_state = 0
else
talk_state = 0
selfSay('I think you dropped the life ring.')
end

elseif getPlayerStorageValue(cid,9544) > 10 and msgcontains(msg,'ring of healing') then
selfSay('Do you wish to sell a ring of healing for 1400 gold coins to me?')
talk_state = 43

elseif talk_state == 43 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,2214) >= 1 then
doPlayerRemoveItem(cid,2214,1)
doPlayerAddItem(cid,2152,14)
npcHandler:say('Thank you.')
talk_state = 0
else
selfSay('You did probably drop it on the way here.')
talk_state = 0
end

elseif talk_state == 43 and msgcontains(msg,'no') then
selfSay('You just broke my heart.')
talk_state = 0

elseif getPlayerStorageValue(cid,9544) > 10 and getPlayerStorageValue(cid,9545) == -1 and msgcontains(msg,'offer') then
selfSay('Now that I daresay I know you quite well, I wanted to tell you that I am capable of healing you anytime. I will only require a one time fee on 600 gold. Is that a deal?')
talk_state = 44

elseif talk_state == 44 and msgcontains(msg,'no') then
selfSay('Fine, you stingy fellow.')
talk_state = 0

elseif talk_state == 44 and msgcontains(msg,'yes') then
selfSay('Great, do you have the cash with you?')
talk_state = 45

elseif talk_state == 45 and msgcontains(msg,'no') then
selfSay('Fine, you stingy fellow.')
talk_state = 0

elseif talk_state == 45 and msgcontains(msg,'yes') then
if doPlayerRemoveMoney(cid,600) then
selfSay('Good. Ask me for healing when you are injured then.')
setPlayerStorageValue(cid,9545,1)
talk_state = 0
else
selfSay('Did you perhaps forget the money? Hehe.')
talk_state = 0
end

elseif getPlayerStorageValue(cid,9545) == 1 and msgcontains(msg,'healing') then
if getPlayerLevel(cid) > 30 then
if getCreatureHealth(cid) < getCreatureMaxHealth(cid) then
selfSay('You are not wounded at all.')
talk_state = 0
else
selfSay('You are officially healed, then.')
doSendMagicEffect(getThingPos(cid),12)
doCreatureAddHealth(cid,1000)
talk_state = 0
end
else
selfSay('You are a little too weak to recieve such... intense... magical cure. So, grow up.')
talk_state = 0
end

end
return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
