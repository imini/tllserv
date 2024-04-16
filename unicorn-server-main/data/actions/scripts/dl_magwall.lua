function onUse(cid, item, frompos, item2, topos)

  humanpos = {x=167, y=161, z=3, stackpos=253}
  leverpos = {x=170, y=159, z=3, stackpos=3}
  tilepos = {x=170, y=161, z=3}
  gettile = getThingfromPos(tilepos)
  newpos = {x=165, y=169, z=3}
  leverpos1 = {x=170, y=159, z=3}
  gethuman = getThingfromPos(humanpos)
  getlever = getThingfromPos(leverpos)
  
  if item.itemid == 1945 and gethuman.itemid > 0 and gettile.itemid == 425 then
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  doRemoveItem(getlever.uid,1)
  doSendMagicEffect(leverpos1,13)
  
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)
  else
  doTransformItem(item.uid,item.itemid+1)
    end
  return 1
end

