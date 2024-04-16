function onUse(cid, item, frompos, item2, topos)

stor1 = getPlayerStorageValue(cid,4306)

pos1 = {x=377, y=253, z=8}
pos2 = {x=376, y=254, z=8}
pos3 = {x=377, y=254, z=8}
pos4 = {x=378, y=254, z=8}
pos5 = {x=379, y=254, z=8}
pos6 = {x=375, y=255, z=8}
pos6 = {x=376, y=255, z=8}
pos7 = {x=378, y=255, z=8}
pos8 = {x=379, y=255, z=8}
pos9 = {x=376, y=256, z=8}
pos10 = {x=377, y=256, z=8}
pos11 = {x=378, y=256, z=8}
pos12 = {x=378, y=253, z=8}
pos13 = {x=375, y=256, z=8}

if item2.uid == 7568 and stor1 == -1 then
doSendMagicEffect(pos1,20)
doSendMagicEffect(pos2,20)
doSendMagicEffect(pos3,20)
doSendMagicEffect(pos4,20)
doSendMagicEffect(pos5,20)
doSendMagicEffect(pos6,20)
doSendMagicEffect(pos7,20)
doSendMagicEffect(pos8,20)
doSendMagicEffect(pos9,20)
doSendMagicEffect(pos20,20)
doSendMagicEffect(pos21,20)
doSendMagicEffect(pos22,20)
doSendMagicEffect(pos23,20)
doPlayerSendTextMessage(cid,22,"You have successfully poisoned the marids holy water..")
setPlayerStorageValue(cid,4306,1)
doCreateItem(4758,1,pos1)
doCreateItem(4758,1,pos2)
doCreateItem(4758,1,pos3)
doCreateItem(4758,1,pos4)
doCreateItem(4758,1,pos5)
doCreateItem(4758,1,pos6)
doCreateItem(4758,1,pos7)
doCreateItem(4758,1,pos8)
doCreateItem(4758,1,pos9)
doCreateItem(4758,1,pos10)
doCreateItem(4758,1,pos11)
doCreateItem(4758,1,pos12)
doCreateItem(4758,1,pos13)

else
return 0
end
return 1
end

