function onUse(cid, item, frompos, item2, topos)
  reward = 2090
  if item.uid == 7334 then
    queststatus = getPlayerStorageValue(cid,7076)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a key in the sacrifical victim.")
      key = doPlayerAddItem(cid, reward, 1)
					doSetItemActionId(key,5300)
      setPlayerStorageValue(cid,7076,1)
    else
      doPlayerSendTextMessage(cid,22,"The corpse is empty.")
    end
  end
  return 1
end

