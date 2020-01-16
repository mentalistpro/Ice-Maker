local _G = GLOBAL
local _S = _G.STRINGS
local Ingredient = _G.Ingredient
local IsDLCEnabled = _G.IsDLCEnabled
local Recipe = _G.Recipe
local RECIPE_GAME_TYPE = _G.RECIPE_GAME_TYPE
local RECIPETABS = _G.RECIPETABS
local TECH = _G.TECH

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
-- Config

TUNING.ICEMAKER_FUEL_MAX = GetModConfigData("max_fuel")
TUNING.ICEMAKER_SPAWN_TIME = GetModConfigData("spawn_rate")
TUNING.ICEMAKER_MINIMAP = GetModConfigData("minimap_icon")

------------------------------------------------------------------------------------------------------------------------
-- Recipes

if IsDLCEnabled(3) then
	icemaker = Recipe("icemaker",
	{ 
	Ingredient("heatrock", 1), 
	Ingredient("log", 10), 
	Ingredient("transistor", 2) 
	}, 
	RECIPETABS.SCIENCE, TECH.SCIENCE_TWO, "common")
elseif IsDLCEnabled(2) then
	icemaker = Recipe("icemaker",
	{ 
	Ingredient("heatrock", 1), 
	Ingredient("log", 10), 
	Ingredient("transistor", 2) 
	}, 
	RECIPETABS.SCIENCE, TECH.SCIENCE_TWO, "rog") 
	--The recipe above is registered as an RoG recipe, so players in RoG world or RoG world with SW enabled will be able to use this new recipe.
	--It does not change the existing icemaker recipe for SW worlds.
else
	icemaker = Recipe("icemaker",
	{ 
	Ingredient("heatrock", 1), 
	Ingredient("log", 10), 
	Ingredient("transistor", 2) 
	}, 
	RECIPETABS.SCIENCE, TECH.SCIENCE_TWO)
end
	icemaker.placer = "icemaker_placer"
	icemaker.atlas = "images/inventoryimages/icemaker.xml"	

------------------------------------------------------------------------------------------------------------------------
--Strings

_S.NAMES.ICEMAKER = "Ice Maker 3000"
_S.RECIPE_DESC.ICEMAKER = "Ice, ice, baby!"

if _S.CHARACTERS.WALANI 	== nil then _S.CHARACTERS.WALANI 		= { DESCRIBE = {},} end -- DLC002
if _S.CHARACTERS.WARBUCKS 	== nil then _S.CHARACTERS.WARBUCKS	 	= { DESCRIBE = {},} end -- DLC003
if _S.CHARACTERS.WARLY 		== nil then _S.CHARACTERS.WARLY 		= { DESCRIBE = {},} end -- DLC002
if _S.CHARACTERS.WATHGRITHR == nil then _S.CHARACTERS.WATHGRITHR 	= { DESCRIBE = {},} end -- DLC001
if _S.CHARACTERS.WEBBER 	== nil then _S.CHARACTERS.WEBBER 		= { DESCRIBE = {},} end -- DLC001
if _S.CHARACTERS.WHEELER 	== nil then _S.CHARACTERS.WHEELER 		= { DESCRIBE = {},} end -- DLC003
if _S.CHARACTERS.WILBA 		== nil then _S.CHARACTERS.WILBA 		= { DESCRIBE = {},} end -- DLC003
if _S.CHARACTERS.WINONA	 	== nil then _S.CHARACTERS.WINONA 		= { DESCRIBE = {},} end -- DST
if _S.CHARACTERS.WOODLEGS 	== nil then _S.CHARACTERS.WOODLEGS 		= { DESCRIBE = {},} end -- DLC002
if _S.CHARACTERS.WORMWOOD 	== nil then _S.CHARACTERS.WORMWOOD 		= { DESCRIBE = {},} end -- DLC003
if _S.CHARACTERS.WORTOX 	== nil then _S.CHARACTERS.WORTOX 		= { DESCRIBE = {},} end -- DST
if _S.CHARACTERS.WURT 		== nil then _S.CHARACTERS.WURT 			= { DESCRIBE = {},} end -- DST

_S.CHARACTERS.WILLOW.DESCRIBE.ICEMAKER		= "It turns fire into ice. Boo."
_S.CHARACTERS.WENDY.DESCRIBE.ICEMAKER       = "My heart makes ice too."
_S.CHARACTERS.WATHGRITHR.DESCRIBE.ICEMAKER  = "Reminds me öf höme."
_S.CHARACTERS.WARBUCKS.DESCRIBE.ICEMAKER    = "Just what one needs in the blasted heat."
_S.CHARACTERS.WAGSTAFF.DESCRIBE.ICEMAKER    = "A practical electric refrigeration unit that doesn't require electricity!"
_S.CHARACTERS.WEBBER.DESCRIBE.ICEMAKER      = "Ice is useful in this heat."
_S.CHARACTERS.WHEELER.DESCRIBE.ICEMAKER     = "I wish I could just climb inside to wait out the heat."
_S.CHARACTERS.WORMWOOD.DESCRIBE.ICEMAKER    = "Cold Spitter"
	