local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

-- Keyword structure generation start
--Statues:

--Tables:
shopModule:addBuyableItem({'small table', 'small table'},     3912,	20,	1,	'small table') ---
shopModule:addBuyableItem({'round table', 'round table'},      3911,  25,	1,	'round table') ---
shopModule:addBuyableItem({'square table', 'square table'},    3910,  25,	1,	'square table') ---
--Chairs:
shopModule:addBuyableItem({'wooden chair', 'wooden chair'},     3901, 15,	1,	'wooden chair')---
shopModule:addBuyableItem({'rocking char', 'rocking char'},     1674,  25,	1,	'rocking char') -- NOT
shopModule:addBuyableItem({'red cushioned chair', 'red cushioned chair'},	 3903, 40,	1,	'red cushioned chair')----
shopModule:addBuyableItem({'green cushioned chair', 'green cushioned chair'},      3904,  40,	1,	'green cushioned chair') ---
shopModule:addBuyableItem({'sofa char', 'sofa char'},     3902, 55,	1,	'sofa char') ---
--Flowers:
shopModule:addBuyableItem({'indoor plant', 'indoor plant'},     3929, 8, 	1, 	'indoor plant') --
shopModule:addBuyableItem({'flower bowl', 'flower bowl'},     2102, 6,		1,	'flower bowl')
shopModule:addBuyableItem({'god flower', 'god flower'},     2100,  5,	1,	'god flower')
shopModule:addBuyableItem({'honey flower', 'honey flower'},      2103,  5,	1,	'honey flower')
shopModule:addBuyableItem({'potted flower',	'potted flower'},     3928, 5,	1,	'potted flower')
--Pillows:
--shopModule:addBuyableItem({'small pillow', 'small pillow'},     2471, 20,	1,	'small pillow')
--shopModule:addBuyableItem({'round pillow', 'round pillow'},     2471, 25,	1,	'round pillow')
--shopModule:addBuyableItem({'square pillow'},     tradeItem, {itemid = 2471, cost = 25})
--shopModule:addBuyableItem({'heart pillow', 'heart pillow'},     2471, 30,	1,	'heart pillow')
--Pottery:
shopModule:addBuyableItem({'vase', 'vase'},     2008, 3,	1,	'vase')
--shopModule:addBuyableItem({'coal basin', 'coal basin'},     2601,  25,	1,	'coal basin')
shopModule:addBuyableItem({'amphora', 'amphora'},    2023,  4, 		1,	'amphora')
shopModule:addBuyableItem({'large amphora', 'large amphora'},     2034, 50,	1,	'large amphora')
--Instruments:
shopModule:addBuyableItem({'piano', 'piano'},      3926, 200,	1,	'piano') --
shopModule:addBuyableItem({'harp', 'harp'},     3917, 50,	1,	'harp')
--Decorations: 
shopModule:addBuyableItem({'water pipe', 'water pipe'},      2093, 40, 		1,	'water pipe')
shopModule:addBuyableItem({'pendulem clock',	'pendulem clock'},     3933, 75,	1,	'pendulem clock')
shopModule:addBuyableItem({'telescope',	'telescope'},     2581, 70,	1,	'telescope')
shopModule:addBuyableItem({'table lamp'},     tradeItem, {itemid = 3937, cost = 35})
shopModule:addBuyableItem({'rocking horse', 'rocking horse'},      2116,  30,	1,	'rocking horse')
shopModule:addBuyableItem({'globe', 'globe'},     3927, 50, 	1,	'globe')
shopModule:addBuyableItem({'bird cage', 'birdcage'},     3918, 40, 	1,	'birdcage')
--shopModule:addBuyableItem({'round mirror', 'round mirror'},     2471, 40,	1,	'round mirror')
--shopModule:addBuyableItem({'oval mirror', 'oval mirror'},     2471,  40,	1,	'oval mirror')
--shopModule:addBuyableItem({'edged mirror', 'edged mirror'},     2471, 40,	1,	'edged mirror')
--shopModule:addBuyableItem({'landscape picture'},     tradeItem, {itemid = 2471, cost = 50})
--shopModule:addBuyableItem({'portrait picture', 'portrait picture'},     2471,  50,	1,	'portrait picture')
--shopModule:addBuyableItem({'stillife picture', 'stillife picture'},     2471,  50,	1,	'stillife picture')
shopModule:addBuyableItem({'cuckoo clock', 'cuckoo clock'},     1873, 40,	1,	'cuckoo clock')
-- tapestry
shopModule:addBuyableItem({'purple tapestry', 'purple tapestry'},      1857,  25,	1,	'purple tapestry')
shopModule:addBuyableItem({'green tapestry', 'green tapestry'},      1860,  25,		1,	'green tapestry')
shopModule:addBuyableItem({'yellow tapestry', 'yellow tapestry'},      1863, 25,	1,	'yellow tapestry')
shopModule:addBuyableItem({'orange tapestry', 'orange tapestry'},     1866,  25, 	1,	'orange tapestry')
shopModule:addBuyableItem({'red tapestry', 'red tapestry'},      1869,  25,	1,	'red tapestry')
shopModule:addBuyableItem({'blue tapestry', 'blue tapestry'},      1872,  25,	1,	'blue tapestry')
shopModule:addBuyableItem({'white tapestry', 'white tapestry'},     1880, 25,	1,	'white tapestry')

--Containers:
shopModule:addBuyableItem({'drawer', 'drawer'},     3921,  18,		1,	'drawer') -- 
shopModule:addBuyableItem({'dresser', 'dresser'},     3932,  25,	1,	'dresser')
shopModule:addBuyableItem({'locker', 'locker'},      3934,  30,		1,	'locker')
shopModule:addBuyableItem({'crate', 'crate'},      1739,  10,	1,	'crate')
shopModule:addBuyableItem({'chest', 'chest'},      3915, 10,	1,	'chest')
shopModule:addBuyableItem({'box', 'box'},    1738, 10,		1,	'box')
shopModule:addBuyableItem({'barrel', 'barrel'},     3923,  12,	1,	'barrel')
shopModule:addBuyableItem({'trunk', 'trunk'},     3907,  10,	1,	'trunk')
shopModule:addBuyableItem({'trough', 'trough'},     3935, 7,	1,	'trough')
--shopModule:addBuyableItem({'weapon rack', 'weapon rack'},    5852,  90, 	1, 'weapon rack')
--shopModule:addBuyableItem({'armor rack', 'armor rack'},     5860, 90, 	1,	'armor rack')




npcHandler:addModule(FocusModule:new())
