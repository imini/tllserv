function onUse(cid, item, frompos, item2, topos)
	jailpos = {x=300,y=330,z=7}
	target = cid
	hours = 1
	if (getPlayerAccess(cid) < 1) then
		return 0
	end
	topos = {x=topos.x, y=topos.y, z=topos.z, stackpos=253}
	target = getThingfromPos(topos)
	target = target.uid
	if (target == 0) then
		doPlayerSendTextMessage(cid,22,"You may ban only players.")
		return 1
	end

	if isPlayer(target) == 1 then
		if (getPlayerStorageValue(target,2900) == 1) then
			setPlayerStorageValue(target,2900,0)
			doPlayerSendTextMessage(cid,22,"You have unbanned the player.")
			return 1
		end
		doTeleportThing(target,jailpos,0)
		if (hours == 1) then
			doPlayerSendTextMessage(target,22,"Welcome to the jail! You have been jailed for " .. hours .. " hour.")
		else
			doPlayerSendTextMessage(target,22,"Welcome to the jail! You have been jailed for " .. hours .. " hours.")
		end
		doSendMagicEffect(topos,2)
		doSendMagicEffect(topos,14)
		doSendMagicEffect(jailpos,10)
		setPlayerStorageValue(target,2900,1)
		setPlayerStorageValue(target,2901,os.time()+(hours*60*60))
		setPlayerStorageValue(target,2902,getPlayerTown(cid))
	else
		doPlayerSendTextMessage(cid,22,"You may ban only players.")
		return 1
	end
	return 1
end