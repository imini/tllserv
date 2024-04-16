function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7483 then
    queststatus = getPlayerStorageValue(cid,4034)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found 100 platinum coins.")
      doPlayerAddItem(cid,2152,100)
      setPlayerStorageValue(cid,4034,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

