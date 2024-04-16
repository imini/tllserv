local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local count = {}
local transfer = {}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

keywordHandler:addKeyword({'lirensfolk'}, StdModule.say, {npcHandler = npcHandler, text = 'A beautiful Island with rich lands and a vast amount of {mysteries} to uncover!'})
keywordHandler:addKeyword({'mysteries'}, StdModule.say, {npcHandler = npcHandler, text = 'Secret caves , hidden treasures and dangerous monsters that hold unique wares!'})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "issue") then --you can copy this npc and edit the msg as you want and add the storage of the task. 
	player:setStorageValue(202024,1) -- GrimReaper TaskNpcStorage. from tasks in creaturescripts.
	npcHandler:say("yes,we have an issue with rats in the sewer , i added a task for you in the task window.", cid)
	end
	return true
end


npcHandler:setMessage(MESSAGE_GREET, "Welcome |PLAYERNAME|!We have an {issue} in the sewer!")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())