function onUse(cid, item, frompos, item2, topos)
if item.uid == 7856 then
    queststatus = getPlayerStorageValue(cid,9691)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a blue christmas bundle.")
      doPlayerAddItem(cid,6508,1)
      setPlayerStorageValue(cid,9691,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
return 1
end
