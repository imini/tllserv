local talk_story = 0 --The time limit, set it to 0
local story = 0 --To add more lines, set it to 0
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

  value0 = getPlayerStorageValue(cid,9616)
  value1 = getPlayerStorageValue(cid,9617)
  value2 = getPlayerStorageValue(cid,9622)
  value3 = getPlayerStorageValue(cid,9619)
  value4 = getPlayerStorageValue(cid,9620)
  value5 = getPlayerStorageValue(cid,9621)
  local newpos = {x=939, y=513, z=14}
  local newpos2 = {x=603, y=684, z=14}
  msg = string.lower(msg)
  
  if msgcontains(msg,'test') and value4 == 1 then
  selfSay('No. NO!! DON\'T SPEAK TO ME AGAIN, FOOOOOL!!!!')
  talk_state = 0
  
  elseif msgcontains(msg,'test') and value0 == -1 then
  selfSay('Death awaits those who fail the test of the three seals! Do you really want me to test you?')
  talk_state = 1

  elseif talk_state == 1 and msgcontains(msg,'no') then
  selfSay('You are funny.')
  talk_state = 0

  elseif talk_state == 1 and msgcontains(msg,'yes') then
  setPlayerStorageValue(cid,9617,1)
  selfSay('FOOL! Now you\'re doomed! But well ... So be it! Let\'s start out with the Seal of Knowledge and the first question: What name did the necromant king choose for himself?')
  talk_state = 2
  
  elseif talk_state == 2 then
  if msgcontains(msg,'foshnar') then
  selfSay('HOHO! You have learned your lesson well. Question number two then: Who or what is the feared Hugo?')
  talk_state = 3
  else
  selfSay('Completely wrong! HAHAHAHA!!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  talk_state = 0
  end
  
  elseif talk_state == 3 then
  if msgcontains(msg,'demonbunny') then
  selfSay('HOHO! Right again. All right. The final question of the first seal: Who was the first warrior to follow the path of the Mooh\'Tah?')
  talk_state = 4
  else
  selfSay('Completely wrong! HAHAHAHA!!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  talk_state = 0
  end
  
  elseif talk_state == 4 then
  if msgcontains(msg,'fah\'kull') then
  selfSay('HOHO! Lucky you. You have passed the first seal! So... would you like to continue with the Seal of the Mind?')
  talk_state = 5
  else
  selfSay('Completely wrong! HAHAHAHA!!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  talk_state = 0
  end
  
  elseif talk_state == 5 and msgcontains(msg,'no') then
  selfSay('You are funny. HAHAHA!!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  talk_state = 0
  
  elseif talk_state == 5 and msgcontains(msg,'yes') then
  selfSay('As you wish, foolish one! Here is my first question: If you name it, you break it.')
  talk_state = 6
  
  elseif talk_state == 6 then
  if msgcontains(msg,'silence') then
  selfSay('That was an easy one. Let\'s try the second: It\'s lighter than a feather but no living creature can hold it for ten minutes?')
  talk_state = 7
  else
  selfSay('Completely wrong! HAHAHAHA!!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  talk_state = 0
  end
  
  elseif talk_state == 7 then
  if msgcontains(msg,'breath') then
  selfSay('Hm. I bet you think you\'re smart. All right. How about this, what\'s that: marble walls as white as milk, lined with skin as soft as silk, in a fountain crystal clear, a golden apple will appear, there is no key to this stronghold, yet theives break in and steal the gold.')
  talk_state = 8
  else
  selfSay('Completely wrong! HAHAHAHA!!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  talk_state = 0
  end
  
  elseif talk_state == 8 then
  if msgcontains(msg,'egg') then
  selfSay('ARGH! You did it again! Well all right. Do you wish to break the Seal of Madness?')
  talk_state = 9
  else
  selfSay('Completely wrong! HAHAHAHA!!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  talk_state = 0
  end
  
  elseif talk_state == 9 and msgcontains(msg,'no') then
  selfSay('You are funny. HAHAHA!!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  talk_state = 0
  
  elseif talk_state == 9 and msgcontains(msg,'yes') then
  selfSay('GOOD! So I will get you at last. Answer this: What is your favourite colour?')
  talk_state = 10
  
  elseif talk_state == 10 then
  if msgcontains(msg,'orange') then
  selfSay('UHM UH OH... how could you guess that? Are you mad??? All right. Question number two: What is the opposite?')
  talk_state = 11
  else
  selfSay('Completely wrong! HAHAHAHA!!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  talk_state = 0
  end
  
  elseif talk_state == 11 then
  if msgcontains(msg,'none') then
  selfSay('NO! NO! NO! That can\'t be true. You\'re not only mad, you are a complete idiot! Ah well. Here is the last question: What is 1 plus 1?')
  talk_state = 12
  else
  selfSay('Completely wrong! HAHAHAHA!!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  talk_state = 0
  end
  
  elseif talk_state == 12 and value2 == -1 then
  if msgcontains(msg,'34234234234234 efdsf46') then
  selfSay('WRONG!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  setPlayerStorageValue(cid,4619,1)
  else
  selfSay('Completely wrong! HAHAHAHA!!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  setPlayerStorageValue(cid,4619,1)
  talk_state = 0
  end
  
  elseif talk_state == 12 and value2 == 1 then
  if msgcontains(msg,'46') then
  selfSay('NO! YOU’RE RIGHT! I DON’T BELIEVE THIS! CHEAT!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos2,0)
  doSendMagicEffect(newpos2,10)
  setPlayerStorageValue(cid,9620,1)
  else
  selfSay('Completely wrong! HAHAHAHA!!')
  doSendMagicEffect(getThingPos(cid),10)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  talk_state = 0
  end
  end
  return true
  end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())