function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7065 then
    queststatus = getPlayerStorageValue(cid,2070)
    if queststatus == -1 then
            doPlayerSendTextMessage(cid,22,"You have found a key.")
      key = doPlayerAddItem(cid, 2089, 1)
					doSetItemActionId(key,4250)
      setPlayerStorageValue(cid,2070,1)
    else
      doPlayerSendTextMessage(cid,22,"The dead body is empty.")
    end
  end
  return 1
end

