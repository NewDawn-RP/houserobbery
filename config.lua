Config = {}

Config.Hours = {
    Start = 12,
    End = 4,
}

Config.EnableHouseBlips = false

Config.FingerDropChance = 50
Config.MinimumHouseRobberyPolice = 1
Config.NotEnoughCopsNotify = true
Config.UseDrawText = false
--Config.RequiredItems = { 'advancedlockpick', 'screwdriverset' }
Config.RequiredItems = { "advlockpick", }

-- Each key is it's own 'pool'. You can create as many as you want and add them to Config.Interiors per loot spot you add.
-- togive determines how many random unique items to give. toget determines the amount of said unique item you should get
-- Config.Rewards = {
--     { items = { 'metalscrap', 'plastic', 'copper', 'iron', 'aluminum', 'steel', 'glass' }, togive = { min = 2, max = 5 }, toget = { min = 2, max = 5 } },
--     { items = { 'diamond_ring', 'goldchain', 'rolex', '10kgoldchain' }, togive = { min = 1, max = 2 }, toget = { min = 1, max = 2 } },
--     { items = { 'bandage', 'repairkit', 'cleaningkit' }, togive = { min = 1, max = 2 }, toget = { min = 2, max = 5 } },
--     { items = { 'weed_white-widow', 'weed_skunk', 'weed_purple-haze', 'weed_og-kush', 'weed_amnesia', 'weed_ak47' }, togive = { min = 1, max = 2 }, toget = { min = 3, max = 8 } },
--     { items = { 'metalscrap', 'plastic', 'copper', 'iron', 'aluminum', 'steel', 'glass' }, togive = { min = 3, max = 6 }, toget = { min = 6, max = 15 } },
--     { items = { 'diamond_ring', 'goldchain', 'rolex', '10kgoldchain' }, togive = { min = 1, max = 3 }, toget = { min = 2, max = 5 } },
--     { items = { 'weed_white-widow', 'weed_skunk', 'weed_purple-haze', 'weed_og-kush', 'weed_amnesia', 'weed_ak47' }, togive = { min = 3, max = 6 }, toget = { min = 5, max = 18 } },
-- }

Config.Rewards = {
    { items = { 'rolex' }, togive = { min = 1, max = 1 }, toget = { min = 1, max = 4 } },
    { items = { 'ring' }, togive = { min = 1, max = 1 }, toget = { min = 1, max = 2 } },
    { items = { 'necklace' }, togive = { min = 1, max = 1 }, toget = { min = 2, max = 7 } },
    { items = { 'black_money' }, togive = { min = 1, max = 1 }, toget = { min = 1, max = 343 } },
    { items = { "jewels" }, togive = { min = 1, max = 1 }, toget = { min = 2, max = 7 } },
    { items = { "diamond" }, togive = { min = 1, max = 1 }, toget = { min = 1, max = 2 } },
}

-- Pre set interiors to use in Config.Houses. Shouldn't touch this unless you know what you are doing. You can however change the skillcheck difficulty.
-- And change the loot pools around to give players different rewards. The player will randomly get the rewards from one of the pools defined underneath.
Config.Interiors = {
    [1] = {
        exit = vector4(266.11, -1007.61, -101.01, 357.68),
        skillcheck = { 'easy', 'medium', 'easy', 'medium' },
        callCopsTimeout = 30000,
        loot = {
            { coords = vector3(265.97, -999.46, -99.01), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(265.66, -997.40, -99.01), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(263.69, -995.40, -99.01), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(262.67, -999.88, -99.01), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(257.01, -995.84, -99.01), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(256.73, -998.34, -99.01), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(259.98, -1004.0, -99.01), pool = {1, 2, 3, 4, 5, 6} },
        },
        pickups = {
            { coords = vector3(262.77, -1002.53, -99.01), model = 'prop_tv_flat_03', reward = 'small_tv' },
            { coords = vector3(265.85, -995.46, -99.01), model = 'prop_toaster_02', reward = 'toaster' }
        }
    },
    [2] = {
        exit = vector4(346.55, -1012.83, -99.2, 5.8),
        skillcheck = { 'medium', 'easy', 'hard', 'medium' },
        callCopsTimeout = 25000,
        -- loot = {
        --     { coords = vector3(346.15, -1001.71, -99.2), pool = {1, 2, 3, 4, 5, 6} },
        --     { coords = vector3(345.01, -995.49, -99.2), pool = {1, 2, 3, 4, 5, 6} },
        --     { coords = vector3(341.97, -997.45, -99.2), pool = {1, 2, 3, 4, 5, 6} },
        --     { coords = vector3(340.69, -995.03, -99.2), pool = {1, 2, 3, 4, 5, 6} },
        --     { coords = vector3(338.35, -995.22, -99.2), pool = {1, 2, 3, 4, 5, 6} },
        --     { coords = vector3(338.31, -997.88, -99.2), pool = {1, 2, 3, 4, 5, 6} },
        --     { coords = vector3(339.71, -1000.35, -99.2), pool = {1, 2, 3, 4, 5, 6} },
        --     { coords = vector3(338.6, -1003.18, -99.2), pool = {1, 2, 3, 4, 5, 6} },
        --     { coords = vector3(351.13, -999.23, -99.2), pool = {1, 2, 3, 4, 5, 6} },
        --     { coords = vector3(351.31, -993.76, -99.2), pool = {1, 2, 3, 4, 5, 6} },
        --     { coords = vector3(349.36, -995.05, -99.2), pool = {1, 2, 3, 4, 5, 6} },
        --     { coords = vector3(347.5, -994.17, -99.2), pool = {1, 2, 3, 4, 5, 6} },
        -- },
        loot = {
            { coords = vector3(346.15, -1001.71, -99.2), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(345.01, -995.49, -99.2), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(341.97, -997.45, -99.2), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(340.69, -995.03, -99.2), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(338.35, -995.22, -99.2), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(338.31, -997.88, -99.2), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(339.71, -1000.35, -99.2), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(338.6, -1003.18, -99.2), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(351.13, -999.23, -99.2), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(351.31, -993.76, -99.2), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(349.36, -995.05, -99.2), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(347.5, -994.17, -99.2), pool = {1, 2, 3, 4, 5, 6} },
        },
        pickups = {
            { coords = vector3(344.14, -1002.33, -99.2), model = 'prop_micro_01', reward = 'microwave' },
            { coords = vector3(342.31, -1003.3, -99.2), model = 'prop_toaster_01', reward = 'toaster' }
        }
    },
    [3] = {
        exit = vector4(-174.27, 497.71, 137.65, 191.5),
        skillcheck = { 'hard', 'medium', 'hard', 'medium' },
        callCopsTimeout = 20000,
        loot = {
            { coords = vector3(-170.21, 495.82, 137.65), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(-168.18, 494.13, 137.65), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(-171.02, 486.88, 137.44), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(-163.0, 482.49, 137.27), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(-164.44, 487.09, 137.44), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(-170.32, 482.18, 133.85), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(-162.86, 482.02, 133.87), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(-167.4, 487.85, 133.84), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(-165.71, 495.38, 133.85), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(-172.71, 500.42, 130.04), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(-174.45, 496.08, 130.04), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(-170.01, 491.14, 130.04), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(-174.03, 493.64, 130.04), pool = {1, 2, 3, 4, 5, 6} },
            { coords = vector3(-175.79, 492.05, 130.04), pool = {1, 2, 3, 4, 5, 6} },
        },
        pickups = {
            { coords = vector3(-165.26, 495.01, 137.65), model = 'prop_micro_02', reward = 'microwave' },
            { coords = vector3(-165.89, 497.0, 137.65), model = 'prop_toaster_01', reward = 'toaster' }
        }
    },
}

Config.Houses = {
    [1] = {
        routingbucket = 600,
        interior = 1,
        opened = false,
        coords = vector3(325.0551, 537.2365, 153.8681),
        setup = {
            loot = {
                min = 3,
                max = 7
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [2] = {
        routingbucket = 601,
        interior = 1,
        opened = false,
        coords = vector3(315.8076, 501.9944, 153.1797),
        setup = {
            loot = {
                min = 3,
                max = 7
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [3] = {
        routingbucket = 602,
        interior = 1,
        opened = false,
        coords = vector3(331.4849, 465.2738, 151.2539),
        setup = {
            loot = {
                min = 3,
                max = 7
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [4] = {
        routingbucket = 603,
        interior = 1,
        opened = false,
        coords = vector3(346.6249, 440.6655, 147.7025),
        setup = {
            loot = {
                min = 3,
                max = 7
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [5] = {
        routingbucket = 604,
        interior = 1,
        opened = false,
        coords = vector3(374.0694, 427.7520, 145.6841),
        setup = {
            loot = {
                min = 3,
                max = 7
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [6] = {
        routingbucket = 605,
        interior = 1,
        opened = false,
        coords = vector3(224.0175, 513.7964, 140.7666),
        setup = {
            loot = {
                min = 3,
                max = 7
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [7] = {
        routingbucket = 606,
        interior = 2,
        opened = false,
        coords = vector3(167.4602, 473.8024, 142.5133),
        setup = {
            loot = {
                min = 4,
                max = 12
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [8] = {
        routingbucket = 607,
        interior = 2,
        opened = false,
        coords = vector3(119.8064, 494.5789, 147.3429),
        setup = {
            loot = {
                min = 4,
                max = 12
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [9] = {
        routingbucket = 608,
        interior = 2,
        opened = false,
        coords = vector3(79.9768, 486.2426, 148.2017),
        setup = {
            loot = {
                min = 4,
                max = 12
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [10] = {
        routingbucket = 609,
        interior = 2,
        opened = false,
        coords = vector3(57.5175, 449.7034, 147.0308),
        setup = {
            loot = {
                min = 4,
                max = 12
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [11] = {
        routingbucket = 610,
        interior = 2,
        opened = false,
        coords = vector3(42.7561, 468.8435, 148.0961),
        setup = {
            loot = {
                min = 4,
                max = 12
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [12] = {
        routingbucket = 611,
        interior = 2,
        opened = false,
        coords = vector3(-7.9923, 467.8922, 145.8457),
        setup = {
            loot = {
                min = 4,
                max = 12
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [13] = {
        routingbucket = 612,
        interior = 1,
        opened = false,
        coords = vector3(-66.9801, 489.9948, 144.8848),
        setup = {
            loot = {
                min = 3,
                max = 7
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [14] = {
        routingbucket = 613,
        interior = 1,
        opened = false,
        coords = vector3(-230.2332, 487.9367, 128.7680),
        setup = {
            loot = {
                min = 3,
                max = 7
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [15] = {
        routingbucket = 614,
        interior = 2,
        opened = false,
        coords = vector3(-355.2990, 469.9851, 112.4995),
        setup = {
            loot = {
                min = 3,
                max = 12
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [16] = {
        routingbucket = 615,
        interior = 2,
        opened = false,
        coords = vector3(-579.5901, 732.7120, 184.2472),
        setup = {
            loot = {
                min = 6,
                max = 12
            },
            pickups = {
                min = 1,
                max = 2
            }
        },
        loot = {},
        pickups = {}
    },
    [17] = {
        routingbucket = 616,
        interior = 2,
        opened = false,
        coords = vector3(-595.9995, 780.4598, 189.3096),
        setup = {
            loot = {
                min = 6,
                max = 12
            },
            pickups = {
                min = 1,
                max = 2
            }
        },
        loot = {},
        pickups = {}
    },
    [18] = {
        routingbucket = 617,
        interior = 1,
        opened = false,
        coords = vector3(-599.6794, 807.5953, 191.5224),
        setup = {
            loot = {
                min = 2,
                max = 6
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [19] = {
        routingbucket = 618,
        interior = 1,
        opened = false,
        coords = vector3(-654.8705, 802.9325, 198.9914),
        setup = {
            loot = {
                min = 2,
                max = 6
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [20] = {
        routingbucket = 619,
        interior = 1,
        opened = false,
        coords = vector3(-606.1866, 672.2381, 151.6143),
        setup = {
            loot = {
                min = 2,
                max = 6
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [21] = {
        routingbucket = 620,
        interior = 1,
        opened = false,
        coords = vector3(-564.3889, 684.7552, 146.6333),
        setup = {
            loot = {
                min = 2,
                max = 6
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
    [22] = {
        routingbucket = 621,
        interior = 3,
        opened = false,
        coords = vector3(-559.6687, 664.1594, 145.4570),
        setup = {
            loot = {
                min = 2,
                max = 6
            },
            pickups = {
                min = 1,
                max = 1
            }
        },
        loot = {},
        pickups = {}
    },
}
