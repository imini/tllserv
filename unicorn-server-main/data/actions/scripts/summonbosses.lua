function onUse(cid, item, frompos, item2, topos)

summonPosition1 = {x=721,y=422,z=9}
summonPosition2 = {x=724,y=423,z=9}
summonPosition3 = {x=720,y=424,z=9}
summonPosition4 = {x=723,y=425,z=9}

  if item.actionid == 9814 and getGlobalStorageValue(80001) == -1 then
  doSummonCreature("Drasilla",summonPosition1)
  doSendMagicEffect(topos,13)
  doRemoveItem(item.uid,1)
  setGlobalStorageValue(80001,1)
  
  elseif item.actionid == 9813 and getGlobalStorageValue(80002) == -1 then
  doSummonCreature("Ragim The Warlord",summonPosition2)
  doSendMagicEffect(topos,13)
  doRemoveItem(item.uid,1)
  setGlobalStorageValue(80002,1)
  
  elseif item.actionid == 9812 and getGlobalStorageValue(80003) == -1 then
  doSummonCreature("The Illusionist",summonPosition1)
  doSendMagicEffect(topos,13)
  doRemoveItem(item.uid,1)
  setGlobalStorageValue(80003,1)
  
  elseif item.actionid == 9811 and getGlobalStorageValue(80004) == -1 then
  doSummonCreature("Spirit Of Earth",summonPosition4)
  doSendMagicEffect(topos,13)
  doRemoveItem(item.uid,1)
  setGlobalStorageValue(80004,1)
  
  elseif item.actionid == 9810 and getGlobalStorageValue(80005) == -1 then
  doSummonCreature("Spirit Of Water",summonPosition3)
  doSendMagicEffect(topos,13)
  doRemoveItem(item.uid,1)
  setGlobalStorageValue(80005,1)
  
  elseif item.actionid == 9809 and getGlobalStorageValue(80006) == -1 then
  doSummonCreature("Spirit Of Fire",summonPosition2)
  doSendMagicEffect(topos,13)
  doRemoveItem(item.uid,1)
  setGlobalStorageValue(80006,1)
  
  elseif item.actionid == 9808 and getGlobalStorageValue(80007) == -1 then
  doSummonCreature("The Executor",summonPosition1)
  doSendMagicEffect(topos,13)
  doRemoveItem(item.uid,1)
  setGlobalStorageValue(80007,1)
 
  else
  return FALSE
  end
  return TRUE
end 
