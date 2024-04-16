function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7011 then
    queststatus = getPlayerStorageValue(cid,2004)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found 53 golden coins.")
      doPlayerAddItem(cid,2148,53)
      setPlayerStorageValue(cid,2004,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

