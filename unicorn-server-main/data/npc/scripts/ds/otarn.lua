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

	value1 = getPlayerStorageValue(cid,4302)
  value2 = getPlayerStorageValue(cid,4303)
  value3 = getPlayerStorageValue(cid,9610)
  value4 = getPlayerStorageValue(cid,9611)
  value5 = getPlayerStorageValue(cid,4311)
  msg = string.lower(msg)
  
  if msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == -1 then
  selfSay('My collection of books is almost done. There is just one book I still haven’t found. It’s about fishing. Oh, perhaps you would like to help me?')
  talk_state = 1

  elseif msgcontains(msg,'no') and talk_state == 1 then
  selfSay('Okay. Perhaps later.')
  talk_state = 0
  
  elseif msgcontains(msg,'yes') and talk_state == 1 then
  selfSay('I have heard that there is a fisherman living in Adanac that is very interested in fishing... perhaps he’s got one. Who knows?')
  talk_state = 0
  setPlayerStorageValue(cid,9543,1)
  
  elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 1 or
  msgcontains(msg,'cookbook') and getPlayerStorageValue(cid,9543) == 1 then
  selfSay('Have you obtained the book which I was missing in my collection? The fishing one?')
  talk_state = 2
  
  elseif msgcontains(msg,'no') and talk_state == 2 then
  selfSay('Then return when you have done so, human.')
  talk_state = 0
  
  elseif msgcontains(msg,'yes') and talk_state == 2 then
  if getPlayerItemCount(cid,2217) >= 1 then
  selfSay('Oh... so it was a cookbook? I really thought it was about the art of fishing itself <looks disappointed>. Well, I could still use it... may I have it?')
  talk_state = 3
  else
  selfSay('You don\'t have it.')
  talk_state = 0
  end
  
  elseif msgcontains(msg,'no') and talk_state == 3 then
  selfSay('A reason for why I dislike humans...')
  talk_state = 0
  
  elseif msgcontains(msg,'yes') and talk_state == 3 then
  if getPlayerItemCount(cid,2217) >= 1 then
  selfSay('Thanks alot, human! I’ll reward you even though it kindof failed my expectations.')
  doPlayerAddItem(cid,2146,3)
  doPlayerRemoveItem(cid,2217,1)
  setPlayerStorageValue(cid,9543,2)
  talk_state = 0
  else
  selfSay('You don\'t have it.')
  talk_state = 0
  end
 
elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 2 then
  selfSay('You have helped me already. I suggest you to speak with Fa\'hadir now.')
elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 6 then
  selfSay('Speak with Umar.')
elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 11 then
  selfSay('You have helped us tremendously already, human.')  

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
