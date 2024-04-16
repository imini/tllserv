function onUse(cid, item, frompos, item2, topos)
  reward = 2088
  if item.uid == 7121 then
    queststatus = getPlayerStorageValue(cid,2126)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a key.")
      key = doPlayerAddItem(cid, reward, 1)
					doSetItemActionId(key,6005)
      setPlayerStorageValue(cid,2126,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

