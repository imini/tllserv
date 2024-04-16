function onUse(cid, item, frompos, item2, topos)
  reward = 2088
  if item.uid == 7017 then
    queststatus = getPlayerStorageValue(cid,8346)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a key, dripping in blood.")
      key = doPlayerAddItem(cid, reward, 1)
					doSetItemActionId(key,6000)
      setPlayerStorageValue(cid,8346,1)
    else
      doPlayerSendTextMessage(cid,22,"The body is empty.")
    end
  end
  return 1
end

