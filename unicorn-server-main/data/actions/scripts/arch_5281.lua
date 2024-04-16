function onUse(cid, item, frompos, item2, topos)
  druid = {x=215, y=194, z=14, stackpos=1}
  knight = {x=215, y=198, z=14, stackpos=1}
  sorcerer = {x=219, y=194, z=14, stackpos=1}
  paladin = {x=219, y=198, z=14, stackpos=1}
  getdruid = getThingfromPos(druid)
  getknight = getThingfromPos(knight)
  getsorcerer = getThingfromPos(sorcerer)
  getpaladin = getThingfromPos(paladin)
  
  if item.itemid == 1945 then
  doTransformItem(item.uid,item.itemid+1)
  
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)
 
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
    end
  return 1
end

