function onUse(cid, item, frompos, item2, topos)
if item2.itemid == 0 then
return 0
end 

destroy = {x=topos.x, y=topos.y, z=topos.z, stackpos=255}
destroyitem = getThingfromPos(destroy)
playerpos = getPlayerPosition(cid)
pz = getTilePzInfo(destroy)
pz1 = getTilePzInfo(playerpos)
storevalue = 1001
exhausttime = 1
ml = getPlayerMagLevel(cid)

function exhaust(cid, storevalue, exhausttime)
    
    newExhaust = os.time()
    oldExhaust = getPlayerStorageValue(cid, storevalue)
    if (lastexhaust == nil or lastexhaust < 0) then
        lastexhaust = 0
    end
    if (exhausttime == nil or exhausttime < 0) then
        exhausttime = 1
    end
    diffTime = os.difftime(newExhaust, oldExhaust)
    if (diffTime >= exhausttime) then
        setPlayerStorageValue(cid, storevalue, newExhaust) 
        return 1
    else
        return 0
    end
end

    if (ml >= 4) then
        --if (exhaust(cid, 1001, 1) > 0) then
          if destroyitem.itemid > 0 then
              if (pz1 == 0) then
                if (pz == 0) then
					doRemoveItem(destroyitem.uid,1)
					doChangeTypeItem(item.uid, item.type-1)
					if item.type == 1 then
					doRemoveItem(item.uid, 1)
					end
                 doSendMagicEffect(topos, 2)
				else
				doSendMagicEffect(frompos, 2)
				doPlayerSendCancel(cid, "This action is not permited while you are in protect zone.")
				end
			  else
				doSendMagicEffect(frompos, 2)
				doPlayerSendCancel(cid, "This action is not permited while you are in protect zone.")
			  end
          else
			doSendMagicEffect(frompos, 2)
            doPlayerSendCancel(cid, "You can not use this object.")
          end
        --else
		--  doSendMagicEffect(frompos, 2)
        --  doPlayerSendCancel(cid, "You are exhausted.")
        --end
    else
      doSendMagicEffect(frompos, 2)
      doPlayerSendCancel(cid, "You dont have the required magic level to use that rune.")
    end
    return 1
end