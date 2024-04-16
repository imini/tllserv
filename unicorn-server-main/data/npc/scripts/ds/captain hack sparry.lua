local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!


local travelNode = keywordHandler:addKeyword({'agatone'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ye want to sail to Agatone for 100 shining gold coins?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 100, destination = {x=467, y=708, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})

local travelNode = keywordHandler:addKeyword({'adanac'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ye want to sail to Adanac for 130 shining gold coins?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 130, destination = {x=507, y=650, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then not.'})
	
local travelNode = keywordHandler:addKeyword({'tha'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ye want to sail to Tha`Reen for 150 shining gold coins?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 130, destination = {x=156, y=233, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Very well.'})

local travelNode = keywordHandler:addKeyword({'gardar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ye want to sail to Gardar for 65 shining gold coins?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 130, destination = {x=707, y=192, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Very well.'})
	
local travelNode = keywordHandler:addKeyword({'hagal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ye want to sail to Hagal for 60 shining gold coins?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 60, destination = {x=768, y=150, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Very well.'})
	
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can sail you to many places, young |PLAYERNAME|. Tha\'Reen, Adanac, Gardar, Hagal or Agatone - the choice is yours as long as I get the money.'})
keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can sail you to many places, young |PLAYERNAME|. Tha\'Reen, Adanac, Gardar, Hagal or Agatone - the choice is yours as long as I get the money.'})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can sail you to many places, young |PLAYERNAME|. Tha\'Reen, Adanac, Gardar, Hagal or Agatone - the choice is yours as long as I get the money.'})
-- Makes sure the npc reacts when you say hi, bye etc.

npcHandler:addModule(FocusModule:new())
