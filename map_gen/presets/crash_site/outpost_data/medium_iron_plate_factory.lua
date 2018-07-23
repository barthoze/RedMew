local ob = require 'map_gen.presets.crash_site.outpost_builder'
local Token = require 'utils.global_token'

local loot = {
    {weight = 5},
    {stack = {name = 'coin', count = 750, distance_factor = 1 / 2}, weight = 5},
    {stack = {name = 'iron-ore', count = 2400}, weight = 8},
    {stack = {name = 'iron-plate', count = 750, distance_factor = 1 / 2}, weight = 10},
    {stack = {name = 'steel-plate', count = 500, distance_factor = 1 / 5}, weight = 4}
}

local weights = ob.prepare_weighted_loot(loot)

local loot_callback =
    Token.register(
    function(chest)
        ob.do_random_loot(chest, weights, loot)
    end
)

local level2 =
    ob.make_1_way {
    force = 'neutral',
    loot = {callback = loot_callback},
    [1] = {tile = 'concrete'},
    [2] = {tile = 'concrete'},
    [3] = {tile = 'concrete'},
    [4] = {tile = 'concrete'},
    [5] = {tile = 'concrete'},
    [6] = {tile = 'concrete'},
    [7] = {tile = 'concrete'},
    [8] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [9] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [10] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [11] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [12] = {tile = 'concrete'},
    [13] = {tile = 'concrete'},
    [14] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [15] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [16] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [17] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [18] = {tile = 'concrete'},
    [19] = {tile = 'concrete'},
    [20] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [21] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [22] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [23] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [24] = {tile = 'concrete'},
    [25] = {tile = 'concrete'},
    [26] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [27] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [28] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [29] = {entity = {name = 'steel-chest', callback = 'loot'}, tile = 'refined-concrete'},
    [30] = {tile = 'concrete'},
    [31] = {tile = 'concrete'},
    [32] = {tile = 'concrete'},
    [33] = {tile = 'concrete'},
    [34] = {tile = 'concrete'},
    [35] = {tile = 'concrete'},
    [36] = {tile = 'concrete'}
}

local level3 =
    ob.make_1_way {
    force = 'neutral',
    factory = {
        callback = ob.magic_item_crafting_callback,
        data = {
            furance_item = 'iron-ore',
            output = {min_rate = 1.5 / 60, distance_factor = 1.5 / 60 / 100, item = 'iron-plate'}
        }
    },
    max_count = 6,
    fallback = level2,
    [1] = {tile = 'concrete'},
    [2] = {tile = 'concrete'},
    [3] = {tile = 'concrete'},
    [4] = {tile = 'concrete'},
    [5] = {tile = 'concrete'},
    [6] = {tile = 'concrete'},
    [7] = {tile = 'concrete'},
    [8] = {tile = 'refined-concrete'},
    [9] = {tile = 'refined-concrete'},
    [10] = {tile = 'refined-concrete'},
    [11] = {tile = 'refined-concrete'},
    [12] = {tile = 'concrete'},
    [13] = {tile = 'concrete'},
    [14] = {tile = 'refined-concrete'},
    [15] = {entity = {name = 'electric-furnace', callback = 'factory'}, tile = 'refined-concrete'},
    [16] = {tile = 'refined-concrete'},
    [17] = {tile = 'refined-concrete'},
    [18] = {tile = 'concrete'},
    [19] = {tile = 'concrete'},
    [20] = {tile = 'refined-concrete'},
    [21] = {tile = 'refined-concrete'},
    [22] = {tile = 'refined-concrete'},
    [23] = {tile = 'refined-concrete'},
    [24] = {tile = 'concrete'},
    [25] = {tile = 'concrete'},
    [26] = {tile = 'refined-concrete'},
    [27] = {tile = 'refined-concrete'},
    [28] = {tile = 'refined-concrete'},
    [29] = {tile = 'refined-concrete'},
    [30] = {tile = 'concrete'},
    [31] = {tile = 'concrete'},
    [32] = {tile = 'concrete'},
    [33] = {tile = 'concrete'},
    [34] = {tile = 'concrete'},
    [35] = {tile = 'concrete'},
    [36] = {tile = 'concrete'}
}

local level3b =
    ob.extend_1_way(
    level3,
    {
        factory = {
            callback = ob.magic_item_crafting_callback,
            data = {
                furance_item = {name = 'iron-plate', count = 100},
                output = {min_rate = 1.5 / 60, distance_factor = 1.5 / 60 / 100, item = 'steel-plate'}
            }
        }
    }
)

local level4 =
    ob.make_1_way {
    force = 'neutral',
    market = {
        callback = ob.market_set_items_callback,
        data = {
            {
                offer = {type = 'give-item', item = 'iron-plate', count = 100},
                name = 'coin',
                price = 60,
                distance_factor = 1 / 32,
                min_price = 6
            },
            {
                offer = {type = 'give-item', item = 'steel-plate', count = 100},
                name = 'coin',
                price = 300,
                distance_factor = 1 / 32,
                min_price = 30
            }
        }
    },
    max_count = 1,
    fallback = level3,
    [1] = {tile = 'concrete'},
    [2] = {tile = 'concrete'},
    [3] = {tile = 'concrete'},
    [4] = {tile = 'concrete'},
    [5] = {tile = 'concrete'},
    [6] = {tile = 'concrete'},
    [7] = {tile = 'concrete'},
    [8] = {tile = 'refined-concrete'},
    [9] = {tile = 'refined-concrete'},
    [10] = {tile = 'refined-concrete'},
    [11] = {tile = 'refined-concrete'},
    [12] = {tile = 'concrete'},
    [13] = {tile = 'concrete'},
    [14] = {tile = 'refined-concrete'},
    [15] = {entity = {name = 'market', callback = 'market'}},
    [16] = {tile = 'refined-concrete'},
    [17] = {tile = 'refined-concrete'},
    [18] = {tile = 'concrete'},
    [19] = {tile = 'concrete'},
    [20] = {tile = 'refined-concrete'},
    [21] = {tile = 'refined-concrete'},
    [22] = {tile = 'refined-concrete'},
    [23] = {tile = 'refined-concrete'},
    [24] = {tile = 'concrete'},
    [25] = {tile = 'concrete'},
    [26] = {tile = 'refined-concrete'},
    [27] = {tile = 'refined-concrete'},
    [28] = {tile = 'refined-concrete'},
    [29] = {tile = 'refined-concrete'},
    [30] = {tile = 'concrete'},
    [31] = {tile = 'concrete'},
    [32] = {tile = 'concrete'},
    [33] = {tile = 'concrete'},
    [34] = {tile = 'concrete'},
    [35] = {tile = 'concrete'},
    [36] = {tile = 'concrete'}
}

local level4b =
    ob.extend_1_way(
    level4,
    {
        fallback = level3b
    }
)

return {
    settings = {
        blocks = 7,
        variance = 3,
        min_step = 2,
        max_level = 2
    },
    walls = {
        require 'map_gen.presets.crash_site.outpost_data.medium_gun_turrets'
    },
    bases = {
        {level4, level4, level4b, level2}
    }
}
