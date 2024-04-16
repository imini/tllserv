function onUse(cid, item, frompos, item2, topos)

  newpos = {x=topos.x, y=topos.y, z=topos.z}
  access = getPlayerAccess(uid)
  
  if access ~= 0 then
  doTeleportThing(cid,newpos,1)
  else
  doPlayerSendCancel(cid,"You can not use this object.") 
  end
  return 1
  end
