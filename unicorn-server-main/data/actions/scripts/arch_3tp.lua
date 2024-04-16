function onUse(cid, item, frompos, item2, topos)
  player1 = {x=231, y=331, z=10, stackpos=253}
  player2 = {x=232, y=331, z=10, stackpos=253}
  player3 = {x=233, y=331, z=10, stackpos=253}
  player4 = {x=231, y=331, z=10}
  player5 = {x=232, y=331, z=10}
  player6 = {x=233, y=331, z=10}
  newpos = {x=228, y=305, z=11}
  getplayer1 = getThingfromPos(player1)
  getplayer2 = getThingfromPos(player2)
  getplayer3 = getThingfromPos(player3)
  wrongpos = {x=228, y=308, z=11}
  
  if item.itemid == 1945 and getplayer1.itemid > 0 and getplayer2.itemid > 0 and getplayer3.itemid > 0 then
  doTeleportThing(getplayer1.uid,newpos,0)
  doTeleportThing(getplayer2.uid,newpos,0)
  doTeleportThing(getplayer3.uid,newpos,0)
  doSendMagicEffect(newpos,10)
  doSendMagicEffect(player4,17)
  doSendMagicEffect(player5,17)
  doSendMagicEffect(player6,17)
  doTransformItem(item.uid,item.itemid+1)
  
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)
  doTeleportThing(cid,wrongpos,0)
  doSendMagicEffect(wrongpos,10)
 
  else
  doCreatureSay(cid,"The mechanism seems not correctly adjusted.",16)
    end
  return 1
end

