local TaskOpcode = 30
Tasks = {
globalTaskNum = 202020,
ResetCoins =0, -- price of reset task
stopCoins =0, -- price of stop task 
[1] = {
	monsters = {"Rat"}, 
	outfit = {type = 21},
	premium = false ,
	taskName= "Rat",
	type = "Items",
	diff = "Easy",
	itemid= 2152,
	count = 25,
	itemcount= 1,
	TaskCounter = 202021,
	stopStorage = 202022,
	repeatStorage = 202023,
	TaskNpcStorage = 202024,
 }, 
 [2] = {
	monsters = {"Spider"}, 
	outfit = {type = 30},
	premium = false ,
	taskName= "Spider",
	type = "Experience",
	diff = "Easy",
	reward = 80,
	count = 35,
	TaskCounter = 202025,
	stopStorage = 202026,
	repeatStorage = 202027,
	TaskNpcStorage = 202028,
 }, 
 [3] = {
	monsters = {"Snake"}, 
	outfit = {type = 28},
	premium = false ,

	taskName= "Snakes",
	type = "Experience",
	diff = "Easy",
	reward = 55,
	count = 35,
	TaskCounter = 202029,
	stopStorage = 202030,
	repeatStorage = 202031,
	TaskNpcStorage = 202032,
 }, 
 [4] = {
	monsters = {"Skeleton"}, 
	outfit = {type = 33},
	premium = false ,

	taskName= "Skeletons",
	type = "Experience",
	diff = "Medium",
	reward = 100,
	count = 10,
	TaskCounter = 202033,
	stopStorage = 202034,
	repeatStorage = 202035,
	TaskNpcStorage = 202036,
 }, --example for add new mission or task
 [5] = {
	monsters = {"Snake"},  -- monster name 
	outfit = {type = 155},--outfit id << what ever
	premium = false ,

	taskName= "Snake",
	type = "Experience",--type if it exp or items there are example for items up^ 
	diff = "Hard",--diffuculty just for filter.
	reward = 1000000,--exp reward 
	count = 200,--monster count 
	TaskCounter = 202037,--increase all these storages starting from last one 
	stopStorage = 202038,
	repeatStorage = 202039,
	TaskNpcStorage = 202040,
 }, 
}
function onExtendedOpcode(player, opcode, buffer)
	if opcode == 30 then
			local json_status, json_data =
			pcall(
			function()
			  return json.decode(buffer)
			end
		  )
		  if not json_status then
			print("SHOP json error: " .. json_data)
			return false
		  end

		  local action = json_data["action"]
		  local data = json_data["data"]
		  if not action or not data then
			return false
		  end


		if action then 
			if action == "getinfo" then 

				local tasksinfo = {}
				for i,v in pairs (Tasks) do 
					if type(v) == "table" then 
						if Tasks[i].type == data[1] then
							if data[2] == "All" or data[2] == Tasks[i].diff then 
								if  player:getStorageValue(Tasks[i].TaskNpcStorage) > 0 then 
									local t = {i,Tasks[i].taskName,Tasks[i].outfit}
									table.insert(tasksinfo,t)
								end
							end 
						end
					end 
				end 
				
				if player:getStorageValue(globalTaskNum) > 0 then 
					player:sendExtendedOpcode(TaskOpcode, json.encode({action = "Runningtask",data= player:getStorageValue(Tasks.globalTaskNum) }))
				end
				player:sendExtendedOpcode(TaskOpcode, json.encode({action = "info", data= tasksinfo }))
			elseif action == "getMonster" then
			
				local ttask = Tasks[tonumber(data)]
				-- print(Tasks[data].itemid)
			
				if (ttask.type == "Items") then
					ttask.item =  ItemType(Tasks[data].itemid):getClientId()
				end 
				ttask.id = tonumber(data)
				ttask.counted =tonumber(player:getStorageValue(ttask.TaskCounter))
				ttask.stoped =tonumber(player:getStorageValue(ttask.stopStorage))
				ttask.repeated =tonumber(player:getStorageValue(ttask.repeatStorage))
				ttask.playerpremium  = false
				ttask.Playercoins  = 100 --here you will change it to balance or money when you want it for money . <3 
				ttask.requiredResetCoin  = Tasks.ResetCoins
				ttask.requiredStopCoins  = Tasks.stopCoins
	
				player:sendExtendedOpcode(TaskOpcode, json.encode({action = "monsterinfo", data=ttask}))
			elseif action == "acceptTask" then
				if player:getStorageValue(Tasks.globalTaskNum) <= 0 then
					local task = Tasks[data]
					local checked = false 

					if (task.type == "Items" and player:getStorageValue(task.repeatStorage) <1) then 
						checked = true 
			
					elseif task.type == "Experience" and player:getStorageValue(task.repeatStorage) < 3 then
						checked = true
										
					end 
				
					if checked then 
						player:setStorageValue(Tasks.globalTaskNum,data)
						player:sendExtendedOpcode(TaskOpcode, json.encode({action = "acceptedTask",data = player:getStorageValue(Tasks.globalTaskNum)}))
					end
				end
			elseif action == "cancelTask" then
				if player:getStorageValue(Tasks.globalTaskNum)  > 0 then
					player:setStorageValue(Tasks.globalTaskNum,0)
					player:setStorageValue(Tasks[data].TaskCounter,0)
					player:sendExtendedOpcode(TaskOpcode, json.encode({action = "canceledTask",data=data}))
				end
				elseif action == "stopTask" then
				if player:getStorageValue(Tasks.globalTaskNum)  > 0 then
					player:setStorageValue(Tasks.globalTaskNum,0)
				
					player:removeMoney(Tasks.stopCoins)
					player:sendExtendedOpcode(TaskOpcode, json.encode({action = "StopedTask",data=data}))
				end
				elseif action == "resetTask" then
				local task = Tasks[data]
				if player:getStorageValue(task.repeatStorage)  ==  3 then
					player:setStorageValue(task.repeatStorage,0)
					player:setStorageValue(task.TaskCounter,0)
		
					player:removeMoney(Tasks.stopCoins)

					player:sendExtendedOpcode(TaskOpcode, json.encode({action = "resetedTask",data=data}))
				end

				
			end
		end
	end
end

function onKill(player, target)
	if player:getStorageValue(Tasks.globalTaskNum) <= 0 then 
		return false 
	end 
	local id = player:getStorageValue(Tasks.globalTaskNum)


	local task = Tasks[player:getStorageValue(Tasks.globalTaskNum)]

	local targetName = target:getName():lower()
	local found = false
	for _, element in ipairs(task.monsters) do
		if element:lower() == targetName then
			found = true
			break
		end
	end

     if target:isPlayer() or target:getMaster() then
         return true
     end
	 if	(found == false ) then return false end
     local stor = player:getStorageValue(task.TaskCounter)
	 if stor < 0 then
         player:setStorageValue(task.TaskCounter, 0)
		 stor = player:getStorageValue(task.TaskCounter)

     end
     if (stor+1 < task.count) then
         player:setStorageValue(task.TaskCounter, stor+1)
         player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Task message: '..(stor +1)..' of '..task.count..' '..target:getName()..'s killed.')
     end

	 if (stor+1) == task.count then
         player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Congratulations, you have killed '..(stor +1)..' '..target:getName()..'s and completed the '..task.taskName..'s mission.')
         player:setStorageValue(task.TaskCounter, stor +1)
		if task.type == "Items" then 
			local inbox =  player:getInbox() 
		local item = inbox:addItem(task.itemid,task.itemcount, INDEX_WHEREEVER, FLAG_NOLIMIT)
			player:setStorageValue(task.repeatStorage,1)
			player:setStorageValue(Tasks.globalTaskNum,0)
			local str = ""
			if task.itemcount > 1 then 
			 str =task.itemcount.." " ..item:getPluralName()
			else 
			 str = item:getName()
			end 
		 player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Congratulations, you have received '..str..' for complete the '..task.taskName..'s mission.')

		else
			if player:getStorageValue(task.repeatStorage) < 3 and player:getStorageValue(task.repeatStorage) >= 0 then 
				player:setStorageValue(task.repeatStorage,player:getStorageValue(task.repeatStorage)+1)
				player:setStorageValue(task.TaskCounter,0)

			elseif player:getStorageValue(task.repeatStorage) < 0 then 
				player:setStorageValue(task.repeatStorage,1)
				player:setStorageValue(task.TaskCounter,0)
				
			end 
			 player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Congratulations, you have received '..task.reward..' Experience for complete the '..task.taskName..'s mission.')

			player:addExperience(task.reward)
			player:setStorageValue(Tasks.globalTaskNum,0)
		end 
     end
	player:sendExtendedOpcode(TaskOpcode, json.encode({action = "Runningtask",data= player:getStorageValue(Tasks.globalTaskNum) }))

     
     return true
end
