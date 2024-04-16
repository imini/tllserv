function onUse(cid, item, frompos, item2, topos)


if getPlayerStorageValue(cid,3908) == -1 then
 if getGlobalStorageValue(13907) == 1 then
	if getPlayerFreeCap(cid) < 2 then
	doPlayerSendTextMessage(cid,22,"You have found a parchment that weighs 2 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3908,1)
	parchment = doPlayerAddItem(cid,1967,1)
	doSetItemActionId(parchment,3438)
  doSetItemText(parchment,"... winding ... to ... confusion                     Its ... unlocked ... the ... rain                         ... left ... reverse ...                                   Where ... content ... be ...")
	doPlayerSendTextMessage(cid,22,"You have found a parchment that bears the royal insignia.")
	setGlobalStorageValue(13907,-1)
	end
else
doPlayerSendTextMessage(cid,22,"You have found a secret compartment, but it won't open. It seems to need a vocal combination password.")
end
else
doPlayerSendTextMessage(cid,22,"The secret compartment is empty.")
end
return 1
end
