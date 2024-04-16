function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7012 then
    queststatus = getPlayerStorageValue(cid,2005)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a steel helmet.")
      doPlayerAddItem(cid,2457,53)
      setPlayerStorageValue(cid,2005,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

