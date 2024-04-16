function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7020 then
    queststatus = getPlayerStorageValue(cid,2014)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a hoe.")
      doPlayerAddItem(cid,2552,1)
      setPlayerStorageValue(cid,2014,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

