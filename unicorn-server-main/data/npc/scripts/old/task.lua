local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
-- function onThink()                          npcHandler:onThink()                        end

function onCreatureDisappear(cid)
    if npcHandler:isFocused(cid) then
        npcHandler:releaseFocus(cid)
    end
end




npcHandler:addModule(FocusModule:new())

local npcMissions = {
    --------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------
    [1] = {name = "Rat Killer", -- Kill monsters only
        arrayName = {"Rat", "rat", "Rats", "rats", "Pest", "pest", "Pests", "pests", "rat killer", "Rat killer", "Rat Killer"},
        storageMission = 43000, -- Mission storage should be unique even in different NPC files.
        storageRequired = nil, -- Use this to require different tasks to be done complete before this task can be started.
        messageTaskInfo = "I need you to kill 10 rats and 10 cave rats.", -- This message is said to the player when he starts the task.
        messageTaskComplete = "Thank you! Those pests have ruined my store. unfortunately they will be back. The rats aren't the main {problem}", -- This message is said to the player when he finishs the task.
        monsters = { -- Monster task
            [1] = {name = "Rat", amount = 10, storage = 41000}, -- Monster storages should be unique even in different NPC files.
            [2] = {name = "Cave Rat", amount = 10, storage = 41001}
        },
        --Rewards--
        exp = 1000, -- Exp given to the player for completing the task.
        rewardItems = { -- Items given to the player for completing the task.
            [1] = {itemid = 2390, amount = 1}
        },
        setStorage = nil -- Use this to set any storages you want to when the player completes the task excluding storageNpc and storageMission
    },
    --------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------
    [2] = {name = "Troll Hunter",
        arrayName = {"troll hunter", "Troll Hunter", "Troll", "troll", "Trolls", "trolls"},
        storageMission = 43001,
        storageRequired = {43000},
        messageTaskInfo = "I need you to kill 20 trolls.",
        messageTaskComplete = "You are truley a legend. There is one more thing I need. Could you {help} me one more time?",
        monsters = {
            [1] = {name = "Troll", amount = 20, storage = 41002},
        },
        collectItems = { -- Collect Items task
            [1] = {itemid = 1111, amount = 1}
        },
        --Rewards--
        exp = 5000,
        rewardItems = {
            [1] = {itemid = 2390, amount = 1}
        },
        setStorage = {
            [1] = {41532, 1}
        }
    },
    --------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------
    [3] = {name = "The Collector", -- Collect Items only
        arrayName = {"collector", "Collector", "collect", "Collect", "cheese", "Cheese"},
        storageMission = 43003,
        storageRequired = {43001, 43002},
        messageTaskInfo = "I need you to collect 10 cheese.",
        messageTaskComplete = "You are truley a legend. I do not need anymore help.",
        collectItems = { -- Collect Items task
            [1] = {itemid = 1111, amount = 1}
        },
        --Rewards--
        exp = 5000,
        rewardItems = {
            [1] = {itemid = 2390, amount = 1}
        },
        setStorage = nil
    }
    --------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------
}

local npcStory = { -- This story is told when the player first talks to the npc.
    "Not now adventurer. I have to deal with these pests.",
    "Honey! Get my broom, these things are everywhere. They aren't even scared of me!?",
    "If this continues we will have to close down our business!",
    "Please god send us some {help}!"
}

local MESSAGES_GREET = { -- Messages are based on the npcStorage for the player. This table handles all greeting interaction between the npc and player.
  --Storage / message
  -- The player gets his storage for the npc set as soon as he talks to the npc
  -- Everytime a player accepts and completes one of the tasks/missions his npcStorage is increased by 1. That is how the code keeps track of how the npc should respond to the player.
    [1] = "Hello again |PLAYERNAME|. Do you want to {help} me yet?",
    [2] = "I am glad you decided to help. Are those {rats} giving you a problem?",
    [3] = "Thanks for killing those rats. I have another {task} I need {help} with.",
    [4] = "The trolls are powerful. Be sure to take strong gear with you.",
    [5] = "Thank you for all your help."
}

local MESSAGES_GOODBYE = { -- This works the same as MESSAGES_GREET. Depending on how many tasks the player has done for the npc. The npc will say different things when he says goodbye to the player.
    [1] = "Thanks for nothing |PLAYERNAME|.",
    [2] = "Thank you for your help. Goodbye.",
    [3] = "You have helped so much. I will be sure to tell other of you."
}

local arrayGreetings = {"hi", "Hi", "hello", "Hello", "hey", "Hey", "oi", "Oi", "hola", "Hola"}
local arrayFarewell = {"bye", "Bye", "goodbye", "Goodbye", "good-bye", "Good-Bye", "Good-bye", "cya", "adios", "Adios"}

local messageHearStoryAgain = "story"
local messageCheckTasks = {"help", "Help", "task", "Task", "tasks", "Tasks"}
local messageShowTasks = "Here is what I need help with:"

local messageCompletedAllTasks = "Thank you for all you have done. I dont need anymore help."

local npcStorage = 45000

function onCreatureSay(cid, type, msg)
    local player = Player(cid)
    local playerGreetMessage = MESSAGES_GREET[player:getStorageValue(npcStorage)]
    local playerGoodbyeMessage = MESSAGES_GOODBYE[player:getStorageValue(npcStorage)]
  
    if isInArray(arrayGreetings, msg) and not npcHandler:isFocused(cid) and player:getStorageValue(npcStorage) == -1 then
        npcHandler:addFocus(cid)
        npcHandler:say(npcStory, cid, false, true, 4000)
        player:setStorageValue(npcStorage, 1)
  
    elseif isInArray(arrayGreetings, msg) and not npcHandler:isFocused(cid) then
        npcHandler:addFocus(cid)
        if string.find(playerGreetMessage, "|PLAYERNAME|") then
            local newMsg = string.gsub(playerGreetMessage, "|PLAYERNAME|", player:getName())
            selfSay(newMsg, cid)
        else
            selfSay(playerGreetMessage, cid)
        end
      
    elseif isInArray(arrayFarewell, msg) and npcHandler:isFocused(cid) then
        if string.find(playerGoodbyeMessage, "|PLAYERNAME|") then
            local newMsg = string.gsub(playerGoodbyeMessage, "|PLAYERNAME|", player:getName())
            selfSay(newMsg, cid)
        else
            selfSay(playerGoodbyeMessage, cid)
        end
        npcHandler:releaseFocus(cid)
      
    elseif isInArray(messageCheckTasks, msg) and npcHandler:isFocused(cid) then
        local text = messageShowTasks
        local tmpTable = {}
      
        for i = 1, #npcMissions do
            if player:getStorageValue(npcMissions[i].storageMission) < 2 then
                if npcMissions[i].storageRequired then
                local showTask = true
                    for x = 1, #npcMissions[i].storageRequired do
                        if player:getStorageValue(npcMissions[i].storageRequired[x]) ~= 2 then
                            showTask = false
                            break
                        end
                    end
                  
                    if showTask then
                        tmpTable[#tmpTable + 1] = npcMissions[i].name
                    end
                else
                    tmpTable[#tmpTable + 1] = npcMissions[i].name
                end
            end
        end
      
        if #tmpTable > 0 then
            for i = 1, #tmpTable do
                if i == #tmpTable then
                    text = text.." {"..tmpTable[i].."}"
                else
                    text = text.." {"..tmpTable[i].."},"
                end
            end
            selfSay(text, cid)
        else
            selfSay(messageCompletedAllTasks, cid)
        end
  
    elseif msg and npcHandler:isFocused(cid) then
        local MISSION = nil
        for i = 1, #npcMissions do
            if isInArray(npcMissions[i].arrayName, msg) then
                MISSION = npcMissions[i]
                break
            end
        end
      
        if MISSION == nil then
            return false
        end
      
        if player:getStorageValue(MISSION.storageMission) == 2 then
            selfSay("You have already completed {"..MISSION.name.."}.", cid)
            return false
        end

        local canDoTask = true
        if MISSION.storageRequired then
            for i = 1, #MISSION.storageRequired do
                if player:getStorageValue(MISSION.storageRequired) ~= 2 then
                    canDoTask = false
                    break
                end
            end
        end
      
        if not canDoTask then
            selfSay("You are not ready for {"..MISSION.name.."}.", cid)
        return false
        end
      
        if player:getStorageValue(MISSION.storageMission) == 1 then
            local isTaskDone = true
            if MISSION.monsters then
                for i = 1, #MISSION.monsters do
                    if player:getStorageValue(MISSION.monsters[i].storage) ~= MISSION.monsters[i].amount then
                        isTaskDone = false
                        break
                    end
                end
            end
          
            if MISSION.collectItems then
                for i = 1, #MISSION.collectItems do
                    if player:getItemCount(MISSION.collectItems[i].itemid) < MISSION.collectItems[i].amount then
                        isTaskDone = false
                        break
                    end
                end
            end
          
            if isTaskDone then
                if MISSION.monsters then
                    for i = 1, #MISSION.monsters do
                        player:setStorageValue(MISSION.monsters[i].storage, -1)
                    end
                end
              
                if MISSION.collectItems then
                    for i = 1, #MISSION.collectItems do
                        player:removeItem(MISSION.collectItems[i].itemid, MISSION.collectItems[i].amount)
                    end
                end
              
                if MISSION.exp then
                    player:addExperience(MISSION.exp)
                end
              
                if MISSION.rewardItems then
                    for i = 1, #MISSION.rewardItems do
                        player:addItem(MISSION.rewardItems[i].itemid, MISSION.rewardItems[i].amount, true)
                    end
                end
              
                selfSay(MISSION.messageTaskComplete, cid)
                player:setStorageValue(npcStorage, player:getStorageValue(npcStorage) + 1)
                player:setStorageValue(MISSION.storageMission, 2)
                return false
            end
      
            local text = "["..MISSION.name.."]: "
            if MISSION.monsters then
                for i = 1, #MISSION.monsters do
                    if i == #MISSION.monsters then
                        text = text.."("..player:getStorageValue(MISSION.monsters[i].storage).."/"..MISSION.monsters[i].amount..") "..MISSION.monsters[i].name.." "
                    else
                        text = text.."("..player:getStorageValue(MISSION.monsters[i].storage).."/"..MISSION.monsters[i].amount..") "..MISSION.monsters[i].name..", "
                    end
                end
            end
          
            if MISSION.collectItems then
                for i = 1, #MISSION.collectItems do
                    if i == #MISSION.collectItems then
                        text = text.."("..player:getItemCount(MISSION.collectItems[i].itemid).."/"..MISSION.collectItems[i].amount..") "..ItemType(MISSION.collectItems[i].itemid):getName().." "
                    else
                        text = text.."("..player:getItemCount(MISSION.collectItems[i].itemid).."/"..MISSION.collectItems[i].amount..") "..ItemType(MISSION.collectItems[i].itemid):getName()..", "
                    end
                end
            end
            selfSay(text, cid)
            return false
        end
          
          
        selfSay(MISSION.messageTaskInfo, cid)
        player:setStorageValue(MISSION.storageMission, 1)
        player:setStorageValue(npcStorage, player:getStorageValue(npcStorage) + 1)

        if MISSION.monsters then
            for i = 1, #MISSION.monsters do
                player:setStorageValue(MISSION.monsters[i].storage, 0)
            end
        end
    end
return true
end