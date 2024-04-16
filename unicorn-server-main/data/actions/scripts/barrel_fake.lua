function onUse(cid, item, frompos, item2, topos)

pos = {x=835, y=674, z=13}
stor = getPlayerStorageValue(cid,3043)

  if item.uid == 7049 and stor == -1 then
      doPlayerSendTextMessage(cid,22,"Unfortunately, it seems to be a fake.")
      doSendMagicEffect(pos,13)
      setPlayerStorageValue(cid,3043,1)
      
  elseif item.uid == 7049 and stor == 1 then
      doPlayerSendTextMessage(cid,22,"You've already found out that it's a fake. You should go and report it.")
    else
      doSendMagicEffect(pos,2)
    end
  return 1
end