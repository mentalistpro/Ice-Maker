name                        = "Ice Maker 3000"
description                 = "Converts Fuel into Ice!"
author                      = "mentalistpro"
version                     = "1.4"
forumthread                 = ""
api_version                 = 6

dont_starve_compatible      = true
reign_of_giants_compatible  = true
shipwrecked_compatible      = true
hamlet_compatible           = true

icon_atlas                  = "modicon.xml"
icon                        = "modicon.tex"

configuration_options =
{
    {
    name = "spawn_rate",
    label = "Spawn in",
    options =   {
                {description = "5s", data = 5},
                {description = "10s", data = 10},
                {description = "15s", data = 15},
                {description = "20s", data = 20},
                {description = "25s", data = 25},
                {description = "30s", data = 30},
                },
    default = 30,
    },

    {
        name = "fuel_volume",
        label = "Fuel storage",
        options =   {
                    {description = "90s", data = 90},
                    {description = "110s", data = 110},
                    {description = "130s", data = 130},
                    {description = "150s", data = 150},
                    {description = "170s", data = 170},
                    {description = "190s", data = 190},
                    },
        default = 90,
    },

    {
    name = "automatic_refuel",
    label = "Automatic refuel",
    options =   {
                {description = "ON", data = 0},
                {description = "OFF", data = 1},
                },
    default = 0,
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
