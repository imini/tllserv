function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7230 then
    queststatus = getPlayerStorageValue(cid,2723)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a pair of crown legs.")
      doPlayerAddItem(cid,2488,1)
      setPlayerStorageValue(cid,2723,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

