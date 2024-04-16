function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7170 then
    queststatus = getPlayerStorageValue(cid,6344)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a chain armor.")
      doPlayerAddItem(cid,2464,1)
      setPlayerStorageValue(cid,6344,1)
    else
      doPlayerSendTextMessage(cid,22,"The dead body is empty.")
    end
  end
  return 1
end

