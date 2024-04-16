function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7306 then
    queststatus = getPlayerStorageValue(cid,3031)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a fire axe.")
      doPlayerAddItem(cid,2432,1)
      setPlayerStorageValue(cid,3031,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

