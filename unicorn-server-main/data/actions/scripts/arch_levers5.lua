
function onUse(cid, item, frompos, item2, topos)
  pillar = {x=204, y=205, z=10, stackpos=1}
  leverposs = {x=topos.x, y=topos.y, z=topos.z}
  leverpos = {x=topos.x, y=topos.y, z=topos.z, stackpos=1}
  getlever = getThingfromPos(leverpos)
  getpillar = getThingfromPos(pillar)
  
  if item.itemid == 1945 then
  doRemoveItem(getlever.uid,1)
  doSendMagicEffect(leverposs,13)
  doRemoveItem(getpillar.uid,1)
 
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
    end
  return 1
end

