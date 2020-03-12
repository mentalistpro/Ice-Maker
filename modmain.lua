PrefabFiles = 
{
  "icemaker",
}

Assets = 
{
    Asset("ATLAS", "images/inventoryimages/icemaker.xml"),
    Asset("ATLAS", "minimap/icemaker.xml"),
    Asset("IMAGE", "minimap/icemaker.tex"),
}

AddMinimapAtlas("minimap/icemaker.xml")

------------------------------------------------------------------------------------------------------------------------
--[[CONTENT]]

--#1 Config
--#2 Recipes
--#3 Strings

------------------------------------------------------------------------------------------------------------------------
--#1 Config

TUNING.ICEMAKER_FUEL_MAX = GetModConfigData("max_fuel")
TUNING.ICEMAKER_SPAWN_TIME = GetModConfigData("spawn_rate")
TUNING.ICEMAKER_MINIMAP = GetModConfigData("minimap_icon")

------------------------------------------------------------------------------------------------------------------------
--#2 Recipes

local _G = GLOBAL
local Ingredient = _G.Ingredient
local IsDLCEnabled = _G.IsDLCEnabled
local Recipe = _G.Recipe
local RECIPE_GAME_TYPE = _G.RECIPE_GAME_TYPE
local RECIPETABS = _G.RECIPETABS
local TECH = _G.TECH

--Icemaker
if IsDLCEnabled and ( IsDLCEnabled(1) or IsDLCEnabled(2) or IsDLCEnabled(3) )then
    --//Enable icemaker recipe in Vanilla, ROG, HAM world with/without compatibility enabled.
    local icemaker = Recipe("icemaker",
        { 
        Ingredient("heatrock", 1), 
        Ingredient("log", 10), 
        Ingredient("transistor", 2) 
        }, 
        RECIPETABS.SCIENCE, TECH.SCIENCE_TWO, {"vanilla", "rog", "porkland"}
    )
    icemaker.placer = "icemaker_placer"
    icemaker.atlas = "images/inventoryimages/icemaker.xml"  
else
    --//Enable icemaker recipe in Vanilla world
    local icemaker = Recipe("icemaker",
        { 
        Ingredient("heatrock", 1), 
        Ingredient("log", 10), 
        Ingredient("transistor", 2) 
        }, 
        RECIPETABS.SCIENCE, TECH.SCIENCE_TWO
    )
    icemaker.placer = "icemaker_placer"
    icemaker.atlas = "images/inventoryimages/icemaker.xml"  
end

--Heatrock
if IsDLCEnabled and IsDLCEnabled(3) then
    --//Enable heatrock recipe in HAM world
    Recipe("heatrock", 
        {
        Ingredient("rocks", 10),
        Ingredient("pickaxe", 1),
        Ingredient("flint", 3)
        },
        RECIPETABS.SURVIVAL, TECH.SCIENCE_TWO, "porkland"
    )
end

------------------------------------------------------------------------------------------------------------------------
--#3 Strings

local _S = _G.STRINGS

_S.NAMES.ICEMAKER = "Ice Maker 3000"
_S.RECIPE_DESC.ICEMAKER = "Ice, ice, baby!"

if _S.CHARACTERS.WALANI     == nil then _S.CHARACTERS.WALANI        = { DESCRIBE = {},} end -- DLC002
if _S.CHARACTERS.WARBUCKS   == nil then _S.CHARACTERS.WARBUCKS      = { DESCRIBE = {},} end -- DLC003
if _S.CHARACTERS.WARLY      == nil then _S.CHARACTERS.WARLY         = { DESCRIBE = {},} end -- DLC002
if _S.CHARACTERS.WATHGRITHR == nil then _S.CHARACTERS.WATHGRITHR    = { DESCRIBE = {},} end -- DLC001
if _S.CHARACTERS.WEBBER     == nil then _S.CHARACTERS.WEBBER        = { DESCRIBE = {},} end -- DLC001
if _S.CHARACTERS.WHEELER    == nil then _S.CHARACTERS.WHEELER       = { DESCRIBE = {},} end -- DLC003
if _S.CHARACTERS.WILBA      == nil then _S.CHARACTERS.WILBA         = { DESCRIBE = {},} end -- DLC003
if _S.CHARACTERS.WINONA     == nil then _S.CHARACTERS.WINONA        = { DESCRIBE = {},} end -- DST
if _S.CHARACTERS.WOODLEGS   == nil then _S.CHARACTERS.WOODLEGS      = { DESCRIBE = {},} end -- DLC002
if _S.CHARACTERS.WORMWOOD   == nil then _S.CHARACTERS.WORMWOOD      = { DESCRIBE = {},} end -- DLC003
if _S.CHARACTERS.WORTOX     == nil then _S.CHARACTERS.WORTOX        = { DESCRIBE = {},} end -- DST
if _S.CHARACTERS.WURT       == nil then _S.CHARACTERS.WURT          = { DESCRIBE = {},} end -- DST

_S.CHARACTERS.WILLOW.DESCRIBE.ICEMAKER      = "It turns fire into ice. Boo."
_S.CHARACTERS.WENDY.DESCRIBE.ICEMAKER       = "My heart makes ice too."
_S.CHARACTERS.WATHGRITHR.DESCRIBE.ICEMAKER  = "Reminds me öf höme."
_S.CHARACTERS.WARBUCKS.DESCRIBE.ICEMAKER    = "Just what one needs in the blasted heat."
_S.CHARACTERS.WAGSTAFF.DESCRIBE.ICEMAKER    = "A practical electric refrigeration unit that doesn't require electricity!"
_S.CHARACTERS.WEBBER.DESCRIBE.ICEMAKER      = "Ice is useful in this heat."
_S.CHARACTERS.WHEELER.DESCRIBE.ICEMAKER     = "I wish I could just climb inside to wait out the heat."
_S.CHARACTERS.WORMWOOD.DESCRIBE.ICEMAKER    = "Cold Spitter"
    