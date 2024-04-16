function onUse(cid, item, frompos, item2, topos)

pos = getPlayerPosition(cid)
stor = getPlayerStorageValue(cid,3035)

if item.uid == 7198 and item.itemid == 1414 and stor == -1 then
      doSendMagicEffect(pos,0)
      doPlayerSendTextMessage(cid,22,"You can suddenly feel your blood pump harder than ever before.")      
      setPlayerStorageValue(cid,3035,1)
    elseif item.uid == 7198 and item.itemid == 1414 and stor == 1 then
      doPlayerSendTextMessage(cid,22,"It doesn't have any effect.")
      else
    end
  return 1
end

