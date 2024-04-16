function onUse(cid, item, frompos, item2, topos)

	playerpos1 = {x=931, y=366, z=13, stackpos=253}
	playerpos2 = {x=930, y=366, z=13, stackpos=253}
	playerpos3 = {x=929, y=366, z=13, stackpos=253}
	playerpos4 = {x=928, y=366, z=13, stackpos=253}
	
	playerpos5 = {x=931, y=366, z=13}
	playerpos6 = {x=930, y=366, z=13}
	playerpos7 = {x=929, y=366, z=13}
	playerpos8 = {x=928, y=366, z=13}
	
	getplayer1 = getThingfromPos(playerpos1)
	getplayer2 = getThingfromPos(playerpos2)
	getplayer3 = getThingfromPos(playerpos3)
	getplayer4 = getThingfromPos(playerpos4)

  newpos1 = {x=871, y=397, z=15}
	newpos2 = {x=870, y=397, z=15}
	newpos3 = {x=869, y=397, z=15}
	newpos4 = {x=868, y=397, z=15}
			
	monster1 = {x=872, y=397, z=15}
	monster2 = {x=873, y=397, z=15}

  if getplayer1.itemid > 0 and getplayer2.itemid > 0 and item.itemid == 1945 and getplayer3.itemid > 0 and getplayer4.itemid > 0 then
  doSendMagicEffect(playerpos5,10)
  doSendMagicEffect(playerpos6,10)
  doSendMagicEffect(playerpos7,10)
  doSendMagicEffect(playerpos8,10)
  doTeleportThing(getplayer1.uid,newpos1,0)
  doTeleportThing(getplayer2.uid,newpos2,0)
  doTeleportThing(getplayer3.uid,newpos3,0)
  doTeleportThing(getplayer4.uid,newpos4,0)
  doSendMagicEffect(newpos1,10)
  doSendMagicEffect(newpos2,10)
  doSendMagicEffect(newpos3,10)
  doSendMagicEffect(newpos4,10)
  doSummonCreature("Demon",monster1)
  doSummonCreature("Demon",monster2)
  doTransformItem(item.uid,1946)
  setPlayerStorageValue(cid,9655,-1)
  setPlayerStorageValue(cid,9654,1)
  
  elseif item.itemid == 1946 then
  doPlayerSay(cid,"It is stuck.",16)
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
  end
  return 1
  end
	