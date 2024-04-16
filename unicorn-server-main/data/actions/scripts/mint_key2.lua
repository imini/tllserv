function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7181 then
    queststatus = getPlayerStorageValue(cid,5030)
    if queststatus == -1 then
           doPlayerSendTextMessage(cid,22,"You have found a key.")
      key = doPlayerAddItem(cid, 2089, 1)
					doSetItemActionId(key,4234)
      setPlayerStorageValue(cid,5030,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

