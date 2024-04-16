function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7062 then
    queststatus = getPlayerStorageValue(cid,2060)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found the armor of wishes.")
      doPlayerAddItem(cid,2508,1)
      setPlayerStorageValue(cid,2060,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

