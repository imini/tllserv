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
	story = 0
	elseif story == 2 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0
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

value0 = getPlayerStorageValue(cid,4348)
value1 = getPlayerStorageValue(cid,4349)
value2 = getPlayerStorageValue(cid,4350)
msg = string.lower(msg)

			if msgcontains(msg, 'the wisdom of solitude') or msgcontains(msg, 'wisdom of solitude')then
			selfSay('The Wisdom of Solitude is a blessing, which will lower your death penalty by one percent. I can bless you with it for 10000 coins. Are you willing to do that?')
			talk_state = 5


		elseif talk_state == 5 then
		if msgcontains(msg, 'yes') then
		if getPlayerBlessing(cid, talk_state) then
		selfSay('A god has already blessed you with this blessing.')
		else
		if doPlayerRemoveMoney(cid, 10000) == 1 then
		doPlayerAddBlessing(cid, talk_state)
		selfSay('You have been blessed by one of the five gods!')
		else
		selfSay('You don\'t have enough money.')
				end
			end
		end
		
		elseif msgcontains(msg,'spell') and value0 == -1 then
		selfSay('I teach certain warriors, mages and paladins one spell each, if I can see the right spirit in them. Each vocation has its own spell, but remember, I can only teach them to promoted people.')
		setPlayerStorageValue(cid,4348,1)
		
		elseif msgcontains(msg,'spell') and value0 == 1 and value1 == 1 then
		selfSay('You have already bought this spell.')
		
		elseif msgcontains(msg,'spell') and value0 == 1 and getPlayerVocation(cid) < 5 then
		selfSay('I only teach people with promotion spells.')
		
		elseif getPlayerVocation(cid) == 8 and value0 == 1 and value1 == -1 and msgcontains(msg,'spell') then
		selfSay('For the knight, yes, I have the powerful spell called ‘Challenge’. It allows the spellcaster to anytime, from the monsters around him, perhaps attacking his friends, draw the attention away from them. ...')
		story = 1
	  talk_start = os.clock()
    talk_story = os.clock()
    storyMessage[1] = 'Therefor, it makes the spell an important and heroic addition in the knights quite limited spellbook. Would you want to buy it, incase your knight and promoted that is, for 2000 coins?'
    talk_state = 10
    
    elseif getPlayerVocation(cid) == 7 and value0 == 1 and value1 == -1 and msgcontains(msg,'spell') then
		selfSay('The paladins... such nimble and noble humans. I know a piece of ancient magic that any paladin would find useful – the power bolt spell. ...')
		story = 2
	  talk_start = os.clock()
    talk_story = os.clock()
    storyMessage[2] = 'It creates a bolt which powers are not even close to matchable from ordinary bolts. I could teach you it, if you’re a paladin of course, and if your promoted too, for 2000 coins.'
    talk_state = 11
    
    elseif getPlayerVocation(cid) == 6 and value0 == 1 and value1 == -1 and msgcontains(msg,'spell') then
		selfSay('Ah... the mystical druids. They’ve intertwined their destinies with natures, and see, what they will earn from it: a spell, which in front of the casters feet, creates an impenetrable wall of branches. ...')
		story = 3
	  talk_start = os.clock()
    talk_story = os.clock()
    storyMessage[3] = 'I can sell it for 2000 coins, if you’re druid and promoted, of course. Are you interested?'
    talk_state = 12
    
    elseif getPlayerVocation(cid) == 5 and value0 == 1 and value1 == -1 and msgcontains(msg,'spell') then
		selfSay('Fighting techniques has always interested the sorcerers. However, I know an ancient spell which might come in handy sometimes. It enchants an ordinary staff to great powers, for a certain amount of time. ...')
		story = 4
	  talk_start = os.clock()
    talk_story = os.clock()
    storyMessage[4] = 'I can teach you it, if you’re a sorcerer and if you’re promoted. Are you interested in it, if I say it’s for 2000 coins?'
    talk_state = 13
    
    elseif talk_state == 10 and msgcontains(msg,'no') then
    selfSay('Very well.')
    talk_state = 0
    elseif talk_state == 11 and msgcontains(msg,'no') then
    selfSay('Very well.')
    talk_state = 0
    elseif talk_state == 12 and msgcontains(msg,'no') then
    selfSay('Very well.')
    talk_state = 0
    elseif talk_state == 13 and msgcontains(msg,'no') then
    selfSay('Very well.')
    talk_state = 0
    
    elseif talk_state == 10 and msgcontains(msg,'yes') then
    if getPlayerItemCount(cid,2148) >= 2000 or
    getPlayerItemCount(cid,2152) >= 20 or
    getPlayerItemCount(cid,2160) >= 1 then
    doPlayerRemoveMoney(cid,2000)
    doSendMagicEffect(getThingPos(cid),13)
    setPlayerStorageValue(cid,4349,1)
    playerLearnInstantSpell(cid, 'challenge')
    selfSay('Excellent. Then, here you go. Enjoy its powers.')
    talk_state = 0
    else
    selfSay('You have not go enough money for this, my child.')
    talk_state = 0
    end
    
    elseif talk_state == 11 and msgcontains(msg,'yes') then
    if getPlayerItemCount(cid,2148) >= 2000 or
    getPlayerItemCount(cid,2152) >= 20 or
    getPlayerItemCount(cid,2160) >= 1 then
    doPlayerRemoveMoney(cid,2000)
    doSendMagicEffect(getThingPos(cid),13)
    setPlayerStorageValue(cid,4349,1)
    playerLearnInstantSpell(cid, 'conjure power bolt')
    selfSay('Excellent. Then, here you go. Enjoy its powers.')
    talk_state = 0
    else
    selfSay('You have not go enough money for this, my child.')
    talk_state = 0
    end
    
    elseif talk_state == 12 and msgcontains(msg,'yes') then
    if getPlayerItemCount(cid,2148) >= 2000 or
    getPlayerItemCount(cid,2152) >= 20 or
    getPlayerItemCount(cid,2160) >= 1 then
    doPlayerRemoveMoney(cid,2000)
    doSendMagicEffect(getThingPos(cid),13)
    setPlayerStorageValue(cid,4349,1)
    playerLearnInstantSpell(cid, 'wild growth')
    selfSay('Excellent. Then, here you go. Enjoy its powers.')
    talk_state = 0
    else
    selfSay('You have not go enough money for this, my child.')
    talk_state = 0
    end
    
    elseif talk_state == 13 and msgcontains(msg,'yes') then
    if getPlayerItemCount(cid,2148) >= 2000 or
    getPlayerItemCount(cid,2152) >= 20 or
    getPlayerItemCount(cid,2160) >= 1 then
    doPlayerRemoveMoney(cid,2000)
    doSendMagicEffect(getThingPos(cid),13)
    setPlayerStorageValue(cid,4349,1)
    playerLearnInstantSpell(cid, 'enchant staff')
    selfSay('Excellent. Then, here you go. Enjoy its powers.')
    talk_state = 0
    else
    selfSay('You have not go enough money for this, my child.')
    talk_state = 0
    end
    
    
	end
return true
end

--------------------------------- Travel ---------------------------------





local travelNode = keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can send you back to Agatone freely if you want.'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=470, y=705, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Maybe later.'})

local travelNode = keywordHandler:addKeyword({'back'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can send you back to Agatone freely if you want.'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=470, y=705, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then not.'})

local travelNode = keywordHandler:addKeyword({'agatone'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can send you back to Agatone freely if you want.'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=470, y=705, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Maybe next time.'})

---------------------------------



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())