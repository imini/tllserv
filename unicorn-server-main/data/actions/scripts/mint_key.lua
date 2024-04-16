function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7179 then
    queststatus = getPlayerStorageValue(cid,2200)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a key in the box.")
      key = doPlayerAddItem(cid,2088,1)
      doSetItemActionId(key,4233)
      setPlayerStorageValue(cid,2200,1)
    else
      doPlayerSendTextMessage(cid,22,"The box is empty.")
    end
  end
  return 1
end

