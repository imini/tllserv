function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7844 then
    queststatus = getPlayerStorageValue(cid,9668)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a staff of darkness.")
      doPlayerAddItem(cid,3961,1)
      setPlayerStorageValue(cid,9668,1)
    else
      doPlayerSendTextMessage(cid,22,"The stone coffin is empty.")
    end
    end
    return 1
    end
    

