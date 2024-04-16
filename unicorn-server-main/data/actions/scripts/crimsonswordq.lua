function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3928) == -1 then
	if getPlayerFreeCap(cid) < 36 then
	doPlayerSendTextMessage(cid,22,"You don't have enough cap to pick up the crimson sword. It weighs 36 oz.")	
	else
	setPlayerStorageValue(cid,3928,1)
	doPlayerAddItem(cid,7385,1)
  doRemoveItem(item.uid,1)
  doSendMagicEffect(topos,14)
	doPlayerSendTextMessage(cid,22,"You have found a crimson sword.")
	end
else
doPlayerSendTextMessage(cid,22,"You have already taken the crimson sword.")
end
return 1
end
