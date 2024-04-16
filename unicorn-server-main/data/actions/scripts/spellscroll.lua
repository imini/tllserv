function onUse(cid, item, frompos, item2, topos)
  vocation = getPlayerVocation(cid)
  level = getPlayerLevel(cid)
  stor = getPlayerStorageValue(cid,2344)
	if stor == -1 and vocation == 1 and level > 59 or
stor == -1 and vocation == 5 and level > 59 then
		doSendMagicEffect(frompos,14)
		playerLearnInstantSpell(cid, 'ultimate explosion')
		doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have learnt to handle the devastating ultimate explosion spell.')
		doRemoveItem(item.uid,1)
		setPlayerStorageValue(cid,2342,1)
		
		elseif stor == -1 and vocation == 2 and level > 49 or
stor == -1 and vocation == 6 and level > 59 then
		doSendMagicEffect(frompos,14)
		playerLearnInstantSpell(cid, 'poison storm')
		doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have learnt to handle the perilous poison storm.')
		doRemoveItem(item.uid,1)
		setPlayerStorageValue(cid,2342,1)
		
		elseif stor == -1 and vocation == 4 and level > 60 or
stor == -1 and vocation == 8 and level > 60 then
		doSendMagicEffect(frompos,14)
		playerLearnInstantSpell(cid, 'strong berserk')
		doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have learnt to handle the powerful fierce berserk spell.')
		doRemoveItem(item.uid,1)
setPlayerStorageValue(cid,2342,1)

    elseif stor == 1 then
    doCreatureSay(cid,"You have already learnt this spell.",16)
    else
    doCreatureSay(cid,"You do not wield the needed abilities to learn this spell.",16)
    end
    return 1
    end