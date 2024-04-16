function onUse(cid, item, frompos, item2, topos)

newpos = {x=855, y=583, z=9}
playerpos = getPlayerPosition(cid)

  if item.uid == 7078 then
	doTeleportThing(cid,newpos,0)
	doSendMagicEffect(playerpos,6)
	doSendMagicEffect(newpos,6)
    else
      doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
    end
  return 1
end

