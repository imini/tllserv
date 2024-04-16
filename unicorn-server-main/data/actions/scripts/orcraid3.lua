function onUse(cid, item, frompos, item2, topos)

pos1 = {x=844, y=722, z=7}
pos2 = {x=844, y=744, z=7}
pos3 = {x=846, y=745, z=7}
pos4 = {x=846, y=747, z=7}
pos5 = {x=847, y=745, z=7}
pos6 = {x=847, y=743, z=7}
pos7 = {x=846, y=749, z=7}
pos8 = {x=846, y=750, z=7}
pos9 = {x=848, y=745, z=7}
pos10 = {x=848, y=742, z=7}
pos11 = {x=848, y=749, z=7}
pos12 = {x=849, y=745, z=7}
pos13 = {x=846, y=743, z=7}
pos14 = {x=852, y=750, z=7}
pos15 = {x=852, y=754, z=7}
pos16 = {x=855, y=750, z=7}
pos17 = {x=853, y=744, z=7}
pos18 = {x=852, y=745, z=7}
pos19 = {x=857, y=743, z=7}
pos20 = {x=856, y=750, z=7}
pos21 = {x=855, y=750, z=7}
pos22 = {x=854, y=746, z=7}
pos23 = {x=855, y=747, z=7}
pos24 = {x=851, y=737, z=7}
pos25 = {x=852, y=739, z=7}
pos26 = {x=845, y=738, z=7}
pos27 = {x=862, y=740, z=7}
pos28 = {x=863, y=740, z=7}
pos29 = {x=867, y=738, z=7}
pos30 = {x=861, y=738, z=7}
pos31 = {x=869, y=738, z=7}
pos32 = {x=867, y=739, z=7}
pos33 = {x=864, y=741, z=7}
pos34 = {x=866, y=747, z=7}
pos35 = {x=859, y=744, z=7}
pos36 = {x=866, y=751, z=7}
pos37 = {x=845, y=754, z=7}
pos38 = {x=848, y=758, z=7}
pos39 = {x=851, y=760, z=7}
pos40 = {x=843, y=761, z=7}
pos41 = {x=842, y=766, z=7}
pos42 = {x=865, y=748, z=7}
pos43 = {x=870, y=744, z=7}
pos44 = {x=859, y=734, z=7}
pos45 = {x=854, y=732, z=7}
pos46 = {x=852, y=731, z=7}
pos47 = {x=847, y=727, z=7}
pos48 = {x=843, y=724, z=7}
pos49 = {x=856, y=720, z=7}
pos50 = {x=860, y=723, z=7}
pos51 = {x=849, y=720, z=7}

if item.itemid == 1945 then
broadcastMessage("The orcish hordes have launched a second attack on Casteldine!", MESSAGE_EVENT_ADVANCE)
doSummonCreature("Orc Berserker", pos1)
doSummonCreature("Orc Berserker", pos2)
doSummonCreature("Orc Shaman", pos3)
doSummonCreature("Orc Warlords", pos4)
doSummonCreature("Orc Rider", pos5)
doSummonCreature("Orc Rider", pos6)
doSummonCreature("Orc Berserker", pos7)
doSummonCreature("Orc Berserker", pos8)
doSummonCreature("Orc Leader", pos9)
doSummonCreature("Orc Berserker", pos10)
doSummonCreature("Orc Rider", pos11)
doSummonCreature("Orc Warlords", pos12)
doSummonCreature("Orc Leader", pos13)
doSummonCreature("Orc Leader", pos14)
doSummonCreature("Orc Berserker", pos15)
doSummonCreature("Orc Berserker", pos16)
doSummonCreature("Orc Leader", pos17)
doSummonCreature("Orc Shaman", pos18)
doSummonCreature("Orc Shaman", pos19)
doSummonCreature("Orc Berserker", pos20)
doSummonCreature("Orc Berserker", pos21)
doSummonCreature("Orc Rider", pos22)
doSummonCreature("Orc Rider", pos23)
doSummonCreature("Orc Berserker", pos24)
doSummonCreature("War wolf", pos25)
doSummonCreature("Orc Leader", pos26)
doSummonCreature("Orc Shaman", pos27)
doSummonCreature("Orc Rider", pos28)
doSummonCreature("Orc Berserker", pos29)
doSummonCreature("Orc Berserker", pos30)
doSummonCreature("Orc Berserker", pos31)
doSummonCreature("Orc Leader", pos32)
doSummonCreature("Orc Rider", pos33)
doSummonCreature("War wolf", pos34)
doSummonCreature("Orc Berserker", pos35)
doSummonCreature("Orc Leader", pos36)

doSummonCreature("Orc Warlords", pos37)
doSummonCreature("Orc Berserker", pos38)
doSummonCreature("Orc Leader", pos39)
doSummonCreature("Orc Berserker", pos40)
doSummonCreature("Orc Shaman", pos41)
doSummonCreature("Orc Berserker", pos42)
doSummonCreature("Orc Rider", pos43)
doSummonCreature("Orc Leader", pos44)
doSummonCreature("Orc Warlords", pos45)
doSummonCreature("Orc Shaman", pos46)
doSummonCreature("Orc Rider", pos47)
doSummonCreature("Orc Berserker", pos48)

doSummonCreature("Orc Leader", pos37)
doSummonCreature("Orc Shaman", pos38)
doSummonCreature("Orc Berserker", pos39)
doSummonCreature("Orc Berserker", pos40)
doSummonCreature("Orc Berserker", pos41)
doSummonCreature("War Wolf", pos41)
doSummonCreature("Orc Berserker", pos42)
doSummonCreature("Orc Shaman", pos43)
doSummonCreature("Orc Berserker", pos44)
doSummonCreature("Orc Leader", pos45)
doSummonCreature("Orc Warlords", pos46)
doSummonCreature("Orc Warlords", pos47)
doSummonCreature("War Wolf", pos48)
doSummonCreature("War Wolf", pos49)
doSummonCreature("Orc Berserker", pos50)
doSummonCreature("Orc Leader", pos51)
doSummonCreature("Orc Berserker", pos49)
doSummonCreature("Orc Berserker", pos50)
doSummonCreature("Orc Leader", pos51)

doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
