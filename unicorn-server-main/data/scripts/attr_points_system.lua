local ATTRWINDOW_CLIENTSIDE, ATTRWINDOW_SERVERSIDE = 223, 224

local function sendJSON(player, action, data)
	local msg = NetworkMessage()
	msg:addByte(50)
	msg:addByte(ATTRWINDOW_SERVERSIDE)
	msg:addString(json.encode({action = action, data = data}))
	msg:sendToPlayer(player)
end

local attrWindowOpcode = CreatureEvent("attrWindowOpcode")
function attrWindowOpcode.onExtendedOpcode(player, opcode, buffer)
	if opcode == ATTRWINDOW_CLIENTSIDE then
		onAttrWindowCallback(player, opcode, buffer)
	end
end

function onAttrWindowCallback(player, opcode, buffer)
	local status, json_data = pcall(function() return json.decode(buffer) end)
	if not status then return false end
	local action = json_data['action']
	local data = json_data['data']

	if action == "resetAttributes" then
		player:resetAttributes()
		player:sendAttributeData()
		return
	elseif action == "raiseAttribute" then
		player:raiseAttribute(data.skillId)
		return
	end
end

attrWindowOpcode:register()

function Player.resetAttributes(self)
	-- We return the points to the final user first.
	local spentPoints = self:getSpentAttrPoints(self:getStrPoints()) + self:getSpentAttrPoints(self:getConstPoints()) + self:getSpentAttrPoints(self:getDexPoints()) + self:getSpentAttrPoints(self:getIntPoints()) + self:getSpentAttrPoints(self:getWisdomPoints()) + self:getSpentAttrPoints(self:getChaPoints())
	self:addAttrPoints(spentPoints)

	-- Reset part
	self:removeStrPoints(self:getStrPoints())
	self:removeConstPoints(self:getConstPoints())
	self:removeDexPoints(self:getDexPoints())
	self:removeIntPoints(self:getIntPoints())
	self:removeWisdomPoints(self:getWisdomPoints())
	self:removeChaPoints(self:getChaPoints())

	-- You can add a message here:
	-- sendJSON(self, "sendMessage", {message = "Example message."})
return
end

attrLevelTable = {
	[1] = {
		fromLevel = 0,
		toLevel = 30,
		pointsToRemove = 1,
	},
	[2] = {
		fromLevel = 31,
		toLevel = 60,
		pointsToRemove = 2,
	},
	[3] = {
		fromLevel = 61,
		toLevel = 90,
		pointsToRemove = 3,
	},
	[4] = {
		fromLevel = 91,
		toLevel = 99,
		pointsToRemove = 4,
	}
} 

function Player.getSpentAttrPoints(self, actualLevel)
	local pointsToAdd = 0
	if (actualLevel == 0) then
		return 0
	end
	
	for i = 1, actualLevel do
		for t = 1, #attrLevelTable do
			if ((i >= attrLevelTable[t].fromLevel) and (i <= attrLevelTable[t].toLevel)) then
				pointsToAdd = pointsToAdd + attrLevelTable[t].pointsToRemove
			end	
		end
	end
	return pointsToAdd
end

function Player.getRequiredAttrPoints(self, nextLevel)
	local pointsToRemove = 0
	for i = 1, #attrLevelTable do
		if ((nextLevel >= attrLevelTable[i].fromLevel) and (nextLevel <= attrLevelTable[i].toLevel)) then
			pointsToRemove = attrLevelTable[i].pointsToRemove
		end		
	end
return pointsToRemove
end

function Player.raiseAttribute(self, attrId)
	if (self:getAttrPoints() < 1) then
		sendJSON(self, "sendErrorMessage", {message = "You don't have enough attr points to upgrade this attribute."})
		return
	end
	
	-- It detects the skill and then it gets raised
	if attrId == 1 then
		requiredPoints = self:getRequiredAttrPoints(self:getStrPoints() + 1)
		if (self:getAttrPoints() < requiredPoints) then
			sendJSON(self, "sendErrorMessage", {message = "You don't have enough attr points to upgrade this attribute."})
		return end
	
		self:removeAttrPoints(requiredPoints)
		self:addStrPoints(1)
	elseif attrId == 2 then
		requiredPoints = self:getRequiredAttrPoints(self:getConstPoints() + 1)
		if (self:getAttrPoints() < requiredPoints) then
			sendJSON(self, "sendErrorMessage", {message = "You don't have enough attr points to upgrade this attribute."})
		return end
		
		self:removeAttrPoints(requiredPoints)
		self:addConstPoints(1)
	elseif attrId == 3 then
		requiredPoints = self:getRequiredAttrPoints(self:getDexPoints() + 1)
		if (self:getAttrPoints() < requiredPoints) then
			sendJSON(self, "sendErrorMessage", {message = "You don't have enough attr points to upgrade this attribute."})
		return end
		
		self:removeAttrPoints(requiredPoints)
		self:addDexPoints(1)
	elseif attrId == 4 then
		requiredPoints = self:getRequiredAttrPoints(self:getIntPoints() + 1)
		if (self:getAttrPoints() < requiredPoints) then
			sendJSON(self, "sendErrorMessage", {message = "You don't have enough attr points to upgrade this attribute."})
		return end

		self:removeAttrPoints(requiredPoints)
		self:addIntPoints(1)
	elseif attrId == 5 then
		requiredPoints = self:getRequiredAttrPoints(self:getWisdomPoints() + 1)
		if (self:getAttrPoints() < requiredPoints) then
			sendJSON(self, "sendErrorMessage", {message = "You don't have enough attr points to upgrade this attribute."})
		return end
	
		self:removeAttrPoints(requiredPoints)
		self:addWisdomPoints(1)
	elseif attrId == 6 then
		requiredPoints = self:getRequiredAttrPoints(self:getChaPoints() + 1)
		if (self:getAttrPoints() < requiredPoints) then
			sendJSON(self, "sendErrorMessage", {message = "You don't have enough attr points to upgrade this attribute."})
		return end
		
		self:removeAttrPoints(requiredPoints)
		self:addChaPoints(1)
	end
	
	-- Reload and bye
	self:sendAttributeData()
end

function Player.sendAttributeData(self)
	local attrData = {
		attrs = {
			strPoints = self:getStrPoints(),
			constPoints = self:getConstPoints(),
			dexPoints = self:getDexPoints(),
			intPoints = self:getIntPoints(),
			wisdomPoints = self:getWisdomPoints(),
			chaPoints = self:getChaPoints()
		},
		
		attrPoints = self:getAttrPoints()
	}

    sendJSON(self, "sendAttributeData", attrData)
return true
end

attrPlayerLevelTable = {
	[1] = {
		fromLevel = 1,
		toLevel = 30,
		pointsToDistribute = 3,
	},
	[1] = {
		fromLevel = 31,
		toLevel = false,
		pointsToDistribute = 4,
	},
	-- You need to add your stages here
} 

local toLevel = false -- Assuming it should be a boolean variable
function Player.getLevelUpAttrPointsAmount(self, nextLevel)
	local pointsToAdd = 0
	for i = 1, #attrPlayerLevelTable do
		if toLevel == false then
			if (attrPlayerLevelTable[i].fromLevel >= nextLevel) then
				pointsToAdd = attrPlayerLevelTable[i].pointsToDistribute
			end	
		else
			if ((attrPlayerLevelTable[i].fromLevel >= nextLevel) and (attrPlayerLevelTable[i].toLevel <= nextLevel)) then
				pointsToAdd = attrPlayerLevelTable[i].pointsToDistribute
			end	
		end
	end
return pointsToAdd
end

-- Creaturescript onAdvance
local advanceAttrPoints = CreatureEvent("attrPointsAdvances")
function advanceAttrPoints.onAdvance(player, skill, oldLevel, newLevel)
	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end
	
	if player:getStorageValue(12450) < newLevel then
		player:addAttrPoints(player:getLevelUpAttrPointsAmount(newLevel))
		player:setStorageValue(12450, newLevel) -- We make sure that the player has the storage

		player:save()
		player:sendAttributeData() -- We refresh the window
	end
return true
end
advanceAttrPoints:register()

local attrWindowLogin = CreatureEvent("attrWindowLogin")
function attrWindowLogin.onLogin(player)
	player:sendAttributeData()
	player:registerEvent("attrWindowOpcode")
	player:registerEvent("attrPointsAdvances")
return true
end
attrWindowLogin:register()