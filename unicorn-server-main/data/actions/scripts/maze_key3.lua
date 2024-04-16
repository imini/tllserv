function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7095 then
    queststatus = getPlayerStorageValue(cid,2107)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a key hidden among the moss.")
      key = doPlayerAddItem(cid,2089,1)
      doSetItemActionId(key,3435)
      setPlayerStorageValue(cid,2107,1)
    else
      doPlayerSendTextMessage(cid,22,"The moss is empty.")
    end
  end
  return 1
end

