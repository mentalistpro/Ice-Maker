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

TUNING.ICEMAKER_AUTOMATIC_REFUEL = GetModConfigData("automatic_refuel")
TUNING.ICEMAKER_FUEL_VOLUME = GetModConfigData("fuel_volume")
TUNING.ICEMAKER_SPAWN_RATE = GetModConfigData("spawn_rate")
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

local icemaker = Recipe("icemaker",
	{
	Ingredient("heatrock", 1),
	Ingredient("log", 10),
	Ingredient("transistor", 2)
	},
	RECIPETABS.SCIENCE, TECH.SCIENCE_TWO)

	--//Enable icemaker recipe in DLCs.
	if IsDLCEnabled and ( IsDLCEnabled(1) or IsDLCEnabled(2) or IsDLCEnabled(3) )then
		icemaker.game_type = {"rog", "vanilla", "porkland"}
	end
	icemaker.placer = "icemaker_placer"
	icemaker.atlas = "images/inventoryimages/icemaker.xml"


--Heatrock
if IsDLCEnabled and IsDLCEnabled(3) then
	--//Enable heatrock recipe in HAM world.
	Recipe("heatrock",
		{
		Ingredient("rocks", 10),
		Ingredient("pickaxe", 1),
		Ingredient("flint", 3)
		},
		RECIPETABS.SURVIVAL, TECH.SCIENCE_TWO, "porkland" )
end

------------------------------------------------------------------------------------------------------------------------
--#3 Strings

local _S = _G.STRINGS

_S.NAMES.ICEMAKER = "Ice Maker 3000"
_S.RECIPE_DESC.ICEMAKER = "Ice, ice, baby!"


