function onUse(cid, item, frompos, item2, topos)

transformpos = {x=609, y=687, z=7}
stair = {x=609, y=687, z=7, stackpos=1}
storage1 = getPlayerStorageValue(cid,3800)
storage2 = getPlayerStorageValue(cid,3801)
storage3 = getPlayerStorageValue(cid,3802)

  if item.itemid == 1304 and storage1 == 1 and storage2 == 1 and storage3 == 1 and item.uid == 9000 then
    doTransformItem(item.uid,3687)
    doSendMagicEffect(transformpos,4)
  
  elseif item.itemid == 1304 and storage1 == -1 and storage2 == -1 and storage3 == -1 and item.uid == 9000 then
    doSendMagicEffect(transformpos,12)
    setPlayerStorageValue(cid,3803,1)
    
  elseif item.itemid == 1304 and storage1 == 1 and storage2 == -1 and storage3 == -1 and item.uid == 9000 then
    doSendMagicEffect(transformpos,13)
    setPlayerStorageValue(cid,3804,1)
 
  elseif item.itemid == 1304 and storage1 == 1 and storage2 == 1 and storage3 == -1 and item.uid == 9000 then
    doSendMagicEffect(transformpos,14)
    setPlayerStorageValue(cid,3805,1)
    
	else
	  doPlayerSay(cid,"Why not walk it?",16)
	end
	return 1

	end