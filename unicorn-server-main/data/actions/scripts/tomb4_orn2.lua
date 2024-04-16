function onUse(cid, item, frompos, item2, topos)
  wallpos = {x=371, y=61, z=11, stackpos=1}
  createpos = {x=371, y=61, z=11}
  humanpos = {x=371, y=61, z=11, stackpos=253}
  newpos = {x=371, y=60, z=11}
  getwall = getThingfromPos(wallpos)
  gethuman = getThingfromPos(humanpos)

  if getwall.itemid == 1061 then
  doRemoveItem(getwall.uid,1)
  
  elseif gethuman.itemid > 0 then
  doMoveCreature(gethuman.uid,0)
   doCreateItem(1061,1,createpos)
  else
  doCreateItem(1061,1,createpos)
    end
  return 1
end

