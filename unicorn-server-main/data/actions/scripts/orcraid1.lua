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

if item.itemid == 1945 then
broadcastMessage("Orc activity near Casteldine has been reported. Be aware!", MESSAGE_EVENT_ADVANCE)
doSummonCreature("Orc", pos1)
doSummonCreature("Orc Spearman", pos2)
doSummonCreature("Orc Spearman", pos3)
doSummonCreature("Orc Warrior", pos4)
doSummonCreature("Orc", pos5)
doSummonCreature("Orc", pos6)
doSummonCreature("Orc", pos7)
doSummonCreature("Orc Warrior", pos8)
doSummonCreature("Orc Rider", pos9)
doSummonCreature("Orc Spearman", pos10)
doSummonCreature("Orc", pos11)
doSummonCreature("Orc Spearman", pos12)
doSummonCreature("Orc Warrior", pos13)
doSummonCreature("Orc Warrior", pos14)
doSummonCreature("Orc Warrior", pos15)
doSummonCreature("Orc Berserker", pos16)
doSummonCreature("Orc Spearman", pos17)
doSummonCreature("Orc Spearman", pos18)
doSummonCreature("Orc Spearman", pos19)
doSummonCreature("Orc", pos20)
doSummonCreature("Orc", pos21)
doSummonCreature("Orc Spearman", pos22)
doSummonCreature("Orc Warrior", pos23)
doSummonCreature("Orc Spearman", pos24)
doSummonCreature("War wolf", pos25)
doSummonCreature("Orc", pos26)
doSummonCreature("Orc Warrior", pos27)
doSummonCreature("Orc Spearman", pos28)
doSummonCreature("Orc", pos29)
doSummonCreature("Orc Warrior", pos30)
doSummonCreature("Orc", pos31)
doSummonCreature("Orc Spearman", pos32)
doSummonCreature("Orc Rider", pos33)
doSummonCreature("War wolf", pos34)
doSummonCreature("Orc", pos35)
doSummonCreature("Orc Warrior", pos36)

doSummonCreature("Orc Warrior", pos37)
doSummonCreature("Orc Spearman", pos38)
doSummonCreature("Orc Warrior", pos39)
doSummonCreature("Orc Berserker", pos40)
doSummonCreature("Orc Warrior", pos41)
doSummonCreature("Orc", pos42)
doSummonCreature("Orc Rider", pos43)
doSummonCreature("Orc", pos44)
doSummonCreature("Orc", pos45)
doSummonCreature("Orc Spearman", pos46)
doSummonCreature("Orc Rider", pos47)
doSummonCreature("Orc Warrior", pos48)

doSummonCreature("Orc", pos37)
doSummonCreature("Orc Spearman", pos38)
doSummonCreature("Orc Spearman", pos39)
doSummonCreature("Orc Warrior", pos40)
doSummonCreature("Orc", pos41)
doSummonCreature("War Wolf", pos41)
doSummonCreature("Orc", pos42)
doSummonCreature("Orc Spearman", pos43)
doSummonCreature("Orc", pos44)
doSummonCreature("Orc Warrior", pos45)
doSummonCreature("Orc Spearman", pos46)
doSummonCreature("Orc Warrior", pos47)
doSummonCreature("War Wolf", pos48)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end