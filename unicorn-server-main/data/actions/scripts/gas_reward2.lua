function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7159 then
    queststatus = getPlayerStorageValue(cid,2168)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found an iron helmet.")
      doPlayerAddItem(cid,2459,1)
      setPlayerStorageValue(cid,2168,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

