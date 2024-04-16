function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7354 then
    queststatus = getPlayerStorageValue(cid,4006)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a stealth ring.")
      doPlayerAddItem(cid,2165,1)
      setPlayerStorageValue(cid,4006,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

