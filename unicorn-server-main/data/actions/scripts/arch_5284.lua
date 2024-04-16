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
  
  createpos1 = {x=216, y=195, z=14}
  createpos2 = {x=218, y=195, z=14}
  createpos3 = {x=216, y=197, z=14}
  createpos4 = {x=218, y=197, z=14}
  removepos1 = {x=216, y=195, z=14, stackpos=1}
  removepos2 = {x=218, y=195, z=14, stackpos=1}
  removepos3 = {x=216, y=197, z=14, stackpos=1}
  removepos4 = {x=218, y=197, z=14, stackpos=1}
  getremove1 = getThingfromPos(removepos1)
  getremove2 = getThingfromPos(removepos2)
  getremove3 = getThingfromPos(removepos3)
  getremove4 = getThingfromPos(removepos4)
  
  if item.itemid == 1945 and getsorcerer.itemid == 1946 then
  doTransformItem(item.uid,item.itemid+1)
  doCreateItem(415,1,createpos1)
  doCreateItem(415,1,createpos2)
  doCreateItem(415,1,createpos3)
  doCreateItem(415,1,createpos4)
  doRemoveItem(getremove1.uid,1)
  doRemoveItem(getremove2.uid,1)
  doRemoveItem(getremove3.uid,1)
  doRemoveItem(getremove4.uid,1)
  doSendMagicEffect(createpos1,15)
  doSendMagicEffect(createpos2,15)
  doSendMagicEffect(createpos3,15)
  doSendMagicEffect(createpos4,15)
  
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

