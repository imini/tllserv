function onUse(cid, item, frompos, item2, topos)

	playerpos1 = {x=881, y=705, z=15, stackpos=253}
	playerpos2 = {x=880, y=705, z=15, stackpos=253}
	playerpos3 = {x=879, y=705, z=15, stackpos=253}
	
	playerpos5 = {x=881, y=705, z=15}
	playerpos6 = {x=880, y=705, z=15}
	playerpos7 = {x=879, y=705, z=15}
	
	getplayer1 = getThingfromPos(playerpos1)
	getplayer2 = getThingfromPos(playerpos2)
	getplayer3 = getThingfromPos(playerpos3)

  newpos1 = {x=891, y=707, z=15}
	newpos2 = {x=891, y=706, z=15}
	newpos3 = {x=891, y=705, z=15}
			
	monster1 = {x=891, y=709, z=15}
	monster2 = {x=891, y=708, z=15}

  if getplayer1.itemid > 0 and getplayer2.itemid > 0 and item.itemid == 1945 and getplayer3.itemid > 0 then
  doSendMagicEffect(playerpos5,10)
  doSendMagicEffect(playerpos6,10)
  doSendMagicEffect(playerpos7,10)
  doTeleportThing(getplayer1.uid,newpos1,0)
  doTeleportThing(getplayer2.uid,newpos2,0)
  doTeleportThing(getplayer3.uid,newpos3,0)
  doSendMagicEffect(newpos1,10)
  doSendMagicEffect(newpos2,10)
  doSendMagicEffect(newpos3,10)
  doSummonCreature("Fire Devil",monster1)
  doSummonCreature("Fire Devil",monster2)
  doTransformItem(item.uid,1946)
  setPlayerStorageValue(cid,9658,-1)
  setPlayerStorageValue(cid,9657,1)
  
  elseif item.itemid == 1946 then
  doPlayerSay(cid,"It is stuck.",16)
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
  end
  return 1
  end
	