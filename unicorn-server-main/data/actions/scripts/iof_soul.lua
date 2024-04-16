function onUse(cid, item, frompos, item2, topos)

stor1 = getPlayerStorageValue(cid,2051)
pos = getPlayerPosition(cid)
stor2 = getPlayerStorageValue(cid,2054)
stor3 = getPlayerStorageValue(cid,2056)
newpos = {x=422, y=523, z=9}
stonepos = {x=423, y=491, z=10, stackpos=1}
getstone = getThingfromPos(stonepos)

  if item.uid == 7058 and item.itemid == 1945 and stor1 == -1 and stor2 == -1 and stor3 == -1 then
        setPlayerStorageValue(cid,2052,1)
	doSendMagicEffect(pos,2)
	doCreatureSay(cid,"Your soul lacks the spirit of fire!",16)
	doTransformItem(item.uid,item.itemid+1)

  elseif item.uid == 7058 and item.itemid == 1946 then
	doTransformItem(item.uid,item.itemid-1)

  elseif item.uid == 7058 and item.itemid == 1945 and stor1 == 1 and stor2 == -1 and stor3 == -1 then
	doSendMagicEffect(pos,2)
	setPlayerStorageValue(cid,2053,1)
	doCreatureSay(cid,"Your soul lacks the spirit of poison!",16)
	doTransformItem(item.uid,item.itemid+1)

  elseif item.uid == 7058 and item.itemid == 1945 and stor2 == 1 and stor1 == 1 and stor3 == -1 then
 	doSendMagicEffect(pos,2)
	setPlayerStorageValue(cid,2055,1)
	doCreatureSay(cid,"Your soul lacks the spirit of energy!",16)
	doTransformItem(item.uid,item.itemid+1)

  elseif item.uid == 7058 and item.itemid == 1945 and stor1 == 1 and stor2 == 1 and stor3 == 1 then 
        doTeleportThing(cid,newpos,0)
	doSendMagicEffect(newpos,10)
	doSendMagicEffect(pos,2)
	doRemoveItem(getstone.uid,1)
	doTransformItem(item.uid,item.itemid+1)
	setPlayerStorageValue(cid,4300,-1)
		
    else
	doSendMagicEffect(pos,2)
    end
  return 1
end