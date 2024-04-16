function onUse(cid, item, frompos, item2, topos)

key1 = {x=852,y=467,z=15,stackpos=2}
key2 = {x=853,y=467,z=15,stackpos=2}
key3 = {x=854,y=467,z=15,stackpos=2}
key4 = {x=855,y=467,z=15,stackpos=2}
key5 = {x=856,y=467,z=15,stackpos=2}
key6 = {x=857,y=467,z=15,stackpos=2}
key7 = {x=858,y=467,z=15,stackpos=2}
key8 = {x=859,y=467,z=15,stackpos=2}
key9 = {x=860,y=467,z=15,stackpos=2}
key10 = {x=861,y=467,z=15,stackpos=2}
key11 = {x=862,y=467,z=15,stackpos=2}
key12 = {x=863,y=467,z=15,stackpos=2}
key13 = {x=864,y=467,z=15,stackpos=2}
key14 = {x=865,y=467,z=15,stackpos=2}
key15 = {x=866,y=467,z=15,stackpos=2}
key16 = {x=867,y=467,z=15,stackpos=2}
key17 = {x=868,y=467,z=15,stackpos=2}
key18 = {x=869,y=467,z=15,stackpos=2}
key19 = {x=870,y=467,z=15,stackpos=2}

kkey1 = {x=852,y=467,z=15}
kkey2 = {x=853,y=467,z=15}
kkey3 = {x=854,y=467,z=15}
kkey4 = {x=855,y=467,z=15}
kkey5 = {x=856,y=467,z=15}
kkey6 = {x=857,y=467,z=15}
kkey7 = {x=858,y=467,z=15}
kkey8 = {x=859,y=467,z=15}
kkey9 = {x=860,y=467,z=15}
kkey10 = {x=861,y=467,z=15}
kkey11 = {x=862,y=467,z=15}
kkey12 = {x=863,y=467,z=15}
kkey13 = {x=864,y=467,z=15}
kkey14 = {x=865,y=467,z=15}
kkey15 = {x=866,y=467,z=15}
kkey16 = {x=867,y=467,z=15}
kkey17 = {x=868,y=467,z=15}
kkey18 = {x=869,y=467,z=15}
kkey19 = {x=870,y=467,z=15}

getkey1 = getThingfromPos(key1)
getkey2 = getThingfromPos(key2)
getkey3 = getThingfromPos(key3)
getkey4 = getThingfromPos(key4)
getkey5 = getThingfromPos(key5)
getkey6 = getThingfromPos(key6)
getkey7 = getThingfromPos(key7)
getkey8 = getThingfromPos(key8)
getkey9 = getThingfromPos(key9)
getkey10 = getThingfromPos(key10)
getkey11 = getThingfromPos(key11)
getkey12 = getThingfromPos(key12)
getkey13 = getThingfromPos(key13)
getkey14 = getThingfromPos(key14)
getkey15 = getThingfromPos(key15)
getkey16 = getThingfromPos(key16)
getkey17 = getThingfromPos(key17)
getkey18 = getThingfromPos(key18)
getkey19 = getThingfromPos(key19)

teleport = {x=861,y=468,z=15}
humanpos = {x=861,y=468,z=15,stackpos=253}
gethumanpos = getThingfromPos(humanpos)
newpos = {x=867,y=494,z=15}

if item.itemid == 1945 and
getkey1.actionid == 3420 and
getkey2.actionid == 3421 and
getkey3.actionid == 3422 and
getkey4.actionid == 3423 and
getkey5.actionid == 3424 and
getkey6.actionid == 3425 and
getkey7.actionid == 3426 and
getkey8.actionid == 3427 and
getkey9.actionid == 3428 and
getkey10.actionid == 3429 and
getkey11.actionid == 3430 and
getkey12.actionid == 3431 and
getkey13.actionid == 3432 and
getkey14.actionid == 3433 and
getkey15.actionid == 3434 and
getkey16.actionid == 3435 and
getkey17.actionid == 3436 and
getkey18.actionid == 3437 and
getkey19.actionid == 3438 then

doRemoveItem(getkey1.uid,1)
doRemoveItem(getkey2.uid,1)
doRemoveItem(getkey3.uid,1)
doRemoveItem(getkey4.uid,1)
doRemoveItem(getkey5.uid,1)
doRemoveItem(getkey6.uid,1)
doRemoveItem(getkey7.uid,1)
doRemoveItem(getkey8.uid,1)
doRemoveItem(getkey9.uid,1)
doRemoveItem(getkey10.uid,1)
doRemoveItem(getkey11.uid,1)
doRemoveItem(getkey12.uid,1)
doRemoveItem(getkey13.uid,1)
doRemoveItem(getkey14.uid,1)
doRemoveItem(getkey15.uid,1)
doRemoveItem(getkey16.uid,1)
doRemoveItem(getkey17.uid,1)
doRemoveItem(getkey18.uid,1)
doRemoveItem(getkey19.uid,1)
doSendMagicEffect(kkey1,13)
doSendMagicEffect(kkey2,13)
doSendMagicEffect(kkey3,13)
doSendMagicEffect(kkey4,13)
doSendMagicEffect(kkey5,13)
doSendMagicEffect(kkey6,13)
doSendMagicEffect(kkey7,13)
doSendMagicEffect(kkey8,13)
doSendMagicEffect(kkey9,13)
doSendMagicEffect(kkey10,13)
doSendMagicEffect(kkey11,13)
doSendMagicEffect(kkey12,13)
doSendMagicEffect(kkey13,13)
doSendMagicEffect(kkey14,13)
doSendMagicEffect(kkey15,13)
doSendMagicEffect(kkey16,13)
doSendMagicEffect(kkey17,13)
doSendMagicEffect(kkey18,13)
doSendMagicEffect(kkey19,13)
doSendMagicEffect(teleport,14)
doCreateTeleport(1387,newpos,teleport)
doTransformItem(item.uid,1946)


elseif item.itemid == 1946 then
doCreatureSay(cid,"It seems to be stuck.",16)

else
doCreatureSay(cid,"It seems to be stuck.",16)
end
return 1
end





