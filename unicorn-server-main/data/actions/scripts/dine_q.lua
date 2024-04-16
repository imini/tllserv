function onUse(cid, item, frompos, item2, topos)
if item.uid == 7857 then
    queststatus = getPlayerStorageValue(cid,9412)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You found a royal brooch.")
      doPlayerAddItem(cid,4873,1)
      setPlayerStorageValue(cid,9412,1)
    else
      doPlayerSendTextMessage(cid,22,"The dresser is empty.")
    end
  end
return 1
end
