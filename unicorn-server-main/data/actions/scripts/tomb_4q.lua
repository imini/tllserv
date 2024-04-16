function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7565 then
    queststatus = getPlayerStorageValue(cid,4351)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found 5 small rubies.")
      doPlayerAddItem(cid,2147,5)
      setPlayerStorageValue(cid,4351,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

