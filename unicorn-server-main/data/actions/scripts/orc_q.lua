function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7184 then
    queststatus = getPlayerStorageValue(cid,2301)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a carlinsword in the dead body.")
      doPlayerAddItem(cid,2395,1)
      setPlayerStorageValue(cid,2301,1)
    else
      doPlayerSendTextMessage(cid,22,"The dead body is empty.")
    end
  end
  return 1
end

