function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7030 then
    queststatus = getPlayerStorageValue(cid,2019)
    if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You have found a key, dripping in poison.")
      key = doPlayerAddItem(cid, 2088, 1)
      doSetItemActionId(key,6012)
      setPlayerStorageValue(cid,2019,1)
    else
      doPlayerSendTextMessage(cid,22,"The corpse is empty.")
    end
  end
  return 1
end
