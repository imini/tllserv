function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7484 then
    queststatus = getPlayerStorageValue(cid,4035)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found soft boots.")
      doPlayerAddItem(cid,2358,1)
      setPlayerStorageValue(cid,4035,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

