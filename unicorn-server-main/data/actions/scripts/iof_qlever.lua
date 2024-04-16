function onUse(cid, item, frompos, item2, topos)

  stor1 = getPlayerStorageValue(cid,4196)
  stor2 = getPlayerStorageValue(cid,4197)
  stor3 = getPlayerStorageValue(cid,4198)
  newpos = {x=422, y=523, z=9}
  wrongpos = {x=422, y=526, z=10}
  
  if item.itemid == 1945 and stor1 == 1 then
  doTransformItem(item.uid,1946)
  doSendMagicEffect(topos,15)
  setPlayerStorageValue(cid,4199,1)
  
  elseif item.itemid == 1945 and stor2 == 1 then
  doTransformItem(item.uid,1946)
  doSendMagicEffect(topos,8)
  setPlayerStorageValue(cid,4200,1)
  
  elseif item.itemid == 1945 and stor3 == 1 then
  doTransformItem(item.uid,1946)
  doSendMagicEffect(topos,11)
  setPlayerStorageValue(cid,4196,-1)
  setPlayerStorageValue(cid,4197,-1)
  setPlayerStorageValue(cid,4198,-1)
  setPlayerStorageValue(cid,4199,-1)
  setPlayerStorageValue(cid,4200,-1)
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,17)
  doCreatureSay(cid,"Grab your reward, but never ever return again.")
  
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,1945)
  
  elseif stor == -1 then
  doCreatureSay(cid,"You are not welcome here.")
  doTeleportThing(cid,wrongpos,0)
  doSendMagicEffect(wrongpos,10)

	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return 1
end