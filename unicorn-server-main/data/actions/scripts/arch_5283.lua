function onUse(cid, item, frompos, item2, topos)
  druid = {x=215, y=194, z=14, stackpos=1}
  knight = {x=215, y=198, z=14, stackpos=1}
  sorcerer = {x=219, y=194, z=14, stackpos=1}
  paladin = {x=219, y=198, z=14, stackpos=1}
  getdruid = getThingfromPos(druid)
  getknight = getThingfromPos(knight)
  getsorcerer = getThingfromPos(sorcerer)
  getpaladin = getThingfromPos(paladin)
  newpos = {x=208, y=211, z=15}
  playerpos = getPlayerPosition(cid)
  
  if item.itemid == 1945 and getknight.itemid == 1946 then
  doTransformItem(item.uid,item.itemid+1)
  
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)
 
  else
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,10)
  doSendMagicEffect(playerpos,10)
  doTransformItem(item.uid,1945)
    end
  return 1
end

