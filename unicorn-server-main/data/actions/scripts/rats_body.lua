function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7144 then
    queststatus = getPlayerStorageValue(cid,2160)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a studded armor in the rottening body.")
      doPlayerAddItem(cid,2484,1)
      setPlayerStorageValue(cid,2160,1)
    else
      doPlayerSendTextMessage(cid,22,"The dead body is empty.")
    end
  end
  return 1
end

