local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
local msg = ''
if (msgcontains(msg, 'hi') and (focus == 0)) and getDistanceToCreature(cid) < 4 then
 		selfSay('Hello, ' .. creatureGetName(cid) .. '.')
 		focus = cid
 		talk_start = os.clock()

	elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
  		selfSay('Sorry, ' .. creatureGetName(cid) .. '! I\'ll talk to you in a moment.')

  	elseif focus == cid then
		talk_start = os.clock()
		
		
		if msgcontains(msg, 'engrave') or msgcontains(msg, 'engraving') then
 				selfSay('Do you wish me to engrave a wedding ring?')
				talk_state = 1
				end
				
		if msgcontains(msg, 'yes') and talk_state == 1 then
 				selfSay('What do you wish me to engrave in the ring? Remember that it will cost you 4000 gold coins.')
				talk_state = 2
		
		
	    local msg = ''
            elseif talk_state == 2 and (msg ~= 'stop') then
                broadcast = msg2
				doPlayerRemoveItem(cid,2121,1)
				doPlayerRemoveMoney(cid,4000)
                ring = doPlayerAddItem(cid,2121,1)
	            doSetItemSpecialDescription(ring,msg)
				selfSay('Here you are.')
 				talk_state = 0
 				end
 				end
 				return true
 				end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

