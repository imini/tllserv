function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7093 then
    queststatus = getPlayerStorageValue(cid,2105)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a key hidden among the moss.")
      key = doPlayerAddItem(cid,2089,1)
      doSetItemActionId(key,3433)
      setPlayerStorageValue(cid,2105,1)
    else
      doPlayerSendTextMessage(cid,22,"The moss is empty.")
    end
  end
  return 1
end

