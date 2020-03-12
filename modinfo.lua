name        = "Ice Maker 3000"
description = "Converts Fuel into Ice!"
author      = "mentalistpro"
version     = "1.3.4"
forumthread = ""
api_version = 6

dont_starve_compatible      = true
reign_of_giants_compatible  = true
shipwrecked_compatible      = true
hamlet_compatible           = true

icon_atlas  = "modicon.xml"
icon        = "modicon.tex"

configuration_options =
{
    {
    name = "spawn_rate",
    label = "Spawn rate",
    options =   {
                {description = "10", data = 10},
                {description = "20", data = 20},
                {description = "30", data = 30},
                {description = "40", data = 40},
                {description = "50", data = 50},
                },
    default = 30,
    },
    {
        name = "max_fuel",
        label = "Maximum fuel",
        options =   {
                    {description = "70", data = 70},
                    {description = "80", data = 80},
                    {description = "90", data = 90},
                    {description = "100", data = 100},
                    {description = "110", data = 110},
                    },
        default = 90,
    },
    {
        name = "minimap_icon",
        label = "Minimap Icon",
        options =   {
                    {description = "ON", data = 0},
                    {description = "OFF", data = 1},
                    },
        default = 0,
    },
}
