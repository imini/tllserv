function onUse(cid, item, frompos, item2, topos)
  newpos = {x=147, y=329, z=9}
  mirrorpos = {x=140, y=296, z=8, stackpos=2}
  mirrorposs = {x=140, y=296, z=8}
  gettape = getThingfromPos(mirrorpos)
  
  if item.itemid == 1871 then
  doTransformItem(item.uid,1844)
  doCreateItem(1871,1,mirrorposs)
  
  elseif item.itemid == 1844 then
  doTeleportThing(cid,newpos,0)
  doCreatureSay(cid,"Beauty has to be rewarded. Muhahahaha!",16)
  doRemoveItem(gettape.uid,1)
  doSendMagicEffect(newpos,10)
  doTransformItem(item.uid,1871)
 
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
    end
  return 1
end

