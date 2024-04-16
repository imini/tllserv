function onLogin(player)
	local serverName = configManager.getString(configKeys.SERVER_NAME)
	local loginStr = "Welcome to " .. serverName .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Your last visit in %s: %s.", serverName, os.date("%d %b %Y %X", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local value = player:getStorageValue(PlayerStorageKeys.promotion)
		if value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end
	
-- Activate Custom Item Attributes
for i = 1,10 do -- CONST_SLOT_FIRST,CONST_SLOT_LAST
    local item = player:getSlotItem(i)
    if item then
        itemAttributes(player, item, i, true)
    end
end
-- If player logged with more 'current health' than their db 'max health' due to an item attribute
local query = db.storeQuery("SELECT `health`,`mana` FROM players where `id`="..player:getGuid())
if query then
    local health = tonumber(result.getDataString(query, 'health'))
    local mana = tonumber(result.getDataString(query, 'mana'))
    local playerHealth = player:getHealth()
    local playerMana = player:getMana()
    if playerHealth < health then
        player:addHealth(health - playerHealth)
    end
    if playerMana < mana then
        player:addMana(mana - playerMana)
    end
    result.free(query)
end

	-- Events
	player:registerEvent("taskopcode")
	player:registerEvent("taskkill")
	player:registerEvent("PlayerDeath")
	player:registerEvent("rollHealth")
	player:registerEvent("rollMana")
	player:registerEvent("DropLoot")
	return true
end
