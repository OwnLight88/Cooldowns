-- -----------------------------------------------------------------------------
-- Cooldowns
-- Author:  g4rr3t, kabs, Noget, OwnLight
-- Created: May 5, 2018
--
-- Defaults.lua
-- -----------------------------------------------------------------------------

Cool.Defaults = {}

local defaults = {
    debugMode = 0,
    sets = {},
    unlocked = true,
    snapToGrid = false,
    gridSize = 16,
    showOutsideCombat = true,
    lagCompensation = true,
    size = 64,
    sounds = {
        onProc = {
            enabled = true,
            sound = 'STATS_PURCHASE',
        },
        onReady = {
            enabled = true,
            sound = 'SKILL_LINE_ADDED',
        },
    },
}

local sets = {}
local buffs = {}
local monsters = {}
local synergies = {}
local passives = {}
local cp = {}
local arenas = {}
local enchants = {}


function Cool.Defaults:Generate()
    for key, set in pairs(Cool.Data.Sets) do

        -- Populate Sets
        defaults.sets[key] = {
            x = 150,
            y = 150,
            size = defaults.size,
            sounds = defaults.sounds,
        }

        if set.procType == "synergy" then
            -- Populate Synergies
            synergies[key] = false
        elseif set.procType == "cp" then
            -- Populate CP
            cp[key] = false
        elseif set.procType == "buffs" then
            -- Populate CP
            buffs[key] = false
        elseif set.procType == "passive" then
            -- Populate Passives
            passives[key] = false
        elseif set.procType == "enchants" then
            -- Populate Enchants
            enchants[key] = false
        elseif set.procType == "monster" then
            -- Populate Monster Sets
            sets[key] = true
        elseif set.procType == "arena" then
            -- Populate Arena Sets
            sets[key] = true
        elseif set.procType == "set" then
            -- Populate Sets
            sets[key] = true
        else
            -- Unsupported procType
        end

    end
end

-- Account-wide
function Cool.Defaults.Get()
    return defaults
end

-- Per-character
function Cool.Defaults.GetCharacter()
    return {
		["set"] = sets,
        ["buffs"] = buffs,
        ["arena"] = arenas,
        ["monster"] = monsters,
		["synergy"] = synergies,
        ["cp"] = cp,
		["passive"] = passives,
        ["enchant"] = enchants,
	}
end
