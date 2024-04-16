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
	
	value0 = getPlayerStorageValue(cid,9968)
	value1 = getPlayerStorageValue(cid,9966)
	value2 = getPlayerStorageValue(cid,9967)
	value3 = getPlayerStorageValue(cid,9969)
	value4 = getPlayerStorageValue(cid,9970)
	value5 = getPlayerStorageValue(cid,9971)
	value6 = getPlayerStorageValue(cid,9877)
	value7 = getPlayerStorageValue(cid,9471)
	voc = getPlayerVocation(cid)
	msg = string.lower(msg)
	
	if value0 == -1 and msgcontains(msg,'addon') or
	value0 == -1 and msgcontains(msg,'outfit') then
	selfSay('This skull shows that your magical power is nothing to underestimate. Only the ones who has sacrificed greatly to show their power will be allowed to wear it. Are you willing to make your sacrifices?')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('It doesn\'t surprise me you are not very keen on displaying your powers.')
	talk_state = 0
	
  elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('It will be a hard task which requires many sacrifices. Do you still want to proceed?')
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('It doesn\'t surprise me you are not very keen on displaying your powers.')
	talk_state = 0
	
  elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Good decision. Your first sacrifice will be a medusa shield. Bring it to me and do give it happily.')
		setPlayerStorageValue(cid,9968,1)
	setPlayerStorageValue(cid,9966,1)
	talk_state = 0
	
	elseif value1 == 1 and msgcontains(msg,'addon') or
	value1 == 1 and msgcontains(msg,'medusa shield') or
	value1 == 1 and msgcontains(msg,'outfit') then
	selfSay('Is it true you wish to sacrifice the medusa shield?')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Come back when you have, then.')
	talk_state = 0
	
  elseif talk_state == 3 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,2536) >= 1 then
	selfSay('Good. I accept your sacrifice. The second sacrifice I require from you is a dragon scale mail. This is to show that your powers exceeds even the ones of a dragon lord.')
	setPlayerStorageValue(cid,9966,-1)
	setPlayerStorageValue(cid,9967,1)
	doPlayerRemoveItem(cid,2536,1)
	talk_state = 0
	else
	selfSay('To become a true mark of power you cannot lie.')
	talk_state = 0
	end
	
	elseif value2 == 1 and msgcontains(msg,'addon') or
	value2 == 1 and msgcontains(msg,'dragon scale mail') or
	value2 == 1 and msgcontains(msg,'outfit') then
	selfSay('Is it true you wish to sacrifice a dragon scale mail to me?')
	talk_state = 4
	
	elseif talk_state == 4 and msgcontains(msg,'no') then
	selfSay('Come back when you have, then.')
	talk_state = 0
	
  elseif talk_state == 4 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,2492) >= 1 then
	selfSay('Good. Again, I accept your sacrifice. The third sacrifice I require from you are crown legs. Bring them to me and do give them happily.')
	setPlayerStorageValue(cid,9967,-1)
	setPlayerStorageValue(cid,9969,1)
	doPlayerRemoveItem(cid,2492,1)
	talk_state = 0
	else
	selfSay('To become a true mark of power you cannot lie.')
	talk_state = 0
	end
	
	elseif value3 == 1 and msgcontains(msg,'addon') or
	value3 == 1 and msgcontains(msg,'crown legs') or
	value3 == 1 and msgcontains(msg,'outfit') then
	selfSay('Is it true you wish to sacrifice crown legs to me?')
	talk_state = 5
	
	elseif talk_state == 5 and msgcontains(msg,'no') then
	selfSay('Come back when you have, then.')
	talk_state = 0
	
  elseif talk_state == 5 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,2488) >= 1 then
	selfSay('Very well. Once again I accept this sacrifice. Now, I want you to bring me a ring of the sky. This is your last sacrifice, but presumably also the toughest. Bring it to me as soon as you can.')
	setPlayerStorageValue(cid,9969,-1)
	setPlayerStorageValue(cid,9970,1)
	doPlayerRemoveItem(cid,2488,1)
	talk_state = 0
	else
	selfSay('To become a true mark of power you cannot lie.')
	talk_state = 0
	end
	
	elseif value4 == 1 and msgcontains(msg,'addon') or
	value4 == 1 and msgcontains(msg,'ring of the') or
	value4 == 1 and msgcontains(msg,'outfit') then
	selfSay('Is it true that you wish to sacrifice a ring of the sky to me?')
	talk_state = 6
	
	elseif talk_state == 6 and msgcontains(msg,'no') then
	selfSay('Come back when you have, then.')
	talk_state = 0
	
  elseif talk_state == 6 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,2123) >= 1 then
	selfSay('Good. I accept your sacrifice. You have proven that you are a truly strong one whose powers exceeds even the one of a warlock and that you do not hesitate to sacrifice worldly goods. Thus, I will reward you with this headgear.')
	doPlayerAddOutfit(cid,149,2)
	doPlayerAddOutfit(cid,145,2)
	setPlayerStorageValue(cid,9970,-1)
	setPlayerStorageValue(cid,9971,1)
	doPlayerRemoveItem(cid,2123,1)
	talk_state = 0
	else
	selfSay('To become a true mark of power you cannot lie.')
	talk_state = 0
	end
	
	elseif value5 == 1 and msgcontains(msg,'outfit') or
	value5 == 1 and msgcontains(msg,'addon') then
	selfSay('You have already finished the mission I gave you and you have also recieved an addon as a reward. I suggest you to seek the Queen of the Banshees if you are interested in another addon.')

  elseif value6 == 1 and msgcontains(msg,'stake') then
  selfSay('I don\'t need a bunch of other fools to bless a stake. Instead, I\'m perfectly capable of doing it alone. Do you want me to prove it?')
  talk_state = 7
  
  elseif talk_state == 7 and msgcontains(msg,'no') then
  selfSay('I take that as you believe me then.')
  talk_state = 0
  
  elseif talk_state == 7 and msgcontains(msg,'yes') then
 if getPlayerItemCount(cid,5941) >= 1 then
 npcHandler:say('So, prayer... blabla, nonsense. Here you go. As you see, my magical powers are unlimited.')
 doPlayerRemoveItem(cid,5941,1)
 doPlayerAddItem(cid,5942,1)
 talk_state = 0
 else
 npcHandler:say('I cannot produce a blessed wooden stake from thin air. Bring a stake, fool.')
 talk_state = 0
 end

 elseif value7 == -1 and msgcontains(msg,'wand of vortex') and voc == 1 then
 npcHandler:say('Well, you\'re a sorcerer, and that means you may have a wand of vortex for free. Do you want it now?')
 talk_state = 8
 
 elseif talk_state == 8 and msgcontains(msg,'no') then
 npcHandler:say('Now you know the offer at least.')
 talk_state = 0
 
 elseif talk_state == 8 and msgcontains(msg,'yes') then
 setPlayerStorageValue(cid,9471,1)
 doPlayerAddItem(cid,2190,1)
 selfSay('Very well, here you go. Have fun with it.')
 talk_state = 0
 
 elseif value7 == 1 and msgcontains(msg,'wand of vortex') and voc == 1 then
 npcHandler:say('You have already been given a free wand of vortex, would you like to pay 500 gold coins for another?')
 talk_state = 9
 
 elseif talk_state == 9 and msgcontains(msg,'no') then
 npcHandler:say('Now you know the offer at least.')
 talk_state = 0

 elseif talk_state == 9 and msgcontains(msg,'yes') then
 if getPlayerItemCount(cid,2148) >= 500 or
 getPlayerItemCount(cid,2152) >= 5 or
 getPlayerItemCount(cid,2160) >= 1 then
 doPlayerRemoveMoney(cid,500)
 doPlayerAddItem(cid,2190,1)
 selfSay('Here you go, have fun with it.')
 talk_state = 0
 else
 npcHandler:say('You do not have enough money, ' .. getPlayerName(cid) .. '.')
 talk_state = 0
 end
 
 elseif value7 == -1 and msgcontains(msg,'snakebite rod') and voc == 2 then
 npcHandler:say('Well, you\'re a druid, and that means you may have a snakebite for free. Do you want it now?')
 talk_state = 10
 
 elseif talk_state == 10 and msgcontains(msg,'no') then
 npcHandler:say('Now you know the offer at least.')
 talk_state = 0
 
 elseif talk_state == 10 and msgcontains(msg,'yes') then
 setPlayerStorageValue(cid,9471,1)
 doPlayerAddItem(cid,2182,1)
 selfSay('Very well, here you go. Have fun with it.')
 talk_state = 0
 
 elseif value7 == 1 and msgcontains(msg,'snakebite rod') and voc == 2 then
 npcHandler:say('You have already been given a free snakebite rod, would you like to pay 500 gold coins for another?')
 talk_state = 11
 
 elseif talk_state == 11 and msgcontains(msg,'no') then
 npcHandler:say('Now you know the offer at least.')
 talk_state = 0

 elseif talk_state == 11 and msgcontains(msg,'yes') then
 if getPlayerItemCount(cid,2148) >= 500 or
 getPlayerItemCount(cid,2152) >= 5 or
 getPlayerItemCount(cid,2160) >= 1 then
 doPlayerRemoveMoney(cid,500)
 doPlayerAddItem(cid,2182,1)
 selfSay('Here you go, have fun with it.')
 talk_state = 0
 else
 npcHandler:say('You do not have enough money, ' .. getPlayerName(cid) .. '.')
 talk_state = 0
 end
 
 elseif msgcontains(msg,'snakebite rod') and voc > 2 then
 npcHandler:say('Would you like to buy a snakebite rod for 500 gold coins?')
 talk_state = 12
 
 elseif talk_state == 12 and msgcontains(msg,'no') then
 npcHandler:say('Now you know the offer at least.')
 talk_state = 0
 
 elseif talk_state == 12 and msgcontains(msg,'yes') then
 if getPlayerItemCount(cid,2148) >= 500 or
 getPlayerItemCount(cid,2152) >= 5 or
 getPlayerItemCount(cid,2160) >= 1 then
 doPlayerRemoveMoney(cid,500)
 doPlayerAddItem(cid,2182,1)
 selfSay('Here you go, have fun with it.')
 talk_state = 0
 else
 npcHandler:say('You do not have enough money, ' .. getPlayerName(cid) .. '.')
 talk_state = 0
 end
 
 elseif msgcontains(msg,'wand of vortex') and voc > 2 then
 npcHandler:say('Would you like to buy a wand of vortex for 500 gold coins?')
 talk_state = 15
 
 elseif talk_state == 15 and msgcontains(msg,'no') then
 npcHandler:say('Now you know the offer at least.')
 talk_state = 0
 
 elseif talk_state == 15 and msgcontains(msg,'yes') then
 if getPlayerItemCount(cid,2148) >= 500 or
 getPlayerItemCount(cid,2152) >= 5 or
 getPlayerItemCount(cid,2160) >= 1 then
 doPlayerRemoveMoney(cid,500)
 doPlayerAddItem(cid,2190,1)
 selfSay('Here you go, have fun with it.')
 talk_state = 0
 else
 npcHandler:say('You do not have enough money, ' .. getPlayerName(cid) .. '.')
 talk_state = 0
 end
 

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
			npcHandler:say('Here\'s the ' .. price .. ' gold coins.')
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
shopModule:addBuyableItem({'wand of dragonbreath', 'wand of dragonbreath'}, 		2191, 1000, 		'wand of dragonbreath')
shopModule:addBuyableItem({'wand of plague', 'wand of plague'}, 		2188, 5000, 		'wand of plague')
shopModule:addBuyableItem({'wand of cosmic energy', 'wand of cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'wand of inferno'}, 2187,  15000, 'wand of inferno')
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
