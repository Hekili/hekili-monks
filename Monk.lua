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

local setArtifact = Retrieve( 'setArtifact' )
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
        addTalent( 'mystic_vitality', 237076 )
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
        addAura( 'dampen_harm', 122278, 'duration', 10 )
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
        addAura( 'master_of_combinations', 238095, 'duration', 6 )
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
        addAura( 'thunderfist', 242387, 'duration', 30, 'max_stack', 99 )
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

        setArtifact( 'fists_of_the_heavens' )
        setArtifact( 'fu_zan_the_wanderers_companion' )

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
            state.spinning_crane_kick.count = nil
            state.healing_sphere.count = nil
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
                    t[ k ] = max( GetSpellCount( state.action.spinning_crane_kick.id ), state.active_dot.mark_of_the_crane )
                    return t[ k ]
                end
            end } )

        state.healing_sphere = setmetatable( {}, {
            __index = function( t, k, v )
                if k == 'count' then
                    t[ k ] = GetSpellCount( state.action.expel_harm.id )
                    return t[ k ]
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

        addSetting( 'elixir_energy', 20, {
            name = "Windwalker: Energizing Elixir Energy Deficit",
            type = "range",
            min = 0,
            max = 100,
            step = 1,
            desc = "Specify the amount of |cFFFF0000missing|r energy that must be missing before Energizing Elixir will be used.  The default is |cFFFFD10020|r.  If set to zero, Energizing Elixir " ..
                "can be used regardless of how much energy you have.",
            width = "full"
        } )


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

        addMetaFunction( 'state', 'ee_maximum', function()
            return state.energy.max * ( 100 - state.settings.elixir_energy ) / 100
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

        addCastExclusion( 123986 )


        addAbility( 'chi_wave', {
            id = 115098,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 15,
            known = function () return PTR or talent.chi_wave.enabled end
        } )

        addHandler( 'chi_wave', function ()
            if talent.hit_combo.enabled then
                if prev_gcd.chi_wave then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )

        addCastExclusion( 115098 )


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
            applyBuff( 'dampen_harm', 10 )
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
            velocity = 60
        } )


        addAbility( 'energizing_elixir', {
            id = 115288,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 60,
            known = function () return talent.energizing_elixir.enabled end,
            usable = function () return energy.current < ee_maximum end,
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
            elseif equipped.katsuos_eclipse then return max( 0, x - 1 ) end
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
            if artifact.quick_sip.enabled then
                stagger.amount = stagger.amount * 0.95
                stagger.tick = stagger.tick * 0.95
            end
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
            cycle = 'keg_smash',
            velocity = 30
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
            if artifact.quick_sip.enabled then
                applyBuff( 'ironskin_brew', buff.ironskin_brew.remains + 1 )
            end
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

        modifyAbility( 'serenity', 'cooldown', function( x )
            if artifact.split_personality.enabled then
                return x - ( artifact.split_personality.rank * 3 )
            end

            return x
        end )

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

        registerInterrupt( 'spear_hand_strike' )


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

        modifyAbility( 'storm_earth_and_fire', 'cooldown', function( x )
            if artifact.split_personality.enabled then
                return x - ( artifact.split_personality.rank * 3 )
            end

            return x
        end )

        modifyAbility( 'storm_earth_and_fire', 'recharge', function( x )
            if artifact.split_personality.enabled then
                return x - ( artifact.split_personality.rank * 3 )
            end

            return x
        end )

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
            active_dot.strike_of_the_windlord = active_enemies
            if artifact.thunderfist.enabled then
                applyBuff( 'thunderfist', 30, active_enemies )
            end
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
            ready = 50,
            cast = 0,
            gcdType = 'melee',
            cooldown = 0,
            cycle = 'mark_of_the_crane'
        } )

        modifyAbility( 'tiger_palm', 'ready', function( x )
            if spec.brewmaster then return settings.tp_energy end
            return 50
        end )

        modifyAbility( 'tiger_palm', 'spend', function( x )
            if spec.brewmaster then return 25 end
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
            if equipped.hidden_masters_forbidden_touch and cooldown.touch_of_death.remains == 0 and buff.hidden_masters_forbidden_touch.down then
                return 0
            end
            return x
        end )

        addHandler( 'touch_of_death', function ()
            if equipped.hidden_masters_forbidden_touch and buff.hidden_masters_forbidden_touch.down then
                applyBuff( 'hidden_masters_forbidden_touch', 5 )
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


    storeDefault( [[Brewmaster: Default]], 'actionLists', 20170329.1, [[dWZngaGEis1MiPSls1Rfk7JsIzd18HO8Ck(MuQBd4WuTtszVQ2TK9du)eIQHPGXrjPZdjnuiImyimCc6Gk0PGiQJrPoTslKalfiwSuTCIEiKONIAzcX6OKAIqctLKmzfnDrxKs8ybxg56sHFdABcPntcTDsWNHu)LqtdIuMhebJeIqFNenAsQA8KuPtcKEMq11GiX9KswKu0HiPIrbrsF7R6SLY7yAEbN1Ca6SajPeWnjjTgmcuqk6nW5zuqk6nW5fCgectUHUwKb72dXJyvD7ZCqUcZZNhd5clZvDn7R6SLY7yAEbN5GCfMNtiA0ysFRKKYgctZ5X(I3e1ZgHKlfvVxtrtk3y0zqR5g8ekpxWIodcHj3qxlYGDu726dXpR5a0zwi5sWiqIEnbJGt5gJEETix1zlL3X08coZb5kmpNq0OXKEacXtOYYOgsfziR3qrf17yiCIBys9gcrgYsxIMs9CbiXekoxcj0k6as(8OeT5C5auliEkQ0LNh7lEtupleMlSodAn3GNq55cw0zqim5g6ArgSJA3wFi(znhGoJKG5cRNxl(vD2s5DmnF)mhKRW8C6vSTqRwacXtOYsFLWYeBlXUKuQhuVlrtMwbiepHkl9vcltSTe7ssPEq9UenzebC1vTTcqGTqloDahnjg3yLHZJ9fVjQNxjSmX2sSljLNbTMBWtO8Cbl6mieMCdDTid2rTBRpe)SMdqNbvcltSTaJqGKu(8AiTR6SLY7yA((zoixH55ggsCsksLzvGmNhLOnNlhGA1uGKuc4MKKwdgbkifPYSkqMMNh7lEtuphCmw0d5clr8AYZGwZn4juEUGfDgectUHUwKb7O2T1hIFwZbOZOGuKkZQazEEnKYvD2s5DmnVGZCqUcZZQt6yQs9o2dXGnsXaeOd1PY7yAQMhYvbsKkcyjJvSppkrBoxoa1QPajPeWnjjTgmco9A6YjyeJi3sZZJ9fVjQNdogl6HCHLiEn5zqR5g8ekpxWIodcHj3qxlYGDu726dXpR5a0zo9A6YjyeJi3YZRf9QoBP8oMMxWzoixH550XuL6DShIbBKIbiqhQtL3X0unpKRcKiveWsgRyFEuI2CUCaQvtbssjGBssAnyeOec0HGrmIClnpp2x8MOEo4ySOhYfwI41KNbTMBWtO8Cbl6mieMCdDTid2rTBRpe)SMdqNrjeOdbJye5wEET2x1zlL3X08coZb5kmpRoPJPk17yped2ifdqGouNkVJPPAEixfirQiGLmTSppkrBoxoa1QPajPeWnjjTgmco9A6YjyeSQMNh7lEtuphCmw0d5clr8AYZGwZn4juEUGfDgectUHUwKb7O2T1hIFwZbOZC610LtWiyvpVMvVQZwkVJP5fCMdYvyEoDmvPEh7HyWgPyac0H6u5DmnvZd5QajsfbSKPL95rjAZ5YbOwnfijLaUjjP1GrGsiqhcgbRQ5zqim5g6ArgSJA3wFi(zqR5g8ekpxWIoR5a0zucb6qWiyvNh7lEtuphCmw0d5clr8AYNppZcPW64fP75cRRfjQvF(d]] )

    storeDefault( [[Brewmaster: Defensives]], 'actionLists', 20170329.1, [[dOtveaGEbO2esLSlL8Asf7taz2u65iCBP0HvStPyVGDRY(POrHuXWGsJta1Yekdva0GPWWvLdsioLqvhtP68eSqKYsjulgQwUKhka8uQEmrRJuPmrbstLu1KvvtNKlcfDArxg11fYpjvIvjuzZcA7Kkvpdk8zennsL03LQrka5Viz0KY4vkojsv3sG4AivQ7jqTncPVPu63qg2b9GJ5n4w(d0aVzAzWPvCVDiuCPBMgbLd5Ji1DMaCxw5tbo4bLdNiRcObUy2YdbdnXWUVflgXc8AhCX88f0NTm40X0qIq2pQFRxuLHc5rsHxCFj1MIKjOANnMgbX0qIq2pQFRxuLHc5rsHxCFj1MIKjOcRrQs0nwtJ4nnIZ0qIq2pQFRxuLHc5rsHxCFvSuBksgCrKQeDeGEOzh0doM3GB5pqd8MPLbNMDK6yAOlBmnOvChCXSLhcgAIHDx09TlSyao93pLJcvGFOJb3Lv(uGlri7h1V1lQYqH8iPWlUVKAtrYebJfCrWtBQeah3osDOqBOWlUdkOjgOhCmVb3YFGg4bW8uj6ah8MPLbpaJQmuipstdAf3bxmB5HGHMyy3fDF7clgG314tmpFbWNifcC6VFkhfQa)qhdUi4PnvcG)IQmuipsk8I7G7YkFkWbf0GbOhCmVb3YFGg4USYNcCjcz)O(TErvgkKhjfEX9LuBksMiyjcz)O(TErvgkKhjfEX9LuBksMGQD2aUi4PnvcGNf6i0jpk8I7Gt)9t5Oqf4h6yWDzLpLEHhdUkBzWBMwgC6l0rOtEMg0kUdUy2YdbdnXWUl6(2fwmaxmpFb9zldoDmnKiK9J636fvzOqEKu4f3xsTPizcQ2zJPrqmnKiK9J636fvzOqEKu4f3xsTPizcQWAKQeDJ10iEtJ4mnKiK9J636fvzOqEKu4f3xfl1MIKbVRXNyE(cGtiR8Paf0ORGEWX8gCl)bAG3mTm4yU5XwtJaAQwWfbpTPsaCEZJTuAt1cExJpX88faFIuiWP)(PCuOc8dDm4USYNcCnES5rsr804Ixsu0PcuW70fD04XQ0wFomLPkqbtOg1AuQrQd1d15kUTl6oonES5rsr804Ixsu0PIhCXSLhcgAIHDx09TlSyakqbU)yzo2mGhvIoOjMObguaa]] )

    storeDefault( [[Brewmaster: Combo ST]], 'actionLists', 20170329.1, [[dOZSdaGAcuTEuP0lji2LaBJq2hQenBsUnu9yj2je7LA3OSFGmkcqdJu9BHoSOHIkHbdIHROoiP0PiaogQ6YilublfkwmKworpKaYtvTmuX6iGAIeOmvjzYaMUuxuqTkuj5zeQRdsBevQ60kTzjLVjiFNG0xrLIPrG08qLuphu)vHgnPyteioPKQpdLUgbvNhOwjQuzCeuETIS5DLFywIQiap4JK4K)GKekEc3KuGbbrGI4OrqqEL)NPYMQLBZEJmJWrKW8fmQwcv1EWhdPOeMmchD(q6I5iSaEFmucaUAXjFFTLEJmyxzeEx5hMLOkcWd(ijo5pOYYueAdcYB5orGGiGc5cG)lYDU97urSoavLLPi0ESeXrJbelrveGGKLEJSGjc7imEcRjqsja4XEXjUgBbGR4deUpgkbaxT4KVVw0vTnyFuvwMIq7r4wUtKFDgWwYok9zrg5JHuuctgHJoVi(qb6I9FrUZDf4zYhEXlUnchx5hMLOkcWd(ijo5lecliihpH14JHuuctgHJoVi(qb6I9RZa2s2rPplYiFTORABW(te2ry8ewJ)lYDU9DBeXUYpmlrveGh8rsCYFqLLPi0geK3YDI8XqkkHjJWrNxeFOaDX(1zaBj7O0NfzKVw0vTnyFuvwMIq7r4wUtK)lYDU9DBeb1v(HzjQIa8G)lYDU99XqkkHjJWrNxeFOaDX(1zaBj7O0NfzKpsIt(yGcRzzybbH7saceeUzza(Arx12G9LqH1SmSJcEcqJcDzaUnIWDLFywIQiap4)ICNBFacfATAbte2ry8ewta0zFmKIsyYiC05fXhkqxSFDgWwYok9zrg5JK4K)GKYwdiiXAGGW9RK81IUQTb7JkPS1mgRnwBLKBJiYv(HzjQIa8GpsIt(vlwscccxKkCFmKIsyYiC05fXhkqxSFDgWwYok9zrg5RfDvBd2VxSKCCov4(Vi352NyKel4GcuPKynxQ72T)lYDU9DBd]] )

    storeDefault( [[Brewmaster: Combo AOE]], 'actionLists', 20170329.1, [[dCdPdaGAIGwVqjVKiQDbKxlG9juQztYTjQDkQ9sTBO2Vc9tcIggH(TidLGkdwrgUqoiICmKADeewOGwkcTyiwoPEirKNQAzkQNdPjsqvtfbtgW0v6Ia1HL6YOUoOSrIaJtOOnlu9zfCAjFLGIPrqQVlu4XG8mKy0iQXte6Kc0FbvxJGsNNiTscs(gb2gsAtBc(GXnIIbCOVWZXByQ1H(5wM9d1CmKB0L1cX4KKsYiPXjscjyFISIBu25zrAbIuMJjiA)hXqvRQy1BLWoptnM(KG2kHrnbNPnbFW4grXao0p3YSpyjgPsafEyCsY8GprwXnk78SinvAbGeP4heduq9M0(4eM9jHuQAL6ZsmsLak8a8a8G)H0v06715ztWhmUrumGd9ZTm7lzEyC6YnkzFISIBu25zrAQ0cajsXpigOG6nP9Xjm7tcPu1k1papahvUrj7FiDfT(EDMIj4dg3ikgWH(5wM9Le5ACkeMgD9jYkUrzNNfPPslaKif)GyGcQ3K2hNWSpjKsvRuFiYfCeyA01)q6kA996SqBc(GXnIIbCOFULz)qn3l5XPu8XjjO0SprwXnk78SinvAbGeP4heduq9M0(4eM9jHuQAL6JO5EjdpfhE8sZ(hsxrRpaJalECqb4b4OYnkzqWI86SWAc(GXnIIbCO)H0v067tKvCJYoplstLwairk(bXafuVjTpoHz)ClZ(eHHsUWdJtcvdWJtctHb8jHuQAL6RHHsUWdWLWgGHhJcd41zQMGpyCJOyah6FiDfT(mM1dsbbbtRz8gBrFISIBu25zrAQ0cajsXpigOG6nP9Xjm7NBz2NqnW6XjHRvY(KqkvTs93AG1WJALSxNfyc(GXnIIbCO)H0v067tKvCJYoplstLwairk(bXafuVjTpoHz)ClZ(HQgkqc2oo9vxbyFsiLQwP(iQgkqc2chD1va2Rx)dPRO13Rn]] )

    storeDefault( [[Brewmaster: Standard ST]], 'actionLists', 20170329.1, [[d0Z7eaGAfbTEsL0lve1UeQTHuTpsLQztY8vj4BeXHLCBH8BrTtLAVu7gQ9drJsevnmbghPIUmQHQiYGHWWjLdsQ6uIi1XqY5erYcvILsKwmIwoHhQsONcwgcEoKMOikMQk1Kvy6Q6IevNwQNHuUUIAJIO0JvXMjkBNuHVRs6RkcnnreMNIaVwrADKkLrRKgVkrNue(SGUMiIopcTssLytIOYFfPnLVnihxKkE4fdjdlRMvVxmSRi2WIGVgvOpl0nKiGVWJsmqIaUniLvCHYEtiGssanc6mMYaCeT2BWG(Z3zmQV9MY3gKJlsfp8IHDfXgMmhIebevORgKYkUqzVjeqrNssCandjWJ(uFwyaNXSb4iAT3Gb9KTQFIgMYHPOrf6QFVj4BdYXfPIhEXaCeT2ByWKZYKfpLdtrJk014zTlCHbtoltwmQgF6sLoyvRdwqmEwZGuwXfk7nHak6usIdOzibE0N6Zcd4mMnONSv9t0aPGRFnnllvwlyd7kInSi46xrIildjIKTfSFVP5BdYXfPIhEXaCeT2BWGuwXfk7nHak6usIdOzibE0N6Zcd4mMnONSv9t0aPQotZZFk6l6PSHDfXgwu1zAE(rIaErpL97Ds4BdYXfPIhEXaCeT2B4KZQr(kowBw0Yi24WusbFn(SwIqgDco5SAKVIJ1MfTmInomLuWxJpRLiKrtJQlnONSv9t0W3HSivRurgsGh9P(SWaoJzd7kInC3HSajIjvQidszfxOS3ecOOtjjoGMFVtsFBqoUiv8WlgGJO1EdFHN24WKd9RWqwexr5z8R7AZIwgX0FvWORz1WGEYw1prd8LAQ8OXHPt5qdjWJ(uFwyaNXSHDfXgKFPMkpACisetMdniLvCHYEtiGIoLK4aA(9MUVnihxKkE4fdWr0AVbdszfxOS3ecOOtjjoGMHe4rFQplmGZy2GEYw1prdIz01ghMoH1GtV24HHDfXgKoJU24qKi0LAWirmXgp87TeFBqoUiv8WlgGJO1Edg0t2Q(jA4S2PKZc03qc8Op1NfgWzmByxrSHlU2irSmlqFdszfxOS3ecOOtjjoGMFV1PVnihxKkE4fdWr0AVbdszfxOS3ecOOtjjoGMHe4rFQplmGZy2GEYw1prdN1o9APd2WUIydxCTrIyILoy)ENu(2GCCrQ4HxmahrR9gmiLvCHYEtiGIoLK4aAgsGh9P(SWaoJzd6jBv)en8Dils1kvKHDfXgU7qwGeXKkvesejpvs73VbqJpDPADT(oJ9MaDD63g]] )

    storeDefault( [[Brewmaster: Standard AOE]], 'actionLists', 20170329.1, [[dOtheaGAssA9eI8sssTlvY2qkZMO5tsXTfY6ie1of1EP2nI9RIgfjHggj(nqpgKHssKbRsnCs1bHQofjrDmKCyjluOwks1IH0Yf8qsk9uLLbONdLjssIPcvMSitxvxecFJaxg11HOnsiLtl1MjL2UkupJG(kjvMgHu9DcHxRc(laJgugpjvDssXNbvxJKGZtOwjHKgNkKFsiXMY48qqkujNCSxUIyV4alIOc75GiFEVViPkKoVXlki8guO1Fpp6SKlm2zGkucuec8OlkVPZqDjBrQ(gK4mqAh5Hh6BqcMX5mLX5HGuOso5yVbfA93ZdpAl7xShREDjyQjWbCGH7PHKAO6bdEeqc7LRi2dH61LGPMa)8w1mCp6SKlm2zGku0OeCPi0VZanopeKcvYjh7nOqR)EE0zjxySZavOOrj4srONgsQHQhm4rajShE0w2VyVdmCayrfgmVCfXEQMHFEVOcdMFNfACEiifQKto2BqHw)9smksTAVoWWbGfvyWUqQRg1KyuKA1EHPZqDjbKyzFmheFHu3Jol5cJDgOcfnkbxkc90qsnu9GbpciH9Yve7fh46HDEdQ98w06a7HhTL9l2dnW1ddaOwaA7a73zr348qqkujNCS3GcT(75rNLCHXoduHIgLGlfHEAiPgQEWGhbKWE5kI9ILf0bqK)59(qFG9WJ2Y(f7HklOdGiFayFOpW(DwfmopeKcvYjh7nOqR)EE0zjxySZavOOrj4srONgsQHQhm4rajSxUIyp6iXG1e4N3IAL4ZB11KKhE0w2VyVasmynboavTsmar0KKFNPzCEiifQKto2BqHw)98WJ2Y(f7bbRbGImG9EAiPgQEWGhbKWE0zjxySZavOOrj4srOxUIyp1cRpVJrgWE)olW48qqkujNCS3GcT(75rNLCHXoduHIgLGlfHEAiPgQEWGhbKWE5kI9ulS(8wD1XShE0w2VypiynaruhZ(D(iJZdbPqLCYXEdk06VNhDwYfg7mqfkAucUue6PHKAO6bdEeqc7LRi2dxdNdN3QujJoVvrkv2dpAl7xS33W5aa9sg53VNQWAlKY3X(Tb]] )

    storeDefault( [[SimC Windwalker: default]], 'actionLists', 20170329.1, [[d8dNiaWCjwpPuytkL2fGTHGAFKsPzsjvhwLzJY8rLUPsX3ib3gKZJQANczVe7wX(PuJcummsX4qq40snusPOblWWfQdsjofO0XquhNuQSqsulvsyXKQLJ0IqfpLQLjjTosOjsjrtfbMmftx0ffepwjxg66sQ)c0Vv1MjPTtI8De5RKsMgPu18eKgjcIEgLKgnO6Zi0jLeDikPCneKUNG6HOkNJscVwPAHSqG4HmNodnIYIhDqO4EdXZoqREmKo2osv0oWGQxnlf3kr1RMLIYIxbYWRGsuvnKvqJvRsiailUVODCkU4wwz)triqIileiEiZPZqJOS4rhekUhJh1oGqEJXoWtAVJI7lAhNINprImeONeP064SSfM8OeXeWG61QQaRRK9qeOogwX5bhx7BELqiCsrx8kqgEfuIQQHScK1iELJPxx(uXNFqXTO3So5lEjgpki8BmGLK27O4BEt0bHIlPevviq8qMtNHgrzX9fTJtXZNirgce)z)tzlm61QQafKItN8bQJ5YvVwvfOKpfcepAch8gdOAtrG6yUCHXA5XWjbkifNo5dGZPZqZ2K2ZoMaX0FbCeBwN8bQJHLlx9AvvaD2)gwDjbQJ5YnpkrmbYgcbZh00yOHjSgyf3IEZ6KV4XF2)iELJPxx(uXNFqXJoiuCT5N9pIBHsSi(CqyyoX0N9dr0ag)KqkhXRaz4vqjQQgYkqwJ48GJR9nVsieoPOl(M3eDqO4CIPp7hIObm(jHuoskrwviq8qMtNHgrzXJoiuCc(6fC7Gx1oWkXlHlUVODCkE(ejYqG1)mZtAkBHjpkrmbYgcbZh00yOHTcyfNhCCTV5vcHWjfDXRaz4vqjQQgYkqwJ4voMED5tfF(bf3IEZ6KV45xVGd(QGg8s4IV5nrhekUKsK2leiEiZPZqJOS4(I2XP4WKhdNeOGuC6KpaoNodnBx)ZmpPbOGuC6KpafHUEkHgwdSC5QxRQcuqkoDYhOowCl6nRt(IVogd8wz)diRlP4voMED5tfF(bfp6GqX5DmMDGLv2)yhy9UKIBHsSi(CqyyoEdXZoqREmKo2osv0oOGuC6KphXRaz4vqjQQgYkqwJ48GJR9nVsieoPOl(M3eDqO4C8gINDGw9yiDSDKQODqbP40jFoskreQqG4HmNodnIYI7lAhNIBT8y4KafKItN8bW50zOzlQD1DCmAam0E27Hii8NoGRxjKUfgyw)ZmpPbqTlzb8vbvRP8bOi01tj0WK3UG3aRAkfNuBdBvy5YvVwvfOKpfcepAch8gdOAtrG6yUCx)ZmpPbOKpfcepAch8gdOAtrGf8JselHRYLBEuIycKnecMpOPXqdxLq5YD9pZ8KgG8RxWbFvqdEjCakcD9u02WeccfwXTO3So5l(6ymWBL9pGSUKIx5y61Lpv85hu8OdcfN3Xy2bwwz)JDG17sAhadzyf3cLyr85GWWC8gINDGw9yiDSDKQODqbv5iEfidVckrv1qwbYAeNhCCTV5vcHWjfDX38MOdcfNJ3q8Sd0QhdPJTJufTdkOkhjLicleiEiZPZqJOS4(I2XP4wlpgojqbP40jFaCoDgA2Anu7Q74y0ayO9S3drq4pDaxVsiDlmWC0SvVvcusAVJGVkychbj1JH9udaoNodnBx)ZmpPbOK0EhbFvWeocsQhd7PgakcD9ucnmzTF76FM5jnaQDjlGVkOAnLpafHUEkHgMWBx)ZmpPbG2LEicwQhW9ETdqrORNsOHjmSC5QxRQcuYNcbIhnHdEJbuTPiqDmSIBrVzDYx81XyG3k7FazDjfVYX0RlFQ4ZpO4rhekoVJXSdSSY(h7aR3L0oaMQWkUfkXI4ZbHH54nep7aT6Xq6y7ivr7GcQYr8kqgEfuIQQHScK1iop44AFZRecHtk6IV5nrhekohVH4zhOvpgshBhPkAhuqvoskrkieiEiZPZqJOS4vGm8kOevvdzfiRr8OdcfN3Xy2bwwz)JDG17sAhaJvHvCluIfXNdcdZXBiE2bA1JH0X2rQI2bobCe3IEZ6KV4RJXaVv2)aY6skELJPxx(uXNFqX5bhx7BELqiCsrx8nVj6GqX54nep7aT6Xq6y7ivr7aNaoskP4EmU6J1AJl7FKOQe2kKue]] )

    storeDefault( [[SimC Windwalker: precombat]], 'actionLists', 20170329.1, [[b4vmErLxtvKBHjgBLrMxc51uofwBL51utLwBd5hyxLMBKDxySTwzYPJFGbNCLn2BTjwy051uevMzHvhB05LqEnLuLXwzHnxzE5KmWeZnWmJm44smEn1uJjxAWrNxt51ubngDP9MBZ5fvE5umErLxtvKBHjgBLrMxc51utnMCPbhDEnfDVD2zSvMlW9gDP9MBZ51ubjwASLgD551uW9gDP9MBEnvsUrwAJfgDVjNxt52BUvMxt5uyTvMxtb1B0L2BU51ubj3zZ51uUfwBL1JiWj3BS9MBNvgzFb3B3vMCI41usvgBLf2CL5LtYatm3edmEn1qOv2yR10B2vwBL5gDEjMxt10BK5uyTvMxtjcCY9gBV52zLr2xW92DLjNiErNx051utbxzJLwySLMEHrxAV5MxojJn54fDE5f]] )

    storeDefault( [[SimC Windwalker: sef]], 'actionLists', 20170329.1, [[diu3iaqiQuzrIu2Kc1Oqv5uKiZse6wOuk7IKggK6ykyzKspJkLMgjQ4AuPQTrLcFdsmorQCorQY6qvyEKOCpuQ2NiOdkIwie6HKIjIsjxuHSrukojQsVeLs1mPsr3Ke2jQmusuPLcj9uIPks(kQI2RQ)QObtjhwQftQESqtwuxgzZuXNrjJMsDAOEnfmBQ62c2Ts)g0WPswoWZrX0LCDiA7OQ67qW4fbopfA9IuvZNevTFk6p8uxgTTUNYhXlCDGUi4GgtlEI3mcT3ab4HPfd5CHTiNgPVoIxqL8uZqNtl6buq7wTPtD4Iebyx1LljJfgUmp15gEQlJ2w3t5J4fUoqxsHzratlLB7dxKia7QUqlbyzunIeaOTyNwcWYOAOtW4OnwnIeaOTu2Wfn2u0Gci)uG266xqL8uZqNtl6bugqFH3nJJDbbxw4sxsQJ94Y4LcZIatxTpCrbmZ1b6YRZP9PUmABDpLpIx46aDjji2lzALcca0wxKia7QUuqwS8KAec9ziclZy(I2y1qNa2w0gRgrca0wjK9HX0sawgvlCGMfCg6eKq2rR6ELUOXMIgua5Nc0wx)cQKNAg6CArpGYa6l8UzCSli4Ycx6ssDShxgV0GyV0SGaaT1ffWmxhOlVoNBFQlJ2w3t5J4fujp1m050IEaLb0x46aDrt79MwjJfgUMwUjMPUKeWI5Y2bI90eCqJPfpXBgH2BGa8W0sdBL2LK6ypUmEj2E)SJfgUtpMPUW7MXXUGGllCPlASPObfq(PaT11VOaM56aDjnbh0yAXt8MrO9giapmT0WwP96CkNN6YOT19u(iEHRd0fPGGqIMwJAqzNOPvVztl2Gb0fjcWUQlfKflpPgHqFgIWYmMp3PJ0XrLPGGWKAqzp7npDWasfPRX8fHqFgIWQwqKr7j0zMPUSvbuOXlJYypDkVYhHqFgIWQwqKr7j0zMPUSvbuOXltctN7vsPlASPObfq(PaT11VGk5PMHoNw0dOmG(cVBgh7ccUSWLUKuh7XLXlmfeeMudk7zV5PdgqxuaZCDGU86CU)PUmABDpLpIx46aDrkiiKOP1Ogu2jAA1B20InyazAX3GsxKia7QUuqwS8KAec9ziclZy(CNoshhvMccctQbL9S380bdivKUghHqFgIWQYuqqysnOSN9MNoyaPgTBalIHDTkDrJnfnOaYpfOTU(fujp1m050IEaLb0x4DZ4yxqWLfU0LK6ypUmEHPGGWKAqzp7npDWa6IcyMRd0LxNZnEQlJ2w3t5J4fUoqxKcccjAAnQbLDIMw9MnTydgqMw8PvPlseGDvxkilwEsncH(meHLzmFUthPJJktbbHj1GYE2BE6GbKksxJRgWIk1chOzbNzmPm216ELUOXMIgua5Nc0wx)cQKNAg6CArpGYa6l8UzCSli4Ycx6ssDShxgVWuqqysnOSN9MNoyaDrbmZ1b6YRZHYtDz026EkFeVW1b6IuqqirtRrnOSt00Q3SPfBWaY0Ip3Q0fjcWUQlfKflpPgHqFgIWYmMp3PJ0XrLPGGWKAqzp7npDWasfPRXri0NHiSQoyMIzcDMoibgvbuOXlJYyFyC0gRgrca0wjKD3Q0fn2u0Gci)uG266xqL8uZqNtl6bugqFH3nJJDbbxw4sxsQJ94Y4fMccctQbL9S380bdOlkGzUoqxEDU09uxgTTUNYhXlCDGUWgmtXyAbDmTydsGXlseGDvx0r64OYuqqysnOSN9MNoyaPI01fn2u0Gci)uG266xqL8uZqNtl6bugqFH3nJJDbbxw4sxsQJ94Y4fhmtXmHothKaJxuaZCDGU86CP3tDz026EkFeVW1b6cQyg8YY0sqUMwSDC0WfjcWUQl6iDCuzkiimPgu2ZEZthmGur6AC0gRgrca0wSRDmTeGLr1isaG2sz0sawgvdDcUOXMIgua5Nc0wx)cQKNAg6CArpGYa6l8UzCSli4Ycx6ssDShxgVaWm4L1Kb5onGJgUOaM56aD515gq)uxgTTUNYhXlOsEQzOZPf9akdOVW1b6IM27nTsglmCnTCtmtzAX3GsxscyXCz7aXEAcoOX0IN4nJq7nqaEyAjPs7ssDShxgVeBVF2Xcd3PhZux4DZ4yxqWLfU0fn2u0Gci)uG266xuaZCDGUKMGdAmT4jEZi0EdeGhMwsQ0E96I4II42Jt)UWW9CADJ071p]] )

    storeDefault( [[SimC Windwalker: serenity]], 'actionLists', 20170329.1, [[d8dzhaGAIuA9OuHxQuPDbfTnIe2hkv1mrPkDyvnBkToQs5MqPdrQW3uOoVk1ovXEf7wY(PQgfrIgMszCKkYPL6zqbdwbdhLCqs0PisXXi05isYcjHLsvSyIA5u5HQKNcwgPQNRKjsvQMkj1Kv00HCrLQEmQUmY1viBKiP(nfBMuPTteFNQKVcfAAKkQ5HsLAreP6VemAsYNjLtIs51q11qPsUNsfReLQytOur3gfhXOoW(6LT0mkcCEgka0mx(dySRPxVfNCEZFyroQA0DaVt6(JSOOiGhYs)IYr)M44nmOxNWumaWDnluGak5O2uROohXOoW(6LT0mkc4HS0VOC0VjowClW5zOaxV16pOKJAt5pWE7fkGsN2kq9m0oshAMl)bm210R3ItoV5pC5DPhqPCBB0Da(BTcph1MsW2lua2QzZFKXfOmff4sfXXXAKqmuHICaSM55zOashAMl)bm210R3ItoV5pC5DPhuo6J6a7Rx2sZOiW5zOaa5OQr3baURzHcGmAAwctUXyNgVQvGlvehhRrcXqfkYb8qw6xuo63ehlUfGTA28hzCbktrbuk32gDhyroQA0DaSM55zOabLdgI6a7Rx2sZOiaWDnluGNJAjKavettl2ngcOuUTn6oGRxDPjSgvc4nhpaB1S5pY4cuMIcCEgkGNE1LM)amQ8h2T54bu60wb43CljGENgHw7igWdzPFr5OFtCS4wGRBULu)oncTIIaxQioowJeIHkuKdG1mppdfiOC05OoW(6LT0mkcCEgkGu3l0YFWOR)GupYDhWdzPFr5OFtCS4waLYTTr3b0TxOLGrxbDh5UdWwnB(JmUaLPOaxQioowJeIHkuKdG1mppdfiOCyxrDG91lBPzue48muaa5ACYFWOR)asf5pGXUMwJBgWdzPFr5OFtCS4waLYTTr3bwixJtcgDfqQibV6AAnUza2QzZFKXfOmff4sfXXXAKqmuHICaSM55zOabLJue1b2xVSLMrrGZZqbawDvDP5pC5(I8h2T54baURzHc8CulHeOIyAAX(7Gb2Poy5ijcA8jMIyUy1v1LMa39fjG3C8axQioowJeIHkuKd4HS0VOC0VjowClaB1S5pY4cuMIcOuUTn6oWIvxvxAcC3xKaEZXdG1mppdfiOCgh1b2xVSLMrraG7AwOaph1sibQiMMwS)oyiGs522O7aUE1LMWAujG3C8aSvZM)iJlqzkkW5zOaE6vxA(dWOYFy3MJ7piLIstaLoTva(n3scO3PrO1oIb8qw6xuo63ehlUf46MBj1VtJqROiWLkIJJ1iHyOcf5aynZZZqbckhDkQdSVEzlnJIaNNHcaS6Q6sZF4Y9f5pSBZX9hKsrPjaWDnluaDWYrse04tmfXCXQRQlnbU7lsaV54bUurCCSgjedvOihWdzPFr5OFtCS4wa2QzZFKXfOmffqPCBB0DGfRUQU0e4UVib8MJhaRzEEgkqq5ivrDG91lBPzuea4UMfkGoy5ijcA8jMIykBFoUzesaV54buk32gDhq2(CCZiKaEZXdWwnB(JmUaLPOaNNHcOW(CCZiK)WUnhpGsN2ka)MBjb070i0AhXaEil9lkh9BIJf3cCDZTK63PrOvue4sfXXXAKqmuHICaSM55zOabLJ4wuhyF9YwAgfbopdfWZOLQU08hyp)K8hWyxZaa31Sqb0blhjrqJpXuet3OLQU0eK2FscE11mWLkIJJ1iHyOcf5aEil9lkh9BIJf3cWwnB(JmUaLPOakLBBJUd4gTu1LMG0(tsWRUMbWAMNNHceuqbaweVFBZoEuBQC0lfsvqja]] )

    storeDefault( [[SimC Windwalker: ST]], 'actionLists', 20170329.1, [[dqKEraqiOQArckAtukgfjuNIeLBrPuSlQyyqPJrHLrP6zqvX0OuQ6AckTnvvfFdQY4uvfDovvvTovvvMNQQs3JezFqHoOGSqQupKIAIckCrOOncf4KKGvsPu5LqvPzsPu6MiPDIudvvvYsvv5PetLk5RukzVs)fHbRkDyilMKEmQMSqxgSzK4ZuYOvvoTIvRQk1RvHztv3gr7w0Vj1Wf44KqwokpxLMUsxhQSDkY3funEsuDEv06vvfMpuq7xvCnQRkyMivpeR7k0isOImKMFET1KXWr(dG9FpVIRkHbqbHZV1DLFGhqxO02XAGhw8X(F6yur4SjyRujeFhDERRsBuxvWmrQEiw3v(bEaDHsBhRbEgyRqJiHkMrE)ZBi(o68512o3TsiM1TsIibLctzin)8ARjJHJ8ha7)EEnhgHzLqQJF2ZkCK3tG47Otc)C3kkKXHJwnRsQtOI5pGFqvBciHCRAfQ6inIeQeMYqA(51wtgdh5pa2)98AomcZUL2EDvbZeP6HyDxHgrcvWmbM18htA98IPFu(WQiC2eSvGeywNoCCmgK7)cjWSoDirk3g(34WXXyqU)Rsgvm)b8dQAtajKBvR8d8a6cL2owd8mWwrHmoC0QzvsDcvcPo(zpRajWSM)yslcWpkFyvOQJ0isOs3sJp1vfmtKQhI1DfAejujeJJs451LMXGCRiC2eSvwTLLhC4ATpQdpV2Oy(34qIuUTH)noCCmgKlgvYWgibM1PZoKaXQjirkhJkH1jSkRI5pGFqvBciHCRALFGhqxO02XAGNb2kkKXHJwnRsQtOsi1Xp7zfeJJsGy1mgKBfQ6inIeQ0T02(6QcMjs1dX6UIWztWwbueUjiaIoCDAcywqYbcnfckOfU2SipKRZfyqo7PdKivpeTHR1(Oo805cmiN90HbKOjVyuj7vcPo(zpRWM7KwexCjXXWpQOqghoA1SkPoHk0isOYV5oP1ZRGlFEX3HFujeZ6wHFY9aXIywWEvYOYpWdOluA7ynWZaBfZNCp4cXSG9w3vm)b8dQAtajKBvRqvhPrKqLULoS1vfmtKQhI1DfHZMGTcOiCtqaeD460eWSGKdeAkeuqlCTb)lYd56CbgKZE6ajs1dXkHuh)SNvyZDslIlUK4y4hvuiJdhTAwLuNqfAeju53CN065vWLpV47WpEEvSHYQeIzDRWp5EGyrmlyVkzu5h4b0fkTDSg4zGTI5tUhCHywWER7kM)a(bvTjGeYTQvOQJ0isOs3s)p1vfmtKQhI1DfHZMGTc(bfHBccGOdxNMaMfKCGqtHGcAHBLqQJF2ZkS5oPfXfxsCm8JkkKXHJwnRsQtOcnIeQ8BUtA98k4YNx8D4hpVk2UYQeIzDRWp5EGyrmlyVkzu5h4b0fkTDSg4zGTI5tUhCHywWER7kM)a(bvTjGeYTQvOQJ0isOs3sJxDvbZeP6HyDxHgrcvWG5U3NxnLNxmah7SIWztWwbueUjiaIoCDAcywqYbcnfckOfU2SipKRZfyqo7PdKivpeTHR1(Oo805cmiN90HbKOjVyuPWwX8hWpOQnbKqUvTYpWdOluA7ynWZaBffY4WrRMvj1jujK64N9ScL5Uxcnfck4yNvOQJ0isOs3s)N1vfmtKQhI1DfAejubdM7EFE1uEEXaCSZNxfBOSkcNnbBfqr4MGai6W1PjGzbjhi0uiOGw4Ad(xKhY15cmiN90bsKQhIvm)b8dQAtajKBvR8d8a6cL2owd8mWwrHmoC0QzvsDcvcPo(zpRqzU7LqtHGco2zfQ6inIeQ0T0)FDvbZeP6HyDxHgrcvWG5U3NxnLNxmah785vX2vwfHZMGTc(bfHBccGOdxNMaMfKCGqtHGcAHBfZFa)GQ2eqc5w1k)apGUqPTJ1apdSvuiJdhTAwLuNqLqQJF2ZkuM7Ej0uiOGJDwHQosJiHkDlTb26QcMjs1dX6UcnIeQilBoGNxnLN39dEET1KrVMfRiC2eSvafHBccGOdxNMaMfKCGqtHGcAHRnlYd56CbgKZE6ajs1drB4ATpQdpDUadYzpDyajAYlgvYaBfZFa)GQ2eqc5w1k)apGUqPTJ1apdSvuiJdhTAwLuNqLqQJF2Zk3LnhaHMcX(beHpz0RzXku1rAejuPBPnmQRkyMivpeR7k0isOISS5aEE1uEE3p451wtg9Aw85vXgkRIWztWwbueUjiaIoCDAcywqYbcnfckOfU2G)f5HCDUadYzpDGeP6HyfZFa)GQ2eqc5w1k)apGUqPTJ1apdSvuiJdhTAwLuNqLqQJF2Zk3LnhaHMcX(beHpz0RzXku1rAejuPBPnSxxvWmrQEiw3vOrKqfzzZb88QP88UFWZRTMm61S4ZRITRSkcNnbBf8dkc3eearhUonbmli5aHMcbf0c3kM)a(bvTjGeYTQv(bEaDHsBhRbEgyROqghoA1SkPoHkHuh)SNvUlBoacnfI9dicFYOxZIvOQJ0isOs3sBGp1vfmtKQhI1DfHZMGTc(dyGjclE0XWzhlGreG8K2ajWSoD44ymixLGeywNoKiLBd)BC44ymi3)vj8XgvCuO4CxnJKaqS9JaLrckddCWfujK64N9SYowaJia5jROqghoA1SkPoHk0isOIRXcypV)fYtwjeZ6wHFY9aXIywWEvYOYpWdOluA7ynWZaBfZNCp4cXSG9w3vm)b8dQAtajKBvRqvhPrKqLUL2W2xxvWmrQEiw3vOrKqfB9nm)KwpVHbdzPZN3)cxY)Q8d8a6cL2owd8mWwjK64N9Ss4FdZpPfrKHS0jraUK)vrHmoC0QzvsDcvm)b8dQAtajKBvRqvhPrKqLUL2iS1vfmtKQhI1DfAejuXmdXp8tA98A7qr4512owFBoPvfHZMGTcOiCtqaeD2pGaidaMMDj4OaeFwnZgvCuO4SFabqgamn7sWrbi(SAMZDr8dmQKryRy(d4hu1Masi3Qw5h4b0fkTDSg4zGTIczC4OvZQK6eQesD8ZEwHZq8d)Kwe)nkce(X6BZjTQqvhPrKqLUL24FQRkyMivpeR7k0isOIemzoP1ZRzgkHNx8D4hveoBc2kkgX3XeqajqoWfJkHpyigEdMmN0IGZqjqCm8dhUgxUyuj8rz2G)agyIWIhDmCUbtMtArWzOeiog(rfZFa)GQ2eqc5w1k)apGUqPTJ1apdSvuiJdhTAwLuNqLqQJF2Zk3GjZjTi4mucehd)OcvDKgrcv6wAd8QRkyMivpeR7k0isOYpC3VjTEETDOi88ARjJveoBc2k8VXHePCBd)BC44ymixmAyd(dyGjclE0XWHH7(nPfXFJIar4tgRy(d4hu1Masi3Qw5h4b0fkTDSg4zGTIczC4OvZQK6eQesD8ZEwHH7(nPfXFJIar4tgRqvhPrKqLUL24pRRkyMivpeR7kcNnbBffZ)ghoogdYfJgyigQIJcfhv9bratZDWfOmBWFadmryXJogoQEe)qJBjog(rLqQJF2ZkQEe)qJBjog(rffY4WrRMvj1juHgrcvC7r8dnU95fFh(rLqmRBf(j3delIzb7vjJk)apGUqPTJ1apdSvmFY9GleZc2BDxX8hWpOQnbKqUvTcvDKgrcv6wAJ)VUQGzIu9qSURqJiHkM)MNxBHmbveoBc2kqcmRtNDibIvtqIuogvYUJ9WwX8hWpOQnbKqUvTYpWdOluA7ynWZaBffY4WrRMvj1jujK64N9Sc)BichzcQqvhPrKqLUL2o26QcMjs1dX6UcnIeQy(BEEDJJD3kcNnbBfibM1PZoKaXQjirkhJkz3XEyRy(d4hu1Masi3Qw5h4b0fkTDSg4zGTIczC4OvZQK6eQesD8ZEwH)neQ4y3TcvDKgrcv6wA7g1vfmtKQhI1DfHZMGTc(dyGjclE0XWzhlGreG8KyigQIJcfNVzj4AsvTtuhEwjK64N9SYowaJia5jROqghoA1SkPoHk0isOIRXcypV)fYt(8QydLvjeZ6wHFY9aXIywWEvYOYpWdOluA7ynWZaBfZNCp4cXSG9w3vm)b8dQAtajKBvRqvhPrKqLUDRibaFq(5pq7OZsB)F()UTa]] )

    storeDefault( [[SimC Windwalker: CD]], 'actionLists', 20170329.1, [[d8JLjaWAsY6rukBsv1Uu02uqyFikSmkPdRYSPy(kOUjvQZdvDBeonKDks7f1UvA)uIrPkmmf43cFtvXFf1GjfdNu6qkeNsH6yQshxbPfQkAPujTysSCIEiuPNk1Jj8CQAIkKMkvyYinDjxKkXZquYLbxNuTrQiPptP2Si2UQsFhr(QcIMgjvnpevZcrrJfrPA0qz8urCsQOghjvUgvK4EqfRJks15OIuoijL5x2b3USNIbO8tUtpcG7grGRfndjAPKoJkq60TOb3r5U1cc0zqKTRqXYPwhcNg3Ucg48aNADW7NbKLv1nF5UfsK2IBUvtuOy9Sdo9LDWTl7Pyak)K70Ja4259BOcSOHSRdlzArtHbw0mKyOcSOXbYgKC3cjsBXDf22gykIWqdsRNBCXaHk3XxGa2Iv42vWaNh4uRdE)8oGBNxksCvi5EJf4wnfKbv45gTFdvq2j6WYT7GMEea3CXPwzhC7YEkgGYp5o9iaUFAIGArJtvxIN7wirAlURW22atregAqA9CJlgiu5o(ceWwSc3Ucg48aNADW7N3bC78srIRcj3BSa3QPGmOcp3kMiO5eDjEUDh00Ja4MloLSyhC7YEkgGYp5o9iaUFcspivHwBUBHePT4UcBBdmfryObP1ZnUyGqL74lqaBXkC7kyGZdCQ1bVFEhWTZlfjUkKCVXcCRMcYGk8CRaspivHwBUDh00Ja4Mlov9SdUDzpfdq5NC7(CcIqNWXjTHYZTvUBHePT4UcBBdmfryObP1))yKtwOKtut7ZazfDPVMWEkgG(ddvhPvlqNyikf2mX5lq6ZjHubrPWMRqxG9pIwj8nBlOZ3zf6cSCKKPWvyJ5wnfKbv45UcDbwosYu4kmUDEPiXvHK7nwG70Ja42rOlWSOjsSOzu4kmUvtA75wGxyGCDsBO848sMeNtYc8cdKRtAdLhhRC7kyGZdCQ1bVFEhWnU4fgWXjTHYZp5gxmqOYD8fiGTyfUDh00Ja4Mlo1PWo42L9umaLFYD6raC7i0fyw0ejw0mkCfMfnpEhZDlKiTf3vyBBGPicdniT()hJCYcLCIAAFgiROl91e2tXa0)rGHQJ0QfOtmeLcBM48fi95KqQGOuyZvOlWgZnUyGqL74lqaBXkC7kyGZdCQ1bVFEhWTZlfjUkKCVXcCRMcYGk8CxHUalhjzkCfg3UdA6raCZfNoeSdUDzpfdq5NC7(CcIqNWXjTHYZTvUBHePT4UcBBdmfryObP1))4Kfk5e10(mqwrx6RjSNIbO)Wq1rA1c0jgIsHntC(cK(CsivqukS5k0fy)pEuNb2A6bjSOc)e2tXa0FregAqANEqclQWpLaXHwp548oE4HfyOPqxkHTidCSo()HicdniTtFjrQGCKKlmitcTutiPtjqCO1tU6gEyregAqANjiF5ZrsorxIFkbIdTEYXr9J)fryObPDkrE0AN96BwfsOAkbIdTEY)8pIwj8nBlOZ3zf6cSCKKPWvyJ5wnfKbv45UcDbwosYu4kmUDEPiXvHK7nwG70Ja42rOlWSOjsSOzu4kmlAEyDm3QjT9ClWlmqUoPnuECEjtIZjzbEHbY1jTHYJJvUDfmW5bo16G3pVd4gx8cd44K2q55NCJlgiu5o(ceWwSc3UdA6raCZfN(HDWTl7Pyak)K70Ja42rOlWSOjsSOzu4kmlAEqwJ5UfsK2I7kSTnWueHHgKw))JtwOKtut7ZazfDPVMWEkgG(psDgyRPhKWIk8typfdq)hbgQosRwGoXqukSzIZxG0NtcPcIsHnxHUa7xeHHgK2PVKivqosYfgKjHwQjK0Peio06jxD)Iim0G0otq(YNJKCIUe)ucehA9KJJ6)fryObPDkrE0AN96BwfsOAkbIdTEY)8lWqtHUucBrg4yDm34IbcvUJVabSfRWTRGbopWPwh8(5Da3oVuK4QqY9glWTAkidQWZDf6cSCKKPWvyC7oOPhbWnxCQ6yhC7YEkgGYp5o9iaUDe6cmlAIelAgfUcZIMhQFm3TqI0wCxHTTbMIim0G06)FCYcLCIAAFgiROl91e2tXa0)hpQZaBn9GewuHFc7Pya6VicdniTtpiHfv4NsG4qRNCCEhp8Wcm0uOlLWwKbowh))qeHHgK2PVKivqosYfgKjHwQjK0Peio06jxDdpSicdniTZeKV85ijNOlXpLaXHwp54O(X)Iim0G0oLipATZE9nRcjunLaXHwp5F(hrRe(MTf057ScDbwosYu4kSXCJlgiu5o(ceWwSc3Ucg48aNADW7N3bC78srIRcj3BSa3QPGmOcp3vOlWYrsMcxHXT7GMEea3CXf3JcjNUP4NCXm]] )


    storeDefault( [[Windwalker Primary]], 'displays', 20170329.1, [[d8J6haqyQwpe8sOO2fkr1RHq3MeZKuQXrkKzlLZtj3ekYPr6BKc6YQStk2Ry3OA)kPFcrdts(nINlXqjPbRunCiDqL4OKc0XuW5ifWcvulfL0IjvlNOhIs9uWJj06iLyIkuAQq1KvKPRQlQuUkPOEgkHRJInkP6ZqPntP2ob9rjfFvHQPPqX3LQgjPiltHmAPY4HcNKa3cLiDnsH6EOeX2iL0ArjkhxsPZqWdi6OpLWRt4p8wTlasnJRTaZwG3LyVxvOA0diDo2JD3jIyMdulZXClnkwUYX)aIbSqABxUNTJ(ucVetvamqABxUNTJ(ucVetvGAzoMBsGiHdueUygtvGshPFHr6c42KOhOwMJ5My7OpLWlzoGfsB7Y94Ue79LyQcObzoMRe8ygcEGnUR3UPmhyr8Pe(6U20YhJgfW4kxaGQWEDFCkFQ3BiEsTSUJkprIIU)by9ANxUygvnO1HQkweaeLu0pWtvowsv(ygf8aBCxVDtzoWI4tj81DTPLpgnmGXvUaavH96(4u(uV3q8KAzDF6SDM2hG1RDE5Izu1GwhQQyr(8bkDK(fMNK5aurchqDrkhBmACG3LyVFHl2rKbMrIJJetSkOgnHhWkgw6iTwfaJyQcu6i94Ue79Lmhar9fUyhrgahPkRcQrt4bejk6(RkCl6beD0Ns4lCXoImWmsCCKykaGEIuVrrWFkHhZiTQbcu6i9aEMdulZXCJLkpXNs4byvqnAcpaNrrGiHxIzmbkOxRvV5Lo2Kgrg8aEmdb0Jzia2ygciJziFGshPNTJ(ucVK5ayG02UC)cJ0JPkGZiDCl0lGoJTDafhJfMNetvaVH25lTE3QOkClMHaEdTZHosVQWTygc4n0oNnrr3FvHBXmeW4kxGXP8PEVH4jx3vLufxAfWB9UvrvOAMdiKwO60g9TWTqVa6beD0Ns4lnkwEa2Bg8nwdmrlOn3c3c9cmfq6CShUf6fW1Pn6BfWzKoMO8lZbg7z7mTpZbquVoH)afHlMHrbytqTw3XjbgNYN69gINCDFb5waVH254Ue79QcvJziGfsB7Y9c4tur)jYsmvbKxla7nd(gRbkOxRvV5LUOhWBODoUlXEVQWTygcGbsB7Y9c4tur)jYsmvbQL5yUjb8jQO)ezjZbWaPTD5ECxI9(smvbCgPVWf7iYaZiXXrIjT3QJh4Dj27Rt4p8wTlasnJRTaZwam5yqvyuw3XPkxmSOkGcLVSfdlcaIsk6hiG3q78LwVBvufQgZqaNr6c42eCl0lGoJTDaujvXLw1j8hOiCXmmkaQ8ejk6(VOQDaGQWEDFCkFQ3BiEsTSUJkprIIU)b0BueqOMgPFP1IEafhJLTyQcG7TJ)R71ijmOXuf4Dj27vfUf9aSETZlxmJQg0WkwmsJy5dbkDKEmFw6u(eLJTK5atNTZ0(fvTdauf2R7Jt5t9EdXtQL19PZ2zAFG3LyVVoH)buXx3bNxw3nUus6dGbsB7Y9yEUetvalK22L7xyKEmvb8gANdDKEvHQXmeO0r6fWNOI(tKLmhO0r6vfUL5aER3TkQc3YCaNr6a61AcgBmvbkDK(LTmhqKOO7VQq1Ohar96e(hqfFDhCEzD34sjPpqPJ0RkunZbquVoH)WB1Uai1mU2cmBbuOCapMQaVlXEFDc)bkcxmdJcyH02UCpMNlXufq0rFkHxNW)aQ4R7GZlR7gxkj9b8gANZMOO7VQq1ygcSXD92nL5afQcA7wqUfZOaIo6tj86e(dueUyggfqvsvCP16oBh9Pe(6(cJ0deGYNOI(tKlCXoImaRcQrt4buCma8ygcOkPkU0ADNTJ(ucpW7sS3xcO3OiGqnnsF0dGkPkU0sGiHdueUygtvaBc)dSHbQ8kLE3kavKWzzeIsmdACGAzoMBQoH)afHlMHrbW8zPt5tuo21D4TAxmJculZXCtyEUK5aku(cZtIPkGZiDnZPFa0MBDY8ja]] )

    storeDefault( [[Windwalker AOE]], 'displays', 20170329.1, [[d8d6haqyjRxf1lPiSlKuLxdu9BeZKIYZqsMTuopv1nbuDAu(gfjpMGDsP9k2nQ2Vk5NazyuLXjvQ2MksdLugmadhKdQqhfjv6ykQZriPfQclLqSys1Yj5HeXtHwgG8CQmrPszQGAYQutxvxurUkfPUSsxhP2OuXNrIntHTtK(ifvFfqzAiP8DfmskIwhHuJwQA8aLtsOUfHextfX9qsf3MOwlsQQJlvYzoWbfkONr4Di8hF)2geKPHntSDk4xkk7Rjvl6bvfNYkPFfaphb7IEP3XgJcxE5FqHG(GmmC7lPGEgH7I1liyGmmC7lPGEgH7I1liKIjxkFXceoYoVXsnVGYm(4uSufSl6LEVLuqpJWD5iOpidd3(WLIY(Uy9csDPx61f4yNdCWjEP327CeCu4ze(faZyUp2Uh0wYBqKjl5caWy87HQb(Qe9fai1kqK1RpOiBBl3glqEZNo75rvquqXG(GptEPoE5JfOahCIx6T9ohbhfEgHFbWmM7J1ubTL8gezYsUaamg)EOAGVkrFb4Enk62huKTTLBJfiV5tN98OkF(GUEYWi9tIEq5cmeowVGFPOS)ixONOcEacggeWfrS5MeoOF6ikM6KtP2Pu1DrfOtO6et5DQxmefQDsqWI1lORNmaxkk77YrqW1h5c9evqyqAIi2CtchuGiRxVM0POhuOGEgHpYf6jQGhGGHbb8Gi0kWQg7C9mcpwGovud66jdiCoc2f9sVDJPwHNr4bfrS5MeoiNwwSaH7ILAbDqBR1PvUEjKgrf4GvSZbvXohKsSZb1JDoFqxpzqsb9mc3LJGGbYWWT)iTQI1lyrRkyFOnOoTHrq5cSr6NeRxWQb1xJTHY3PjDk25GvdQVWEYGM0PyNdwnO(scrwVEnPtXoh0wYBqGX43dvd8vDbye0uWQnu(onPA5iOuMJPZAS3h2hAdQhuOGEgHp2yu4bLmzHNej4nZb1kFyFOnOqqvXPSW(qBWsN1yVFWIwvaNX3CeeC9oe(JSZBSZafSBRrr3(CeutXKlL)fajf0Zi8laJ0Qkyqjei)laWKGaJXVhQg4R6cWiOPGQTfuYKfEsKGoOT160kxF0dwnO(cUuu2xt6uSZbbdKHHBFX8BMq9eLlwVGDrV07Ty(ntOEIYLJGge(hCcmi16CdLFqxpzyKwvI5gKOh8lfL97q4p((TniitdBMy7uqGxGXKPLVaaZK3yPYlyrRQrUqprf8aemmiGB2uh4GOGIb9bDmoL2gSAq91yBO8DAs1IDoOEJD(S5nYq0dcPyYLYVdH)i78g7mqbHuRarwV(rnZcImzjxaagJFpunWxLOVaaPwbISE9bbdKHHBF4srzFxSEbLlWgNI1liC1w(FbWCfHgkwVGFPOSVM0POhSOvLyUbb2hAdQtByeutXKlL)fajf0Zi8GFPOSVlOpidd3(M4WfRxqWazy423ehUy9c(LIY(Di8pOg8faS4Ula2sPidbD9KbnPA5iOpidd3(J0QkwVGUEYGy(ntOEIYLJGvdQVWEYGMuTyNdwTHY3PjDkhbD9KbnPt5iORNmmoLJGcez961KQf9GfTQqOT1e3Ty9c66jdMy91z8BgNIlhbbxVdH)b1GVaGf3DbWwkfziOmJJWXsvWVuu2VdH)i78g7mqbbxVdH)4732GGmnSzITtbfkONr4Di8pOg8faS4Ula2sPidbRguFjHiRxVMuTyNdoXl92ENJGoMmuBhbnflvbVxJIU9JAMfezYsUaamg)EOAGVkrFb4Enk62huVXoF28gzyS1IEqHc6zeEhc)r25n2zGckZ4J0pjwQcwnO(cUuu2xtQwSZbfzBB52ybYB2uEubu3PEZbzceocvcmoLypjyx0l9ElwGWr25nwQ5fKjq4uFcro25tc2f9sV3Di8hzN3yNbkiJFZeQNOg5c9evqreBUjHd2f9sV3M4WLJG(GmmC7lMFZeQNOCX6fSOvLP5SpiuR8xv(ea]] )

    storeDefault( [[Brewmaster Primary]], 'displays', 20170329.1, [[dWJAhaGEfQxsaTlvPKxRQIzsj1Sv0Jj0nvvPdt13qrX0uLIDsXEf7MO9Jc)uvzyk43igNQunuuzWqvdhkhuQCuvPuhtsooLKfsPwkbAXsXYr6HsPEkyzQswNcbtuH0uHyYe00v5IQIRsaUSsxhsBKsCAs2mQA7OuFukXZqr(mu57svJefvBtkPrlPgVQQojk5wOO01ui68s45KATke62s0PkibeDStrKwiYdUI5g4taiwZY8eq0XofrAHipqnEJP6vaQlXTTRxXFIDaRqx0TBQWjlx5fqmqXhpVEV2o2PisDmdb()XZR3RTJDkIuhZqamQQ0PfSejsqnEJ5ndbkvYUNyykGvOl6kSTJDkIuh7afF8869qCkU90Xme4Trx0vhKyQcsGhP3mxHXoqN4Pisg4TwPVyQcy8YnWOlVJoVacUZ11BmVgQATAyGPaGivHDbYLlGUM03HEKyhqjsKaMlQK4IzKbCuQZsYtqkW2anO88bkIHzF16qG)XsRmXetvVZmJS617To0ARmfEM9nVhqxt6rCkU90XoWpnDsXAcnaYhNGSAH5ibejLn(XX(jnbeDStrKDsXAcnG9hcY3VbAtWkyGhHeWMU9LU(wkd8DFpb01KEaj2bScDr3rv0v8uezabz1cZrcirlzjsK6yykGgBNtltxx3Mmj0GeWJPkanMQa4IPkqtmv5cORj9TDStrK6yh4)hpVEVouQhZqahL6ifyBGguE(aL()o0JeZqaFIv7DZEVqZX(jMQa(eR2HAsph7NyQc4tSAVnPSXpo2pXufy0L3rNxSd4ZEVqZXMl2byR0Qg1uDfifyBGMaIo2PiYUPcNmq7hdYJGbeQ0ytVaPaBdima1L4wKcSnG3OMQRiGJs9FvYn2b(PXcrEGA8gt1RagVCdyt3(sxFlLbEoQQ0Pfb4OQsNwWaFBh7uejd8DOupqaaBfv(un2pfrgZRwFpaDNbA)yqEemGgBNtltxxNMa(eR2rCkU94y)etvGIpEE9ESKcvI(rO6ygcyf6IUczjfQe9Jq1XoaprEb6OkFYaVXPusFGZP42RtkwtObS)qq((vqwTWCKaNtXTNfI8GRyUb(eaI1Smpb(1)RkrlzGhrvUXW0qahL6DsXAcnG9hcY3Vw)ybjaisvyxGa(eR27M9EHMJnxmvbAMQXJBzs6ttamQQ0PfwiYduJ3yQEfaJUIKYg)64SoGnD7lD9T0rGb(rxEhDEb01K(ouQZsYtstGs)F3tmdbq85kpg4BHsqXIziW5uC7XX(jnbeU8o6864SoGnD7lD9T0rGb(rxEhDEbeCNRR3yEnuXmdm9693QkqXhpVEpbARJziW)pEE9Eiof3E6ygc8tJfI8GRyUb(eaI1Smpbk(45171Hs9ygc4tSAhQj9CS5IPkGUM0Zskuj6hHQJDaDnPxGBrJskujXPJDaF27fAo2pXoGUM0ZX(j2b01K(UNyhqKu24hhBU0eWrPoGTZjRrJziWpnwiYlahcd8Gl1mWBCkL0hqxt65yZf7aLkjGeZqGZP42ZcrEGA8gt1Ra))4517jqBDmdbeDStrKwiYlahcd8Gl1mWBCkL0hWNy1EBszJFCS5IPkWJ0BMRWyhqRkXMB33tmVc0mvJh3YK03nNPjW5uC7XXMlnbkvYo0JeZqaFIv7iof3ECS5IPkqP)hqIPkahvv60cg4B7yNIidCof3E6akPqLOFeANuSMqdiiRwyosaRqx0vilrIeuJ3yEZqaLiroIeszmvJmGvOl6k0crEGA8gt1RaNtXTNfI8cWHWap4snd8gNsj9bScDrxHc0wh7a))4517Xskuj6hHQJziGJsDbivxaSPxS0Cj]] )

    storeDefault( [[Brewmaster AOE]], 'displays', 20170329.1, [[d0JFhaGELOxIQQ2fsiEnsWmjL6XeA2k62sYnHatdc6BOQYZPyNuAVIDt0(rk)uPmmfACsP60KmucgmsA4q5GsvhfjKoMu54KQAHsXsjLSyjSCuEOs4PGLPu16qc1evQyQqAYKktxvxujDvuvCzvUouTrsX5uQuTzuz7ivFKuLNjL8zi67kyKOQ02qIgTKA8qOtIQClLk5AsPCEj6WuTwLkLFJ40f0aIo2Risne5dF58cSXhuT5zxdi6yVIi1qKpOwEX2TpaZLiVf1Nifsta9Xp8RFQqkRo5hqmq5ghN5(fo2RistSJbqCJJZC)ch7vePj2Xa6JF4NoEIejOwEXIWXavkz)ASTcOp(HF6w4yVIinPjq5ghN5EuNH8EtSJbOO4h(zcASDbnWQ0lMNU0eOx8vejnQARmFSDbSE1fyNJZXNFaTU55Ml29JDu2no2kaiYuyFG85dyQjd94pjfbuIejG5IkjYyBlGJZCEsocAj2fOaNJlqz0Sl(1gLiKYwTV77BRvB8BKYXWTle2waoI8d0Zu(KgvRZyKHaMAYaQZqEVjnbOqrVuSMWcGUjOfp94lAarsvH)c0xtrarh7vezVuSMWc0SHIUHGaliyL0OIsc0WUHk38hJg1(T1aMAYaGMMa6JF43ok2j(kImGw80JVObK4v8ejstSTcyWU5uZ0n1litclOb8y7cueBxaKX2fGfBx(aMAYWch7vePjnbqCJJZCFpoZJDmGJZC0sSlqbohxGkhXE8Ne7yaFIv79ZbV0iqFn2Ua(eR2HAYGa91y7c4tSAFbPQWFb6RX2fyNJZXNFAc4ZbV0iqxinbORmQc1u9LOLyxGIaIo2RiY(PcPmWIvl6Qwb0PmytVeTe7cigG5sKhAj2fWlut1xgWXzocuYlnbOqHgI8b1Yl2U9bQuYE8NeBRa(eR2rDgY7fOleBxae344m3ZtQtj6pHzIDma7MbwSArx1kGb7Mtnt3uNIa(eR2rDgY7fOVgBxGYnooZ98K6uI(tyMyhdOp(HF64j1Pe9NWmPjqLJiGg7yG3ziVVxkwtybA2qr3qGw80JVObENH8Ene5dF58cSXhuT5zxdGahrvfEfnQOQQl2wJbCCM3lfRjSanBOOBiq7vnObarMc7dyusKZlGpXQ9(5GxAeOleBxGIPA5s9MKHueaJPQCwPgI8b1Yl2U9bWyNiPQW)EbTd0WUHk38hJIPrDNJZXNFatnzOhN58KCKueOYrSFn2XaO(8KpnQ6Xi4yXog4DgY7fOVMIa6oohF(9cAhOHDdvU5pgftJ6ohNJp)aADZZnxS7h743yR9Ttr6cuUXXzUN)nMyhdG4ghN5EuNH8EtSJbOqHgI8HVCEb24dQ28SRbk344m33JZ8yhd4tSAhQjdc0fITlGPMmWtQtj6pHzstatnzG)xzHsQtjrAstaFo4Lgb6RPjGPMmiqFnnbm1KH(10eqKuv4VaDHueWXzoGDZjVDIDmafk0qKFabuAubxAOr16mgziGPMmiqxinbQusan2wbENH8Ene5dQLxSD7dG4ghN5E(3yIDmGOJ9kIudr(beqPrfCPHgvRZyKHa(eR2xqQk8xGUqSDbwLEX80LMagvf2863wJTvGIPA5s9MKH(5mfbSE1fOHDdvU5pgnQ9BRbENH8Eb6cPiGatv5SsAux4yVIiPrThN5bcGXuvoRKNircQLxSiCmGatv5SsAux4yVIid8od59Maignu2QvRU25xBD7BNYrkPSv42fcBpGsQtj6pH1lfRjSaAXtp(IgqjsK7gHufBxBb0h)WpDAiYhulVy72h4DgY71qKFabuAubxAOr16mgziG(4h(PJ)nM0eaWorLpvl9xrKXUNY2d44mNps1haB6LhlFc]] )

    storeDefault( [[Brewmaster Defensives]], 'displays', 20170329.1, [[d0dxhaGEPQEjjODrcWRHentkrhwYSvQJtPQBQkQRrI0TLspNWoPyVIDJY(jj)uvzysXVrmosugkPmysQHdLdQKokjGoMu5CKqTqQYsPewmvA5e9qvHNcwMuL1rc0ePuzQqmzKY0v5IQsxLeXLvCDOAJuspJsPnJKTRQ6Juk(mKAAQIuFxjgjjKTrIQrtfJhs6Kiv3sveNgvNNQ6XKQ1Qks(gKWPlib0lSJtywjSdo)9e4tjiws38g4kj650(1IBazXqppCgDugVa2Jp4Z6MJM1oSlGEa)pkkXCpkSJtyIyAcG6hfLyUhf2XjmrmnbShFWhA01jmG3FIPNsd0YzRVXyBa7Xh8H2Jc74eMiEb8)OOeZHus0ZjIPjGceFWhrqIPlibEzL7EOfVaR6hNWuP2sU4IPxat1obSBOgMG)pIawm7Petm9A6uExtJTbaDjh7cKlxaHdzzf)iXlqBHkGetxGRKONBLP7qKb8(qq(E2c62OiKa(X8KEkVjafHDbwL8ARsTPKsYsaHdzbPKONteVaO0DLP7qKbq(0SGUnkcjGoP1ToT)34gqVWooHTY0DiYaEFiiFphaWgDET59RJtyX0t5klGWHSaiXlG94d(yhxo6hNWcybDBuesagElDDctetxab2S3w3LW5bztKbjqftxa3y6cGoMUaYy6Yfq4qwEuyhNWeXlaQFuuI5wXLvmnbkCzH4JnbCXPOc0wOUIFKyAcuBmNADVu(cT)3y6cuBmNcCilA)VX0fO2yo1dsRBDA)VX0fWuTtap5S0wIBKQuB3qnmb)FebQ9s5l0(1IxGFUG7Y38ZhXhBc4gqVWooHTU5OzbE8AqETianUaBx(i(ytaAbKfd9G4Jnbkx(MF(bkCz9mNnXlakDTsyhW7pX01lqTXCkKsIEoTFTy6cy3qv47lEbKZoWJxdYRfbeyZEBDxcN4gO2yofsjrpN2)BmDbq9JIsmhDgnUEDePiMMa2Jp4dn6mAC96isr8cCLe9CwjSlGgIk1qXeQuBkPKSea1y9jkdfkw5nk2wLQuf3GcLP4oueQN80OiWvs0ZzLWo483tGpLGyjDZBGNlu5T4TQuJWBNySTjaxNWaSsNZqhJsda6so2fiqTXCQ19s5l0(1IPlqHlRvMUdrgW7db57zlFTIeatYBlPVvc7aE)jMUEbWKJoP1TUvnld4jNL2sCJubvP2UHAyc()icG6hfLyoKsIEormnbAluxFJPjasTh2PsTnscowmnbUsIEoT)34gqtYBlPVk1pkSJtybOnuf((cyXSNsmX0RPdfn22tzkGUa(FuuI5uONiMMaO(rrjMtHEIyAciCilR4YIoJIe3achYI2Vw8c4)rrjMBfxwX0eq4qwOZOX1RJifXlqTXCkWHSO9RftxGAVu(cT)34fq4qwwFJxaHdzr7)nEb0jTU1P9Rf3achYIchFxoJgNHweVafUSaSzVPBxmnbqPRvc7cOHOsnumHk1MskjlbA5majMMaxjrpNvc7aE)jMUEbqPRvc7GZFpb(ucIL0nVb0lSJtywjSlGgIk1qXeQuBkPKSeO2yo1dsRBDA)AX0f4LvU7Hw8ci4Ty7z97nMEbOnuf((w1SmGNCwAlXnsfuLA7gQHj4)JiG7M3VVnBYY6Eh3a6f2XjmRe2b8(tmD9c0YzR4hjMMaAsEBj9vP(rHDCctL6vCzfiaMK3wsF66egW7pXyBtaoJgxVoICLP7qKbSGUnkcjG7M3VVnBYsCdW1jSNIqAJX2Ma2Jp4dnRe2b8(tmD9cu4YIoJIG4JnbCXPOcyp(Gp0uONiEb8)OOeZrNrJRxhrkIPjqHllLW4xaSD5pYCja]] )


    Commit( 'initializeClassModule', MonkInit )
    Hekili:ReInitialize()

end
