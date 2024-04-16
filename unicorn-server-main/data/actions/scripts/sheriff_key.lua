function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7076 then
    queststatus = getPlayerStorageValue(cid,2093)
    if queststatus == -1 then
          doPlayerSendTextMessage(cid,22,"You have found a key.")
      key = doPlayerAddItem(cid, 2087, 1)
					doSetItemActionId(key,5035)
      setPlayerStorageValue(cid,2093,1)
    else
      doPlayerSendTextMessage(cid,22,"The box is empty.")
    end
  end
  return 1
end

