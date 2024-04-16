function onUse(cid, item, frompos, item2, topos)
	
	playerpos5 = {x=720, y=463, z=8}
	playerpos6 = {x=722, y=480, z=8}
	playerpos7 = {x=702, y=479, z=8}
	playerpos8 = {x=702, y=463, z=8}
	
player1pos = {x=720, y=463, z=8, stackpos=253}
		player1 = getThingfromPos(player1pos)
		player2pos = {x=722, y=480, z=8, stackpos=253}
		player2 = getThingfromPos(player2pos)
		player3pos = {x=702, y=479, z=8, stackpos=253}
		player3 = getThingfromPos(player3pos)
		player4pos = {x=702, y=463, z=8, stackpos=253}
		player4 = getThingfromPos(player4pos)
newpos1 = {x=709, y=472, z=9}
				newpos2 = {x=708, y=471, z=9}
				newpos3 = {x=707, y=472, z=9}
				newpos4 = {x=708, y=473, z=9}
  if player1.itemid > 0 and player2.itemid > 0 and item.itemid == 1945 and player3.itemid > 0 and player4.itemid > 0 then
  doSendMagicEffect(playerpos5,10)
  doSendMagicEffect(playerpos6,10)
  doSendMagicEffect(playerpos7,10)
  doSendMagicEffect(playerpos8,10)
  doTeleportThing(player1.uid,newpos1,0)
  doTeleportThing(player2.uid,newpos2,0)
  doTeleportThing(player3.uid,newpos3,0)
  doTeleportThing(player4.uid,newpos4,0)
  doSendMagicEffect(newpos1,10)
  doSendMagicEffect(newpos2,10)
  doSendMagicEffect(newpos3,10)
  doSendMagicEffect(newpos4,10)
  doTransformItem(item.uid,1946)
  
  elseif item.itemid == 1945 then
  doTransformItem(item.uid,1945)
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
  end
  return 1
  end
	