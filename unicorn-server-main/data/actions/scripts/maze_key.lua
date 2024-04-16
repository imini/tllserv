function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7096 then
    queststatus = getPlayerStorageValue(cid,2108)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a key hidden among the moss.")
      key = doPlayerAddItem(cid,2089,1)
      doSetItemActionId(key,3436)
      setPlayerStorageValue(cid,2108,1)
    else
      doPlayerSendTextMessage(cid,22,"The moss is empty.")
    end
  end
  return 1
end

