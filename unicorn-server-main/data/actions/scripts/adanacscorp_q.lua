function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7015 then
    queststatus = getPlayerStorageValue(cid,2007)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a pair of brass legs.")
      doPlayerAddItem(cid,2478,1)
      setPlayerStorageValue(cid,2007,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

