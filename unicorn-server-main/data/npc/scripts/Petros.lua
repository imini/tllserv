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
local travelNode = keywordHandler:addKeyword({'casteldine'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wish to travel to Casteldine for 140 gold coins?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 140, destination = {x=782, y=745, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})

local travelNode = keywordHandler:addKeyword({'adanac'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to travel to Adanac for 80 gold coins?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 80, destination = {x=507, y=650, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then not.'})

local travelNode = keywordHandler:addKeyword({'agatone'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like travel to Agatone for 45 gold coins?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 45, destination = {x=470, y=707, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'It\'s only 45 gp. Too expensive?'})

local travelNode = keywordHandler:addKeyword({'omere'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to travel to Omere for 15 gold coins?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 15, destination = {x=541, y=732, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then not.'})


keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to the island of Agatone, aswell as the cities Casteldine and Adanac. Apart from that, I can sail you to Omere, the solitude sage.'})
keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to the island of Agatone, aswell as the cities Casteldine and Adanac. Apart from that, I can sail you to Omere, the solitude sage.'})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to the island of Agatone, aswell as the cities Casteldine and Adanac. Apart from that, I can sail you to Omere, the solitude sage.'})
-- Makes sure the npc reacts when you say hi, bye etc.

npcHandler:addModule(FocusModule:new())