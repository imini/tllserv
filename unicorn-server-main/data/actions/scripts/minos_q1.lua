function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7010 then
    queststatus = getPlayerStorageValue(cid,2003)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a stone skin amulet.")
      doPlayerAddItem(cid,2197,5)
      setPlayerStorageValue(cid,2003,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

