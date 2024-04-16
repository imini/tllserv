function onUse(cid, item, frompos, item2, topos)
  
  saqpos = {x=737, y=210, z=5, stackpos=2}
  sawpos = {x=737, y=210, z=5}
  getsaq = getThingfromPos(saqpos)
  playerpos = getPlayerPosition(cid)
  
  if item.itemid == 1945 and getsaq.itemid == 4848 then
  doRemoveItem(getsaq.uid,1)
  doSendMagicEffect(sawpos,30)
  doTransformItem(item.uid,item.itemid+1)
  setPlayerStorageValue(cid,3079,1)
  
  elseif item.itemid == 1945 and getsaq.itemid ~= 4848 then
  doMoveCreature(cid,2)
  doSendMagicEffect(playerpos,10)
  
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)
  
  else
  doMovePlayer(cid,2)
  doSendMagicEffect(playerpos,10)
    end
  return 1
end

