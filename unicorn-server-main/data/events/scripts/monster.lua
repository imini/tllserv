-- Rarity Animations
local rare_popup = true
local rare_effect = true
local rare_effect_id = CONST_ME_STUN

function Monster:onDropLoot(corpse)
    if hasEventCallback(EVENT_CALLBACK_ONDROPLOOT) then
        EventCallback(EVENT_CALLBACK_ONDROPLOOT, self, corpse)
    end

    -- Apply rarity chance to corpse contents and apply animation
    if rollRarity(corpse) > 0 then -- If a rare item was rolled, play animation
        if rare_popup then
            local spectators = Game.getSpectators(corpse:getPosition(), false, true, 7, 7, 5, 5)
            for i = 1, #spectators do
               spectators[i]:say(rare_text, TALKTYPE_MONSTER_SAY, false, spectators[i], corpse:getPosition())
            end
        end
        if rare_effect then
            corpse:getPosition():sendMagicEffect(rare_effect_id)
        end
    end
end

function Monster:onSpawn(position, startup, artificial)
    if hasEventCallback(EVENT_CALLBACK_ONSPAWN) then
        return EventCallback(EVENT_CALLBACK_ONSPAWN, self, position, startup, artificial)
    else
        self:registerEvent("rollHealth")
        self:registerEvent("rollMana")
        return true
    end
end