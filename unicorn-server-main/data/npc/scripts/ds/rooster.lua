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

value1 = getPlayerStorageValue(cid,9962)
value2 = getPlayerStorageValue(cid,9963)
value3 = getPlayerStorageValue(cid,9964)
value4 = getPlayerStorageValue(cid,9965)
value5 = getPlayerStorageValue(cid,9887)
value6 = getPlayerStorageValue(cid,9706)
value6 = getPlayerStorageValue(cid,9892)
value7 = getPlayerStorageValue(cid,9710)
sex = getPlayerSex(cid)
msg = string.lower(msg)

if msgcontains(msg,'addon') or
msgcontains(msg,'outfit') then
selfSay('Currently I am offering accessories for the nobleman - and, of course, noblewoman - outfit. Would you like to hear more about our offer?')
talk_state = 1

elseif talk_state == 1 and sex == 1 and msgcontains(msg,'yes') then
selfSay('Especially for you, we are offering a fashionable top hat and a fancy coat like the one Kalvin Clen wears. Which one are you interested in?')
talk_state = 0

elseif talk_state == 1 and msgcontains(msg,'no') then
selfSay('No, it\'s only for the wealthy people, of course.')
elseif talk_state == 2 and msgcontains(msg,'no') then
selfSay('No, it\'s only for the wealthy people, of course.')

elseif value1 == -1 and sex == 1 and msgcontains(msg,'hat') then
selfSay('This accessory requires a small fee of 150000 gold pieces. Are you interested in purchasing this accessory?')
talk_state = 2

elseif value1 == 1 and sex == 1 and msgcontains(msg,'hat') then
selfSay('Now I remember. You have already purchased this accessory. I have so many customers I forget about them sometimes.')
talk_state = 0

elseif talk_state == 2 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,2148) >= 150000 or getPlayerItemCount(cid,2152) >= 1500 or getPlayerItemCount(cid,2160) >= 15 then
selfSay('Fine then. Here is your new top hat. Enjoy it.')
doPlayerAddOutfit(cid,132,2)
doSendMagicEffect(getThingPos(cid),12)
doPlayerRemoveMoney(cid,150000)
setPlayerStorageValue(cid,9962,1)
talk_state = 0
else
talk_state = 0
selfSay('Apparently, you cannot afford such accessorys. Bring the money, or there will be no deal.')
end
elseif talk_state == 3 and msgcontains(msg,'no') then
selfSay('No, it\'s only for the wealthy people, of course.')

elseif value2 == -1 and sex == 1 and msgcontains(msg,'coat') then
selfSay('This accessory requires a small fee of 150000 gold pieces. Are you interested in purchasing this accessory?')
talk_state = 5

elseif value2 == 1 and sex == 1 and msgcontains(msg,'coat') then
selfSay('Now I remember. You have already purchased this accessory. I have so many customers I forget about them sometimes.')
talk_state = 0

elseif talk_state == 5 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,2148) >= 150000 or getPlayerItemCount(cid,2152) >= 1500 or getPlayerItemCount(cid,2160) >= 15 then
selfSay('Fine then. Here is your new fashion coat. Enjoy it.')
doPlayerAddOutfit(cid,132,1)
doSendMagicEffect(getThingPos(cid),12)
setPlayerStorageValue(cid,9963,1)
doPlayerRemoveMoney(cid,150000)
talk_state = 0
else
talk_state = 0
selfSay('Apparently, you cannot afford such accessorys. Bring the money, or there will be no deal.')
end
elseif talk_state == 1 and sex == 0 and msgcontains(msg,'yes') then
selfSay('Especially for you, mylady, we are offering a pretty hat and a beautiful dress. Which one are you interested in?')
talk_state = 0

elseif talk_state == 1 and msgcontains(msg,'no') then
selfSay('No, it\'s only for the wealthy people, of course.')
elseif talk_state == 2 and msgcontains(msg,'no') then
selfSay('No, it\'s only for the wealthy people, of course.')

elseif value3 == -1 and sex == 0 and msgcontains(msg,'hat') then
selfSay('This accessory requires a small fee of 150000 gold pieces. Are you interested in purchasing this accessory?')
talk_state = 3

elseif value3 == 1 and sex == 0 and msgcontains(msg,'hat') then
selfSay('Now I remember. You have already purchased this accessory. I have so many customers I forget about them sometimes.')
talk_state = 0

elseif talk_state == 3 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,2148) >= 150000 or getPlayerItemCount(cid,2152) >= 1500 or getPlayerItemCount(cid,2160) >= 15 then
selfSay('Fine then. Here is your new pretty hat. Enjoy it.')
doPlayerAddOutfit(cid,140,2)
doSendMagicEffect(getThingPos(cid),12)
setPlayerStorageValue(cid,9964,1)
doPlayerRemoveMoney(cid,150000)
talk_state = 0
else
talk_state = 0
selfSay('Apparently, you cannot afford such accessorys. Bring the money, or there will be no deal.')
end
elseif talk_state == 3 and msgcontains(msg,'no') then
selfSay('No, it\'s only for the wealthy people, of course.')
elseif talk_state == 4 and msgcontains(msg,'no') then
selfSay('No, it\'s only for the wealthy people, of course.')

elseif value4 == -1 and sex == 0 and msgcontains(msg,'dress') and value7 == -1 and value6 == -1 and talk_state ~= 7 then
selfSay('This accessory requires a small fee of 150000 gold pieces. Are you interested in purchasing this accessory?')
talk_state = 4

elseif value4 == 1 and sex == 0 and msgcontains(msg,'dress') and value7 == -1 and value6 == -1 and talk_state ~= 7 then
selfSay('Now I remember. You have already purchased this accessory. I have so many customers I forget about them sometimes.')
talk_state = 0

elseif talk_state == 4 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,2148) >= 150000 or getPlayerItemCount(cid,2152) >= 1500 or getPlayerItemCount(cid,2160) >= 15 then
selfSay('Fine then. Here is your new beautiful dress. Enjoy it.')
doPlayerAddOutfit(cid,140,1)
doSendMagicEffect(getThingPos(cid),12)
setPlayerStorageValue(cid,9965,1)
doPlayerRemoveMoney(cid,150000)
talk_state = 0
else
selfSay('Apparently, you cannot afford such accessorys. Bring the money, or there will be no deal.')
talk_state = 0
end

elseif value5 == 1 and msgcontains(msg,'uniform') then
selfSay('A new uniform for the post officers? I am sorry but my dog ate the last dress pattern we used. You need to supply us with a new dress pattern.')
talk_state = 7

elseif talk_state == 7 and msgcontains(msg,'dress pattern') then
selfSay('It was... wonderous beyond wildest imaginations! I have no clue where Freya Mailner got it from. Better ask her.')
setPlayerStorageValue(cid,9887,-1)
setPlayerStorageValue(cid,9706,1)
talk_state = 0

elseif value5 == 1 and msgcontains(msg,'uniform') then
selfSay('Ask Freya for the new dress pattern. I need it.')
talk_state = 0

elseif value6 == 1 and msgcontains(msg,'dress pattern') then
selfSay('By the gods of fashion! Didn\'t it do that I fed the last dress pattern to my poor dog? Will this mocking of all which is taste and fashion never stop?? Ok, ok, you will get those ugly, stinking uniforms and now get lost, fashion terrorist.')
setPlayerStorageValue(cid,9892,-1)
setPlayerStorageValue(cid,9710,1)
talk_state = 0

elseif value7 == 1 and msgcontains(msg,'dress pattern') then
selfSay('Don\'t talk to me about no dress patterns anymore, fashion terrorist. Go to your stupid Freya. I\'ll send them to her.')

end
return true
end
-----------------------------------------------------------------------------------------------------
function returnVials(cid, message, keywords, parameters, node)
	if(npcHandler.focus ~= cid) then
		return false
	end
	
	local amount = removePlayerItemsWithCharges(cid, parameters.itemid, parameters.charges)
	if(amount <= 0) then
		npcHandler:say('You do not have any.')
	else
		local price = amount*parameters.cost
		if(doPlayerAddMoney(cid, price) == LUA_NO_ERROR) then
			npcHandler:say('Here are your reward of ' .. price .. ' gold coins. It was a pleasure doing business with you.')
		else
			error('[Error] returnVials:', 'Could not give ' .. price .. ' gold coins to player ' .. getPlayerName(cid))
		end
	end
	npcHandler:resetNpc()
	return true
end
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'mana fluid', 'manafluid'}, 	2006, 55, 	7,	'mana fluid')
shopModule:addBuyableItem({'life fluid', 'lifefluid'}, 		2006, 25, 	10, 	'life fluid')
shopModule:addBuyableItem({'heavy magic missile rune', 'heavy magic missile rune'}, 	2311, 125, 	5,	'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball rune', 'great fireball rune'}, 		2304, 180, 	2, 	'great fireball rune')
shopModule:addBuyableItem({'ultimate healing rune', 'ultimate healing rune'}, 		2273, 175, 	1, 	'ultimate healing rune')
shopModule:addBuyableItem({'sudden death rune', 'sudden death rune'}, 		2268, 325, 	1, 	'sudden death rune')
shopModule:addBuyableItem({'destroy field rune', 'destroy field rune'}, 		2261, 85, 	3, 	'destroy field rune')
shopModule:addBuyableItem({'firebomb rune', 'firebomb rune'}, 		2305, 235, 	2, 	'firebomb rune')
shopModule:addBuyableItem({'antidote rune', 'antidote rune'}, 		2266, 65, 	1, 	'antidote rune')
shopModule:addBuyableItem({'intense healing rune', 'intense healing rune'}, 		2265, 95, 	1, 	'intense healing rune')
shopModule:addBuyableItem({'poisonbomb rune', 'poisonbomb rune'}, 		2286, 170, 	2, 	'poisonbomb rune')
shopModule:addBuyableItem({'magicwall rune', 'magic wall rune'}, 		2293, 350, 	3, 	'magic wall rune')
shopModule:addBuyableItem({'soulfire rune', 'soulfire rune'}, 		2308, 210, 	2, 	'soulfire rune')
shopModule:addBuyableItem({'wand of vortex', 'wand of vortex'}, 		2190, 500, 		'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'wand of dragonbreath'}, 		2191, 1000, 		'wand of dragonbreath')
shopModule:addBuyableItem({'wand of plague', 'wand of plague'}, 		2188, 5000, 		'wand of plague')
shopModule:addBuyableItem({'wand of cosmic energy', 'wand of cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'wand of inferno'}, 2187,  15000, 'wand of inferno')
shopModule:addBuyableItem({'snakebite rod', 'snakebite rod'}, 2182, 500, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight rod'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'volcanic rod', 'volcanic rod'}, 2185, 5000, 'volcanic rod')
shopModule:addBuyableItem({'quagmire rod', 'quagmire rod'}, 2181, 10000, 'quagmire rod')
shopModule:addBuyableItem({'tempest rod', 'tempest rod'}, 2183, 15000, 'tempest rod')
shopModule:addBuyableItem({'blank', ' blank rune'}, 			2260, 10, 		'blank rune')
local node = keywordHandler:addKeyword({'flask'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will pay you 5 gold for every empty vial. Ok?'})
	node:addChildKeyword({'yes'}, returnVials, {itemid = 2006, charges = 0, cost = 5})
	node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Alright then.'})
local node = keywordHandler:addKeyword({'vial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will pay you 5 gold for every empty vial. Ok?'})
	node:addChildKeyword({'yes'}, returnVials, {itemid = 2006, charges = 0, cost = 5})
	node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Alright then.'})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
