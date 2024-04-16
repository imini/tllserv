function onUse(cid, item, frompos, item2, topos)
  instrument1 = {x=470, y=123, z=12}
  instrument2 = {x=472, y=132, z=12}
  instrument3 = {x=472, y=123, z=12}
  instrument4 = {x=471, y=132, z=12}
  instrument5 = {x=473, y=132, z=12}
  storage1 = getPlayerStorageValue(cid,4161)
  storage2 = getPlayerStorageValue(cid,4162)
  storage3 = getPlayerStorageValue(cid,4163)
  storage4 = getPlayerStorageValue(cid,4164)
  storage5 = getPlayerStorageValue(cid,4165)

  if (isPlayer(cid)) and storage1 == 1 then
  doSendMagicEffect(topos,19)
   setPlayerStorageValue(cid,4162,1)
   setPlayerStorageValue(cid,4161,-1)
  else
  doSendMagicEffect(topos,19)
    setPlayerStorageValue(cid,4161,-1)
  setPlayerStorageValue(cid,4162,-1)
  setPlayerStorageValue(cid,4163,-1)
  setPlayerStorageValue(cid,4164,-1)
  setPlayerStorageValue(cid,4165,-1)
    end
  return 1
end

