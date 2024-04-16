function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7018 then
    queststatus = getPlayerStorageValue(cid,2011)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a strange helmet.")
      doPlayerAddItem(cid,2479,1)
      setPlayerStorageValue(cid,2011,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

