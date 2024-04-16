function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7139 then
    queststatus = getPlayerStorageValue(cid,2147)
    if queststatus == -1 then
            doPlayerSendTextMessage(cid,22,"You have found a key.")
      key = doPlayerAddItem(cid, 2091, 1)
					doSetItemActionId(key,4255)
      setPlayerStorageValue(cid,2147,1)
    else
      doPlayerSendTextMessage(cid,22,"The wooden coffin is empty.")
    end
  end
  return 1
end

