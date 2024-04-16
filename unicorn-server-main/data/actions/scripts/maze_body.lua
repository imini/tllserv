function onUse(cid, item, frompos, item2, topos)
  if item.actionid == 7084 then
    queststatus = getPlayerStorageValue(cid,3815)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a steel hammer.")
      doPlayerAddItem(cid,4846,1)
      setPlayerStorageValue(cid,3815,1)
    else
      doPlayerSendTextMessage(cid,22,"The dead body is empty.")
    end
  end
  return 1
end

