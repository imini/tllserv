function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7776 then
    queststatus = getPlayerStorageValue(cid,9927)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a troll green.")
      doPlayerAddItem(cid,2805,1)
      setPlayerStorageValue(cid,9927,1)
    else
      doPlayerSendTextMessage(cid,22,"You have already taken a troll green.")
    end
  end
  return 1
end

