local QUEST = 7
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)

	if(npcHandler.focus ~= cid) then
		return false
	end
	local value1 = getPlayerStorageValue(cid,4308)
	local value2 = getPlayerStorageValue(cid,4318)
	local value3 = getPlayerStorageValue(cid,4555)
  local value4 = getPlayerStorageValue(cid,9614)
  local value5 = getPlayerStorageValue(cid,9615)
  local value6 = getPlayerStorageValue(cid,3143)
	if msgcontains(msg, 'lamp') getPlayerStorageValue(cid,9543) == 8 then 
			selfSay('Ugh! I know you want lamp. I sense from you that evil plans to imprison Falor you has. Right?')
			talk_state = 1
			
			elseif msgcontains(msg,'no') and talk_state == 1 then
			selfSay('No? Fine.')
			talk_state = 0
			
			elseif msgcontains(msg,'no') and talk_state == 2 then
			selfSay('No? Fine.')
			talk_state = 0
			
	elseif value2 == 1 and msgcontains(msg,'lamp') and getPlayerStorageValue(cid,9542) == 8 then 
			selfSay('I can sense evil intentions of yours to imprison djinn! You are longing for lamp, which still in my possession is. Who you want trap in cursed lamp?')
			talk_state = 2
		
			elseif talk_state == 1 and msgcontains(msg, 'yes') then
			doPlayerAddItem(cid,2356,1)
			getPlayerStorageValue(cid,9543,9)
			selfSay('Good! I waited have for this day, when revenge I can commit against the fool. He never me give power. No! Take lamp and remove from our world him!')
			talk_state = 0
	
			elseif getPlayerStorageValue(cid,9542) > 8 and msgcontains(msg,'lamp') then
			selfSay('You have take lamp already.')
			talk_state = 0
			elseif getPlayerStorageValue(cid,9543) > 8 and msgcontains(msg,'lamp') then
			selfSay('You have take lamp already.')
			talk_state = 0

			 
			elseif talk_state == 2 and msgcontains(msg, 'umar') then
			doPlayerAddItem(cid,2356,1)
			getPlayerStorageValue(cid,9542,9)

			   npcHandler:say('Finally! I waited for this day. Take lamp and go. Leave now!')
			talk_state = 0

end
end


function greetCallback(cid)
	if getPlayerStorageValue(cid,9542) > QUEST or getPlayerStorageValue(cid,9543) > QUEST  then

		return true
	else
		return false
	end
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)


npcHandler:setMessage(MESSAGE_GREET, 'Argh! You think you are very strong human to infiltrate base? What you want from me?')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())
