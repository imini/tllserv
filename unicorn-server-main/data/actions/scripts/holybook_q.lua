function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7792 then
    queststatus = getPlayerStorageValue(cid,9639)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found the djinns' holy book.")
      doPlayerAddItem(cid,6533,1)
      setPlayerStorageValue(cid,9639,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

