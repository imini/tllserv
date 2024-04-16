function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7034 then
    queststatus = getPlayerStorageValue(cid,2023)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a beholder shield")
      doPlayerAddItem(cid,2518,1)
      setPlayerStorageValue(cid,2023,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

