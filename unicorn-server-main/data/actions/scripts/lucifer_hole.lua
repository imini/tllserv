function onUse(cid, item, frompos, item2, topos)
  rempos1 = {x=778, y=901, z=9, stackpos=1}
  rempos2 = {x=778, y=902, z=9, stackpos=1}
  newpos1 = {x=779, y=900, z=9}
  newpos2 = {x=779, y=901, z=9}
  holepos = {x=778, y=901, z=9}
  getrem1 = getThingfromPos(rempos1)
  getrem2 = getThingfromPos(rempos2)
  
  if item.uid == 7329 then
  doRemoveItem(getrem1.uid,1)
  doRemoveItem(getrem2.uid,1)
  doCreateItem(1742,1,newpos1)
  doCreateItem(1743,1,newpos2)
  doCreateItem(383,1,holepos)
    end
  return 1
end

