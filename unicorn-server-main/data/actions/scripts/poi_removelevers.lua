
function onUse(cid, item, frompos, item2, topos)
  lever = {x=topos.x, y=topos.y, z=topos.z, stackpos=1}
  leverpos = {x=topos.x, y=topos.y, z=topos.z}
  getlever = getThingfromPos(lever)
  
  if item.itemid == 1945 then
  doRemoveItem(getlever.uid,1)
  doSendMagicEffect(leverpos,13)
 
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
    end
  return 1
end

