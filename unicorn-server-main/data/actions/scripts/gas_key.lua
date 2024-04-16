function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7157 then
    queststatus = getPlayerStorageValue(cid,5466)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a key, dripping in poison.")
      key = doPlayerAddItem(cid, 2089, 1)
					doSetItemActionId(key,8100)
      setPlayerStorageValue(cid,5466,1)
	doSendMagicEffect(topos,8)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

