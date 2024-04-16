function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7031 then
    queststatus = getPlayerStorageValue(cid,2020)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a key, dripping in poison.")
      key = doPlayerAddItem(cid, 2088, 1)
      doSetItemActionId(key,6011)
      setPlayerStorageValue(cid,2020,1)
    else
      doPlayerSendTextMessage(cid,22,"The hole is empty.")
    end
  end
  return 1
end
