function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7793 then
    queststatus = getPlayerStorageValue(cid,4365)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found some strange looking dust.")
      doPlayerAddItem(cid,7251,1)
      setPlayerStorageValue(cid,4365,1)
    else
      doPlayerSendTextMessage(cid,22,"The coffin is empty.")
    end
  end
  return 1
end

