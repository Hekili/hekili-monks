-- Monk.lua
-- Testing modularization of classes.
-- October 2016


local Retrieve = Hekili.RetrieveFromNamespace
local Commit = Hekili.StoreInNamespace


local class = Retrieve( 'class' )
local state = Retrieve( 'state' )

local addHook = Retrieve( 'addHook' )

local addAbility = Retrieve( 'addAbility' )
local modifyAbility = Retrieve( 'modifyAbility' )
local addHandler = Retrieve( 'addHandler' )

local addAura = Retrieve( 'addAura' )
local modifyAura = Retrieve( 'modifyAura' )

local addCastExclusion = Retrieve( 'addCastExclusion' )
local addGearSet = Retrieve( 'addGearSet' )
local addGlyph = Retrieve( 'addGlyph' )
local addMetaFunction = Retrieve( 'addMetaFunction' )
local addTalent =  Retrieve( 'addTalent' )
local addPerk = Retrieve( 'addPerk' )
local addResource = Retrieve( 'addResource' )
local addStance = Retrieve( 'addStance' )

local addSetting = Retrieve( 'addSetting' )
local addToggle = Retrieve( 'addToggle' )

local registerCustomVariable = Retrieve( 'registerCustomVariable' )
local registerInterrupt = Retrieve( 'registerInterrupt' )

local removeResource = Retrieve( 'removeResource' )

local setClass = Retrieve( 'setClass' )
local setPotion = Retrieve( 'setPotion' )
local setRole = Retrieve( 'setRole' )

local RegisterEvent = Retrieve( 'RegisterEvent' )

local retireDefaults = Retrieve( 'retireDefaults' )
local storeDefault = Retrieve( 'storeDefault' )


local PTR = Retrieve( 'PTR' )


if select( 2, UnitClass( 'player' ) ) == 'MONK' then

    local function MonkInit()

        Hekili:Print("Initializing Monk Class Module.")

        setClass( 'MONK' )

        addResource( 'energy', true )
        addResource( 'chi' )

        addTalent( 'ascension', 115396 )
        addTalent( 'black_ox_brew', 115399 )
        addTalent( 'blackout_combo', 196736 )
        addTalent( 'celerity', 115173 )
        addTalent( 'chi_burst', 123986 )
        addTalent( 'chi_orbit', 196743 )
        addTalent( 'chi_torpedo', 115008 )
        addTalent( 'chi_wave', 115098 )
        addTalent( 'dampen_harm', 122278 )
        addTalent( 'elusive_dance', 196738 )
        addTalent( 'energizing_elixir', 115288 )
        addTalent( 'eye_of_the_tiger', 196607 )
        addTalent( 'gift_of_the_mists', 196719 )
        addTalent( 'healing_elixir', 122281 )
        addTalent( 'high_tolerance', 196737 )
        addTalent( 'hit_combo', 196740 )
        addTalent( 'invoke_niuzao', 132578 )
        addTalent( 'invoke_xuen', 123904 )
        addTalent( 'leg_sweep', 119381 )
        addTalent( 'light_brewing', 196721 )
        addTalent( 'power_strikes', 121817 )
        addTalent( 'ring_of_peace', 116844 )
        addTalent( 'rushing_jade_wind', 116847 )
        addTalent( 'serenity', 152173 )
        addTalent( 'special_delivery', 196730 )
        addTalent( 'summon_black_ox_statue', 115315 )
        addTalent( 'whirling_dragon_punch', 152175 )
        addTalent( 'mystic_vitality', 237076 )            


        -- Buffs/Debuffs
        addAura( 'blackout_combo', 228563, 'duration', 15 )
        addAura( 'bok_proc', 116768, 'duration', 15 )
        addAura( 'breath_of_fire', 115181, 'duration', 8 )
        addAura( 'brewstache', 214373, 'duration', 4.5 )
        addAura( 'chi_torpedo', 115008, 'duration', 10, 'max_stack', 2 )
        addAura( 'dampen_harm', 122278, 'duration', 45, 'max_stack', 3 )
        addAura( 'diffuse_magic', 122783, 'duration', 6 )
        addAura( 'elusive_brawler', 195630, 'duration', 10, 'max_stack', 10 )
        addAura( 'eye_of_the_tiger', 196608, 'duration', 8 )
        addAura( 'fists_of_fury', 113656, 'duration', 4 )
        addAura( 'fortification', 213341, 'duration', 21 )
        addAura( 'fortifying_brew', 115203, 'duration', 15 )
        addAura( 'gale_burst', 195399, 'duration', 8 )
        addAura( 'healing_winds', 195380, 'duration', 6 )
        addAura( 'hidden_masters_forbidden_touch', 213112, 'duration', 3 )
        addAura( 'hit_combo', 196741, 'max_stack', 8, 'duration', 10 )
        addAura( 'ironskin_brew', 115308, 'duration', 6 )
        addAura( 'keg_smash', 121253, 'duration', 15 )
        addAura( 'leg_sweep', 119381, 'duration', 5 )
        addAura( 'mark_of_the_crane', 228287, 'duration', 15 )
        addAura( 'paralysis', 115078, 'duration', 15 )
        addAura( 'power_strikes', 129914 )
        addAura( 'provoke', 115546, 'duration', 8 )
        addAura( 'ring_of_peace', 116844, 'duration', 8 )
        addAura( 'rising_sun_kick', 107428, 'duration', 10 )
        addAura( 'rushing_jade_wind', 116847, 'duration', 6 )
        addAura( 'serenity', 152173, 'duration', 8 )
        addAura( 'special_delivery', 196734, 'duration', 15 )
        addAura( 'storm_earth_and_fire', 137639, 'duration', 15 )
        addAura( 'strike_of_the_windlord', 205320, 'duration', 6 )
        addAura( 'swift_as_a_coursing_river', 213177, 'duration', 15, 'max_stack', 5 )
        addAura( 'the_emperors_capacitor', 235054, 'duration', 30, 'max_stack', 20 )
        addAura( 'tigers_lust', 116841, 'duration', 6 )
        addAura( 'touch_of_death', 115080, 'duration', 8 )
        addAura( 'transfer_the_power', 195321, 'duration', 30, 'max_stack', 10 )

        addAura( 'light_stagger', 124275, 'duration', 10, 'unit', 'player' )
        addAura( 'moderate_stagger', 124274, 'duration', 10, 'unit', 'player' )
        addAura( 'heavy_stagger', 124273, 'duration', 10, 'unit', 'player' )

        addHook( 'reset_postcast', function( x )
            for k,v in pairs( state.stagger ) do
                state.stagger[k] = nil
            end
            return x
        end )

        --[[ addHook( 'advance_bonus_cdr', function( x )
            if state.buff.serenity.up then
                return min( x, state.buff.serenity.remains )
            end

            return 0
        end ) ]]


        -- Fake Buffs.
        -- None at this time.


        -- Gear Sets
        addGearSet( 'tier19', 138325, 138328, 138331, 138334, 138337, 138367 )
        addGearSet( 'class', 139731, 139732, 139733, 139734, 139735, 139736, 139737, 139738 )
        addGearSet( 'fists_of_the_heavens', 128940 )
        addGearSet( 'fu_zan_the_wanderers_companion', 128938 )

        addGearSet( 'cenedril_reflector_of_hatred', 137019 )
        addGearSet( 'cinidaria_the_symbiote', 133976 )
        addGearSet( 'drinking_horn_cover', 137097 )
        addGearSet( 'firestone_walkers', 137027 )
        addGearSet( 'fundamental_observation', 137063 )
        addGearSet( 'gai_plins_soothing_sash', 137079 )
        addGearSet( 'hidden_masters_forbidden_touch', 137057 )
        addGearSet( 'jewel_of_the_lost_abbey', 137044 )
        addGearSet( 'katsuos_eclipse', 137029 )
        addGearSet( 'march_of_the_legion', 137220 )
        addGearSet( 'prydaz_xavarics_magnum_opus', 132444 )
        addGearSet( 'salsalabims_lost_tunic', 137016 )
        addGearSet( 'sephuzs_secret', 132452 )
        addGearSet( 'the_emperors_capacitor', 144239 )


        addHook( 'specializationChanged', function ()
            setPotion( 'prolonged_power' )
            setRole( state.spec.brewmaster and 'tank' or 'attack' )
        end )

        addHook( 'reset_precast', function ()
            if state.spec.windwalker and state.talent.hit_combo.enabled and state.prev_gcd.tiger_palm and state.chi.current == 0 then
                -- We won't proc Hit Combo from Tiger Palm, but we don't have anything else to hit.
                state.prev.last = 'none'
                state.prev_gcd.last = 'none'
            end
            rawset( state.healing_sphere, 'count', nil )
            state.stagger.amount = nil
        end )

        addHook( 'spend', function( amt, resource )
            if state.equipped.drinking_horn_cover and resource == 'chi' and state.buff.storm_earth_and_fire.up then
                state.buff.storm_earth_and_fire.expires = state.buff.storm_earth_and_fire.expires + 1
            end

            if state.equipped.the_emperors_capacitor and resource == 'chi' then
                state.addStack( 'the_emperors_capacitor', 30, 1 )
            end
        end )


        state.spinning_crane_kick = setmetatable( {}, {
            __index = function( t, k, v )
                if k == 'count' then
                    return state.active_dot.mark_of_the_crane
                end
            end } )

        state.healing_sphere = setmetatable( {}, {
            __index = function( t, k, v )
                if k == 'count' then
                    return GetSpellCount( state.action.expel_harm.id )
                end
            end } )


        local staggered_damage = {}
        local total_staggered = 0

        local myGUID = UnitGUID( 'player' )

        RegisterEvent( "COMBAT_LOG_EVENT_UNFILTERED", function( event, _, subtype, _, sourceGUID, sourceName, _, _, destGUID, destName, destFlags, _, arg1, _, _, _, arg5, _, _, arg8, _, _, arg11 )

            if destGUID == myGUID and subtype == 'SPELL_ABSORBED' then

                local now = GetTime()

                if arg1 == myGUID and arg5 == 115069 then -- This was melee damage that was absorbed.

                    table.insert( staggered_damage, 1, {
                        t = now,
                        d = arg8,
                        s = 6603 -- auto attack
                    } )
                    total_staggered = total_staggered + arg8

                elseif arg8 == 115069 then

                    table.insert( staggered_damage, 1, {
                        t = now,
                        d = arg11,
                        s = arg1
                    } )
                    total_staggered = total_staggered + arg11

                end
            end

        end )

        local function stagger_in_last( t )

            local now = GetTime()

            for i = #staggered_damage, 1, -1 do
                if staggered_damage[i].t + 10 < now then
                    total_staggered = max( 0, total_staggered - staggered_damage[i].d )
                    table.remove( staggered_damage, i )
                else
                    break
                end
            end

            t = min( 10, t )

            if t == 10 then return total_staggered end

            local sum = 0

            for i = 1, #staggered_damage do
                if staggered_damage[i].t > now + t then
                    break
                end
                sum = sum + staggered_damage[i]
            end

            return sum

        end

        local function avg_stagger_ps_in_last( t )

            t = max( 1, min( 10, t ) )

            return stagger_in_last( t ) / t

        end


        state.stagger = setmetatable( {}, {
            __index = function( t, k, v )
                local stagger = state.debuff.heavy_stagger.up and state.debuff.heavy_stagger or nil
                stagger = stagger or ( state.debuff.moderate_stagger.up and state.debuff.moderate_stagger ) or nil
                stagger = stagger or ( state.debuff.light_stagger.up and state.debuff.light_stagger ) or nil

                if not stagger then
                    if k == 'up' then return false
                    elseif k == 'down' then return true
                    else return 0 end
                end

                if k == 'tick' then
                    return state.stagger.amount / state.stagger.ticks_remain

                elseif k == 'ticks_remain' then
                    return math.floor( stagger.remains / 0.5 )

                elseif k == 'amount' then
                    t[k] = UnitStagger( 'player' )
                    return t[k]

                elseif k == 'incoming_per_second' then
                    return avg_stagger_ps_in_last( 10 )

                elseif k == 'time_to_death' then
                    return math.ceil( health.current / stagger.v1 )

                elseif k == 'percent_max_hp' then
                    return ( 100 * state.stagger.amount / state.health.max )

                elseif k == 'percent_remains' then
                    return total_staggered > 0 and ( 100 * state.stagger.amount / stagger_in_last( 10 ) ) or 0

                elseif k == 'total' then
                    return total_staggered

                elseif k == 'dump' then
                    DevTools_Dump( staggered_damage )

                end

                return nil

            end } )


        addToggle( 'strike_of_the_windlord', true, 'Artifact Ability',
            'Set a keybinding to toggle your artifact ability on/off in your priority lists.' )

        addSetting( 'strike_cooldown', true, {
            name = "Artifact Ability: Cooldown Override",
            type = "toggle",
            desc = "If |cFF00FF00true|r, when your Cooldown toggle is |cFF00FF00ON|r then the toggle for your artifact ability will be overridden and your artifact ability will be shown regardless of its toggle above.",
            width = "full"
        } )

        addToggle( 'use_defensives', true, "Brewmaster: Use Defensives",
            "Set a keybinding to toggle your defensive abilities on/off in your priority lists." )

        addSetting( 'purify_light', 60, {
            name = "Brewmaster: Light Stagger Purify Threshold",
            type = "range",
            min = 0,
            max = 100,
            step = 1,
            desc = "Specify the amount of damage, as a percentage of damage Staggered in the previous 10 seconds, that must be Staggered before Purifying Brew can be recommended by the addon.  " ..
                "This setting applies when your current level of Stagger is Light.\n\n" ..
                "If set to 0, Purifying Brew can be recommended regardless of your Stagger damage, based solely on the criteria of your action lists.\r\n\r\n" ..
                "Remember, tanking is complex and you may want to use your defensive abilities proactively to manage mechanics that the addon cannot see.",
            width = "full"
        } )

        addSetting( 'purify_moderate', 60, {
            name = "Brewmaster: Moderate Stagger Purify Threshold",
            type = "range",
            min = 0,
            max = 100,
            step = 1,
            desc = "Specify the amount of damage, as a percentage of damage Staggered in the previous 10 seconds, that must be Staggered before Purifying Brew can be recommended by the addon.  " ..
                "This setting applies when your current level of Stagger is Moderate.\n\n" ..
                "If set to 0, Purifying Brew can be recommended regardless of your Stagger damage, based solely on the criteria of your action lists.\r\n\r\n" ..
                "Remember, tanking is complex and you may want to use your defensive abilities proactively to manage mechanics that the addon cannot see.",
            width = "full"
        } )

        addSetting( 'purify_heavy', 40, {
            name = "Brewmaster: Heavy Stagger Purify Threshold",
            type = "range",
            min = 0,
            max = 100,
            step = 1,
            desc = "Specify the amount of damage, as a percentage of damage Staggered in the previous 10 seconds, that must be Staggered before Purifying Brew can be recommended by the addon.  " ..
                "This setting applies when your current level of Stagger is Heavy.\n\n" ..
                "If set to 0, Purifying Brew can be recommended regardless of your Stagger damage, based solely on the criteria of your action lists.\r\n\r\n" ..
                "Remember, tanking is complex and you may want to use your defensive abilities proactively to manage mechanics that the addon cannot see.",
            width = "full"
        } )

        addSetting( 'purify_extreme', 20, {
            name = "Brewmaster: Extreme Stagger Purify Threshold",
            type = "range",
            min = 0,
            max = 100,
            step = 1,
            desc = "Specify the amount of damage, as a percentage of damage Staggered in the previous 10 seconds, that must be Staggered before Purifying Brew can be recommended by the addon.  " ..
                "This setting applies when your current level of Stagger is Heavy and you have Staggered more than twice your maximum health in the past 10 seconds.\n\n" ..
                "If set to 0, Purifying Brew can be recommended regardless of your Stagger damage, based solely on the criteria of your action lists.\r\n\r\n" ..
                "Remember, tanking is complex and you may want to use your defensive abilities proactively to manage mechanics that the addon cannot see.",
            width = "full"
        } )

        addSetting( 'tp_energy', 65, {
            name = "Brewmaster: Tiger Palm Energy",
            type = "range",
            min = 25,
            max = 100,
            step = 1,
            desc = "Use this setting to specify the minimum Energy required before Tiger Palm is recommended.\r\n\r\n" ..
                "Using this setting, rather than adding an |cFFFFD100energy.current>=X|r condition is recommended, as this will allow the addon's engine to predict how long before Tiger Palm is ready with X energy.\r\n\r\n" ..
                "This setting applies only to Brewmaster Monks.",
            width = "full",
        } )


        -- Using these to abstract the 'Strike of the Windlord' options so the same keybinds/toggles work in Brewmaster spec.
        addMetaFunction( 'toggle', 'artifact_ability', function()
            return state.toggle.strike_of_the_windlord
        end )

        addMetaFunction( 'settings', 'artifact_cooldown', function()
            return state.settings.strike_cooldown
        end )

        addMetaFunction( 'state', 'gcd', function()
            return 1.0
        end )

        addMetaFunction( 'state', 'use_defensives', function()
            if not state.spec.brewmaster then return false end
            return state.toggle.use_defensives
        end )


        -- Abilities.
        addAbility( 'black_ox_brew', {
            id = 115399,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 90,
            known = function() return spec.brewmaster and talent.black_ox_brew.enabled end,
        } )

        addHandler( 'black_ox_brew', function ()
            gain( energy.max, 'energy' )
            gainCharges( 'ironskin_brew', class.abilities.ironskin_brew.charges )
            gainCharges( 'purifying_brew', class.abilities.purifying_brew.charges )
        end )

        addAbility( 'blackout_kick', {
            id = 100784,
            spend = 1,
            spend_type = 'chi',
            cast = 0,
            gcdType = 'melee',
            cooldown = 0,
            cycle = 'mark_of_the_crane'
        } )

        modifyAbility( 'blackout_kick', 'spend', function( x )
            if buff.serenity.up then return 0
            elseif buff.bok_proc.up then return 0 end
            return x
        end )

        addHandler( 'blackout_kick', function ()
            if buff.bok_proc.up and buff.serenity.down then
                removeBuff( 'bok_proc' )
            end

            applyDebuff( 'target', 'mark_of_the_crane', 15 )
            
            if talent.dizzying_kicks.enbled then
                applyDebuff( 'target', 'dizzying_kicks', 3 )
            end

            if talent.hit_combo.enabled then
                if prev_gcd.blackout_kick then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'blackout_strike', {
            id = 205523,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            cooldown = '3',
            known = function () return spec.brewmaster end
        } )

        modifyAbility( 'blackout_strike', 'cooldown', function( x )
            return x * haste
        end )

        addHandler( 'blackout_strike', function ()
            if talent.blackout_combo.enabled then
                applyBuff( 'blackout_combo', 15 )
            end
        end )


        addAbility( 'breath_of_fire', {
            id = 115181,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            cooldown = 15,
            cycle = 'breath_of_fire'
        } )

        modifyAbility( 'breath_of_fire', 'cooldown', function( x )
            if buff.blackout_combo.up then
                return x - 6
            end
            return x
        end )

        addHandler( 'breath_of_fire', function ()
            if debuff.keg_smash.up then applyDebuff( 'target', 'breath_of_fire', 8 ) end
            if equipped.firestone_walkers then setCooldown( 'fortifying_brew', max( 0, cooldown.fortifying_brew.remains - ( min( 6, active_enemies * 2 ) ) ) ) end
            -- cooldown.fortifying_brew.expires = max( state.query_time, cooldown.fortifying_brew.expires - 4 + ( buff.blackout_combo.up and 2 or 0 ) )
            removeBuff( 'blackout_combo' )
        end )


        addAbility( 'chi_burst', {
            id = 123986,
            spend = 0,
            spend_type = 'energy',
            cast = 1,
            gcdType = 'spell',
            cooldown = 30,
            known = function () return talent.chi_burst.enabled end
        } )

        modifyAbility( 'chi_burst', 'cast', function( x )
            return x * haste
        end )

        addHandler( 'chi_burst', function ()
            if talent.hit_combo.enabled then
                if prev_gcd.chi_burst then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'chi_wave', {
            id = 115098,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 15,
            known = function () return talent.chi_wave.enabled end
        } )

        addHandler( 'chi_wave', function ()
            if talent.hit_combo.enabled then
                if prev_gcd.chi_wave then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'crackling_jade_lightning', {
            id = 117952,
            spend = 20,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 0,
            channeled = true,
            break_channel = true,
        } )

        addHandler( 'crackling_jade_lightning', function ()
            removeBuff( 'the_emperors_capacitor' )
            if talent.hit_combo.enabled then
                if prev_gcd.crackling_jade_lightning then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'dampen_harm', {
            id = 122278,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 120,
            known = function () return talent.dampen_harm.enabled end
        } )

        addHandler( 'dampen_harm', function ()
            applyBuff( 'dampen_harm', 45, 3 )
        end )

        
        addAbility( 'diffuse_magic', {
            id = 122783,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 90,
            known = function () return spec.windwalker or talent.diffuse_magic.enabled end,
        } )

        addHandler( 'diffuse_magic', function ()
            applyBuff( 'diffuse_magic', 6 )
        end )


        addAbility( 'effuse', {
            id = 116694,
            spend = 30,
            spend_type = 'energy',
            cast = 1.5,
            gcdType = 'spell',
            cooldown = 0,
        } )


        addAbility( 'energizing_elixir', {
            id = 115288,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 60,
            known = function () return talent.energizing_elixir.enabled end
        } )

        addHandler( 'energizing_elixir', function ()
            gain( energy.max, 'energy' )
            gain( chi.max, 'chi' )
        end )

        addCastExclusion( 'energizing_elixir' )


        addAbility( 'expel_harm', {
            id = 115072,
            spend = 15,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 0,
            usable = function () return healing_sphere.count > 0 end
        } )

        addHandler( 'expel_harm', function ()
            healing_sphere.count = 0
        end )


        addAbility( 'exploding_keg', {
            id = 214326,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 75,
            known = function () return equipped.fu_zan_the_wanderers_companion and ( toggle.artifact_ability or ( toggle.cooldowns and settings.artifact_cooldown ) ) end,
        } )


        addAbility( 'fists_of_fury', {
            id = 113656,
            spend = 3,
            spend_type = 'chi',
            cast = 4,
            channeled = true,
            gcdType = 'spell',
            cooldown = 24,
        } )

        modifyAbility( 'fists_of_fury', 'cast', function( x )
            return x * haste
        end )

        modifyAbility( 'fists_of_fury', 'spend', function( x )
            if buff.serenity.up then return 0
            elseif equipped.katsuos_eclipse then return max( 0, x - 2 ) end
            return x
        end )

        modifyAbility( 'fists_of_fury', 'cooldown', function( x )
            if buff.serenity.up then
                x = max( 0, x - ( buff.serenity.remains / 2 ) )
            end
            return x * haste
        end )

        -- By having the ability's handler set the global cooldown to 4 seconds (reduced by haste),
        -- the addon's next prediction will wait until the global cooldown ends.
        -- We should watch this for unintended consequences.
        addHandler( 'fists_of_fury', function ()
            applyBuff( 'fists_of_fury', 4 * haste )
            if talent.hit_combo.enabled then
                if prev_gcd.fists_of_fury then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'fortifying_brew', {
            id = 115203,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 420,
        } )

        addHandler( 'fortifying_brew', function ()
            applyBuff( 'fortifying_brew', 15 )
            if artifact.fortification.enabled then applyBuff( 'fortification', 21 ) end
            if artifact.swift_as_a_coursing_river.enabled then addStack( 'swift_as_a_coursing_river', 15, 1 ) end
            health.max = health.max * 1.2
            health.current = health.current * 1.2
        end )


        addAbility( 'ironskin_brew', {
            id = 115308,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 21,
            charges = 3,
            recharge = 21,
        } )

        modifyAbility( 'ironskin_brew', 'cooldown', function( x )
            return x * haste
        end )

        modifyAbility( 'ironskin_brew', 'recharge', function( x )
            return x * haste
        end )

        modifyAbility( 'ironskin_brew', 'charges', function( x )
            return x + ( talent.light_brewing.enabled and 1 or 0 )
        end )

        addHandler( 'ironskin_brew', function ()
            applyBuff( 'ironskin_brew', buff.ironskin_brew.remains + 6 + ( artifact.potent_kick.rank * 0.5 ) )
            spendCharges( 'purifying_brew', 1 )
            if artifact.brewstache.enabled then applyBuff( 'brewstache', 4.5 ) end
            if artifact.swift_as_a_coursing_river.enabled then addStack( 'swift_as_a_coursing_river', 15, 1 ) end
            removeBuff( 'blackout_combo' )
        end )


        addAbility( 'invoke_xuen', {
            id = 123904,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 180,
            known = function() return talent.invoke_xuen.enabled end,
            toggle = 'cooldowns'
        } )

        addHandler( 'invoke_xuen', function ()
            summonPet( 'xuen', 45 )
        end )


        addAbility( 'keg_smash', {
            id = 121253,
            spend = 40,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            cooldown = 8,
            cycle = 'keg_smash'
        } )

        modifyAbility( 'keg_smash', 'cooldown', function( x )
            return x * haste
        end )

        addHandler( 'keg_smash', function ()
            applyDebuff( 'target', 'keg_smash', 15 )
            active_dot.keg_smash = min( active_enemies, active_dot.keg_smash + 7 )
            gainChargeTime( 'ironskin_brew', 4 + ( buff.blackout_combo.up and 2 or 0 ) )
            gainChargeTime( 'purifying_brew', 4 + ( buff.blackout_combo.up and 2 or 0 ) )
            cooldown.fortifying_brew.expires = max( state.time, cooldown.fortifying_brew.expires - 4 + ( buff.blackout_combo.up and 2 or 0 ) )
            if equipped.salsalabims_lost_tunic then setCooldown( 'breath_of_fire', 0 ) end
            removeBuff( 'blackout_combo' )
        end )


        addAbility( 'leg_sweep', {
            id = 119381,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            cooldown = 45,
            known = function () return talent.leg_sweep.enabled end,
        } )

        addHandler( 'leg_sweep', function ()
            applyDebuff( 'target', 'leg_sweep', 5 )
            active_dot.leg_sweep = min( active_enemies )
            interrupt()
        end )


        addAbility( 'paralysis', {
            id = 115078,
            spend = 20,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 15,
        } )

        addHandler( 'paralysis', function ()
            applyDebuff( 'target', 'paralysis', 60 )
        end )


        addAbility( 'provoke', {
            id = 115546,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 8,
        } )

        addHandler( 'provoke', function ()
            applyDebuff( 'target', 'provoke', 8 )
        end )


        addAbility( 'purifying_brew', {
            id = 119582,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 21,
            charges = 3,
            recharge = 21,
            usable = function ()
                if stagger.percent_max_hp > 30 and stagger.percent_max_hp <= 60 and stagger.percent_remains > settings.purify_light then return true -- Light
                elseif stagger.percent_max_hp > 60 and stagger.percent_max_hp <= 100 and stagger.percent_remains > settings.purify_moderate then return true -- Moderate
                elseif stagger.percent_max_hp > 100 and stagger.percent_max_hp <= 200 and stagger.percent_remains > settings.purify_heavy then return true -- Heavy
                elseif stagger.percent_max_hp > 200 and stagger.percent_remains > settings.purify_extreme then return true end -- Extreme
                return false
            end
        } )

        modifyAbility( 'purifying_brew', 'cooldown', function( x )
            return x * haste
        end )

        modifyAbility( 'purifying_brew', 'recharge', function( x )
            return x * haste
        end )

        modifyAbility( 'purifying_brew', 'charges', function( x )
            return x + ( talent.light_brewing.enabled and 1 or 0 )
        end )

        addHandler( 'purifying_brew', function ()
            spendCharges( 'ironskin_brew', 1 )
            if buff.blackout_combo.up then
                addStack( 'elusive_brawler', 10, 1 )
                removeBuff( 'blackout_combo' )
            end
            if artifact.brewstache.enabled then applyBuff( 'brewstache', 4.5 ) end
            if artifact.swift_as_a_coursing_river.enabled then addStack( 'swift_as_a_coursing_river', 15, 1 ) end
            stagger.amount = stagger.amount * 0.5
            stagger.tick = stagger.tick * 0.5
            if equipped.gai_plins_soothing_sash then gain( stagger.amount * 0.25, 'health' ) end -- LegionFix: Purify doesn't always purify 50% stagger, resolve this later.
        end )


        addAbility( 'ring_of_peace', {
            id = 116844,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 45,
            known = function () return talent.ring_of_peace.enabled end,
        } )


        addAbility( 'rising_sun_kick', {
            id = 107428,
            spend = 2,
            spend_type = 'chi',
            cast = 0,
            gcdType = 'melee',
            cooldown = 10,
            cycle = 'mark_of_the_crane'
        } )

        modifyAbility( 'rising_sun_kick', 'cooldown', function( x )
            if buff.serenity.up then
                x = max( 0, x - ( buff.serenity.remains / 2 ) )
            end
            return x * haste
        end )

        modifyAbility( 'rising_sun_kick', 'spend', function( x )
            if buff.serenity.up then return 0 end
            return x
        end )

        addHandler( 'rising_sun_kick', function ()
            applyDebuff( 'target', 'mark_of_the_crane', 15 )

            if talent.hit_combo.enabled then
                if prev_gcd.rising_sun_kick then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'roll', {
            id = 109132,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            cooldown = 20,
            charges = 2,
            recharge = 20,
            known = function () return not talent.chi_torpedo.enabled end
        } )

        modifyAbility( 'roll', 'charges', function( x )
            return x + ( talent.celerity.enabled and 1 or 0 )
        end )

        modifyAbility( 'roll', 'cooldown', function( x )
            return x - ( talent.celerity.enabled and 5 or 0 )
        end )

        modifyAbility( 'roll', 'recharge', function( x )
            return x - ( talent.celerity.enabled and 5 or 0 )
        end )


        addAbility( 'rushing_jade_wind', {
            id = 116847,
            spend = 1,
            spend_type = 'chi',
            cast = 0,
            gcdType = 'spell',
            cooldown = 6,
            known = function () return talent.rushing_jade_wind.enabled end,
            cycle = 'mark_of_the_crane'
        } )

        modifyAbility( 'rushing_jade_wind', 'cooldown', function( x )
            if buff.serenity.up then
                x = max( 0, x - ( buff.serenity.remains / 2 ) )
            end
            return x * haste
        end )

        modifyAbility( 'rushing_jade_wind', 'spend', function( x )
            if buff.serenity.up or spec.brewmaster then return 0 end
            return x
        end )

        addHandler( 'rushing_jade_wind', function ()
            applyBuff( 'rushing_jade_wind', 6 * haste )
            
            if spec.windwalker then
                active_dot.mark_of_the_crane = min( active_enemies, active_dot.mark_of_the_crane + 4 )
                applyDebuff( 'target', 'mark_of_the_crane', 15 )
            end

            if talent.hit_combo.enabled then
                if prev_gcd.rushing_jade_wind then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'serenity', {
            id = 152173,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 90,
            known = function () return talent.serenity.enabled end,
            toggle = 'cooldowns'
        } )

        addHandler( 'serenity', function ()
            applyBuff( 'serenity', 8 )
            setCooldown( 'strike_of_the_windlord', cooldown.strike_of_the_windlord.remains - ( max( 8, cooldown.strike_of_the_windlord.remains / 2 ) ) )
            setCooldown( 'fists_of_fury', cooldown.fists_of_fury.remains - ( max( 8, cooldown.fists_of_fury.remains / 2 ) ) )
            setCooldown( 'rising_sun_kick', cooldown.rising_sun_kick.remains - ( max( 8, cooldown.rising_sun_kick.remains / 2 ) ) )
            setCooldown( 'rushing_jade_wind', cooldown.rushing_jade_wind.remains - ( max( 8, cooldown.rushing_jade_wind.remains / 2 ) ) )            
        end )

        addCastExclusion( 'serenity' )


        addAbility( 'spear_hand_strike', {
            id = 116705,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 15,
            usable = function () return target.casting end,
            toggle = 'interrupts'
        } )

        addHandler( 'spear_hand_strike', function ()
            interrupt()
        end )


        addAbility( 'spinning_crane_kick', {
            id = 101546,
            spend = 3,
            spend_type = 'chi',
            cast = 0,
            gcdType = 'melee',
            cooldown = 0,
        } )

        modifyAbility( 'spinning_crane_kick', 'spend', function( x )
            if buff.serenity.up then return 0 end
            return x
        end )

        addHandler( 'spinning_crane_kick', function ()
            if talent.hit_combo.enabled then
                if prev_gcd.spinning_crane_kick then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'storm_earth_and_fire', {
            id = 137639,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 90,
            charges = 2,
            recharge = 90,
            known = function () return not talent.serenity.enabled end,
            usable = function () return not buff.storm_earth_and_fire.up end,
            toggle = 'cooldowns'
        } )

        addHandler( 'storm_earth_and_fire', function ()
            applyBuff( 'storm_earth_and_fire', 15 )
        end )

        addCastExclusion( 'storm_earth_and_fire' )


        addAbility( 'strike_of_the_windlord', {
            id = 205320,
            spend = 2,
            spend_type = 'chi',
            cast = 0,
            gcdType = 'melee',
            cooldown = 40,
            known = function () return equipped.fists_of_the_heavens and ( toggle.strike_of_the_windlord or ( toggle.cooldowns and settings.strike_cooldown ) ) end,
        } )

        modifyAbility( 'strike_of_the_windlord', 'cooldown', function( x )
            if buff.serenity.up then
                x = max( 0, x - ( buff.serenity.remains / 2 ) )
            end
            return x
        end )

        modifyAbility( 'strike_of_the_windlord', 'spend', function( x )
            if buff.serenity.up then return 0 end
            return x
        end )

        addHandler( 'strike_of_the_windlord', function ()
            applyDebuff( 'target', 'strike_of_the_windlord', 6 )
            if talent.hit_combo.enabled then
                if prev_gcd.strike_of_the_windlord then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'summon_black_ox_statue', {
            id = 115315,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 10,
            known = function () return talent.summon_black_ox_statue.enabled end,
        } )

        addHandler( 'summon_black_ox_statue', function ()
            summonTotem( 'black_ox_statue', 'statue', 900 )
        end )


        addAbility( 'tiger_palm', {
            id = 100780,
            spend = 50,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            ready = 50,
            cooldown = 0,
            cycle = 'mark_of_the_crane'
        } )

        modifyAbility( 'tiger_palm', 'spend', function( x )
            return spec.brewmaster and 25 or 50
        end )

        modifyAbility( 'tiger_palm', 'ready', function( x )
            if spec.brewmaster then return settings.tp_energy or 25 end
            return x
        end )


        addHandler( 'tiger_palm', function ()
            if talent.eye_of_the_tiger.enabled then
                applyDebuff( 'target', 'eye_of_the_tiger', 8 )
                applyBuff( 'eye_of_the_tiger', 8 )
            end

            if spec.windwalker then
                applyDebuff( 'target', 'mark_of_the_crane', 15 )

                if talent.hit_combo.enabled then
                    if prev_gcd.tiger_palm then removeBuff( 'hit_combo' )
                    else addStack( 'hit_combo', 10, 1 ) end
                end

                gain( buff.power_strikes.up and 3 or 2, 'chi' )
            end

            if spec.brewmaster then
                gainChargeTime( 'ironskin_brew', 1 )
                gainChargeTime( 'purifying_brew', 1 )
                cooldown.fortifying_brew.expires = max( state.time, cooldown.fortifying_brew.expires - 1 )
                removeBuff( 'blackout_combo' )
            end

        end )


        addAbility( 'tigers_lust', {
            id = 116841,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 30,
            known = function () return talent.tigers_lust.enabled end
        } )

        addHandler( 'tigers_lust', function ()
            applyBuff( 'tigers_lust', 6 )
        end )


        addAbility( 'touch_of_death', {
            id = 115080,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 120,
            toggle = 'cooldowns',
            cycle = 'touch_of_death'
        } )

        modifyAbility( 'touch_of_death', 'cooldown', function( x )
            if artifact.hidden_masters_forbidden_touch.enabled and cooldown.touch_of_death.remains == 0 and buff.hidden_masters_forbidden_touch.down then
                return 0
            end
            return x
        end )

        addHandler( 'touch_of_death', function ()
            if artifact.hidden_masters_forbidden_touch.enabled and buff.hidden_masters_forbidden_touch.down then
                applyBuff( 'hidden_masters_forbidden_touch', 3 )
            end
            applyDebuff( 'target', 'touch_of_death', 8 )
        end )


        addAbility( 'whirling_dragon_punch', {
            id = 152175,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            cooldown = 24,
            known = function () return talent.whirling_dragon_punch.enabled end,
            usable = function () return cooldown.fists_of_fury.remains > 0 and cooldown.rising_sun_kick.remains > 0 end
        } )

        addHandler( 'whirling_dragon_punch', function ()
            if talent.hit_combo.enabled then
                if prev_gcd.whirling_dragon_punch then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'zen_meditation', {
            id = 115176,
            spend = 0,
            spend_type = 'energy',
            cast = 8,
            gcdType = 'spell',
            channeled = true,
            cooldown = 300
        } )


        addAbility( 'effuse', {
            id = 116694,
            spend = 30,
            spend_type = 'energy',
            cast = 1.5,
            gcdType = 'spell',
            cooldown = 0,
        } )

        modifyAbility( 'effuse', 'cast', function( x )
            return x * haste
        end )

        addCastExclusion( 'effuse' )

    end


    storeDefault( [[Brewmaster: Default]], 'actionLists', 20170110.1, [[dWZngaGEisAtKu2ff2gPQ9jKYSHA(qu9BqRti52aESGDsk7v1ULSFi8tiHHjLghePopK0qHi0GbQHtqhurDkiI6yu0PvAHeyPaXILQLt0dHe9uultiEoLMieLPsIMSctx0fjvomvxg56cvFdi9mPOntc2oj0NHu)LqttivMhejgPqQ67KKrtsvJNKkDsfPxluUgeb3trSiPWHiPIrbrKV5vEwx5DmnUGZSqkSoErQEUW6Ar0J0N1Ca6SajPcWTjjJcbyKrk4XX5zqim5w6ArAn1BgPvVH5zoixH55ZZHCHL9kVM5vEwx5DmnUGZCqUcZZjenAmzSvsszCHP98CFXBI6zRqYLIQ3RHOnLBm680ASbpHYZfSOZGqyYT01I0AQ3euJ2MN1Ca6mlKCjcWrVxdeG5uUXONxlYvEwx5DmnUGZCqUcZZjenAmzeGq8aQQSQHKqoY7XvqbJogch4420iUqKJ80LOP0ixasmHIJLqkt03IKpplrBpxoanbIhIQC555(I3e1ZcH5cRZtRXg8ekpxWIodcHj3sxlsRPEtqnABEwZbOZiryUW651AELN1vEhtJ3pZb5kmpNEfBl0QfGq8aQQmwjSSX2sSljvgb17s0KDsacXdOQYyLWYgBlXUKuzeuVlrtwraxDvBRaeyl0IdhWrtInTrR98CFXBI65vclBSTe7ss15P1ydEcLNlyrNbHWKBPRfP1uVjOgTnpR5a05PsyzJTfcWcKKQNxl6UYZ6kVJPX7N5GCfMNJBjXbPav2vrYEEwI2EUCaAsdbssfGBtsgfcWiJuGk7QizBCEUV4nr9CWXyrpKlSeXRnppTgBWtO8Cbl6mieMClDTiTM6nb1OT5znhGoJmsbQSRIK951qcx5zDL3X04coZb5kmpRoPJPkn6ypedgpfdqGo0GkVJPHAEixfjrQiGLSrZ88SeT9C5a0KgcKKka3MKmkeG50RHlhiapJcDnop3x8MOEo4ySOhYfwI41MNNwJn4juEUGfDgectULUwKwt9MGA028SMdqN50RHlhiapJcDpVM(R8SUY7yACbN5GCfMNthtvA0XEigmEkgGaDObvEhtd18qUksIuralzJM55zjA75YbOjneijvaUnjzuiaJsiqhIa8mk0148CFXBI65GJXIEixyjIxBEEAn2GNq55cw0zqim5w6ArAn1BcQrBZZAoaDgLqGoeb4zuO751a9kpRR8oMgxWzoixH5z1jDmvPrh7HyW4Pyac0Hgu5DmnuZd5QijsfbSKDI55zjA75YbOjneijvaUnjzuiaZPxdxoqaMv248CFXBI65GJXIEixyjIxBEEAn2GNq55cw0zqim5w6ArAn1BcQrBZZAoaDMtVgUCGamR851q6R8SUY7yACbN5GCfMNthtvA0XEigmEkgGaDObvEhtd18qUksIuralzNyEEwI2EUCaAsdbssfGBtsgfcWOec0HiaZkBCgectULUwKwt9MGA02880ASbpHYZfSOZAoaDgLqGoebyw555(I3e1ZbhJf9qUWseV285ZZiJuWJJZl45pa]] )

    storeDefault( [[Brewmaster: Defensives]], 'actionLists', 20170110.1, [[dOdkeaGEkj1MOu0UuyBcv7JsHztXVbUTuzDusyNczVq7wL9tkJsO0WqKXrKspMWqjsLbtudxvoir4uikoMu68KQfQQAPsHfdQLl5HusYQekwgLQNJKjsjLPsjMmsnDsUOQsNw0LrDDPQVrK8teLSzbTDkj61Qk(mitJiv9DfnseL6WknAbgVu0jjIUfLuDnIuCpkLEgIQ)IWtPASfTG(3BHnmn(JU)yrUM0QxvcomYECPf9OTJr)V4z3sP4Yk0KTghYhvALmf6wJd3EJc)rVbB4LIXi7KAJ3ANu8rl6n4Lw3s2XOhRMSaam0G5nE9vgQNhebCXZHiyliMIOBBQjBDnzbayObZB86Rmuppic4INdrWwqmfryTcvcU1Ojtgn5y0KfaGHgmVXRVYq98GiGlEokweSfeJUecvcok0cg1Iwq)7TWgMg)rpA7y0)nR4JMmz1ut(V4j6nydVumgzNuB8wPgKihDjp6uSkqH(bogDxu5tHUaam0G5nE9vgQNhebCXZHiyliMYwsOlbCAsLo6WMv8Ha0KaU4jQWi7Of0)ElSHPXF0J2ogDPRVYq98G0K)lEIUvTpvco0rVbB4LIXi7KAJ3k1Ge5Ol5rNIvbk0pWXO7IkFk0rxc40KkD0F9vgQNhebCXtuHrKJwq)7TWgMg)r3fv(uOR27tEq2uaagAW8gV(kd1ZdIaU45qeSfetzRaam0G5nE9vgQNhebCXZHiyliMIOBBIE02XOlzboQp5Pj)x8e9gSHxkgJStQnERudsKJUeWPjv6ONf4O(KhbCXt0BWlTULSJrpwnzbayObZB86Rmuppic4INdrWwqmfr32ut26AYcaWqdM341xzOEEqeWfphIGTGykIWAfQeCRrtMmAYXOjlaadnyEJxFLH65brax8CuSiyligDjp6uSkqH(bogDxu5tzr)XORYogvyK0Jwq)7TWgMg)rpA7y0)28XgnzYERo0BWgEPymYoP24Tsniro6sE0PyvGc9dCm6UOYNc9aEn5brq9c4Ihcq)PSHTT2m2aEnQGbnhMIuzdBPuRASk1k(q8atUIrQH0etaVM8GiOEbCXdbO)uKbDjGttQ0rNB(ydrWwDOcvO7IkFk0rfIa]] )

    storeDefault( [[Brewmaster: Combo ST]], 'actionLists', 20170110.1, [[dOZSdaGAcQA9eaVKqPDrQ2guzFeGMnr3gfRJaYoH0EP2nQ2pigfbudJughHQoSOHsqQbdudxHoOaofbfhdLEMaTqfzPqPfdQLtYdjOYtv9yHEoetKGstvsMmGPl1ffKVjPCzKRdKnsq0PvAZsQETc(mu8vcuMgbjFNqLnrG08iqmAczveeoPG6VkQRrO48G0kjq1YGQ(TeBwx5hINWscWt(pQ2X23hnzi)jfjoMePjLabbSWvyGlqa)kFHLQNGKTN8XsskriJIxJfhlEnC6S(yPeaA1Yq((bI9w4iUYOSUYpepHLeGN8rtgYFsMXHcOgc43QDGGawGf7fg)hv7y73PK4ToSmJdfq9CSWax0jEcljabnJ9w46deMzeMerKUIsaOZ9YqccMiGqWQlg)WCGnMDr5ZlCYhljPeHmkEnwCS101c6JLsaOvld57haELBd1hwMXHcOEgPv7a5)OAh7kOJKpYYeDBu8UYpepHLeGN8rtgYxSegiGptIiYhljPeHmkEnwCS101c6hMdSXSlkFEHt(bGx52q9himZimjIi)hv7y772ObDLFiEcljap5JMmK)KmJdfqneWVv7a5JLKuIqgfVglo2A6Ab9dZb2y2fLpVWj)aWRCBO(WYmoua1ZiTAhi)hv7y772OcLR8dXtyjb4j)hv7y77JLKuIqgfVglo2A6Ab9dZb2y2fLpVWjF0KH8Xccr0YXabSGNaeeWc2Yb8daVYTH6RaHiA5yMf(eGMf3YbCBuX4k)q8ewsaEY)r1o2(aemO611himZimjIiDqJ(yjjLiKrXRXIJTMUwq)WCGnMDr5ZlCYhnzi)jfLTiiGl1Hawixf5haELBd1hwrzlAUuFU(Qi3gfNR8dXtyjb4jF0KH8RwmKccyHoLm(yjjLiKrXRXIJTMUwq)WCGnMDr5ZlCYpa8k3gQFVyi18ykz8FuTJTpXjfgO6rqkfXBbuZTB)psXnLRaK9w4gfpoX72g]] )

    storeDefault( [[Brewmaster: Combo AOE]], 'actionLists', 20170110.1, [[dCdPdaGAcHwVQO8scr7svABQk7tvKMnPUnrTtr2l1UrSFa(jsLmmc(TOgksvzWQQgUGois5yq1JbzHczPiXIHYYj5HesEQYYa0ZH0erQWuHWKbA6QCri6WsDzuxhu2isvmocbBwv4Zc1PL8vKkAAivQVRkINre)funAK04jK6Kc41c01qQQopHALQIQVrKwhsvAJBeEijnMMbDK3Guv455rh8JgM(CKhfwZnk7eqb8pCGcFV4ElKHQwxpRVktCc4Ni4rd6Qmb1iCc3i8qsAmnd6iVulZEifDOodwKya)IKJ9OWAUrzNakG)Hl9vqIxacyb1xw5rYe2JgwPRtShl6qDgSiXWdYXEdsvHNNpNaAeEijnMMbDKxQLzprYXa(NCJs1JcR5gLDcOa(hU0xbjEbiGfuFzLhjtypAyLUoXEb5y4OYnkvVbPQWZZNtsmcpKKgtZGoYl1YSNOOwa(JGPqppkSMBu2jGc4F4sFfK4fGawq9LvEKmH9OHv66e7brTGJbtHEEdsvHNNpNOBJWdjPX0mOJ8sTm7fP4(Oc4p)aWp9uk2JcR5gLDcOa(hU0xbjEbiGfuFzLhjtypAyLUoXEykUpQWZpG)OuS3Guv45bYyWE84nihdhvUrP(cl0Nt0Vr4HK0yAg0rEdsvHNNhfwZnk7eqb8pCPVcs8cqalO(YkpsMWEPwM9OadLArIb8)8gKb8tNfb0JgwPRtSNcgk1IedxeBqg(tkcOpN(mcpKKgtZGoYBqQk88ycRIf)cbtPyY9ubpkSMBu2jGc4F4sFfK4fGawq9LvEKmH9sTm7HOIzfGF6R1YE0WkDDI9UkMvWdBTSpNKAeEijnMMbDK3Guv455rH1CJYobua)dx6RGeVaeWcQVSYJKjSxQLzViDdfmd7a8VtvbzpAyLUoXEy6gkyg2bh9uvq2NpVulZErk(jYn6Xk6fWVOYYyza)0OlK(Sb]] )

    storeDefault( [[Brewmaster: Standard ST]], 'actionLists', 20170110.1, [[d0Z7eaGAru16fsYlve1UeQTHq7tiLMnrZxrWVf1JvXTjvphs7uP2l1UHA)QuJseLgMGgNIqFJumuvcnyimCs6GcXPerLJHuNtePwOsAPKOfJOLt4HkI8uWYqI1jKIjkIKPcrtwHPRQlIKoTuxg11vuBuerpJuAZKW2fs8DvsFvLGPjKQMNik(Ri9AfPrReJxLOtkcFwGRjIW5rWkfsQdlztcPYM2inqfxKsE4vdGkF6s2rv9Dg7nfIt0qsXkQz57vdkzjxOS3ucPjstjKymTb4iA13GHiNVZyuJ0BAJ0avCrk5HxnSlD2WK5GBeGEHUyqjl5cL9MsinrAnXHAnKap6t9zHbCgZgGJOvFdgIq2Y(jyykhKIQxOl(9MIrAGkUiL8WRgGJOvFddMCwHI4PCqkQEHUepRoHjmyYzfkIrv5txY0bl7OWccXZQguYsUqzVPestKwtCOwdjWJ(uFwyaNXSHiKTSFcgifC9lPzfPkAbByx6SHvbx)YnISIBejzly)ER1inqfxKsE4vdWr0QVbdkzjxOS3ucPjsRjouRHe4rFQplmGZy2qeYw2pbdKY6mnp)POVONYg2LoByvwNP55)gb8IEk737O3inqfxKsE4vdWr0QVHtolh5R4y1zrRGqJdsjf814Zsjcy0K5KZYr(kowDw0ki04GusbFn(SuIagnvVU0qeYw2pbdFhWIu1sQBibE0N6Zcd4mMnSlD2aYoGf3iUyj1nOKLCHYEtjKMiTM4qT(9ojmsduXfPKhE1aCeT6B4l80gheDOFfeWI4sppJ)OvDw0kiK(lcgDjlhgIq2Y(jyGVuvMhnoiDkhyibE0N6Zcd4mMnSlD2a1lvL5rJdUrmzoWGswYfk7nLqAI0AId163BIgPbQ4IuYdVAaoIw9nyqjl5cL9MsinrAnXHAnKap6t9zHbCgZgIq2Y(jyqmJU04G0KVgC61gpmSlD2GYz0LghCJiQRbFJ4cnE43BngPbQ4IuYdVAaoIw9nyiczl7NGHZsNsolqFdjWJ(uFwyaNXSHDPZgM0sFJyDwG(guYsUqzVPestKwtCOw)EprJ0avCrk5HxnahrR(gmOKLCHYEtjKMiTM4qTgsGh9P(SWaoJzdriBz)emCw60Rvuyd7sNnmPL(gXfQOW(9oPnsduXfPKhE1aCeT6BWGswYfk7nLqAI0AId1AibE0N6Zcd4mMneHSL9tWW3bSivTK6g2LoBazhWIBexSK63isw6KZVFd7sNnSk4R6f6ZIO5gb8fEuIXncaPFBa]] )

    storeDefault( [[Brewmaster: Standard AOE]], 'actionLists', 20170110.1, [[dOtheaGAQe16PIWlPsPDPI2gGMnLMpvkUTqoSKDkQ9s2ns7xL8tQemmk63aToQOyOurvdwLA4uvherDkQO0Xq4YOwOqTuezXqz5cEivQ6PkpgKNdvtKkIMkKmzrMUQUiO61QGNrfUoeTrQe50sTzQsBxfQXrLkFLkjtJkH(UkKVrH(lOmAi14PsQtsv8ziCnQOY5PGvsfPwgaJIkswecLgCAHz5KI1Cs2BH0(kwlxrSwCGpkQWFo4mx37lAQcPRBYUaCnsSLlCwzaMeajayc8KqB(mux22jQVbPkdaO70id9nifxOuMqO0GtlmlNuS2GcT)RPrgRT9BqJDTVfm1ueWoWi08qtnu9GbnkiL1YveRb31(wWutrCD7wgHgj2YfoRmatcGegpnDOxzacLgCAHz5KI1guO9FnnsSLlCwzaMeajmEA6qZdn1q1dg0OGuwJmwB73G2bgbm8OchTwUIyn3YiUUxuHJwVYoekn40cZYjfRnOq7)AjgdPxVNhyeWWJkC0Ni9DJBsmgsVEpX9zOUSWsSTpMdgor6RrITCHZkdWKaiHXtthAEOPgQEWGgfKYA5kI1IdC9OVUb9ED7sDG1iJ12(nOHf46rdd0lmVDG1RSlkuAWPfMLtkwBqH2)10iXwUWzLbysaKW4PPdnp0udvpyqJcszTCfXAX2c6aiY)6EFOpWAKXAB)g0WSf0bqKpm8p0hy9k7CcLgCAHz5KI1guO9FnnsSLlCwzaMeajmEA6qZdn1q1dg0OGuwlxrSgjK4OBkIRBNUs81TRAAsJmwB73Gwajo6MIaMlxjg2rnnPxzGcLgCAHz5KI1guO9FnnYyTTFdAqOByyid4VMhAQHQhmOrbPSgj2YfoRmatcGegpnDOLRiwZ9O7R7yKb8xVYgfkn40cZYjfRnOq7)AAKylx4SYamjasy800HMhAQHQhmOrbPSwUIyn3JUVUDvDmRrgRT9BqdcDd7O6ywVYUtO0GtlmlNuS2GcT)RPrITCHZkdWKaiHXtthAEOPgQEWGgfKYA5kI1q1i4W1TZx2ORBNIWz1iJ12(nO9ncoaZVSr61RnOq7)A6La]] )

    storeDefault( [[SimC Windwalker: default]], 'actionLists', 20170110.1, [[d8dRiaWAqSEHk1MaKDjPTbO2hjrntkj9CjMnkZhv5MkjhwLBdQZtI2Pq2lXUvSFbgfi1WiHXrsKoTudLKigmLA4kXbPeNcKCmuXXfQKfkOAPcslMuwoulcv6PuTmLuRJKYejjutfImzkMUOlkiESsDzKRdWFb6BusTzs12jj9Di1xjPAAusyEckJKKqEge1OHWNHKtku1HeQ4AKeCpHYdrvDokj63QAHJGK4HmNgJms4IhDWK4EdZpWw9EmOpgecRwGTH0paSu8qjgDfsIwRGdWCuOazX9fA3hRJ7l7FKO1aBLIBzN9pfbjjIJGK4HmNgJms4IhDWK4(cD4aBv0nMaBpXnesCFJ7Lu88rHIr1EscJbSKfGGopmkkRgsdGUEDFLShuvalqjoFe0gYQxvcMMu0epuIrxHKO1k4amhRRkqw84htVV8XIp)qIBrRzDQu8YcDyqe3yaljUHqIV6nrhmjUKs0AbjXdzongzKWf334EjfpFuOyuD5Z(NcqqRbqxVwimnDQScyHhpna661s(yyq6WjcWBmG6nMQaw4Xd64KhJMSwimnDQSsZPXidqjUhiuwxW)UEOAwNkRawGIhpna66vn2)ggGswbSWJxEyuuwZgMaZh00uyXawbuIBrRzDQu8Lp7Fep(X07lFS4ZpK4rhmjUk5Z(hXTGrveFoykg3f8Z(bfzaxE0eMR4Hsm6kKeTwbhG5yDvbYIZhbTHS6vLGPjfnXx9MOdMeN7c(z)GImGlpAcZvsjczbjXdzongzKWfp6GjXr6bSrey)6b2Qy6seI7BCVKINpkumQU)NzE0tbiOZdJIYA2Wey(GMMclMvcL48rqBiREvjyAsrt8qjgDfsIwRGdWCSUQazXJFm9(Yhl(8djUfTM1PsXZhWgb4RdAOlri(Q3eDWK4skrwHGK4HmNgJms4I7BCVKIdDEmAYAHW00PYknNgJmaT)NzE0tTqyA6uzftWxpLWIPakE80aORxleMMovwbSiUfTM1PsX3hJbE7S)bK1Lu84htVV8XIp)qIhDWK48pglW2Yo7FcSTAxsXTGrveFoykgxVH5hyREpg0hdcHvlWUqyA6ujxXdLy0vijATcoaZX6QcKfNpcAdz1RkbttkAIV6nrhmjoxVH5hyREpg0hdcHvlWUqyA6ujxjLivqqs8qMtJrgjCX9nUxsXJtEmAYAHW00PYknNgJmarXfGEzHmvdUhi9GceXJhW9RkHbcAO3)Zmp6PQ3LSa(6G6aWkRyc(6PewmoaTr01namMMuLJHmu84PbqxVwYhddshoraEJbuVXufWcpE7)zMh9ul5JHbPdNiaVXaQ3yQUrCyuuj2AE82)Zmp6jpmkkRzdtG5dAAkSyRvbE82)Zmp6PMpGncWxh0qxIOIj4RNIkhtLQcqjUfTM1PsX3hJbE7S)bK1Lu84htVV8XIp)qIhDWK48pglW2Yo7FcSTAxYaBO5aL4wWOkIphmfJR3W8dSvVhd6JbHWQfyxiDUIhkXORqs0AfCaMJ1vfiloFe0gYQxvcMMu0eF1BIoysCUEdZpWw9EmOpgecRwGDH05kPebSGK4HmNgJms4I7BCVKIhN8y0K1cHPPtLvAongzakouCbOxwit1G7bspOar84bC)QsyGGg6dNT(TZAjXnec81bteei6EmShBQ0CAmYa0(FM5rp1sIBie4RdMiiq09yyp2uXe81tjSyCScG2)Zmp6PQ3LSa(6G6aWkRyc(6PewmGbA)pZ8ONkUl9GcSayaH0BivmbF9uclgWqXJNgaD9AjFmmiD4eb4ngq9gtvalqjUfTM1PsX3hJbE7S)bK1Lu84htVV8XIp)qIhDWK48pglW2Yo7FcSTAxYaBOxdL4wWOkIphmfJR3W8dSvVhd6JbHWQfyxiDUIhkXORqs0AfCaMJ1vfiloFe0gYQxvcMMu0eF1BIoysCUEdZpWw9EmOpgecRwGDH05kPezTGK4HmNgJms4IhkXORqs0AfCaMJ1vfilE0btIZ)ySaBl7S)jW2QDjdSHgzOe3cgvr85GPyC9gMFGT69yqFmiewTaBhjUIBrRzDQu89XyG3o7FazDjfp(X07lFS4ZpK48rqBiREvjyAsrt8vVj6GjX56nm)aB17XG(yqiSAb2osCLusX9nUxsXLuea]] )

    storeDefault( [[SimC Windwalker: precombat]], 'actionLists', 20170110.1, [[b4vmErLxtvKBHjgBLrMxc51uofwBL51utLwBd5hyxLMBKDxySTwzYPJFGbNCLn2BTjwy051usvgBLf2CL5LtYatm2edmWmJxtnfCLnwAHXwA6fgDP9MBE5Km2KJxtf0y0L2BUnNxu5LtX4fvEnvrUfMySvgzEjKxtn1yYLgC051u092zNXwzUa3B0L2BUnNxtfKyPXwA0LNxtb3B0L2BU51uj5gzPnwy09MCEnLBV5wzEnLtH1wzEnfuVrxAV5MxtfKCNnNxt5wyTvwpIaNCVX2BUDwzK9fCVDxzYjIxtjvzSvwyZvMxojdmXytm34cmZ41udHwzJTwtVzxzTvMB05LyEnvtVrMtH1wzEnLiWj3BS9MBNvgzFb3B3vMCI4fDErNxtn1yYLgC051uErNxEb]] )

    storeDefault( [[SimC Windwalker: sef]], 'actionLists', 20170110.1, [[diK7iaqiQqTiPGnjvmksQofjLzrLQBHevTlenmi5ysPLrL8mPstdjQCnQuABsv9nKIXHeLZjfkRdPQMhsvUhsL9jfYbPQAHiLEiP0ePcPlkfTrKiNKK0lPcIzsfu3KuStsmuQG0srcpLyQuv(kvG9c(ledMsoSIftQESGjlQlJAZuLpJKgnL60q9Ak0Sf52cTBL(TQgov0Yv55imDjxhsTDsIVlvz8uP48uW6LcvZNke7NIgAbFG0Ch9eNbAbrzImicoQ10Yb4n3Bsg5J(MweShiuWjEiyqXfQ2(TOq1feXjhWtc34tH)fuC1VXaXFOW)sa(aLwWhin3rpXzGwquMidIpmv(mTCOtkcIeoSZceE5JQbYa674TOJx(OAGmoUPtWgtgqFhVf9AbrRnhmQ5vHJ8wGoiuWjEiyqXfQ2(T0qIQliQUzCyQ)az)LbXVooHldGuyQ8H4Csrq08zLjYGafO4c8bsZD0tCgOfeLjYG4)cZYMw((74Tarch2zbs9uPMyYW)P83Bj6OEWgtgh3q5d2yYa674TAeDTD4LpQgilCKrQhjoUPr0HI0TQbIwBoyuZRch5TaDqOGt8qWGIluT9BPHevxquDZ4Wu)bY(ldIFDCcxgazUWSms93XBbIMpRmrgeOaLUGpqAUJEIZaTGqbN4HGbfxOA73sdjQUGOmrgeTtkzA5pu4FnTCymrbI)Jkbi7ez6AqWrTMwoaV5EtYiF030sRJ2ai(1XjCzaKWKsitOW)IKWefiQUzCyQ)az)LbrRnhmQ5vHJ8wGoiA(SYezqAqWrTMwoaV5EtYiF030sRJ2auGcLd8bsZD0tCgOfeLjYGi1Fr3nTAoxz7UP1SztlkHpgejCyNfi1tLAIjd)NYFVLOJ6owhTNhjr9xeHNRSrMnJ4HpMeTZoQh(pL)Elz9Od2iVhsMNYM844Gxc6rhL5ios4)u(7TK1JoyJ8EizEkBYJJdEjAeL5w1udeT2CWOMxfoYBb6GqbN4HGbfxOA73sdjQUGO6MXHP(dK9xge)64eUmacr9xeHNRSrMnJ4HpgenFwzImiqbkUf8bsZD0tCgOfeLjYGi1Fr3nTAoxz7UP1SztlkHp20s9w1arch2zbs9uPMyYW)P83Bj6OUJ1r75rsu)fr45kBKzZiE4Jjr7St4)u(7TKe1FreEUYgz2mIh(yYG9Cuzc6CPgiAT5GrnVkCK3c0bHcoXdbdkUq12VLgsuDbr1nJdt9hi7Vmi(1XjCzaeI6VicpxzJmBgXdFmiA(SYezqGcu6d(aP5o6jod0cIYezqK6VO7MwnNRSD30A2SPfLWhBAPUl1arch2zbs9uPMyYW)P83Bj6OUJ1r75rsu)fr45kBKzZiE4Jjr7StnhvUilCKrQhjJz6rNl3QgiAT5GrnVkCK3c0bHcoXdbdkUq12VLgsuDbr1nJdt9hi7Vmi(1XjCzaeI6VicpxzJmBgXdFmiA(SYezqGcuOb8bsZD0tCgOfeLjYGi1Fr3nTAoxz7UP1SztlkHp20s9UQbIeoSZcK6PsnXKH)t5V3s0rDhRJ2ZJKO(lIWZv2iZMr8WhtI2zNW)P83Bj9WefbY7H4H(mqECCWlb9ORTtWgtgqFhVvJORRAGO1Mdg18QWrElqhek4epemO4cvB)wAir1fev3mom1FGS)YG4xhNWLbqiQ)Ii8CLnYSzep8XGO5ZktKbbkqHYaFG0Ch9eNbAbrzImiuctueMwVNPfLqFgarch2zbIoAppsI6VicpxzJmBgXdFmjANGO1Mdg18QWrElqhek4epemO4cvB)wAir1fev3mom1FGS)YG4xhNWLbq8WefbY7H4H(maIMpRmrgeOaLgd8bsZD0tCgOfeLjYGqbMaVunTe0RPLdbhmcIeoSZceD0EEKe1FreEUYgz2mIh(ys0o7eSXKb03XBrNRo8YhvdKb03XBrpE5JQbY44gq0AZbJAEv4iVfOdcfCIhcguCHQTFlnKO6cIQBghM6pq2Fzq8RJt4YaihMaVuriqVigXbJGO5ZktKbbkqPff4dKM7ON4mqliuWjEiyqXfQ2(T0qIQliktKbr7KsMw(df(xtlhgtuMwQ3Qgi(pQeGStKPRbbh1AA5a8M7njJ8rFtlXxdG4xhNWLbqctkHmHc)lsctuGO6MXHP(dK9xgeT2CWOMxfoYBb6GO5ZktKbPbbh1AA5a8M7njJ8rFtlXxdqbfis4WolqGca]] )

    storeDefault( [[SimC Windwalker: serenity]], 'actionLists', 20170110.1, [[d8tDhaGAIQY6vrjVeOYUqjBtrSpIQyMevW6urXSPYRrXnbYHiP42OY5byNQ0Ef7wY(vOrrurdtrnoIk0PL6zKsdwbdhL6GKKtruvDyvDoIk1cjflLszXKy5u1db0tHwgLQNRutKOknvsvtwjth0fvrEmHlJCDvWgjQKVPcTzfjBNO8DsQ(QkQMgqvmpGQ0IiP0FrvJMu5ZuYjbkhJixdOQCpfPwPkk1MaQQ(nfhPOp4P6vC0kAcEFoki2CahhoVRL6VJH8NzCytEQAiGG2ih9Bkx7ZstKMN1geztI(D9z9W2u5AFIChuLa2MAh95kf9bpvVIJwrtqBKJ(nLR9zPjshznRn495OGaFNBCqLa2MACqo0ByqvERDW65OPvl2CahhoVRL6VJH8NzCaO8Q2GQuAxdbeu8oh)lGTP4D9ggeSA1IhA8bltrbbQJemGmYioQGrjiiZ6(Cuq1InhWXHZ7AP(7yi)zghakVQnWCTh9bpvVIJwrtW7ZrbrYtvdbeef(Mnmi0yz5iwcJXTmQx7Ga1rcgqgzehvWOe0g5OFt5AFwAI0rwZAdcwTAXdn(GLPOGQuAxdbeCtEQAiGGGmR7ZrbdmxTrFWt1R4Ov0e8(Cuqe6BgACWm14auhnoCExlNXVcAJC0VPCTplnr6iRzTbvP0Ugci4g6BgI3mfpuhXRExlNXVccwTAXdn(GLPOGa1rcgqgzehvWOeeKzDFokyG5cEI(GNQxXrROjik8nByWxaBzepvextBWR2GQuAxdbe037US43hkEMwWeeSA1IhA8bltrbVphf0wV7YACapuJdGRfmbv5T2bfaeoIh(ElcUNwkOnYr)MY1(S0ePJSM1geiaHJ0)ElcUJMGa1rcgqgzehvWOeeKzDFokyG5c(I(GNQxXrROj495OGYvVH7XbZuJdY1bpGG2ih9Bkx7ZstKoYAwBqvkTRHacovVHBEZu8tDWdiiy1Qfp04dwMIccuhjyazKrCubJsqqM195OGbM7KOp4P6vC0kAcEFokiYURQlRXbG(VOXbW1cMGOW3SHbFbSLr8urCnTLNP1c(vdBpjJ3sSyjXAZURQllEH)lINPfmbbQJemGmYioQGrjOnYr)MY1(S0ePJSM1geSA1IhA8bltrbvP0Ugci4MDxvxw8c)xeptlyccYSUphfmWCpg9bpvVIJwrtqu4B2WGVa2YiEQiUM2YZ0AdQsPDneqqFV7YIFFO4zAbtqWQvlEOXhSmff8(CuqB9UlRXb8qnoaUwWmoiNsYFqvERDqbaHJ4HV3IG7PLcAJC0VPCTplnr6iRzTbbcq4i9V3IG7OjiqDKGbKrgXrfmkbbzw3NJcgyUYXOp4P6vC0kAcEFokiYURQlRXbG(VOXbW1cMXb5us(dIcFZggunS9KmElXILeRn7UQUS4f(ViEMwWeeOosWaYiJ4OcgLG2ih9Bkx7ZstKoYAwBqWQvlEOXhSmffuLs7AiGGB2DvDzXl8Fr8mTGjiiZ6(CuWaZvUJ(GNQxXrROjik8nByq1W2tY4TelwsSuCVGXCaYZ0cMGQuAxdbeuX9cgZbiptlyccwTAXdn(GLPOG3NJcQX9cgZb44a4AbtqvERDqbaHJ4HV3IG7PLcAJC0VPCTplnr6iRzTbbcq4i9V3IG7OjiqDKGbKrgXrfmkbbzw3NJcgyUsZrFWt1R4Ov0e8(CuqBh266YAC4S)fnoCExRGOW3SHbvdBpjJ3sSyjXYFyRRllE57xeV6DTccuhjyazKrCubJsqBKJ(nLR9zPjshznRniy1Qfp04dwMIcQsPDneqq)HTUUS4LVFr8Q31kiiZ6(CuWadmik8nByWata]] )

    storeDefault( [[SimC Windwalker: ST]], 'actionLists', 20170110.1, [[dq0DraqiiLwKaInrjmkQO6uur6wuru7cvnmi5yKYYOsEMIY0eGY1Gu02GiFds14OIiNtaP1PGkZtaL7rjAFOcoOaTqf4HuHjQGIlcrTrifojQOvkaXlPIWmfGQBIkTtKAOkO0svu9uIPsL6RurzVs)frdwvCyOwmP6XKmzHUmyZiPptPgneoTsRwavVwHMnvDBe2TOFtXWf0XrfA5O8Cv10v56iX2PK(UcY4faNxrwVcQA(cqA)QsxT6UcYjw3dXoOcnMaQilHJ3hNTzCiSFeyd37J4UYCWd4puAxO0qsdfQzvKqqTy)o84BnzPDHuGwjO6wt(R7sRv3vqoX6Ei2bvMdEa)Hs7cLgsAOZJAwfAmbuXb27FFcQU1KVpb89FvcYS)vsmbyzGilHJ3hNTzCiSFeyd37JJHjqQeuF97nvrH9EsS6wts63)vHZmUk8zyvstcvCGauJCnwbciVQxHRjsJjGkbISeoEFC2MXHW(rGnCVpogMaPxPDv3vqoX6Ei2bvOXeqfKtGzVd)M2Vpi73aSSkIITHxfibM9eVIcJb5fyqcm7jEcCaSqHy5vuymiVaZsTkoqaQrUgRabKx1Rmh8a(dL2fknK0qNh1SkCMXvHpdRsAsOsq91V3ufibM9o8BAtc(nalRcxtKgtav6v6z1DfKtSUhIDqfAmbujitHt49XTHXG8Qik2gEvoJTTh4vgJpAgk)w4CfILNahaNScXYROWyqECWsnlGey2t83saKNHKahaoyjkE00PvCGauJCnwbciVQxzo4b8hkTluAiPHopQzv4mJRcFgwL0KqLG6RFVPkyMcNa5zymiVkCnrAmbuPxPdy1DfKtSUhIDqfAmburo2ocVpgQVphc49XzBg9gwSIOyB4vb4iLnmeI8ktAfy2qQasdvsQ4d(wCypKh)hyqU3epKyDpeTqzm(OzOK)dmi3BINbe4n)CWsnuvCGauJCnwbciVQxzo4b8hkTluAiPHopQzv4mJRcFgwL0KqLG6RFVPk)JTJaPHk5HaihAZO3WIv4AI0ycOsVsJM1DfKtSUhIDqfAmburo2ocVpgQVphc49XzBg9gw89X5AoTIOyB4vb4iLnmeI8ktAfy2qQasdvsQ4d(wG2d7H84)adY9M4HeR7Hyfhia1ixJvGaYR6vMdEa)Hs7cLgsAOZJAwfoZ4QWNHvjnjujO(63BQY)y7iqAOsEiaYH2m6nSyfUMinMaQ0R0iv3vqoX6Ei2bvOXeqf5y7i8(yO((CiG3hNTz0ByX3hN7YPvefBdVkOf4iLnmeI8ktAfy2qQasdvsQ4d(vCGauJCnwbciVQxzo4b8hkTluAiPHopQzv4mJRcFgwL0KqLG6RFVPk)JTJaPHk5HaihAZO3WIv4AI0ycOsVsJEDxb5eR7HyhuHgtavqJ9F)3hd13h0GcBQIOyB4vb4iLnmeI8ktAfy2qQasdvsQ4d(wCypKh)hyqU3epKyDpeTqzm(OzOK)dmi3BINbe4n)CWs0SIdeGAKRXkqa5v9kZbpG)qPDHsdjn05rnRcNzCv4ZWQKMeQeuF97nvH6(VpPHkjvkSPkCnrAmbuPxPDs1DfKtSUhIDqfAmbubn2)9FFmuFFqdkSP3hNR50kIITHxfGJu2WqiYRmPvGzdPcinujPIp4BbApShYJ)dmi3BIhsSUhIvCGauJCnwbciVQxzo4b8hkTluAiPHopQzv4mJRcFgwL0KqLG6RFVPku3)9jnujPsHnvHRjsJjGk9kDGw3vqoX6Ei2bvOXeqf0y)3)9Xq99bnOWMEFCUlNwruSn8QGwGJu2WqiYRmPvGzdPcinujPIp4xXbcqnY1yfiG8QEL5GhWFO0UqPHKg68OMvHZmUk8zyvstcvcQV(9MQqD)3N0qLKkf2ufUMinMaQ0R0AOQ7kiNyDpe7GkIITHxf0gYaRK2QiVg)T2aJme7jSasGzpXROWyqEwcjWSN4jWbWcfILxrHXG8cmlNzHofQu5)NHrqcy2HGeNrsQld4PewjO(63BQYT2aJme7jQWzgxf(mSkPjHk0ycOI71gyVpdl2tujiZ(xrnP8a5Hz2W9TuRYCWd4puAxO0qsdDEuZQ4ys5b3yMnC)oOIdeGAKRXkqa5v9kCnrAmbuPxP10Q7kiNyDpe7GkIITHxfGJu2WqiYRmPvGzdPcinujPIp4BXH9qE8FGb5Et8qI19q0cLX4JMHs(pWGCVjEgqG38ZblDvjO(63BQcB)BAt(PKKJRAScNzCv4ZWQKMeQqJjGkZ3)M2VpcL89Xjw1yLGm7Ff1KYdKhMzd33sTkZbpG)qPDHsdjn05rnRIJjLhCJz2W97GkoqaQrUgRabKx1RW1ePXeqLELwZvDxb5eR7HyhuruSn8QaCKYggcrELjTcmBivaPHkjv8bFlq7H9qE8FGb5Et8qI19qSsq91V3uf2(30M8tjjhx1yfoZ4QWNHvjnjuHgtavMV)nTFFek57JtSQX3hNR50kbz2)kQjLhipmZgUVLAvMdEa)Hs7cLgsAOZJAwfhtkp4gZSH73bvCGauJCnwbciVQxHRjsJjGk9kT2S6UcYjw3dXoOIOyB4vbTahPSHHqKxzsRaZgsfqAOssfFWVsq91V3uf2(30M8tjjhx1yfoZ4QWNHvjnjuHgtavMV)nTFFek57JtSQX3hN7YPvcYS)vutkpqEyMnCFl1Qmh8a(dL2fknK0qNh1SkoMuEWnMzd3VdQ4abOg5ASceqEvVcxtKgtav6vATawDxb5eR7HyhuHgtavCgIL530(9zyyyBt((mSusfIkZbpG)qPDHsdjn05rnRsq91V3uLHqSm)M2Krg22KKHusfIkCMXvHpdRsAsOIdeGAKRXkqa5v9kCnrAmbuPxP1qZ6UcYjw3dXoOcnMaQ4GHvJ(nTFFci4i8(eWxBexUPDfrX2WRcWrkByie5peajqecmd7tQWHy1EgMf6uOsL)qaKariWmSpPchIv7zy8)dRg5GLAbAfhia1ixJvGaYR6vMdEa)Hs7cLgsAOZJAwfoZ4QWNHvjnjujO(63BQIIHvJ(nTjdCCei9RnIl30UcxtKgtav6vAnKQ7kiNyDpe7Gk0ycOIeUzUP97JdgoH3hNyvJvefBdVky1TwbsibIf(CWYzwG2qgyL0wf514)HBMBAtQy4eihx1yfhia1ixJvGaYR6vMdEa)Hs7cLgsAOZJAwfoZ4QWNHvjnjujO(63BQYpCZCtBsfdNa54QgRW1ePXeqLELwd96UcYjw3dXoOcnMaQmNYhXM2VpbeCeEFC2MXkIITHxffILNahaNScXYROWyqECqZc0gYaRK2QiVgpJYhXM2KboocKdTzSIdeGAKRXkqa5v9kZbpG)qPDHsdjn05rnRcNzCv4ZWQKMeQeuF97nvHr5JytBYahhbYH2mwHRjsJjGk9kTMtQURGCI19qSdQik2gEvCUcXYROWyqECqlGgq1PqLkVUzKmKzu8ucDQfOnKbwjTvrEnEDpwnAOCKJRASsq91V3ufDpwnAOCKJRAScNzCv4ZWQKMeQqJjGkd8y1OHY9(4eRASsqM9VIAs5bYdZSH7BPwL5GhWFO0UqPHKg68OMvXXKYdUXmB4(Dqfhia1ixJvGaYR6v4AI0ycOsVsRfO1DfKtSUhIDqfAmbuXbI99XzyRqfrX2WRcKaZEI)wcG8mKe4aWblDX7cnR4abOg5ASceqEvVYCWd4puAxO0qsdDEuZQWzgxf(mSkPjHkb1x)EtvuiwYHWwHkCnrAmbuPxPDHQURGCI19qSdQqJjGkoqSVpdOW(xfrX2WRcKaZEI)wcG8mKe4aWblDX7cnR4abOg5ASceqEvVYCWd4puAxO0qsdDEuZQWzgxf(mSkPjHkb1x)EtvuiwsDkS)vHRjsJjGk9kTlT6UcYjw3dXoOIOyB4vbTHmWkPTkYRXFRnWidXEIkb1x)EtvU1gyKHyprfoZ4QWNHvjnjuHgtavCV2a79zyXEI3hNR50kbz2)kQjLhipmZgUVLAvMdEa)Hs7cLgsAOZJAwfhtkp4gZSH73bvCGauJCnwbciVQxHRjsJjGk96vruSn8Q0Rf]] )

    storeDefault( [[SimC Windwalker: CD]], 'actionLists', 20170110.1, [[d8tNjaWCrTEQeYMGk7sQ2gH0(OsQ8As4WknBknFPe3uK68uKBtWPrStPyVO2TQ2pfAueQgMimovcEmspdkmyky4QuhckQtriogu1XPs0cvjTurulMOwoPEiuQNQyzuPwhvc1eHImvkQjdz6sUOiXxvjKldUor2ivsvFMK2mvSDPuFNenlQemnvIMNiPVbLmwvc1OvX4PsYjfr(lvDnQKs3tkPZrLuCqcLFlmJNnZtk)kBbeFLNMva4zicyB0WfrEKY1Qa0UyJgWgt8KmyHndCJ7e4ffFIeyWZCduYAjUOTiXZnUf11WJy0IeFMnZn4zZ8KYVYwaXx5PzfaEs6BhkaJgUyj4DbJgQdy0WfDify0GzIkO5zOAYDXtfQQwOtJWIcLFMhSpavr6OniaFXY8KmyHndCJ7e4ffpw9eyWtspIq3k088Xd8iMmXskt8q(2HcW7kj45jDGAwbGhU4g3SzEs5xzlG4R80ScapxTrGmAW1lPnXZq1K7INkuvTqNgHffk)mpyFaQI0rBqa(IL5jzWcBg4g3jWlkES6jWGNKEeHUvO55Jh4rmzILuM4r2gbY7iPnXt6a1ScapCXnyWM5jLFLTaIVYtZka8Cf0zqRG8Q8mun5U4Pcvvl0PryrHYpZd2hGQiD0geGVyzEsgSWMbUXDc8IIhREcm4jPhrOBfAE(4bEetMyjLjEKbDg0kiVkpPduZka8Wf3CjBMNu(v2ci(kpPxxreKemVAvOY84MNHQj3fpvOQAHonclku(zCIJ5vxeNLwD11cEzjDU6WVYwaHdCPe5(gq9dbHG3lS5c0zVtOLjie8(kKOhCIFRH2EvkQ7UxHe94dhpc260sl3AOTxLI6y0RqIE8HJhbBDAPLBn02Rsr9l7virp(WXJGToIicpIjtSKYepvirp(WXJGTo8K0Ji0TcnpF8apnRaWJ5qIEmAiCmAatWwhEetRM5HAIAbFTAvOYTI3fewx5PMOwWxRwfQCRU5jzWcBg4g3jWlkES6jWGhSnrTG5vRcvMVYd2hGQiD0geGVyzEshOMva4HlUX1YM5jLFLTaIVYtZka8yoKOhJgchJgWeS1XObXXlcpdvtUlEQqv1cDAewuO8Z4ehZRUiolT6QRf8Ys6C1HFLTachMbxkrUVbu)qqi49cBUaD27eAzccbVVcj6reEW(aufPJ2Ga8flZtYGf2mWnUtGxu8y1tGbpj9icDRqZZhpWJyYelPmXtfs0JpC8iyRdpPduZka8Wf3ikBMNu(v2ci(kpPxxreKemVAvOY84MNHQj3fpvOQAHonclku(zCIV6I4S0QRUwWllPZvh(v2ciCGlLi33aQFiie8EHnxGo7DcTmbHG3xHe9GJgHffk)EU0efGpC81b8kjpYgAuxdcl5ZPEbC0iSOq53Di5k7dhVJK2uxdcl5ZP26L4OryrHYVRjzYR6ZsVxbHQORbHL85uXcN43AOTxLI6U7virp(WXJGToT0YTgA7vPOog9kKOhF44rWwNwA5wdT9Quu)YEfs0JpC8iyRJiIWJyYelPmXtfs0JpC8iyRdpj9icDRqZZhpWtZka8yoKOhJgchJgWeS1XObXDlcpIPvZ8qnrTGVwTku5wX7ccRR8utul4RvRcvUv38KmyHndCJ7e4ffpw9eyWd2MOwW8QvHkZx5b7dqvKoAdcWxSmpPduZka8Wf3GfBMNu(v2ci(kpnRaWJ5qIEmAiCmAatWwhJgehdr4zOAYDXtfQQwOtJWIcLFgN4RUiolT6QRf8Ys6C1HFLTachMR1cF1ZGgEszQd)kBbeomdUuICFdO(HGqW7f2Cb6S3j0YeecEFfs0doAewuO875stua(WXxhWRK8iBOrDniSKpN6fWrJWIcLF3HKRSpC8osAtDniSKpNARxIJgHffk)UMKjVQpl9EfeQIUgewYNtflC0dPtL0A4lxxRUfHhSpavr6OniaFXY8KmyHndCJ7e4ffpw9eyWtspIq3k088Xd8iMmXskt8uHe94dhpc26Wt6a1ScapCXnxGnZtk)kBbeFLNMva4XCirpgneognGjyRJrdIFPi8mun5U4Pcvvl0PryrHYpJt8vxeNLwD11cEzjDU6WVYwaHRwl8vpdA4jLPo8RSfq4Wm4sjY9nG6hccbVxyZfOZENqltqi49virp4OryrHYVNlnrb4dhFDaVsYJSHg11GWs(CQxahnclku(DhsUY(WX7iPn11GWs(CQTEjoAewuO87AsM8Q(S07vqOk6AqyjFovSeHhSpavr6OniaFXY8KmyHndCJ7e4ffpw9eyWtspIq3k088Xd8iMmXskt8uHe94dhpc26Wt6a1ScapCXfpdvtUlE4Iza]] )


    storeDefault( [[Windwalker Primary]], 'displays', 20170110.1, [[dStXeaGEcYUeuyBqPMPOqZMOdRYnbfphOUTqptuYoj1EL2Ti7NYpbLmmb(TQ68cYqrXGPA4e6GkLJsqDmu6CckzHaYsjGflQwUsEOQ4PilJeTorPMiu0ubYKbvthvxuv6QcQ4YkUoiBKaDAiBgqTDOYhfu1xHctduQVRuzKck6XamAsy8qjNuu0TiPRjk4Eck1NHQwRGk9ALQUSfujHHgObU5c(tCZjKqt1SklXGJXCvZbDl8dV5LywO4Tcz(ZjYr)K5BqRRuP1il98Qb9kqPWb8yojosPGYdSIMxIb3R5QMd6w4hEZlXG71CvZXCa(GK8cujgCVMRA(ZpMF8MxcMdluekAoiuCQoRGsH7)hRMndLyWXyUQ5yoaFqsU5Bsrfx1SLyWXyUQ5p)y(XBEjgCmMRAoMdWhKKxGkfQAvLyhuAdwVMRAomhwOiuS6GscmY5apvRmGfBwLbyhgSLe4s4hZFuma2Js4lD5ijIhQedUxZvn)5hZpU5Bsrfx1SLyWXyUQ5GUf(HB(MuuXvnBjgCmMRA(ZpMFCZ3KIkUQzljm0anMVjr4tXjXlbO0gao6Nm)5e5OFcCbQewvhuIepaOe(QZqjsCKsbLhyfM)8L)vbv6QMTuE1SLWxnBPv1SLx65lgYCq)syGsW3DY9ZY8ny9wIzHI3kK5c(tCZjKqt1Skljm0anMJjAna4OFQKazg(WeujmhGpijVavsyObAGBEMa(jZjKqt1WoOKG)eV0lwIRbm4DxOsVPlxoWlqLywO4TczEMa(jZjKqt1WoOeZcfVviZForo6NkXVf(HdU0gSEnx1CyqjuekwDwLiXba6KiHoo6NQwj2HvPmb8tGnNu83LQg2LaDYjXnp8RpKy1bLiucVCmx1CyoSqrOy1SL0xCkHbkbF3j3plZzwO4TcvIb3R5QMd6w4hU5Bsrfx1SL2G4FZvnhgucfHIvhuAdI)nx1CyoSqrOy1bLiucVCmx1CyqjuekwDqjHHgObCbvnBbv6nD5YbEbQ0gao6NmpJiW8sek(yogOe8DNC)SY2CX1a4hZpEj9fNsek(yogOe8DNC)SY2CX1a4hZpEjbg5CGNQvgWInBqqwLialKiVehfNWoO8QvwqLEtxUCGxGkTbGJ(jZZicmVeHIpMJbkbF3j3pRSnh(a8bj5L0xCkrO4J5yGsW3DY9ZkBZHpaFqsEjbg5CGNQvgWInBqqwLxEjgCVMRAoMdWhKKB(MuuXvnBjcWcjYlvEl]] )

    storeDefault( [[Windwalker AOE]], 'displays', 20170110.1, [[d0t2eaGEuQ2fuLSnLOdRQzkkXTfz2KCnq0nbjNxP4BIs55QKDkyVs7wO9t5Nqvmms14GQuptj1qjyWunCICqr1rjLCmcDorPAHGulfQQfRuTCGEOk1trwMOyDkbtefzQqXKHkthvxufUkPu6YkUoO2ik0NHsBwP02rjFuusFff10qP8DLKrskvESkA0KIXJcoPsOBruNgY9iLIFdyTKsvVgeUIftjTGh4bN5mce5Mti2NgeZusGLG5YMJ5bXo8UxsaeLEWnMF)sCeq08CyWVujWrv6(iG5a)sA71yojnkfJQ)st3lrs)jkITbiljW6WCzZzA2(WkEHUKaRdZLn)giT)8UxcQNbucozoguAAyTEjThai1GiKLeyjyUS5mnBFyf38CLKMVbXscSemx28BG0(Z7EjbwcMlBotZ2hwXl0L2ugLZgKlzB5A8o7zGCnKzthYLDRmBqwIHg0lH)OM)AAiJU4sXm6lXlXs4)rSJ53AMtiqrSL(DKcX3usG1H5YMFdK2FU55kjnFdILearPhCJ5lEcenNqSpnWMEjbwcMlB(nqA)5MNRK08niwkhMdyUS5qHIOeCQH1LeyDyUS5mnBFyf38CLKMVbXs0jisIx6cfXQMsekIvnMlBouOikbNAyDjsAukgv)LgZVbuaGftPVbXsGniwcBdIL2BqS8sK0CIEfI9NJaInKzz2lLdZbmx2COEgqj4ud6L0cEGhZzcboNCeqSe(lMvTdtjMMTpSIxOlPf8ap4mFXtGO5eI9Pb20ljW6WCzZX8GyhU55kjnFdILoI)UAWvOljWsWCzZX8GyhU55kjnFdILiueRAmx2COEgqj4ud6LYXZH5YMdfkIsWPgwxcZRMi38Sccal1GEPfpbIxMtAawfBGTs545WCzZH6zaLGtnOxsaeLEWnMF)sCeqSe)bXo8RscGO0dUXCgbICZje7tdIzkXiqKx6GbjW56A1VPu4ttjMrrCREfedO5545O0nG0gZXauIzue3QxbXaAEoEokjW6WCzZX8GyhE3lPf8apxftdIftPJ4VRgCf6s5NCeq08SGU4Liu62CMrrCREfed4cMlboNaP9Nxk8PPeHs3MZmkIB1RGyaxWCjW5eiT)8s4pQ5VMgYOlUuuxFDj6eejXlXrPrB0lVHmftPJ4VRgCf6s5NCeq08SGU4Liu62CMrrCREfed4cMJB2(WkEPWNMsekDBoZOiUvVcIbCbZXnBFyfVe(JA(RPHm6Ilf11xxE5LYp5iGO53VehbeVk0L0cEGhZZviSX0e5LolVf]] )

    storeDefault( [[Brewmaster Primary]], 'displays', 20170110.1, [[dOZueaGEuKDriX2ekZKqsZMQUPc1Hv52IACIu2jv2R0UbSFk)ui1WuWVv01ajnuinysdNOoOiokkQJbXLvAHePLsiwSQYYf8qu4PilJiEoiMOizQa1KfIMouxuv1vjKYZuixxv2ii13ecTzHQTdKpksLpdktdK47OKgPiv9yq1OrPgpkXjfsUfbNgvNNqTocPATcbETqqxKcUu0G2G)e3Vsm)23gPPqpbWMsCM26qKucfeQPcMc(cWwC)kHg45li2ugNmMpbmn5fUsLcRVeJFh4FrkjAqwtj517H2Fqy3VsK8bNdaRoOwcf0VPcMMAJFppUslHc63ubtzmZFhUFLgFSWZVSPG55TUrdLIG5mxhculHcc1ubttTXVNhBAIxM9vhsjuqOMkykJz(7W9Rekiutfmn1g)EECLwsCDcsInuILcDSrJgHKweHkIK0InelIsACbOKwjrw)Eq26KmGedrYqmrbPeZV9TMM45WaYlaUe8sOG(nvWugZ83HnnXlZ(QdPekiutfmf8fGTytt8YSV6qkHcc1ubtzmZFh20eVm7RoKse8axgxQekOFtfmn1g)EESPjEz2xDiLioam)AQGPJ5a88lx3qj0apFbXMgf8jGPeNPToOmuIKxVhA)bHTPmM(zOGlD1Hukuhsjy1Hu6RoKIlXykl2uWZssdlR5dcEdMMe9FPKhEAQGPJpw45xUUHsm)23AAkEyHJ5tGsIev6sp4sjp80ubthZb45xUUHsm)23gPPrbFcykXzARdkdLqb9BQGPGVaSfBAIxM9vhsPFG7ZVrwPLioam)AQGPJpw45xUoKsGp)cGnnDH5tUUHsjr)BQGPJ5a88lx3OsrbFcaXuI9KvG6gvI53(wifCDifCPFG7ZVrwPLsGJ5tatfvoeCjPHL18bbVbr30uB875XLCxElLAJFppUKiRFpiBDsgqIHmmmQebpWLXLkU4sObE(cInLXjJ5tGs4laBXqkHg45li2uONaytjotBDisk5U8wsAyznFqWBWu0apFbXLGEcGlLe4N3u3fctwlLAJFppUslrYlC(55mDy(eOojXsRekOFtfmf8fGT4(vkj6FtfmD8Xcp)Y1nukboMpbmLXjJ5taivAjroayRPmyVWJqoaSs3h3ZXIlUfa]] )

    storeDefault( [[Brewmaster AOE]], 'displays', 20170110.1, [[dSZzeaGEIWUarzBeLzcIQztQddCtq41cICBfUMiANcTxPDRs7NYpHQAyQWVvLNbvgkugmvdNKoOahfPYXG05eeSqs0srQAXkYYf1dHONIAzKW6eeAIIKPcQMSGY0rCrf1vfK0Lv66QQnksnoKsBMOA7GYhfK6ZG00iI(osXifK4Xqy0ePXdv5KcQUfsonHZlcpxfTwbr9nqKlAHxgFyBwds0PY093)gM5PFxI5SqITrufLXYIbiNW80VlXCwiX2iQIYyzXaKtyosGkr8UMh8ZGYLZRUmY5i8z6lhQNR5S6Q1P1GtPDQmRcqiUqBmzzmyZMtzEQvo4RjvzzmyZMtzoY3ycq6uzia4jg)H5WfJTrChLd53B0iAYYmISqLu(uCHQ3YyWWmNYCKVXeG0PYyWWmNY8uRCWxtQYYjAAkiLuMKYWrBiOijUKq6iPSkNsYKLXRPLHdhouAHusuf0k7qgKuu5ussBz6x9co3gvCGkdvXHmidTm9Gl01CKsxeHK4cTmysOfKeLd(KN5uMdbapX4pA8Omwwma5eMhoI31CwiX2OKhLzXfQEnNYCiexX4pAexz6(7FnpqlGEh7Lugr5aeeX7AosGkr8UNvz5a8NnNYCia4jg)rJhLXGnBoL5WbzOlPtLz1vRtRbNsnh5t)YfEzqJOLNAeTm0grlNBeTKYiFQjmh(RSY8sZaCs2S5b4pxMvxecGwibGiE3gviJ2Y093)AEkrErqeVBz6dp0Hc8YrWylRmV0maNKnBEa(ZLP7V)nmZdhX7AolKyBuYJYPFxs5GSaOnpcY5hnLNVGj9gwvwgdgM5uMdhKHUKovgllgGCcZrcujI3TmbKHUKZYb4pBoL5qiUIXF0iUY093)Ew4nIw4LNVGj9gwvwoabr8UMd5ItszL5LMb4KS5q08uRCWxtkhbJTCQvo4RjLPF1l4CBuXbQm0JdCLzezHkPCjLuoCeV7P5S0hn3gXvgoqVxI5Ho)(QnEuMfxO61CkZHaGNy8hnEuo4tEMtzoeIRy8hnIRmgSzZPmhoidDjMhOvLcAeTCQvo4RjvzzmyZMtzoY3ycqmpqRkf0iAzmyyMtzoCqg6smpqRkf0iAzmyyMtzoY3ycqmpqRkf0iAzmyZMtzEQvo4RjMhOvLcAeTmgmmZPmp1kh81eZd0QsbnIwsla]] )

    storeDefault( [[Brewmaster Defensives]], 'displays', 20170110.1, [[dSJqeaGEeLDrkW2akZKuqZwOdRQBQu63aUTsEgq1ojzVs7wu7NQFIimmbghq0RrezOqAWugUGoOiDuevhdIZrk1cjvTuKOfRuTCv8qK0trTmIyDKc1ejstfKMmsy6eUiiUkPiUSIRRsBeiDAO2ms12fXhjf1NbvtJuK(oPsJKuipgugnsz8isNKuXTq4AKsoVsXZjQ1IiQVbeUifAzsKmN4VP7Lj)o3Hc3afilCJXKnvHiPmAcQBeUb9pWhr3lJEWR)SXnQFOadKDl9E(YLptSmvikOqOSSMipUXHtmcA8LP19YOjqCJWnO)b(i6Ez0eiUr4M0H(FJIQVmAce3iCJkWA)fDV82Nu86UCdkEnvbEqzsgayvf4bLzyhCOOCz0eu3iCJkWA)fDVmAcQBeUjDO)3OO6lVPkcjGfuoLeqCJWTTpP41DvvqzkN48YtvscqadrsayAaszYVZDClnIHNxtwugw50RaWnc32(KIx3vvbLrp41F24MoWaYUXyYMQapOmJZWJJBeUTfNXR7QQGYKwqjaji0gSaTbxlT0oaeGuBejLoHMcIYPWeyGSBu)qbgilx9LP8ZWh3OsBGrs4m8Y)ooIfBkZHtmcA8LP5gvGiWPql)vHuEVkKYWRcP8PkKkkZHdm8hXK9cmqUkjGbYYC4ddNHxLwLj)o3XnP4ZatGbYLPuhnRrqlJEWR)SXnqbYc3ymztviskt(DUdfUPdmGSBmMSPkjAvw9RPS(ZO76LfZXnPd9jlJtg5YqY)ECOO6ldkqwuo9G)OBQ)Ca0Tm6bV(Zg3O(HcmqUmfd9)gfLtjbe3iCBloJx3vvGxM87Ch5cTkKcTmK8VhhkQ(YPWeyGSBAiwwuw)z0D9YI5OXUjDOpzzCYixw9RPS0H(KLXjJCzkN48Ytvscqadjia8YmSdouuUIkkRdmGSSBmnaDZvHug6hNSWnnFaUHvfuMXz4XXnc32(KIx3vviLtVca3iCBloJx3vvbLrtG4gHBq)d8r4wAmK2xfszPd9)gfvFz0eiUr4gvG1(lClngs7RcPmAcQBeUb9pWhHBPXqAFviLrtqDJWnQaR9x4wAmK2xfsz0eiUr4M0H(FJc3sJH0(QqkJMG6gHBsh6)nkClngs7RcPIw]] )


    Commit( 'initializeClassModule', MonkInit )
    Hekili:ReInitialize()

end
