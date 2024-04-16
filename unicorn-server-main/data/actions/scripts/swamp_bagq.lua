function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7294 then
    queststatus = getPlayerStorageValue(cid,3818)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a dragon necklace.")
      doPlayerAddItem(cid,2201,200)
      setPlayerStorageValue(cid,3818,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

