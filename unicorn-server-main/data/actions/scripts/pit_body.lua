function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7100 then
    queststatus = getPlayerStorageValue(cid,2112)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a pair of knight legs.")
      doPlayerAddItem(cid,2477,1)
      setPlayerStorageValue(cid,2112,1)
    else
      doPlayerSendTextMessage(cid,22,"The corpse is empty.")
    end
  end
  return 1
end

