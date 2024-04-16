function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7480 then
    queststatus = getPlayerStorageValue(cid,4031)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a stuffed dragon.")
      doPlayerAddItem(cid,5791,1)
      setPlayerStorageValue(cid,4031,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

