function onUse(cid, item, frompos, item2, topos)
  newpos = {x=772, y=771, z=8}
  doorpos = {x=772, y=771, z=8, stackpos=1}
  getdoor = getThingfromPos(doorpos)
  if item.uid == 7545 then
  doTransformItem(getdoor.uid,5102)
   doTeleportThing(cid,newpos,0)
    end
  return 1
end

