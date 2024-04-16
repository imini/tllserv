function onUse(cid, item, frompos, item2, topos)
leverposs = {x=90, y=252, z=11}
createpos = {x=103, y=252, z=11}
newpos = {x=139, y=320, z=13}
  leverpos = {x=90, y=252, z=11, stackpos=1}
  stonepos = {x=101, y=252, z=11, stackpos=1}
  getstone = getThingfromPos(stonepos)
  teleportpos = {x=103, y=252, z=11}
  getlever = getThingfromPos(leverpos)
  if item.itemid == 1945 then
  doRemoveItem(getstone.uid,1)
  doRemoveItem(getlever.uid,1)
  doSendMagicEffect(leverposs,13)
  doCreateTeleport(1387, newpos, createpos)
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
    end
  return 1
end

