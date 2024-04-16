function onUse(cid, item, frompos, item2, topos)

if getGlobalStorageValue(13906) == 1 then
 if getPlayerStorageValue(cid,3907) == -1 then
	if getPlayerFreeCap(cid) < 2 then
	doPlayerSendTextMessage(cid,22,"You have found a parchment that weighs 2 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3907,1)
	parchment = doPlayerAddItem(cid,1967,1)
	doSetItemActionId(parchment,3437)
  doSetItemText(parchment,"A ... staircase ... indicate ...                           ... bottom ... with ... cloudless ...                Zed ... a ... delusion                                          ... the ... shall ... drained")
	doPlayerSendTextMessage(cid,22,"You have found a parchment that bears the royal insignia.")
	setGlobalStorageValue(13906,-1)
	end
else
doPlayerSendTextMessage(cid,22,"The secret compartment is empty.")
end
else
doPlayerSendTextMessage(cid,22,"You have found a secret compartment, but it won't open. It seems to need a vocal combination password.")
end
return 1
end
