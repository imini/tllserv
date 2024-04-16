function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7008 then
    queststatus = getPlayerStorageValue(cid,2001)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a pair of plate legs.")
      doPlayerAddItem(cid,2647,1)
      setPlayerStorageValue(cid,2001,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

