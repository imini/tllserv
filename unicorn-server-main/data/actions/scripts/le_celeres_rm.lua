function onUse(cid, item, frompos, item2, topos)

newpos = {x=957, y=337, z=9}
playerpos = getPlayerPosition(cid)

  if item.uid == 7077 then
	doTeleportThing(cid,newpos,0)
	doSendMagicEffect(playerpos,6)
	doSendMagicEffect(newpos,6)
    else
      doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
    end
  return 1
end

