function onUse(cid, item, frompos, item2, topos)
	rabbit = {x=250, y=130, z=14, stackpos=2}
	rabbitpos = {x=250, y=130, z=14}
	getrabbit = getThingfromPos(rabbit)
	random = math.random(1, 9)
	playerpos = getPlayerPosition(cid)

	if random > 8 and item.itemid == 1945 then
	doSendMagicEffect(rabbitpos,15)
	doRemoveItem(getrabbit.uid,1)
	doCreateItem(2355,1,rabbit)
	setPlayerStorageValue(cid,7800,1)
	doSendMagicEffect(playerpos,13)
	doTransformItem(item.uid,item.itemid+1)

	elseif random < 9 and item.itemid == 1945 then
	doSendMagicEffect(rabbitpos,14)
	doRemoveItem(getrabbit.uid,1)
	doCreateItem(2362,1,rabbit)
	doTransformItem(item.uid,item.itemid+1)

	elseif random < 10 and item.itemid == 1946 then
	doTransformItem(item.uid,item.itemid-1)
	doRemoveItem(getrabbit.uid,1)
	doCreateItem(2662,1,rabbit)
	doSendMagicEffect(playerpos,15)
	doCreatureAddHealth(cid,-300)
	doSendAnimatedText(playerpos,300,180)

	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return 1
end