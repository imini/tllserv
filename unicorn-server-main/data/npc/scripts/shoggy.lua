local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local story = 0
local talk_story = 0
-- OTServ event handling functions start
function onThingMove(creature, thing, oldpos, oldstackpos)     npcHandler:onThingMove(creature, thing, oldpos, oldstackpos) end
function onCreatureAppear(creature)                             npcHandler:onCreatureAppear(creature) end
function onCreatureDisappear(id)                                 npcHandler:onCreatureDisappear(id) end
function onCreatureTurn(creature)                                 npcHandler:onCreatureTurn(creature) end
function onCreatureSay(cid, type, msg)                         npcHandler:onCreatureSay(cid, type, msg) end

function onThink() npcHandler:onThink()
	if (os.clock() - talk_story) > 1 and story > 0 then
    
        if story == 1 then
	npcHandler:unGreet()
	end
    end
end
-- OTServ event handling functions end
 
function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end

end






-- Keyword handling functions start
function sayMessage(cid, message, keywords, parameters)     return npcHandler:defaultMessageHandler(cid, message, keywords, parameters) end

function greet(cid, message, keywords, parameters)

	if(npcHandler.focus == 0) then
        npcHandler.focus = cid
        story = 1

    end

    return true
end




function farewell(cid, message, keywords, parameters)    
return 
npcHandler:onFarewell(cid, message, keywords, parameters)

end


keywordHandler:addKeyword({'hi'}, greet, nil)
keywordHandler:addKeyword({'hello'}, greet, nil)
keywordHandler:addKeyword({'hey'}, greet, nil)

keywordHandler:addKeyword({'bye'}, farewell, nil)
keywordHandler:addKeyword({'farewell'}, farewell, nil)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
