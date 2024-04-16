function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7308 then
    queststatus = getPlayerStorageValue(cid,3034)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found an ice rapier.")
      doPlayerAddItem(cid,2396,5)
      setPlayerStorageValue(cid,3034,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

