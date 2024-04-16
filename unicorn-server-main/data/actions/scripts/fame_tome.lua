function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7174 then
    queststatus = getPlayerStorageValue(cid,2183)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a blue tome.")
      doPlayerAddItem(cid,1984,1)
      setPlayerStorageValue(cid,2183,1)
    else
      doPlayerSendTextMessage(cid,22,"It's empty.")
    end
  end
  return 1
end

