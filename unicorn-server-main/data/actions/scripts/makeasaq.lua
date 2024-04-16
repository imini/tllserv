function onUse(cid, item, frompos, item2, topos)

  
  
  if item.actionid == 7420 then
  doSendMagicEffect(topos,12)
  doSendMagicEffect(topos,10)

  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
    end
  return 1
end

