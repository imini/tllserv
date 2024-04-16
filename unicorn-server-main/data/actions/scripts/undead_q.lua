function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7359 then
    queststatus = getPlayerStorageValue(cid,4012)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a medusa shield.")
      doPlayerAddItem(cid,2536,1)
      setPlayerStorageValue(cid,4012,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

