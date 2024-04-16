function onUse(cid, item, frompos, item2, topos)

  playerpos = getPlayerPosition(cid)
  newpos = {x=468, y=59, z=6}
  
  if item.itemid == 3391 then
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  doSendMagicEffect(playerpos,10)
        
	else
	  doPlayerSay(cid,"You are not beautiful!",16)
	end
	return 1

	end