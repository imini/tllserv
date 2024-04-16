function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7227 then
    queststatus = getPlayerStorageValue(cid,2721)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found 4 small diamonds.")
      doPlayerAddItem(cid,2145,4)
      setPlayerStorageValue(cid,2721,1)
    else
      doPlayerSendTextMessage(cid,22,"The body is empty.")
    end
  end
  return 1
end

