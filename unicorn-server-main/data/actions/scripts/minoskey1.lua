function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7742 then
    queststatus = getPlayerStorageValue(cid,9312)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a key.")
      key = doPlayerAddItem(cid,2088,1)
      doSetItemActionId(key,9180)
      setPlayerStorageValue(cid,9312,1)
    else
      doPlayerSendTextMessage(cid,22,"The corpse is empty.")
    end
  end
  return 1
end

