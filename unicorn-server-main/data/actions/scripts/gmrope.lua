function onUse(cid, item, frompos, item2, topos)

  newpos = {x=topos.x, y=topos.y+1, z=topos.z-1}
  access = getPlayerAccess(uid)
  
  if access ~= 1 then
  doTeleportThing(cid,newpos,0)
  else
  doPlayerSendCancel(cid,"You can not use this object.") 
  end
  return 0
  end
