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
        npcHandler.focus = cid

            story = 0

		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_ONTHINK, callbackOnThink)
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end

	value0 = getPlayerStorageValue(cid,7518)
	value1 = getPlayerStorageValue(cid,7516)
	value2 = getPlayerStorageValue(cid,7517)
  msg = string.lower(msg)
if msgcontains(msg, 'raffie') then
		selfSay('The flipping dog is completely insane. I bet if I stand still for too long the crazy maniaac will bite my leg off and chew on it for the next couple of weeks, instead of the delicious food I\'m serving him. But truth to be told, I like him. I need someone to bark at when I\'m mad... I suppose he thinks the same of me. Well, at least he\'s barking at me. ...')
			story = 1
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[1] = 'Oh, did I mention that the reason why half of my arm is gone? No, I know. It was not really Raffie who bit it off, but his even more mad cousin! I kept the arm of course, it’s in the locker. But I think it’s more of a rotten stump by now. It smells quite badly – I almost vomited. But Raffie wanted to eat it. ...'
			storyMessage[2] = 'That actually explains why there’s two bitmarks on it... gah, I’m gonna kill that dog – or well, I changed my mind. He’ll kill me first, probably. His teeth can cut through anything – diamond, perhaps, I’ve never tried. But if you bring me one we could do a scientific experiment.'
			talk_state = 0

	elseif value0 == -1 and msgcontains(msg,'addon') or
	value0 == -1 and msgcontains(msg,'outfit') then
	selfSay('Would you like to wear bear paws as I do? No problems, really, just bring me 50 bear paws and 50 wolf paws and I’ll fit them on.')
	talk_state = 0
	
	elseif msgcontains(msg,'bear paws') or
	msgcontains(msg,'wolf paws') then
	selfSay('Have you brought me 50 wolf paws and 50 bear paws as I asked you to? ')
	talk_state = 40

	elseif talk_state == 40 and msgcontains(msg,'no') then
	selfSay('Come back when you have, then.')
	talk_state = 0

	
  elseif talk_state == 40 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5897) >= 50 and getPlayerItemCount(cid,5896) >= 50 then
	selfSay('Excellent! Like promised, here are you bear paws. And you better use them nicely and often, because I have spent many minutes talking to you.')
	setPlayerStorageValue(cid,7517,1)
	doPlayerRemoveItem(cid,5897,50)
	doPlayerRemoveItem(cid,5896,50)
                doPlayerAddOutfit(cid, 144, 1)
                doPlayerAddOutfit(cid, 148, 1)
	talk_state = 0
	else
	selfSay('You don\'t have those items.')
	talk_state = 0
	end

	elseif value2 == 1 and msgcontains(msg,'outfit') or
	value2 == 1 and msgcontains(msg,'addon') then
	selfSay('You have already finished the mission. How exceptionally greedy can one single person actually become? You\'re getting annoying.')



	elseif msgcontains(msg, 'blessing') then
		selfSay('I KNEW IT! Why? Why must everyone ask for blessings? Why can\’t just people be normal and talk about U-Pads and stuff? Ah, this stuff is really driving me insane. Are you really, really, really, really, completely, really serious about that blessing stuff?')
				talk_state = 2

		elseif talk_state == 2 then
			if msgcontains(msg, 'yes') then
				selfSay('Very well then, there\’s 5 of them. Oh, and before you ask, I only handle one... the Embrace of The Lost Lands. The other ones are the Spark of the Phoenix, the Wisdom of Solitude, The Spiritual Shielding and the Fire of the Suns.')
				talk_state = 0

			end

---------------------------------

		elseif msgcontains(msg, 'embrace of the lost lands') then
			selfSay('I can grant you this blessing, but only for 10000 gold. It will reduce your death penalty by one percent. Are you interested in that, ' .. getPlayerName(cid) .. '? I mean, you should be, you\'ve kinda wasted all my time, haven\'t you?')
			talk_state = 3


		elseif talk_state == 3 then
		if msgcontains(msg, 'yes') then
		if getPlayerBlessing(cid, talk_state) then
		selfSay('A god has already blessed you with this blessing.')
			talk_state = 0
		else
		if doPlayerRemoveMoney(cid, 10000) == 1 then
		doPlayerAddBlessing(cid, talk_state)
		selfSay('You have been blessed by one of the five godforsaken gods. Can you stop whining about this crap now? It\'s getting slightly annoying... really, it does.')
			talk_state = 0
		else
		selfSay('You don\'t have enough money. Bah!')
			talk_state = 0
		end

	end
end
---------------------------------

	elseif msgcontains(msg, 'diamond') then
		selfSay('You\'ve got a diamond for me... eh, I mean, for Raffie?')
				talk_state = 5

		elseif talk_state == 5 then
			if msgcontains(msg, 'yes') then
			if getPlayerItemCount(cid,2145)  >= 1 then
			doPlayerTakeItem(cid,2145,1)
				selfSay('Cool. Thank you.')
				talk_state = 0
			else
				selfSay('You don\'t have it!')
				talk_state = 0

			end

		end

		

			end
			return true
	end


local node1 = keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright. I have a mission for you. It’s very, very lethal. I hope you’re really willing to do this... are you?'})
	node1:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'Go get me peanuts and chilisauce. And soda. And when you’re at it, bring me a paper. Preferably today’s. And well, yeh, why not? Catch a fameboy on the way – I need to kill some time sometimes. Catchy... get it? Kill some time, sometimes! Haha, I’m just dying of laughter... ain’t I a genious of humour? Hilarious!'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Allright then. Come back when you are ready.', reset = true})


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())