local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink()
    end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end

value0 = getPlayerStorageValue(cid,4301)
value1 = getPlayerStorageValue(cid,9609)
value2 = getPlayerStorageValue(cid,9610)
value3 = getPlayerStorageValue(cid,9611)
value4 = getPlayerStorageValue(cid,4311)
value5 = getPlayerStorageValue(cid,9542)
msg = string.lower(msg)
	if msgcontains(msg, 'passage') and value0 == -1 and value5 == -1 then
			selfSay('Incase you want to enter our fortress you will have to become one of us and fight the efreet. Do you want to do that? Yes?')
			talk_state = 1
			
			elseif msgcontains(msg,'passage') and value5 == 1 and value0 == -1 then
  selfSay('GET OUT OF HERE HUMAN SCUM!!') 

		elseif talk_state == 1 and msgcontains(msg, 'yes') then
			   selfSay('Alright then, but you have to swear that you won’t ever set foot in the marids territories.... unless you want to kill them of course. Is that okey?')
			talk_state = 2

		elseif talk_state == 2 and msgcontains(msg, 'yes') then
			   selfSay('Oh. Ok. Welcome then. You may pass... and remember to kill som marids now and then.')
			setPlayerStorageValue(cid,4301,1)
			talk_state = 0
			
			elseif msgcontains(msg,'no') and talk_state == 1 then
			selfSay('Very well.')
			talk_state = 0
			
      elseif msgcontains(msg,'no') and talk_state == 2 then
			selfSay('Very well.')
			talk_state = 0
			
			elseif msgcontains(msg,'passage') and value0 == 1 then
			selfSay('I have granted you passage to our fortress, human.')
			talk_state = 0
			
			elseif msgcontains(msg,'door') and value1 == 1 then
			selfSay('I have granted you passage to our fortress, human.')
			talk_state = 0
			
			elseif msgcontains(msg,'door') and value1 == -1 then
			selfSay('I can’t allow you passage to this door... yet.')
			talk_state = 0

elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == -1 then
  selfSay('You should speak with Otarn. He is urgently in need of help. Perhaps even yours.')
elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 2 then
  selfSay('Fa\'hadir appears to need your help.')
elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 6 then
  selfSay('Fa\'hadir told me you must speak with Umar as soon as possible.')
elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 11 then
  selfSay('You have helped us enough, already.')  
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())