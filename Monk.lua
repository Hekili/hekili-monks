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
local storeDefault = Retrieve( 'storeDefault' )



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
        addTalent( 'diffuse_magic', 122783 )
        addTalent( 'dizzying_kicks', 196722 )
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
        end )

        addHook( 'spend', function( amt, resource )
            if state.equipped.drinking_horn_cover and resource == 'chi' and state.buff.storm_earth_and_fire.up then
                state.buff.storm_earth_and_fire.expires = state.buff.storm_earth_and_fire.expires + 1
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
                    return UnitStagger( 'player' )

                elseif k == 'incoming_per_second' then
                    return avg_stagger_ps_in_last( 10 )

                elseif k == 'time_to_death' then
                    return math.ceil( health.current / stagger.v1 )

                elseif k == 'percent_max_hp' then
                    return ( 100 * state.stagger.amount / state.health.max )

                elseif k == 'percent_remains' then
                    return total_staggered > 0 and ( 100 * state.stagger.amount / stagger_in_last( 10 ) ) or 0

                elseif k == 'dump' then
                    DevTools_Dump( staggered_damage )

                end

                return stagger[ k ]

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
        } )

        modifyAbility( 'breath_of_fire', 'cooldown', function( x )
            if buff.blackout_combo.up then
                return x - 6
            end
            return x
        end )

        addHandler( 'breath_of_fire', function ()
            if debuff.keg_smash.up then applyDebuff( 'target', 'breath_of_fire', 8 ) end
            if equipped.firestone_walkers then setCooldown( 'fortifying_brew', max( 0, cooldown.fortifying_brew.remains - ( min( 4, active_enemies ) ) ) ) end
            cooldown.fortifying_brew.expires = max( state.time, cooldown.fortifying_brew.expires - 4 + ( buff.blackout_combo.up and 2 or 0 ) )
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
            if buff.serenity.up then x = x / 2 end
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
            summonPet( 'xuen' )
        end )


        addAbility( 'keg_smash', {
            id = 121253,
            spend = 40,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            cooldown = 8,
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


        addAbility( 'rising_sun_kick', {
            id = 107428,
            spend = 2,
            spend_type = 'chi',
            cast = 0,
            gcdType = 'melee',
            cooldown = 10,
        } )

        modifyAbility( 'rising_sun_kick', 'cooldown', function( x )
            if buff.serenity.up then return x * haste * 0.5 end
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
            known = function () return talent.rushing_jade_wind.enabled end
        } )

        modifyAbility( 'rushing_jade_wind', 'cooldown', function( x )
            if buff.serenity.up then x = x / 2 end
            return x * haste
        end )

        modifyAbility( 'rushing_jade_wind', 'spend', function( x )
            if buff.serenity.up or spec.brewmaster then return 0 end
            return x
        end )

        addHandler( 'rushing_jade_wind', function ()
            applyBuff( 'rushing_jade_wind', 6 * haste )
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
            if buff.serenity.up then return x * 0.5 end
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


        addAbility( 'tiger_palm', {
            id = 100780,
            spend = 50,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            ready = 50,
            cooldown = 0
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
            toggle = 'cooldowns'
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


    storeDefault( [[SimC Import: default]], 'actionLists', 20161206.1, [[dKtriaGEcuAtuODr02ukntOunBiZNs8ncv7ei7L0UfTFPYOKIggH8BvTmOWqHsPgSuA4svhKGoLu4ya6CeOAHeklLIYIPulh0IqOEQIhRKNJ0ejqXuritwIPt1fPO6WQCzuxxP6zeW5bQnJOtl8xj9DemnaY8ukgjuk51uWOHIUnuDsa8zkPRbLI7rroebYdHswha1kqLiDmppBexuX0rWWK3oYvX0z65vCOqWEE8PccJTcUoMXi(OSccdra3ceOaIKa1zwWO31rhHlp(KQePGaQePJ55zJ4IkMoZcg9Uo(B1kILr6meU37uDeAhOWbRdTNpyfZllvQdddSoaKLyD(d1j)K1XmgXhLvqyic4wGIlfjGoGoCwNPNpyxl26Ysx74WWaRUccdLiDmppBexuX0zwWO31XFRwrSC9pQ8esQXM27KKskd5mCWY9ElwS3jjLu)H4v(GoM1llvYaYY9ElwAki)qC6skd5mCWsopBexm6WinWUSh(l5znqHdwU33WIf7DssPn6)cAN6Y9Elw8dALDPh4C1)Aj4nM2kQHocHwP6KhoB6rLkHdQJq7afoyD6Fp(uhaYsSo)H6KFY6ygJ4JYkimebClqXLIeqhqhoRd2(94t1vqcOePJ55zJ4IkMoZcg9Uon9dXPlPmKZWbl58SrCX46Fu5jKskd5mCWsiJFrs3ysudJnBEqpiVLlPommW1NS6yYvcrwqpSi58SrCX46Fu5jKsQdddC9jRoMCLqKf0dlsiJFrs3yciGmU(hvEcPeg0iTwP7z1qSmiHm(fjDJja1WIf7DssjLHCgoy5EFdDecTs1jpC2eXtGJvxla49p0bCxlLHCgoyI1rODGchSoRdHQ3YJpROG66aqwI15puN8twhZyeFuwbHHiGBbkUuKa6a6WzDW6qOUwHlp(SRf7b1vxbbiLiDmppBexuX0zwWO31rq(H40LugYz4GLCE2iUySzZd6b5TCj1HHbU(KvhtUsiYc6HfjNNnIlgx)JkpHusDyyGRpz1XKReISGEyrcz8ls6gtabKX1)OYtiLKb1P1NSsUdblHm(fjDJPTgx)JkpHucdAKwR09SAiwgKqg)IKUX02gwSyVtskP(dXR8bDmRxwQKbKL79n0ri0kvN8WztepbowDTaG3)qhWDTuMKyDeAhOWbRZ6qO6T84ZkkOUoaKLyD(d1j)K1XmgXhLvqyic4wGIlfjGoGoCwhSoeQRv4YJp7AXEq9U2MaBOUccBuI0X88SrCrftNzbJExNM(H40LugYz4GLCE2iUyC9pQ8esjLHCgoyjKXViPBmjQHXMc6GEqElxsDyyGRpz1XKReISGEyrY5zJ4IX1)OYtiLuhgg46twDm5kHilOhwKqg)IKUbiGmU(hvEcPKmOoT(KvYDiyjKXViPBmbeBmU(hvEcPeg0iTwP7z1qSmiHm(fjDJ4nSyXENKusziNHdwU3RJqOvQo5HZMiEcCS6AbaV)HoG7APmKZWbtSocTdu4G1zDiu9wE8zffuxhaYsSo)H6KFY6ygJ4JYkimebClqXLIeqhqhoRdwhc11kC5XNDTypOExBtmAOUcARsKoMNNnIlQy6mly076ii)qC6skd5mCWsopBexm2SPGoOhK3YLuhgg46twDm5kHilOhwKCE2iUyC9pQ8esjzqDA9jRK7qWsiJFrs3ysWnU(hvEcPeg0iTwP7z1qSmiHm(fjDJjSPHfl27KKsQ)q8kFqhZ6LLkzaz5EFdDecTs1jpC2eXtGJvxla49p0bCxlLjjwhH2bkCW6SoeQElp(SIcQRdazjwN)qDYpzDmJr8rzfegIaUfO4srcOdOdN1bRdH6AfU84ZUwShuVRTPanuxbjUsKoMNNnIlQy6a6WzDW6qOUwHlp(SRf7b17ABcOg6ieALQtE4SjINahRUwaW7FOd4U2HiI1rODGchSoRdHQ3YJpROG66aqwI15puN8twhZyeFuwbHHiGBbkUuKaQRUoGoCwNjWXQRfa8(h6aURTWK3oYvxva]] )

    storeDefault( [[SimC Import: precombat]], 'actionLists', 20161206.1, [[b4vmErLxtvKBHjgBLrMxc51uevMzHvhB05LqEn1uWv2yPfgBPPxy0L2BU5LtYytoEnLuLXwzHnxzE5KmWeJnXeZmW4smEn1uJjxAWrNxt51ubngDP9MBZ5fvE5umErLxtvKBHjgBLrMxc51utnMCPbhDEnfDVD2zSvMlJ92BSr2B352CEnvqYD2CEnLBH1wz98gBK91DHjNxtfKyPXwA0LNxtb3B0L2BU51uj5gzPnwy09MCEnLBV5wzEnLuLXwzHnxzE5KmWeJnXCJlWmJxt5uyTvMxtb1B0L2BU5fDErNxt5uyTvMxtnvATnKFGLuBW9MC0PJFGbNCLn2BTjwy05fDE5f]] )

    storeDefault( [[SimC Import: sef]], 'actionLists', 20161206.1, [[dGJrdaGEkfBcI0UOsBJcTpiIzcrz2GUTQStG2Ry3kTFuAuqbdJs(nHLbvnyumCk4GkYPGI6yaoNQsSqkYsPuTyf1Yr1dPIEkYJPQNdPjcL0uHWKjQPl5IQQoSkxM01HISrvLQNrrTzIuNNkCAPMfevttvP8DOq)vbFtvXOjsgpuQtse3svjDnOe3dQ0NvOfbvSokLoabrO)9MHQCmfcRQ0hMGvmfImO((GTnx1InG4n(Lq2vOEOAaXBbyeaWSLlqiYZBdvOqt(QflAqeqGGi0)EZqvoMcbEpn0)Q8X2MEhzz(Hn2np00Cd7YriDv(yBtVJdkSXU5HKSYT)kbp0kwnKDfQhQgq8wagb(4AzovaXheH(3BgQYXuiYZBdvOsmocvxVqaLfyCrrkg8s1UVd7V6LQD9yIZ1TqcUaivxLp6WT6NouIH3HnsW1Yflyo00Cd7YrOJ7VvhkbNRBfsYk3(Re8qRy1q2vOEOAaXBbye4JRL5qG3tdnX93QSmieCUUvQaAoic9V3muLJPqG3td58GqwMjF1ILLbznAfAIpIgAVNIlou)CYYi5zqWlBzzCIvCcnn3WUCeYFq4W5RwSdWgTcjzLB)vcEOvSAi7kupunG4Tamc8X1YCQa(TGi0)EZqvoMcrEEBOcvIXrO66fcOSaJlAOP5g2LJqOLG)g0JxsnCR8G0nxdjzLB)vcEOvSAi7kupunG4Tamc8X1YCiW7PHOsWFiNL5)4LuiNL5wzwMV3CnvaXsqe6FVzOkhtHaVNgY5bHSmt(QflldYA0ILbdayo0eFen0EpfxCO(5KLrYZGGx2YYqiWj00Cd7Yri)bHdNVAXoaB0kKKvU9xj4HwXQHSRq9q1aI3cWiWhxlZPsfc8EAiQFozzK8mi4LTSmOQ0Psa]] )

    storeDefault( [[SimC Import: serenity]], 'actionLists', 20161206.1, [[daeZjaqicvTiPqztsvmkPGtru1QKcr7sGHjvogKwgPYZiKPjfQUMkuTnQKVjv14KcHZjLkToPuY8iu5EsvAFek6Gq0cjv9qcLMOuk1fPsTrPu1jLIwPui5LQqMPui1ojyPeLNImvPKVkLc7v5VIAWuLddAXKYJHAYQQlJAZq4ZuXOjQCAkRwkv8AImBHUTG2TKFRkdxLSCsEUith46QOTRc(UkugVuk68QuRNqH9tv9qxRrUlOwK)t)O2MrapJGPFeDXydgnXacSxnbDUA3rY4idt8e01H6cfvuxa6icRSlWOriXa7vP1AcOR1i3fulY)PFKamKh5UyLJjgw5475oATPPgHuZIg4EexSYXedRCYC0AttnQz9nme8uJQxXJKXrgM4jORd1fA)GordmbDR1i3fulY)PFKamKhjwym67HedSx571OTeyesLtAubd5EBmYcfRVxZWRNc0w(EITTBSri1SObUhHHXygIb2RYrlbg1S(ggcEQr1R4rY4idt8e01H6cTFqNObMGO1AK7cQf5)0pIWk7cmc8CCICa(9I)3XQ0iKAw0a3JsSIldCpQz9nme8uJQxXJKXrgM4jORd1fA)GorJeGH8iIvCzG7bMqJVwJCxqTi)N(rcWqEebuMe779q47bKJ99AdR(XN6pcPMfnW9OeqzsC(HidKJZhZQF8P(JAwFddbp1O6v8izCKHjEc66qDH2pOt0at44R1i3fulY)PFeHv2fyK2jcebjwXLbUdoV6r7ebIGeR4Ya3bkoeAvsC96G)ns0GJpcPMfnW9iewcKYpezeNQ7rnRVHHGNAu9kEKmoYWepbDDOUq7h0jAKamKh1Elbs(Epe(ET)uD771axF5hycUwRrUlOwK)t)icRSlWiigyh4mxCOXjXjQNg(S2jcebHqLu(HidKJZyfS4GZREGyGDGZ)hiieQKYpezGCCgRGfloigyh4mxCOXj5hHu5KgHVXrodGkhgK6fDesnlAG7rklzLtoDwzjdlnQz9nme8uJW34ipsghzyINGUouxO9d6ensagYJKzjRC89OZY37idl571aQ8dmH(R1i3fulY)PFeHv2fyeedSdCMlo04K4encPYjnAesnlAG7rklzLtoDwzjdlnQz9nme8uJQxXJKXrgM4jORd1fA)GorJeGH8izwYkhFp6S89oYWsdmHgXAnYDb1I8F6hjad5rT3sGKV3dHVx7pv3JqQzrdCpcHLaP8drgXP6EuZ6Byi4PgvVIhryLDbgnsghzyINGUouxO9d6enWeA31AK7cQf5)0pIWk7cmcIb2boZfhACsm7vupI)sXhYo4Fq6YQYkNmwblolzyPri1SObUhLUSQSYjJvWIZsgwAuZ6Byi4PgvVIhjJJmmXtqxhQl0(bDIgjad5r0LvLvo(EIvbl237idlnWeq7wRrUlOwK)t)icRSlWiigyh4mxCOXjXSxr90WN1orGiieQKYpezGCCgRGfhCE1dedSdC()abHqLu(HidKJZyfSyXbXa7aN5Idnoj)iKkN0i8noYzau5WGuVOJqQzrdCpszjRCYPZklzyPrnRVHHGNAe(gh5rY4idt8e01H6cTFqNOrcWqEKmlzLJVhDw(EhzyjFVgej)atafDTg5UGAr(p9JiSYUaJGyGDGZCXHgNeZEfncPYjnAesnlAG7rklzLtoDwzjdlnQz9nme8uJQxXJKXrgM4jORd1fA)GorJeGH8izwYkhFp6S89oYWs(EnOt(bMaQU1AK7cQf5)0pIWk7cms8xk(q2b)d0IqS07eKLmSupn8zTteiccHkP8drgihNXkyXbNx9aXa7aN)pqqiujLFiYa54mwblwCqmWoWzU4qJtYpcPYjncFJJCgavomi1l6iKAw0a3J0IqS07eKLmS0OM13WqWtncFJJ8izCKHjEc66qDH2pOt0ibyipsFeILENaFVJmSKVxdOYpWeqfTwJCxqTi)N(rewzxGrI)sXhYo4FGweILENGSKHLgHu5KgncPMfnW9iTiel9obzjdlnQz9nme8uJQxXJKXrgM4jORd1fA)GorJeGH8i9riw6Dc89oYWsdmb0gFTg5UGAr(p9JiSYUaJe)LIpKDW)G0LvLvozScwCwYWsJqQzrdCpkDzvzLtgRGfNLmS0OM13WqWtnQEfpsghzyINGUouxO9d6ensagYJOlRkRC89eRcwSV3rgwY3Rbu5hycOhFTg5UGAr(p9JiSYUaJe)LIpKDW)a1zsoRCYTd8Z5Jz1FesnlAG7rQZKCw5KBh4NZhZQ)OM13WqWtnQEfpsghzyINGUouxO9d6ensagYJKDMKZkhFVgf8Z(ETHv)bgyKamKhrwOy99AgE9uG2Y3lXkUmW9aB]] )

    storeDefault( [[SimC Import: ST]], 'actionLists', 20161206.1, [[di0ilaqikkwKuLQnrk1OKK6ussULOs1UqYWeQJbXYifptqMMuL01evyBc03KeJJIs15evkRtQszEIk5EuuTpPkoijSqb8qqkteKQUOqAJGuXjfvTskkLxkQOzcsL2jsnuPQyPcQNsmvkYxLQs7v5Vsmyj1HbwmfEmIjdQlJAZcXNjPrtIonvRwQs8ArA2u62KQDRYVLYWfLLd1ZH00v11fX2bjFNuIXlvvNheRNIsMpPK2Vu5HmttIEadldVatGEociX(lWejJjoW6Mf492nAnbZTjHzldq5rRjgjicsOykKjcb7z)KjkiV3o0zA0iZ0KOhWWYWlWeAGopbAaRTRwb5921vdDD0FIcSk6KdOZM37IRdTU686zn83BD1qd679jkmCR)qMqawBbqEVDfRJ(tYFWob8n8KRD8KWSLbO8O1eJeePcvCO9JwZmnj6bmSm8cmriyp7N8nvvltrAnlCtlhQ2vtu6u6G(ZDIsNIKGX899yoI28XyviuVRZLVv0b93J5Xu5OQjkmCR)qMaWeWXLVHX89tYFWob8n8KRD8KWSLbO8O1eJeePcvCOj0aDEIcmbCCxTPggZ3VF0HMPjrpGHLHxGjcb7z)e(ySkekscgZ3Nl(ySkekDq)Atu6uKemMVpxMJmrHHB9hYe(ySQBw(PwyR3VJNK)GDc4B4jx74jHzldq5rRjgjisfQ4qtOb68KOhJvDZYp1U6OwVFhVF096mnj6bmSm8cmriyp7N8alFpfkJ5ZFiu8bmSmSw1kG8ouCHpw3z0CfCIcd36pKjOp2t5sls5vYfT4hSTHHNK)GDc4B4jx74jHzldq5rRjgjisfQ4qtOb68e5XEk3v3I0v)k5U6(6hSTHH3p6CmttIEadldVatOb68eOJJ(OD1TiD1qNemKjkmCR)qMeXrF0slsjscgYK8hStaFdp5AhpjmBzakpAnXibrQqfhA)OdottIEadldVatec2Z(jaY7qXf(yDNr7bqEhkUa3EkSJ6NAbn5kPojvBy2ijsekSJ6NAbn5kPojLkjBIcSk6eceILlpaRYpQ5ituy4w)Hmb7O(PwqtUsQtsNK)GDc4B4jeielpjmBzakpAnXibrQqfhAcnqNNe2r9tTRwsUU6C6K0U6QrQA)ORmttIEadldVatOb68KWoQFQD1sY1vNtNKorbwfDYefgU1FitWoQFQf0KRK6K0j5pyNa(gEY1oEsy2YauE0AIrcIuHko0(rB2NPjrpGHLHxGj0aDEsFv6yRFQD1qpgO2UU6(KCeLtuy4w)HmrlkDS1p1cmgO2UswYruoj)b7eW3WtU2XtcZwgGYJwtmsqKkuXH2p6CBMMe9agwgEbMieSN9taK3HIl8X6oJ2J5H02mzygQIkbMcnZVZp1cbdoUK6K0jkmCR)qMGM535NAHGbhxsDs6K8hStaFdp5AhpjmBzakpAnXibrQqfhAcnqNNiz(D(P2vdnm44U6C6K09JgjEMMe9agwgEbMieSN9tikDkDq)5orPtrsWy((Eq02mzygQIkbMcNGQ0p1sVaG5Iw8dEIcd36pKj4euL(Pw6famx0IFWtYFWob8n8KRD8KWSLbO8O1eJeePcvCOj0aDEs4euL(P2vB2aWCxDF9dE)OrqMPjrpGHLHxGjcb7z)KQjkDkscgZ33dIw1QrsKiugT0sgUrOsYQsBZKHzOkQeykdlGK2s(sQts1UAy2ijsekDaoT0IuELCHGbhtLKPnG8ouCbU9u6aCAPfP8k5cbdooxaY7qXf(yDNrRAIcSk6eceILlpaRYpQ5ituy4w)HmXWciPTKVK6K0j5pyNa(gEcbcXYtcZwgGYJwtmsqKkuXHMqd05jbSasAl57QZPts7QRgPQ9JgrZmnj6bmSm8cmriyp7NunrPtrsWy((Eq0QwnsIeHYOLwYWncvswvABMmmdvrLatzybK0wYxsDs6efyv0jtuy4w)HmXWciPTKVK6K0j5pyNa(gEY1oEsy2YauE0AIrcIuHko0eAGopjGfqsBjFxDoDs6(rJeAMMe9agwgEbMieSN9t4JXQqOExNlFROd6VhZ1qPjhtuy4w)HmHO0lAbafpj)b7eW3WtU2XtcZwgGYJwtmsqKkuXHMqd05jqtP3v3xau8(rJ0RZ0KOhWWYWlWeHG9SFcFmwfc176C5BfDq)9yUgkn5yIcd36pKjeLEXibJ(tYFWob8n8KRD8KWSLbO8O1eJeePcvCOj0aDEc0u6D1bsWO)(rJKJzAs0dyyz4fyIqWE2pXmzygQIkbM6DvgxYawDTRgMnsIeHshGtlTiLxjxiyWXujzAdiVdfxGBpLoaNwArkVsUqWGJZfG8ouCHpw3z0QMOaRIoHaHy5YdWQ8JAoYefgU1FitExLXLmGvFs(d2jGVHNqGqS8KWSLbO8O1eJeePcvCOj0aDEIjxLXD19by17QRgPQ9Jgj4mnj6bmSm8cmriyp7NyMmmdvrLat9UkJlzaR(efyv0jtuy4w)Hm5DvgxYaw9j5pyNa(gEY1oEsy2YauE0AIrcIuHko0eAGopXKRY4U6(aS67hnsLzAs0dyyz4fycnqNNyYvzCxDFaw9U6QJ7QHMsVQjHzldq5rRjgjisfQ4qtYFWob8n8KRD8efgU1FitExLXLmGvFIqWE2pHO0PijymFV5X73pHgOZtexhAD151ZA4V36Qft73a]] )

    storeDefault( [[SimC Import: CD]], 'actionLists', 20161206.1, [[dWZKgaGEqrAtqPDPOTPuSmkvZMOdRYZucNhK(Mc1Pv1ofP9IA3a7xPAuuiddkgNiGxRe9xQmyqmCL0HeroffQJjQooOKfkkTuqLftrlNupeuupvQhtyDGIyIIOMkLYKHmDjxeu1SeH6YixNK2iOG(mj2mLSDqP(of8vrGMMiK5jk62kySGcmAOA8IGoPsPNtvxdui3tu4CGc1VfoOczoNTXn8GZusiol3jtwNQS4SC3RK4p5dtV6daNAFdmMB4ijDEItTJjFtE(cmZCUBH(xlU5EKO(a4zBCAoBJB4bNPKqCwUBH(xlURqrrstresuya45EK5l)ck3pa2XsYLqvcW9wa6fxfAUbbG4gossNN4u7yY3KpEIzb3P3aX9waSJL0oeyGkbs8oKcN2HKG4Fr7qS9kKMlo1oBJB4bNPKqCwUBH(xlURqrrstresuya45EK5l)ck3MYiqolvnuU3cqV4QqZniae3Wrs68eNAht(M8Xtml4o9giUZkJaTdbgQQHYfNUGTXn8GZusiol3Tq)Rf3vOOiPPicjkma8CpY8LFbLBts7j9YhOW9wa6fxfAUbbG4gossNN4u7yY3KpEIzb3P3aXDws7j9YhOWfNMi2g3WdotjH4SC3c9VwCxHIIKMIiKOWaWJ1OKoD9wNOMkNKCMQAFnjWzkjewcwQ)6kHM4pcra3W5ls7DwH28ric4QqvGJnPvnbBNIanRqvG7clhIUc3yUhPv8ClGkKKRoTcv(mYt8WLqNaQqsU60ku5ZWo3JmF5xq5UcvbUlSCi6kCU3cqV4QqZTaQqsCdhjPZtCQDm5BYhpXSG70BG42wOkW3Hew7qsMUcNlofgX24gEWzkjeNL7wO)1I7kuuK0ueHefgaESgL0PR36e1u5KKZuv7RjbotjHWMebl1FDLqt8hHiGB48fP9oRqB(iebCvOkWnM7rMV8lOCxHQa3fwoeDfo3BbOxCvO5geaIB4ijDEItTJjFt(4jMfCNEde32cvb(oKWAhsY0v47qmk3yU40nSnUHhCMscXz5Uf6FT4UcffjnfrirHbGhRrNUERtutLtsotvTVMe4mLeclbl1FDLqt8hHiGB48fP9oRqB(iebCvOkWXkIqIcdGPV0)sYfwUcNCgEasgA0utd3d8zMayfrirHbW069L3fwolvn0PMgUh4ZmJeHveHefgat97FGIZRcClFXYPMgUh4ZCm2Kw1eSDkc0ScvbUlSCi6kCJ5EKwXZTaQqsU60ku5ZipXdxcDcOcj5QtRqLpd7CpY8LFbL7kuf4UWYHORW5Ela9IRcn3cOcjXnCKKopXP2XKVjF8eZcUtVbIBBHQaFhsyTdjz6k8Digz3yU40XSnUHhCMscXz5Uf6FT4UcffjnfrirHbGhRrNUERtutLtsotvTVMe4mLecBseSu)1vcnXFeIaUHZxK27ScT5JqeWvHQahRicjkmaM(s)ljxy5kCYz4bizOrtnnCpWNzcGveHefgatR3xExy5Su1qNAA4EGpZmsewresuyam1V)bkoVkWT8flNAA4EGpZXgZ9iZx(fuURqvG7clhIUcN7Ta0lUk0CdcaXnCKKopXP2XKVjF8eZcUtVbIBBHQaFhsyTdjz6k8DigTWyU4I70BG4U)byEhY2H1qxWKDiWCYCXma]] )

    storeDefault( [[Brewmaster: Default]], 'actionLists', 20161206.1, [[dWZngaGEisAtKu2ff2gf1(iPQzd18He9CkDyQUnGNjK2jPSxv7wY(bQrbrIHjLghjvCEiPHcrWGHWWjOdbrQtbrOJrQoTslKalfiTyPA5e9qiQEkQLjuToHWeHOmvs0Kvy6IUif5XcUmY1fkVwk8nGyZKqBNe8zi1Fj00GiY8GiQrkevFNKmAHiJNKkDsfPfjfDnHOCpfXbvu)es43G(6x5ztL3X04coR5a0zbssfGBtsgbyeiJu0JHZZiJu0JHZl4mOeMClDT4T6M11J2AOFMdYvyE(8CixyzVYRPFLNnvEhtJl4mhKRW8CcrJgtgBLKugtyApp3x8MOE2kKCPyK8AiAt52GopTgBWtO8Cbl6mOeMClDT4T6M1bXOn6znhGoZcjxcgrK71amcoLBd651IFLNnvEhtJl4mhKRW8CcrJgtgbiepGQkRAifuIYEmfv0OJHWboMnnIjeLOmDjAknYfGetO4yjK8eZTiXZZs02ZLdqtG4HOkxEEUV4nr9SqyUW680ASbpHYZfSOZGsyYT01I3QBwheJ2ON1Ca6msaMlSEETOx5ztL3X049ZCqUcZZPxn2cTAbiepGQkJvclBJTe7ssLrisUenzNeGq8aQQmwjSSn2sSljvgHi5s0KveWvx12kab2cT4WbC0KyuR6Bpp3x8MOEELWY2ylXUKuDEAn2GNq55cw0zqjm5w6AXB1nRdIrB0ZAoaDEQew2gBbgHajP651qsx5ztL3X049ZCqUcZZXSK4GuKk7QazpplrBpxoanPPajPcWTjjJamcKrksLDvGSnpp3x8MOEo4ySOhYfwI41MNNwJn4juEUGfDguctULUw8wDZ6Gy0g9SMdqNrgPiv2vbY(8Ar2vE2u5DmnUGZCqUcZZiD6yQsJo2dnGXsXaeOdnOY7yAOMhYvbsKkcyjR61pplrBpxoanPPajPcWTjjJamco9A4YbyeZOWuZZZ9fVjQNdogl6HCHLiET55P1ydEcLNlyrNbLWKBPRfVv3SoigTrpR5a0zo9A4YbyeZOW0ZRz(kpBQ8oMgxWzoixH550XuLgDShAaJLIbiqhAqL3X0qnpKRcKiveWsw1RFEwI2EUCaAstbssfGBtsgbyeihc0HGrmJctnpp3x8MOEo4ySOhYfwI41MNNwJn4juEUGfDguctULUw8wDZ6Gy0g9SMdqNroeOdbJygfMEEnqUYZMkVJPXfCMdYvyEgPthtvA0XEObmwkgGaDObvEhtd18qUkqIuralzNOFEwI2EUCaAstbssfGBtsgbyeC61WLdWiyLnpp3x8MOEo4ySOhYfwI41MNNwJn4juEUGfDguctULUw8wDZ6Gy0g9SMdqN50RHlhGrWkFEn15kpBQ8oMgxWzoixH550XuLgDShAaJLIbiqhAqL3X0qnpKRcKiveWs2j6NNLOTNlhGM0uGKub42KKragbYHaDiyeSYMNbLWKBPRfVv3SoigTrppTgBWtO8Cbl6SMdqNroeOdbJGvEEUV4nr9CWXyrpKlSeXRnF(8mlKcRJxKQNlSUwCZQZZF]] )

    storeDefault( [[Brewmaster: Defensives]], 'actionLists', 20161206.1, [[dOdkeaGEkj1MOKYUKQTPQY(OKQztXVbUTcwNQQQDkK9cTBL2pPmkbvddughLe9ycdLifdMOgUQCqIWPuvLJjuNNuTqq1sLclgrlxYdPKWtPAzkKNJKjkiAQuIjJutNKlQqDArptvPRlL(jrk9AvfBwGTtKQwLGYNbzAePY3v0ivvv(lcJMsnEPOtseDlbHRrjj3tq6Bejxg1HvzmgTG(49inmnchD)XI8mPvFQeSy0OFwj6r3aJo8INdhLIR)RjhsoGxQu6zk0djhCTgfch9gSHpkgJgbl(xC8xy9y0BWhTULCGrpCnzbayObZT)ARmqpxicYINDH9vqmfXW1utoeAYcaWqdMB)1wzGEUqeKfp7c7RGykIG6eQeSNrt(pn5W0KfaGHgm3(RTYa9CHiilE2lwyFfeJUecvcwk0cgfJwqF8EKgMgHJE0nWOd3CIpAYsBtnz4fprVbB4JIXOrWI)flvh2x0LCPtXPaf6lyz0DrLpf6caWqdMB)1wzGEUqeKfp7c7RGyQqHHUeKPjv6OtAoXhcqtcYINOcJgHwqF8EKgMgHJE0nWOlnTvgONlKMm8INOlbzAsLo6V2kd0ZfIGS4j6wX9ujyrhDjx6uCkqH(cwgDxu5tHo6nydFumgncw8VyP6W(Ikm6lAb9X7rAyAeo6UOYNcD1TFYfYAcaWqdMB)1wzGEUqeKfp7c7RGyQqfaGHgm3(RTYa9CHiilE2f2xbXuedxt0JUbgDjlWs9jxnz4fprxcY0KkD0ZcSuFYLGS4j6nydFumgncw8VyP6W(IUKlDkofOqFblJEd(O1TKdm6HRjlaadnyU9xBLb65crqw8SlSVcIPigUMAYHqtwaagAWC7V2kd0ZfIGS4zxyFfetreuNqLG9mAY)PjhMMSaam0G52FTvgONlebzXZEXc7RGy0DrLpLf9hJUkhyuHrshAb9X7rAyAeo6r3aJ(4Mp2Oj)VRgqVbB4JIXOrWI)flvh2x0LCPtXPaf6lyz0DrLpf628zYfIG6zZf3fG2vz9qJTw428zu2DAoifPY6HsPov)uQt8H4bMCfMuDRkmB(m5crq9S5I7cq7Q(dDjittQ0rNB(ydH9vdOcvO7IkFk0rfIa]] )

    storeDefault( [[Brewmaster: Combo ST]], 'actionLists', 20161206.1, [[dOZSdaGAcQA9eaVuaSls12qP2hbOzt0THQ1razNGAVu7gv7hOgfbudJugNaQdlAOeKAWaz4kQdkiNIGIJHILHswOcwkuAXqSCsEibLwfbvESqphstKGOPkjtgW0L6Ic03KuUmY1bXgjq50kTzjvpJq9zO4ReeMgbjFxa5VkYMiqA0eY8iqCsb1RvORjaDEqALeO6PQ(TeBgx5hKNiscWd(pQ2523hoXj)bffi8eTjLabgKWwWrkGb9kFHKQNqKTh8XsskrjdZsJHndJynDgFSucaTAXjF)qXElCuxzygx5hKNiscWd(Wjo5piZ4ybsdg0B1osGbjWb4cJ)JQDU97us8whrMXXcKEkwWrk6eprKeGGMXElC9rcZekEIksxrja0PEXjbbteq4y0dOpwkbGwT4KVFiKvUnuFezghlq6j0wTJKFyoWgZUO85fo5JLKuIsgMLgdBMA6AI9FuTZDf0zYhDXJUnmlx5hKNiscWd(Wjo5hacdyqhprf5JLKuIsgMLgdBMA6AI9dZb2y2fLpVWj)qiRCBO(JeMju8evK)JQDU9DByXUYpiprKeGh8HtCYFqMXXcKgmO3QDK8XsskrjdZsJHntnDnX(H5aBm7IYNx4KFiKvUnuFezghlq6j0wTJK)JQDU9DByHYv(b5jIKa8G)JQDU99XsskrjdZsJHntnDnX(H5aBm7IYNx4KpCIt(yHGkA5yadsWtacmiHy5a(Hqw52q9vqqfTCmtcFcqtbA5aUnCaDLFqEIijap4)OANBFacbs966JeMju8evKoKzFSKKsuYWS0yyZutxtSFyoWgZUO85fo5dN4K)GIYweyqL6GbjyRI8dHSYTH6JOOSfnvQpvFvKBdZ2v(b5jIKa8GpCIt(vlgsbgKqNsCFSKKsuYWS0yyZutxtSFyoWgZUO85fo5hczLBd1VxmKAAoL4(pQ252N4Kcdu9ieLI4TaQ52T)NP4MYvaYElCdZIDGDBd]] )

    storeDefault( [[Brewmaster: Combo AOE]], 'actionLists', 20161206.1, [[dCdPdaGAcfTEvr5LeQSlvPxlq7tvKMnPUnrTtr2l1UrSFvv)KqWWi43IAOesAWQkdxiheP6yqADQIQfkOLIuwmuwojpuvepvzzq45q1ejKYubPjdy6QCrqCyPEgs66q0gjKQVrK2SQWNfQtl5ReImncj(oHQghHOEmqJgjgpHsNua)fuDncfoprSscHUmQTbkBud1dcPX0mGd9en(rJuFo0l1YSxOIfVCJFS65)FpjlJL))Olcq8OXAUXzNqiGcdfLQWlQ3IyWQ11Z6RYeNqatK9OdEvMGBOoHAOEqinMMbCOxQLzpiInsNbks8)N44ypASMBC2jecOWqL(kq1labOa7lR8izc7rhR01jXJfBKoduKy4b5yVbQQOZZNtimupiKgtZao0l1YSN444)Vj34u8OXAUXzNqiGcdv6RavVaeGcSVSYJKjShDSsxNeVGCmCC5gNI3avv055ZjQgQhesJPzah6LAz27juQ)VqKk8ZJgR5gNDcHakmuPVcu9cqakW(YkpsMWE0XkDDs8aPuWXqQWpVbQQOZZNtIIH6bH0yAgWHEPwM9cvCFu()Yp()e9sXE0yn34StieqHHk9vGQxacqb2xw5rYe2JowPRtIhMI7Jc88d4pkf7nqvfDEamgYhpEdYXWXLBCkViJ85KyyOEqinMMbCO3avv055rJ1CJZoHqafgQ0xbQEbiafyFzLhjtyVulZE0qItPiX)FIydW)FIura8OJv66K4PqItPiXWfZgGHl(Ia4ZjygQhesJPzah6nqvfDEmHvXsEbrQum5EQGhnwZno7ecbuyOsFfO6fGauG9LvEKmH9sTm7bTIz1)NO2Azp6yLUojExfZk4rTw2NtsnupiKgtZao0BGQk688OXAUXzNqiGcdv6RavVaeGcSVSYJKjSxQLzVqDdgmJ8()2PQGShDSsxNepmDdgmJ8GJFQki7ZN3avv055Zga]] )

    storeDefault( [[Brewmaster: Standard ST]], 'actionLists', 20161206.1, [[d0Z7eaGAru16fsQxQiQDjuBdrTpHumBIMVIqhwYZir3wGNdPDQu7LA3qTFvQrjIIHrQgNIipwfdvLqdgcdNuoij1PerLJHKZjKslujwks1Iry5eEOkbpfSmKY6esLjkIKPcrtwHPRQlscNwQlJ66kPnkIOVjeBMKSDHeFxL0xvemnHKmpHu1FfPxRinAf14vj6KIWNf01er48iYkfrQnjIs)wuBkJ0GcCri5HxmKuSQAv(EXWUcydlc(AqH(Si6UraFHhLyCJaqAGol5cL9MMofzkkL6XugGJO1EdguF(oJrnsVPmsdkWfHKhEXWUcydtMdVrabf6Sb6SKlu2BA6uKPIeRR0qc8Op1NfgWzmBaoIw7nyqnrl7NKHPCykAqHo73BAgPbf4IqYdVyaoIw7nmyIvvQINYHPObf6C8Q2eN4GjwvPkgvJpDjthSSJclifVQzGol5cL9MMofzQiX6knKap6t9zHbCgZgut0Y(jzGqW1pNMvLQQfSHDfWgweC9Z3iYQUrKKTG97TsJ0GcCri5HxmahrR9gmqNLCHYEttNImvKyDLgsGh9P(SWaoJzdQjAz)KmqiRZ086NI(IEkByxbSHfzDMMx)BeWl6PSFVJkJ0GcCri5HxmahrR9go5SCKVIJ1wfTksnomLqWxJpZLiKrJ(tolh5R4yTvrRIuJdtje814ZCjcz00G6sdQjAz)Km8Dils1kzGHe4rFQplmGZy2WUcydi7qwCJ4ILmWaDwYfk7nnDkYurI1v637KWinOaxesE4fdWr0AVHVWtBCyYI(vyilIRG8k(JgTvrRIu6ply05SCyqnrl7NKb(snzE04W0PCOHe4rFQplmGZy2WUcydkUutMhno8gXK5qd0zjxOS300PitfjwxPFVjBKguGlcjp8Ib4iAT3Gb6SKlu2BA6uKPIeRR0qc8Op1NfgWzmBqnrl7NKbXk6CJdtt(AWPxB8WWUcyd0xrNBC4nIKUg8nIj04HFVJyKguGlcjp8Ib4iAT3Gb1eTSFsgoZDkXQa9nKap6t9zHbCgZg2vaB4cZ9nILvb6BGol5cL9MMofzQiX6k979KmsdkWfHKhEXaCeT2BWaDwYfk7nnDkYurI1vAibE0N6Zcd4mMnOMOL9tYWzUtVwrHnSRa2WfM7BetOIc737O1inOaxesE4fdWr0AVbd0zjxOS300PitfjwxPHe4rFQplmGZy2GAIw2pjdFhYIuTsgyyxbSbKDilUrCXsgCJizOso)(naA8Plzh113zS30ipj)2a]] )

    storeDefault( [[Brewmaster: Standard AOE]], 'actionLists', 20161206.1, [[dOtheaGAQe16PIWlPsLDPsTnimBknFQK62czDur0of1Ej7gP9Rs(jvKmmk63a9yadLkbdwfnCQQdsbNIkHogOoSKfkulfrwmuTCbpKkLEQYYaPNJWePsKPcftwKPRQlcL(liUmQRdP2ivuCAP2mvX2vHACuj5RuPQPrfL(UkKNHOETky0qY4PsXjPk9zi6AurLZtHwjvKAuurvFJkSGfgnS0c3YjfRLRiwloWhfvephCYRZ9fnvH01PbNcR2acT)RPrITCrWkd1egbmmzZByT5ZaDzBNO(gKQmueUsZaW3GucHrzyHrdlTWTCsXAdi0(VMMb822Vrn2n(wWutrc5aJuZln1a1dg0OGuwlxrSgw34Bbtnf51P7yKAKylxeSYqnHra742KSELHkmAyPfULtkwBaH2)10iXwUiyLHAcJa2XTjznV0udupyqJcsznd4TTFJAhyKqiIkcuA5kI1ChJ86Crfbk9ktwy0WslClNuS2acT)RLyC0E8CFGrcHiQiqDJ231UoX4O945MWNb6YcjX2(yoy8gTVgj2YfbRmutyeWoUnjR5LMAG6bdAuqkRLRiwloW1J66e0Z1PZ0bwZaEB73OgEGRhfeqpq80bwVYoRWOHLw4woPyTbeA)xtJeB5IGvgQjmcyh3MK18stnq9GbnkiL1YveRfBlGdGO)RZ9H(aRzaVT9Bud3wahar)qi(qFG1RSZjmAyPfULtkwBaH2)10iXwUiyLHAcJa2XTjznV0udupyqJcszTCfXAKqtGQPiVoD6kXxNUVPjnd4TTFJAb0eOAksiUCLyih10KELrimAyPfULtkwBaH2)10mG32(nQbGQHGJoq8AEPPgOEWGgfKYAKylxeSYqnHra742KSwUIyn3IQVoJrhiE9k7qy0WslClNuS2acT)RPrITCrWkd1egbSJBtYAEPPgOEWGgfKYA5kI1ClQ(6091XSMb822VrnaunKJQJz9k7kHrdlTWTCsXAdi0(VMgj2YfbRmutyeWoUnjR5LMAG6bdAuqkRLRiwdtJKdxNUqzJUoDEyxuZaEB73O23i5ae)YgPxVMlXEk02xX6La]] )


    storeDefault( [[Windwalker Primary]], 'displays', 20161206.1, [[dStTeaGEIKDHKkBJiAMcfMTGdRQBcqltu62eUMqr7Ku7vA3kz)u(jskdJe)wKZlKgksnyQgochurokrLJHOZruvTqqYsrswSOA5k8qLYtr9yf16eQmrqXub0KfIPd1fvQUkrv5YQCDG2irQpJeBgaBhu9rHs9vHsMgivFxOQrsufpJimAIY4bLoPO4wK0PHCpKu1ZbXAjQsVgKYLSallh4bErmx60cBoJK6QMmBz6bs8JOMlDAHnNrsDvtMTm9aj(ruZ3EcmkTmFcC8LlpUq5TDnWDQklFqoZzIleKo8qK18YmXpJwuQoMLPHVBUQ5WCa8GbCHQmn8DZvnFljYFCZld4dlsakmhisCvlHsz5apWdsbwnzbwEF95HlsHQ80mgLwMhdeeCzgj2mpJGinWXzoX4MtI8hxw)IRmJeBMNrqKg44mNyCZjr(Jlt1fUhYvDwfsjjvuKOmppqe4YyK4OELIRoBbwEF95HlsHQ80mgLwMhdeeCzgj2mpJGinWXzEKdGhmGlRFXvMrInZZiisdCCMh5a4bd4YuDH7HCvNvHussffjkU4Y88arGlxMgoT5QMVLe5pU5LPHtBUQ5WCa8GbCHQC0QvZkPszyRwPmvx4Eix1zviLKKucfQJSSCGh4z(uarzjUfU8C5jqCYCvZb8HfjafvRuMgoT5QMd8huoS5tbczF1KLz0Is4mx1CarlKauuTszQ(fLZ8nz3m0qlkL)CuaHJwEAgJslZ3EcmkTGuOkprTDZvnhWhwKauuTszA47MRAoWFq5WnVmtCHG0HhImZ3sH0Oal)vtwoVAYYuQMS8OAYIlVLiIAoWu5yHwrI)dq7gMprT9Y0WPnx1CG)GYHBEz5apWZCyqJBgJsRYuLj2YdWYWCa8GbCHQSCGh4fX8mZPL5msQRAORuw60cxEhwIXbbs8F0Y7RppCrkuLPhiXpIAEM50YCgj1vn0vktpqIFe18TNaJsRY4Fq5WqkprTDZvnhq0cjafvlrzM4MrFaj1JrPv1zLu(lNzoTGyollf)QAOxg4hUf28ypsGevRuMrlkHZCvZb8Hfjafvtww)IRCSqRiX)bODdZPhiXpIwMg(U5QMd8huoS5tbczF1KLNaXjZvnhq0cjafvRuMg(U5QMVLe5p28PaHSVAYY0WPnx18TKi)XMpfiK9vtwwEtjr1KXSmn8DZvnhMdGhmGnFkqi7RMSmnCAZvnhMdGhmGnFkqi7RMS4wa]] )

    storeDefault( [[Windwalker AOE]], 'displays', 20161206.1, [[d0tYeaGEcLDrQIETQkDyGzkQOVjQuZwWJvvUji68kWTj50i2Pq7vA3kz)u(POkdJu(TiJJufgkbdMQHJKdkkhLq1XqQZjQWcbHLcjwSISCv5HkLNIAzkupxPAIeIPcstMuz6qDrf1vjvjpJO66GAJqsFgcBwHSDi1hfvYxjvvtJq67QQyKKQuRtuvJMOmEiYjvq3IixdI6EKQsxwL1sQk2MQQU0fAzXHp4tN5OMwyZzIyxJ0JllGwWCjZHcEioCNkl8ikWBG5BakmjTmpd(bkx(DHYBZrOZOuwV2pZzQleqna2L1PYcONnxYCOGhId3PYcONnxYCrUra4aUquwa9S5sMVLutaCNkdjajIcwzouI6AuUwzXHp4BVqBKUqlpVatHtxHOC2hMKwMNtYoUmtuBMpurLE48nN6DFj1eaxocuxzMO2mFOIk9W5Bo17(sQjaUmkx4a7xJJ1O)tRPjVm)9iu4YyI60xTIBCCHwEEbMcNUcr5SpmjTmpNKDCzMO2mFOIk9W5BUUBeaoGlhbQRmtuBMpurLE48nx3ncahWLr5chy)ACSg9FAnn5fxCz(7rOWL3jleHRSaAbZLmFlPMa4ovwaTG5sMlYncahWfIYdkQs5g5)I(xUEKJXilh5CR9xRJKef5Yi1OwzuUWb2VghRr)NMwUMEsxwC4d(mplqqSu3cx(RCgmozUK5qcqIOGvnQvw4ruG3aZh(LwMZeXUgfvRmtwicN5sMdjzruWQgLxwaTG5sMlYncahWMNfOKbAKUSa6zZLmxKBeaoGnplqjd0iDzb0cMlz(wsnbWMNfOKbAKUSa6zZLmFlPMayZZcuYansxMPUqa1ayxM5BPq6vOLbnsx(1iDzensxEQr6IlVLOgyo0uz9tw6(be(9EMNL3CzrUra4aUquwC4d(mxeY7(WK0QmkdZLEdTCgmozUK5qswefSQr5Lfh(GpDMp8lTmNjIDnkQwzb0ZMlzouWdXHnplqjd0iD55fykC6keLfqlyUK5qbpeh28SaLmqJ0LzYcr4mxYCibiruWQg1kNL3S5sMdjzruWQgLxgkiClS556LGPAuR8WV0A3Cww6NvJIwolVzZLmhsasefSQrTYcpIc8gy(gGctsRYyWdXH3ll8ikWBG5OMwyZzIyxJ0JlJAAHlpJe1723)bmOCeOUY6NS09di879mplV5Ym19rabIyamjTAC8)CuMPaFKfIgrUS(KsQgPrUC2hMKwMVbOWK0AVqugfWcXz(MS77xYcrzWejqWdkUfa]] )

    storeDefault( [[Brewmaster Primary]], 'displays', 20161206.1, [[dKJqeaGEiv7IkHTrL0mbQQztv3eOCBroSk7KO9kTBv1(P8tQunmr1VvyDIIAOGAWKgovCqH6OOchdINbPSqczPOsTyvXYf8qi5PiltiEoatuinvGmzrHPd1fvLUkQQ4YkDDfTrurFgK2SO02b0hff50OmnQe9DuvgjQQYJbXOrvgpQKtsLYTi4AavopHACOQQwlQQ0RbQYfPGk5oWn4pX9PehZDUzykNJp2uIH(wjsKsWaHnvWuqxa6I7tj4alDbXMI6CWSX304z4kvkS(sOELGE5Ue)aynLCwVNt)bGxFkbd81ubtbDbOlUpLGb(AQGPr3S30JROsWaFnvWuuJ0ZH7tjWoUyPzYuqS0wjA5L43Xivjc4krqcmhCPsWaHnvWuuJ0ZH7tjyGWMkyA0n7n94kQK4kfI4AEPy3FnvWuWoUyPzQY8sCV(9aSvgjhXvee0YDbsjUVp01uu8wiGh7dT09W8mS4sXt8Wubtb74ILMPkZlbhyPli2u3Gm(Msm03kDzEjI9H6xtfmfm2NLMPkZlbde2ubtJUzVPhBAS3H3vjsjyGVMkyA0n7n9ytJ9o8Ukrkbde2ubtrnsph20yVdVRsKsWaHnvWuqxa6Inn27W7QePe5SEpN(daptrn8Jqbv6QePuOsKsqReP0tLifxICwiSZZq)WSXVYiUY)LGb(AQGPOgPNdBAS3H3vjsjoM7CnnklSqWSXVe3ULj(duP4jEyQGPGX(S0mvzEjoM7CZWu3Gm(Msm03kDzEjyGVMkykOlaDXMg7D4DvIu69Fp(nJkQeX(q9RPcMc2XflntvIuc053p20mfgtNkZlf7(RPcMcg7ZsZuLOvYniJpatjEd((vIwjoM7CbuqvIuqLE)3JFZOIkfdbZgFtbFgaCjrHLV0baVHmBA0n7n94sYlTLIUzVPhxI71VhGTYi5iUIKNJwjcsG5GlvCXLGdS0feBkQZbZg)s4laDXakbhyPli2uohFSPed9TsKiLKxAljkS8Loa4nykCGLUG4sCo(4sXb25nvEHWGVsr3S30JROsOgoInf0OKOWYx6aG3GPXU)wICoiSp0kbxjUQmsexaUsXqWSX3uuNdMn(aQOsCm35AASNb9N2pUeKIBb]] )

    storeDefault( [[Brewmaster AOE]], 'displays', 20161206.1, [[dSJveaGEus7sqY2uv1mvc1Sj5Wa3uj65kLBlQNre7Ku7vA3QY(P6NOedtv53Q4XGQHcPbtz4cCqI6OekhdfNtqWcjslfLQfRKwUipeIEkYYeQwhHknrHYubXKvcMouxuP6QeQ4YkUUkTri40OAZcX2bLpQeYNbPPjO67OugPGqFtq0OjKXdHoPGYTi4AQQCEH04eKATeQQxtOkxMcPelWMKceTRLe7o3zb3q48WUrCwNQzIxcnXZGuu3q48WUrCwNQzIxcnXZGuu3qccW8ZZn5BcuQuAuLqURHSZEjXzBCJcgLcbfytuxlHcB3nb3GasqhCxlHcB3nb3InraxfUslHcB3nb3qEYRaCxlTeGipFZUbHNNQL8vs8pNC1m)kHcd1nb3Inraxf2nzvGiq1mLqHH6MGBip5vaURLqHH6MGBXMiGRcxPLIweec5V)H)xsOdH4)K8lKF))AeHW)vsMLD3eCBjarE(MR(Re7JAaBt1X)y(ZWi5lumLe7o3Xnzfh6lppCj4LqHT7MGBip5va2nzvGiq1mLqHH6MGBqajOd2nzvGiq1mLqHH6MGBip5va2nzvGiq1mLyh8GoUHu0ax84pOLaRCfhhTKmCm)8CdjiaZpVTkTeIvhpEO(vIcaW5pOv)RefmkfckWMi3qEuNuHucuntP1QzkbTAMsPQzkUefmW5afNvaMFEvh)FOlH8ee1niNsstdBzWgEsUjZYEjXUZDClgpnWX8ZRe7HTOqesjnipLKMg2YGn8KCtML9sIDN7SGBHb)8CJ4Sovh(xjeopCj5ehOCtdsPdBL2FGv1SqLwcfgQBcUbbKGo4UwcnXZGuu3qccW8ZRegKGo4TsYSS7MGBl5pE(MRwsjXUZD2kKQzkKs7pWQAwOsljdhZpp3wmFdxsAAyld2WtsCDl2ebCv4sAqEkfBIaUkCj2h1a2MQJ)X8N57tsjcEIhGlvCXLcd(5T5gj6W2RAjLGauZd72IsNBq1FLi(dQACtWTLae55BU6VsYx8Xnb3wYF88nxTKsOW2DtWniGe0b7MSkqeOAMsXMiGRcxPLKV4JBcUTeGipFZv)vcnXZGuu3cd(55gXzDQo8Vse)bvnUj42s(JNV5QLucf2UBcUfBIaUkSBYQarGQzkrWt8aCPn(dQAkUf]] )

    storeDefault( [[Brewmaster Defensives]], 'displays', 20161206.1, [[dGtmeaGEOQ2LqkBdQ0mfs1SfCtLWTv0ojAVs7wH9t6NQuAyQKFd4WQAOqzWugov1bfQJsqogOwhbvwivQLcvSyL0YvQhIIEkYYeINtftKqnvGAYOqthvxeixLGsxw01vXgrbxtLIntiBNQ8rQe9mvQ(mi9DHKrsqvpgeJMaJhQYjPs6wO0PHCELOXrLqRLGIxtLGlCbx6wVCh(LDTKqN8KmQgdadUAec)Ss4iLW2O5VxQgdadUAec)Ss4iLW2O5VxQgZ3NJagQfF2FPs7muIjijyq4usyDs1i)meyi8oc6AjY)HGgqR8MsyEGuJvnXPO)e41DjmpqQXQgtG56Z7APfpEO5zQgy0mR8(vjHbayw59RsyEyQXQM4u0FcC1Id(c(kHlH5HPgRAmbMRpVRLW8WuJvnXPO)e41DPLvYgb3Rs4vjlUrI2nLWjd57Kvg5cgxy47xrdUKqN8KQfhqqhZCWlbPeMhi1yvJjWC95Qfh8f8vcxcZdtnw1a)BOjxT4GVGVs4syEyQXQgtG56Zvlo4l4ReUu8TGuJvTfpEO5zw5vPyiCeWqnMVphbmCQ7syEGuJvnW)gAY7AjYpdbgcVJa1ycea2fCPVs4sRvcxcALWL2vcxEjYpHG(ac)NJagvgbxxSeo)aAQgtbjexanGw6xrbeFzjHo5jvtmANq4iGrjCC1Lcp4syEyQXQg4Fdn5DTKqN8KmQMRqagQri8ZkJCtj5pZsU3zuZ3HNB1eNIYHdYlDkbA8RHKX6UedadEP4n6dQj)9giQsyB083lvJ57ZraJsmMI(tGxk(wqQXQ2c0anpZkVxsOtEsNcUs4cUeOXVgsgR7sXq4iGHArh5Wl5ENrnFhEUfo1eNIYHdYlDkj)zwsCkkhoiV0PeoziFNSYixW4cFDDVebzJ85LkV8sUcby4OgjaiQrLWLa)HCWvZLBGJFLxLi0aAivJvTfpEO5zwjCP4dhqnw1wGgO5zw5vjmpqQXQg4Fdn5Qfh8f8vcxsCk6pbEDxk(WbuJvTfpEO5zw5vjSnA(7LQ5keGHAec)SY7xLi0aAivJvTfObAEMvEvcZdKASQjof9NaxT4GVGVs4seKnYNxQ8wa]] )


    Commit( 'initializeClassModule', MonkInit )
    Hekili:ReInitialize()

end
