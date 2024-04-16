function onUse(cid, item, frompos, item2, topos)
 
 
 if item2.actionid == 1434 then
 doTransformItem(item.uid,7286)
 doSendMagicEffect(topos,1)
 else
 return 0
 end
 return 1
 end