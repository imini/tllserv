local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    if(npcHandler.focus ~= cid) then
        return false
    end
    
    value0 = getPlayerStorageValue(cid,9867)
    value1 = getPlayerStorageValue(cid,9868)
    value2 = getPlayerStorageValue(cid,9869)
    value3 = getPlayerStorageValue(cid,9870)
    msg = string.lower(msg)

      if msgcontains(msg, 'infernal bolts') then
      selfSay('I suppose, if you provide me with a soul orb - I could forge a few infernal bolts out of it. I\'ll keep a few for myself as payment, though.')
       
      elseif msgcontains(msg, 'soul orb') then
      selfSay('Have you got one of those soul orbs for me?')
      talk_state = 11
        
      elseif msgcontains(msg, 'yes') and talk_state == 11 then
      if getPlayerItemCount(cid,5944) >= 1 then
      if doPlayerTakeItem(cid,5944,1) then
      selfSay('Thanks. And as promised, here are your infernal bolts.')
      doPlayerAddItem(cid,6529,3)
      end
      else
      selfSay('Sorry, you don\'t have any soul orbs.')
      end
          
      elseif msgcontains(msg, 'no') and talk_state == 1 then
      selfSay('Ok then.')
      talk_state = 0
      
      elseif msgcontains(msg,'addon') and value0 == -1 or
      msgcontains(msg,'outfit') and value0 == -1 then
      selfSay('Is it my knight’s sword you are interested in?')
      talk_state = 1
	
      elseif talk_state == 1 and msgcontains(msg,'yes') then
      selfSay('I could forge you one, but it will require a few things of you. Just bring me a 100 iron ore and 1 huge chunk of crude iron. Actually, I can help you with the crude iron. Got it?')      
      talk_state = 2
	
      elseif msgcontains(msg,'no') and talk_state == 1 then
      selfSay('Very well.')
      talk_state = 0
      elseif msgcontains(msg,'no') and talk_state == 2 then
      selfSay('Very well.')
      talk_state = 0
      elseif msgcontains(msg,'no') and talk_state == 3 then
      selfSay('Very well.')
      talk_state = 0
      
      elseif msgcontains(msg,'yes') and talk_state == 2 then
      selfSay('Great. Return when you have the items required and ask me to forge you the sword.')
      talk_state = 0
      setPlayerStorageValue(cid,9867,1)
      setPlayerStorageValue(cid,9868,1)
      
      elseif msgcontains(msg,'addon') and value1 == 1 or
      msgcontains(msg,'forge') and value1 == 1 or
      msgcontains(msg,'outfit') and value1 == 1 then
      selfSay('Have you gathered 100 iron ores as I asked you to, and have you obtained a huge chunk of crude iron?')
      talk_state = 3
      
      elseif msgcontains(msg,'yes') and talk_state == 3 then
      if getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5880) >= 100 then
      doPlayerRemoveItem(cid,5892,1)
      doPlayerRemoveItem(cid,5880,100)
      setPlayerStorageValue(cid,9869,1)
      setPlayerStorageValue(cid,9868,-1)
      doPlayerAddOutfit(cid,139,1)
      doPlayerAddOutfit(cid,131,1)
      doSendMagicEffect(getThingPos(cid),13)
      npcHandler:say('Alright! As a matter of fact, I have one in store. Here you go!')
      talk_state = 0
      else
      selfSay('You don\'t have these items. Sorry.')
      talk_state = 0
      end
      
      elseif msgcontains(msg,'royal steel') then
      selfSay('I can trade with you a crown armor for a piece of royal steel. What do you say?')
      talk_state = 4
      
      elseif msgcontains(msg,'no') and talk_state == 4 then
      selfSay('Very well.')
      talk_state = 0
      
      elseif msgcontains(msg,'yes') and talk_state == 4 then
      if getPlayerItemCount(cid,2487) >= 1 then
      doPlayerRemoveItem(cid,2487,1)
      doPlayerAddItem(cid,5887,1)
      npcHandler:say('Here you go. And here I go, too.')
      talk_state = 0
      else
      selfSay('I don\'t think you have that item.')
      talk_state = 0
      end
      
      elseif msgcontains(msg,'hell steel') then
      selfSay('I can trade with you a devil helmet for a piece of hell steel. What do you say?')
      talk_state = 5
      
      elseif msgcontains(msg,'no') and talk_state == 5 then
      selfSay('Very well.')
      talk_state = 0
      
      elseif msgcontains(msg,'yes') and talk_state == 5 then
      if getPlayerItemCount(cid,2462) >= 1 then
      doPlayerRemoveItem(cid,2462,1)
      doPlayerAddItem(cid,5888,1)
      npcHandler:say('Here you go. And here I go, too.')
      talk_state = 0
      else
      selfSay('I don\'t think you have that item.')
      talk_state = 0
      end
      
      elseif msgcontains(msg,'draconian steel') then
      selfSay('I can trade with you a dragon shield for a piece of draconian steel. What do you say?')
      talk_state = 6
      
      elseif msgcontains(msg,'no') and talk_state == 6 then
      selfSay('Very well.')
      talk_state = 0
      
      elseif msgcontains(msg,'yes') and talk_state == 6 then
      if getPlayerItemCount(cid,2516) >= 1 then
      doPlayerRemoveItem(cid,2516,1)
      doPlayerAddItem(cid,5889,1)
      npcHandler:say('Here you go. And here I go, too.')
      talk_state = 0
      else
      selfSay('I don\'t think you have that item.')
      talk_state = 0
      end
      
      elseif msgcontains(msg,'crude iron') then
      selfSay('I can trade with you a giant sword for a huge chunk of crude iron. What do you say?')
      talk_state = 7
      
      elseif msgcontains(msg,'no') and talk_state == 7 then
      selfSay('Very well.')
      talk_state = 0
      
      elseif msgcontains(msg,'yes') and talk_state == 7 then
      if getPlayerItemCount(cid,2393) >= 1 then
      doPlayerRemoveItem(cid,2393,1)
      doPlayerAddItem(cid,5892,1)
      npcHandler:say('Here you go. And here I go, too.')
      talk_state = 0
      else
      selfSay('I don\'t think you have that item.')
      talk_state = 0
      end
      end
      return true
      end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
