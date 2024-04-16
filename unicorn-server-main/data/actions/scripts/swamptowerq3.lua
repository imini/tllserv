function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7220 then
    queststatus = getPlayerStorageValue(cid,2716)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a plate armor.")
      doPlayerAddItem(cid,2463,1)
      setPlayerStorageValue(cid,2716,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

