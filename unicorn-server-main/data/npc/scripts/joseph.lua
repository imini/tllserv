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
	
	local outfitz = getCreatureOutfit(cid)
	value2 = getPlayerStorageValue(cid,9897)
  	josephvalue = getPlayerStorageValue(cid,9721)
	value20 = getPlayerStorageValue(cid,9712)
	msg = string.lower(msg)
	
	if msgcontains(msg, 'quest') then
  selfSay('Once in time, me and Alexander found a curious place where we learnt some amazing spells from a spell scroll. Would you like to see?')
  talk_state = 7

	elseif value20 == 1 and josephvalue == -1 and msgcontains(msg,'measurements') then
	selfSay('If its necessary ... <tells you his measurements>')
	setPlayerStorageValue(cid,9721,1)
	talk_state = 0
	
	elseif josephvalue == 1 and msgcontains(msg,'measurements') then
	selfSay('I have told you my measurements already.')
  
  elseif talk_state == 7 and msgcontains(msg, 'no') then
  selfSay('Then not.')
  talk_state = 0
  elseif talk_state == 8 and msgcontains(msg, 'no') then
  selfSay('Then not.')
  talk_state = 0
  
  elseif talk_state == 7 and msgcontains(msg, 'yes') then
  selfSay('It was a long time ago, and I\'m afraid the spell will demand much of my powers. If you give me 70 gold coins for the trouble, I can perform it. Are you willing to proceed, still?')
  talk_state = 8
  
  elseif talk_state == 8 and msgcontains(msg, 'yes') then
  if getPlayerItemCount(cid,2152) >= 1 or getPlayerItemCount(cid,2148) >= 70 or getPlayerItemCount(cid,2160) >= 1 then
  doPlayerRemoveMoney(cid,70)
  doSendMagicEffect(getThingPos(cid),15)
  doSendMagicEffect(getThingPos(cid),4)
  doSetMonsterOutfit(cid, "Spirit of Fire", 50000)
  selfSay('Here goes.')
  talk_state = 0
  else
  selfSay('You don\'t have enough money.')
  talk_state = 0
   end 
  elseif outfitz["lookType"] == 242 then
  selfSay('Fancy, huh?')  


	
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())