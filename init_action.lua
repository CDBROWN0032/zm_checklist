-- Variables -- 
local line_break = '----------'
local double_space = '\n\n'
local progress_increment = '||||'
local progress_space = '-'
local end_date = {3, 22, 2022}

local rep_needed = {
    ['03/14'] = 5825,
    ['03/15'] = 7900,    
    ['03/16'] = 8275,
    ['03/17'] = 8650,
    ['03/18'] = 9025,
    ['03/19'] = 9400,
    ['03/20'] = 9775,
    ['03/21'] = 10150,
    ['03/22'] = 12000    
}

local colors = {
    yellow = 'ffffff00',
    dark_green = 'ff008080',
    light_green = 'ff00ff00',
    pink = 'ffff00ff',
    blue = 'ff187bcd',
    red =  'ffff0000'
}

local englightenedRepId = 2478
local reputation = {
    name = 'rep', displayName = 'Rep', level_name = '', current = 0, level_max = 0, percent_complete = 0, percent_complete_rounded = 0    
}

local get_standing = {
    [3] = function() return 'Unfriendly', 0 end,
    [4] = function() return 'Neutral', 3000 end,
    [5] = function() return 'Friendly', 6000 end,
    [6] = function() return 'Honored', 12000 end,
    [7] = function() return 'Revered', 21000 end,
    [8] = function() return 'Exalted', 0 end,        
}

local objectives = {               
    {name = 'dailyQuests', displayName = "Dailies", subCount = false, limit = 3,
        quests = {
            {questId = 65232,reputation = 125,}, -- Annelid-ilation
            {questId = 65081,reputation = 125,}, -- An Apple A Day
            {questId = 65119,reputation = 125,}, -- Automa Ops
            {questId = 65230,reputation = 125,}, -- Bot-any
            {questId = 65117,reputation = 125,}, -- Bad Samples
            {questId = 64974,reputation = 125,}, -- Clean Up, Automa Aisle
            {questId = 65244,reputation = 125,}, -- Devourable
            {questId = 64960,reputation = 125,}, -- Feed the Annelids
            {questId = 65102,reputation = 125,}, -- Fish Eyes
            {questId = 65252,reputation = 125,}, -- Stomp it Now
            {questId = 65234,reputation = 125,}, -- Sweet On Them
            {questId = 65262,reputation = 125,}, -- Save the Wombata
            {questId = 65231,reputation = 125,}, -- Plundered Knowledge
            {questId = 65115,reputation = 125,}, -- Researching the Solution
            {questId = 65407,reputation = 125,}, -- Pattern Recognition
            {questId = 65408,reputation = 125,}, -- Pattern Recognition
            {questId = 65402,reputation = 125,}, -- Pattern Recognition
            {questId = 65405,reputation = 125,}, -- Perplexing Problem
            {questId = 65415,reputation = 125,}, -- Perplexing Problem
            {questId = 65414,reputation = 125,}, -- Perplexing Problem
            {questId = 65404,reputation = 125,}, -- Puzzling It Out
            {questId = 65412,reputation = 125,}, -- Puzzling It Out
            {questId = 65413,reputation = 125,}, -- Puzzling It Out        
            {questId = 65411,reputation = 125,}, -- Puzzling Situation
            {questId = 65410,reputation = 125,}, -- Puzzling Situation
            {questId = 65403,reputation = 125,}, -- Puzzling Situation         
            {questId = 65416,reputation = 125,}, -- Connecting It All
            {questId = 65406,reputation = 125,}, -- Connecting It All
            {questId = 65417,reputation = 125,}, -- Connecting It All    
            {questId = 65089,reputation = 125,}, -- Frog'it
        },
    },        
    {name = 'weeklyQuests', displayName = "Weekly", subCount = false, limit = 0,
        quests = {
            {questId = 66042,reputation = 1250,}, -- Pattern Within Patterns
        },
    },  
    {name = 'worldBoss', displayName = "World Boss", subCount = false, limit = 0, 
        quests = {
            {id = 182466,questId = 65143,reputation = 500,name = 'Antros'},
        }
    },
    {name = 'rareMobs', displayName = "Rares", subCount = true, limit = 0, group_complete = false,
        quests = {           
            {id = 183953,questId = 65273,reputation = 10,name = 'Corrupted Architect'},
            {id = 180917,questId = 64716,reputation = 10,name = 'Destabilized Core'},            
            {id = 180924,questId = 64719,reputation = 15,name = 'Garudeon'},            
            {id = 178778,questId = 65579,reputation = 10,name = 'Gluttonous Overgrowth'},            
            {id = 183748,questId = 65551,reputation = 10,name = 'Helmix'},
            {id = 182155,questId = 65586,reputation = 15,name = 'High Reaver Damaris'},
            {id = 180978,questId = 65548,reputation = 10,name = 'Hirukon'},
            {id = 182114,questId = 65585,reputation = 15,name = 'Iska, Outrider of Ruin'},
            {id = 183646,questId = 65544,reputation = 10,name = 'Furidian'},
            {id = 178229,questId = 65557,reputation = 10,name = 'Feasting'},
            {id = 178508,questId = 65547,reputation = 15,name = 'Mother Phestis'},
            {id = 179043,questId = 65582,reputation = 10,name = 'Orixal'},
            {id = 183814,questId = 65257,reputation = 10,name = 'Otaris the Provoked'},
            {id = 183746,questId = 65556,reputation = 10,name = 'Otiosen'},
            {id = 180746,questId = 64668,reputation = 10,name = 'Protector of the First Ones'},
            {id = 182158,questId = 65587,reputation = 15,name = 'Reanimatrox Marzan'},
            {id = 183927,questId = 65574,reputation = 10,name = 'Sand Matriarch Ileus'},
            {id = 184413,questId = 65549,reputation = 10,name = 'Shifting Stargorger'},          
            {id = 183925,questId = 65272,reputation = 10,name = 'Tahkwitz'},            
            {id = 183516,questId = 65580,reputation = 10,name = 'The Engulfer'},                        
            {id = 183764,questId = 65251,reputation = 10,name = 'Zatojin'},            
        }
    },
    
    {name = 'rotatingMobs', displayName = "Notable Rares", subCount = true, limit = 5, group_complete = false,
        quests = {
            {id = 179006,questId = 65552,reputation = 15,name = 'Akkaris'},
            {id = 183596,questId = 65553,reputation = 10,name = 'Chitali the Eldest'},
            {id = 184409,questId = 65555,reputation = 10,name = "Euv'ouk"},
            {id = 182318,questId = 65583,reputation = 15,name = 'General Zarathura'},
            {id = 178963,questId = 63988,reputation = 10,name = 'Gorkek'},
            {id = 178563,questId = 65581,reputation = 10,name = 'Hadeon the Stonebreaker'},
            {id = 183722,questId = 65240,reputation = 10,name = 'Sorranos'},
            {id = 181249,questId = 65550,reputation = 10,name = 'Tethos'},
            {id = 181360,questId = 65239,reputation = 10,name = 'Vexis'},
            {id = 183747,questId = 65584,reputation = 10,name = 'Vitiane'},
            {id = 183737,questId = 65241,reputation = 10,name = "Xy'rath the Covetous"},    
        },
    },    
}

-- Functions -- 
local set_color = function(text, color)
    return WrapTextInColorCode(text, color) end

local set_header_color = function(name)
    return set_color(name, colors.dark_green) end

local get_quest_complete = function(questId)
    return C_QuestLog.IsQuestFlaggedCompleted(questId) end

local set_quest_complete = function(name)
    return set_color(name, colors.light_green) end

local set_group_complete = function(completed, max)
    completed = set_color(completed, colors.pink)
    max = set_color(max, colors.pink)
    return completed, max    
end

local get_completed_quests = function(objective)
    local completed_quests = 0
    for _, quest in ipairs(objective.quests) do
        if get_quest_complete(quest.questId) then             
            completed_quests = completed_quests + 1
        end
    end
    return completed_quests
end

local build_progress_bar = function(percentage_complete)
    local progress_increments = percentage_complete / 5    
    local progress_bar_start, progress_bar_end = '[', ']'
    local progress_bar = progress_bar_start
    local i = 1
    
    while i <= 20 do
        if i <= progress_increments then            
            progress_bar = progress_bar .. set_quest_complete(progress_increment)
        else
            progress_bar = progress_bar .. progress_space
        end        
        i = i+1
    end
    
    progress_bar = progress_bar .. progress_bar_end
    
    return progress_bar    
end

local set_display_base = function()
    aura_env.text = ''
end


local set_display_line = function(add_line)    
    aura_env.text = aura_env.text .. add_line 
end

local add_mob_list = function(objective)    
    -- if not objective.group_complete then
        -- set_display_line('\n' .. line_break)
    -- end
    if aura_env.config.addSpacers then
        set_display_line('\n' .. line_break)
    end

    for _, quest in ipairs(objective.quests) do                          
        local is_complete = get_quest_complete(quest.questId)
        
        if aura_env.config.hideCompletedMobs then
            if is_complete == false then 
                if not objective.group_complete then
                    set_display_line('\n ' .. quest.name)                 
                end
            end
        else
            local quest_name = is_complete and set_quest_complete(quest.name) or quest.name     
            set_display_line('\n ' .. quest_name)              
        end        
        
    end
end

local set_reputation_data = function(reputation)
    local _, _, standing, minimum, _, current = GetFactionInfoByID(englightenedRepId)    
    reputation.level_name, reputation.level_max  = get_standing[standing]()
    reputation.current = current - minimum
    reputation.percent_complete = (reputation.current / reputation.level_max) * 100
    reputation.percent_complete_rounded = (math.floor(reputation.percent_complete / 5) * 5)
end

local set_reputation_display = function(reputation)
    -- header --     
    set_display_line('\n'.. set_header_color(reputation.displayName) .. ':\n')    
    
    -- body -- 
    set_display_line(' ' .. reputation.level_name .. '\n')
    set_display_line(' ' .. build_progress_bar(reputation.percent_complete_rounded) .. '\n')
    set_display_line(' ' .. reputation.current .. '/' .. reputation.level_max .. '\n')   
end


local set_unity_data = function()
    --local today = date("%m/%d/%y %H:%M:%S")
    local month, day, year = date("%m"), date("%d"), date("%y")
    aura_env.today = month .. '/' .. day
    aura_env.days_till_double = 22-day   
end

local set_unity_display = function()        
    local unity_tracker = reputation.current - rep_needed[aura_env.today]
    if unity_tracker < 0 then 
        unity_tracker = set_color(unity_tracker, colors.red) 
    else 
        unity_tracker = '+' .. set_color(unity_tracker, colors.light_green) 
    end
    
    set_display_line(set_color('Unity: ', colors.blue) .. aura_env.days_till_double .. ' days\n')
    set_display_line(' Target: '.. rep_needed[aura_env.today] .. '\n')
    set_display_line(' At: '.. unity_tracker .. '\n')
end


local set_rares_display = {
    [1] = function(writeLine, objective) set_display_line('\n' .. writeLine) add_mob_list(objective)   end, -- All
    [2] = function(writeLine, objective) set_display_line('\n' .. writeLine) end,                            -- Count Only 
    [3] = function(writeLine, objective) add_mob_list(objective) end,                                        -- List Only
    [4] = function(writeLine, objective) end,                                                                -- None
}



-- Run -- 
aura_env.update_display = function()
    
    -- Base --
    set_display_base()  
    
    set_reputation_data(reputation)    
    set_unity_data()    
    
    
    if aura_env.config.showUnity == true then
        set_unity_display()            
    end
    
    if aura_env.config.showRep == true then
        set_reputation_display(reputation)    
    end
    
    
    -- Set/Display Quests -- 
    for _, objective in ipairs(objectives) do
        
        local available_max = objective.limit == 0 and #objective.quests or objective.limit
        local completed  = get_completed_quests(objective)    
        local is_complete = completed == available_max
        if is_complete then
            completed, available_max = set_group_complete(completed, available_max)
        end
        
        local writeLine = set_header_color(objective.displayName) .. ': ' .. completed .. '/' .. available_max                
        if objective.subCount then set_display_line('\n') end                        
        
        
        
        if objective.name == 'dailyQuests' and aura_env.config.showDailies == true or               
        objective.name == 'weeklyQuests' and aura_env.config.showWeekly == true or        
        objective.name == 'worldBoss' and aura_env.config.showWorldBoss == true then 
            set_display_line('\n' .. writeLine) 
        elseif objective.name == 'rareMobs' then 
        objective.group_complete = is_complete
            set_rares_display[aura_env.config.showRares](writeLine, objective) 
        elseif objective.name == 'rotatingMobs' then 
            objective.group_complete = is_complete
            set_rares_display[aura_env.config.showRotating](writeLine, objective)                                    
        end        
    end
end

aura_env.update_display()