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


    storeDefault( [[Brewmaster: Default]], 'actionLists', 20170328.1, [[dWZngaGEisAtKq7IuTnHQ9rsvZgQ5dr1YKc)g03KIomv7Ku2RQDlz)q4NqcdtbJJKkopK0qHi0GbQHtGdQqNcIOogfDALwibTuG0ILQLt0dHO8uupwW6ectes0ujrtwrtx0fPGNrHUmY1fkVwiDBaBMeSDskFgs9xcnniImpHOmsHO67KKrlez8KuPtcepNsxdIG7jLArsjhcIuJcIeFZR8SHY7yAEHNrjPGhdNx4zwafwhVivpxyDTgXvNZGsyYT01Amy2CWOPrDZZCqUcYZNhd5cl7vEnZR8SHY7yAEHN5GCfKNtiA0ysFRKKYycs75X(I3e1ZwbKlfJKxtrBk3O0zqQ5g8ekpxWIodkHj3sxRXGzCZM6dgpR5a0zwa5seGJCVMiaZPCJspVwJR8SHY7yAEHN5GCfKNtiA0yspaH4juvzvePGCK3JPGc6DmeoXXSPEmbih5PlrtPEUaKycfNlfzTJpGKppkrBpxoa1gINIQC55X(I3e1ZcG5cRZGuZn4juEUGfDguctULUwJbZ4Mn1hmEwZbOZiryUW651mELNnuEhtZ3pZb5kipNEfDl0kgGq8eQQ0xjSSr3sSljv6Hi5s0KTDacXtOQsFLWYgDlXUKuPhIKlrtwraxDvCRaeyl0IthWrtIgTQF48yFXBI65vclB0Te7ss1zqQ5g8ekpxWIodkHj3sxRXGzCZM6dgpR5a0zqKWYgDleGfkjvpVgs6kpBO8oMMVFMdYvqEoMLeNKcuzx1i75rjA75YbO2TekjvaUnjzeiaJssbQSRAKT15X(I3e1ZbhJf9qUWseV28mi1CdEcLNlyrNbLWKBPR1yWmUzt9bJN1Ca6mkjfOYUQr2NxdjCLNnuEhtZl8mhKRG8msNoMQuVJ9quySumab6qDQ8oMMk6HCvJePIawYQEZZJs02ZLdqTBjusQaCBsYiqaMtVMUCIa8ikm068yFXBI65GJXIEixyjIxBEgKAUbpHYZfSOZGsyYT01Amyg3SP(GXZAoaDMtVMUCIa8ikm88AXVYZgkVJP5fEMdYvqEoDmvPEh7HOWyPyac0H6u5Dmnv0d5QgjsfbSKv9MNhLOTNlhGA3sOKub42KKrGamYGaDicWJOWqRZJ9fVjQNdogl6HCHLiET5zqQ5g8ekpxWIodkHj3sxRXGzCZM6dgpR5a0zKbb6qeGhrHHNxR5vE2q5DmnVWZCqUcYZiD6yQs9o2drHXsXaeOd1PY7yAQOhYvnsKkcyjBBZZJs02ZLdqTBjusQaCBsYiqaMtVMUCIamRS15X(I3e1ZbhJf9qUWseV28mi1CdEcLNlyrNbLWKBPR1yWmUzt9bJN1Ca6mNEnD5ebyw5ZRPox5zdL3X08cpZb5kipNoMQuVJ9quySumab6qDQ8oMMk6HCvJePIawY2288OeT9C5au7wcLKka3MKmceGrgeOdraMv26mOeMClDTgdMXnBQpy8mi1CdEcLNlyrN1Ca6mYGaDicWSYZJ9fVjQNdogl6HCHLiET5ZNN1Ca6SqjPcWTjjJabyusk4XW5ZF]] )

    storeDefault( [[Brewmaster: Defensives]], 'actionLists', 20170328.1, [[dOtveaGEbO2esLAxkzBKk2NsvmBk9Bi3wQADkvPDku7fSBv2pfgLsvnmKY4ivIht0qfagmfnCv5GesNcPIJPuopblekTuc1IrYYf9qbqpLQLjv65imrbKPsQAYQQPtYfHIoTKNPu56c61ivTkbQnlKTla5BqHpJOPrQu9DPmsKk5Vq1OjLXlvCscXTeqDnsL09ei)KuPCzuhwXWgOhCmVHYYFal4(JL1yRaEuf6G4U6OlGhp9m4ytU1peko3RHzG4i(iQaIjapqC0eAvawWfZwEiyiUlTnmOTBB3AdCX88f0x9m47Bykri7h1U1lmRiH6iXPsUTKAtsYe49thdZaBykri7h1U1lmRiH6iXPsUTKAtsYe4r5ivf6gRHjDmmd2WuIq2pQDRxywrc1rItLCBLSuBssgCrLQcDeGEiEd0doM3qz5pGf84PNbhRDK0ByQBDmmXMCdCXSLhcgI7sBtNnmw02bUi3VKJcLGFOJb3Lz9uGlri7h1U1lmRiH6iXPsUTKAtsYebrdCrPkBPeaNYos6XrDWPsUbkiUlOhCmVHYYFal4Izlpeme3L2MoBySOTdCxM1tbo4b48uf6ah8MgFI55la(eQqGlY9l5Oqj4h6yWfLQSLsa8xywrc1rItLCd84PNbpacZksOosdtSj3afeVd0doM3qz5pGfCxM1tbUeHSFu7wVWSIeQJeNk52sQnjjteKeHSFu7wVWSIeQJeNk52sQnjjtG3pDaxuQYwkbWReDe0xhovYnWf5(LCuOe8dDm4UmRNsVWJbxv9m4XtpdUij6iOVodtSj3axmB5HGH4U020zdJfTDGlMNVG(QNbFFdtjcz)O2TEHzfjuhjovYTLuBssMaVF6yygydtjcz)O2TEHzfjuhjovYTLuBssMapkhPQq3ynmPJHzWgMseY(rTB9cZksOosCQKBRKLAtsYG304tmpFbWjKz9uGcI1Dqp4yEdLL)awWJNEgCm78yRHjDnzp4Isv2sjao35XwCTj7bVPXNyE(cGpHke4IC)sokuc(HogCxM1tbUgp26iXjEACYljk8u7jOn6EFnESkT1NJkzP2tqeQrTgLAK0J)qnodgJLUgSgp26iXjEACYljk8u0bCXSLhcgI7sBtNnmw02bkqbUlZ6Pahuaa]] )

    storeDefault( [[Brewmaster: Combo ST]], 'actionLists', 20170328.1, [[dOZSdaGAcQA9eaVuaSls1RvO9raA2eDBOADeq2jO2l1Ur1(bQrra1WiLXjG6WIgkbPgmigUI6GcQtrqXXqPLHIwOcwkuAXqSCsEibLwfbvESqphstKGOPkjtgW0L6Ic02iuxg56azJeOCAL2SKYZqHpdfFLGW0ii57ci)vr2ebsJMqMhbItkP6BcY1eGopiTscu9uv)wInRR8dYtejb4b)hv7C77dN4K)GIceEI2KsGadryl4ifWqELVqs1sqY2d(yjjLOKHzQXgsJbldDwFSucaTAXjF)WXElCuxzywx5hKNiscWd(Wjo5piZ4ybudgYB1osGHiWb4cJ)JQDU97us8whrMXXcOEkwWrk6eprKeGGMXElC9rcZekEIksxrja0PEXjbbteq4y1dOpwkbGwT4KVFyKvUnuFezghlG6j0wTJKFDoWgZUO85fo5JLKuIsgMPgRy2q6Am8FuTZDf0zYhDXJUnmtx5hKNiscWd(Wjo5hacdyihprf5JLKuIsgMPgRy2q6Am8RZb2y2fLpVWj)WiRCBO(JeMju8evK)JQDU9DBygUYpiprKeGh8HtCYFqMXXcOgmK3QDK8XsskrjdZuJvmBiDng(15aBm7IYNx4KFyKvUnuFezghlG6j0wTJK)JQDU9DByHYv(b5jIKa8G)JQDU99XsskrjdZuJvmBiDng(15aBm7IYNx4KpCIt(ybHkA5yadrWtacmeHy5a(Hrw52q9vGqfTCmtcFcqtbA5aUnCaDLFqEIijap4)OANBFacbuTA6JeMju8evKoOzFSKKsuYWm1yfZgsxJHFDoWgZUO85fo5dN4K)GIYweyiLAGHiyRI8dJSYTH6JOOSfnvQnvBvKBdl2v(b5jIKa8GpCIt(vlgsbgIqNsCFSKKsuYWm1yfZgsxJHFDoWgZUO85fo5hgzLBd1VxmKAAoL4(pQ252N4Kcdu9iiLI4TaQ52T)NP4MYvaYElCdZuCGDBd]] )

    storeDefault( [[Brewmaster: Combo AOE]], 'actionLists', 20170328.1, [[dCdPdaGAIGwVQi9sIi7sv1RfW(ufLztQBtu7uK9sTBe7xv5NeeggH(TOgkbLgSQ0Wf0brIJbvRtvuTqHSuKQfdPLtYdjI6PkpgONdLjsqLPcrtgW0v5Iq4WsDzuxhu2ibvnocs2SQWNfQtl5ReKAAeu8DIqpdK(gsz0iPXRkItkq)fuDnIaNNiTscIwgi2gb24gPhcsJQzah5LAz2lsXsuUXow98VxjNLrZFVueceEduvHNNhDwZng7eerCAIqXH(J7TqgSAD90(QmXjicekpkGxLjygPt4gPhcsJQzah5LAz2dXtc1zGIe)9kjo2JoR5gJDcIiUaCA)Iq9csakW(YkpsMWEuqlDDs94NeQZafjgEao2BGQk8885eeJ0dbPr1mGJ8sTm7jjo(7DYngvp6SMBm2jiI4cWP9lc1libOa7lR8izc7rbT01j1lahdhtUXO6nqvfEE(CcQr6HG0OAgWrEPwM9Km167ncMc78OZAUXyNGiIlaN2ViuVGeGcSVSYJKjShf0sxNupqQfCuykSZBGQk8885KWyKEiinQMbCKxQLzVif3h1V38JVxHVuShDwZng7eerCb40(fH6fKauG9LvEKmH9OGw66K6HQ4(Ocp)a(JsXEduvHNhaJc7XJ)aCmCm5gJ6pSqFojbgPhcsJQzah5nqvfEEE0zn3yStqeXfGt7xeQxqcqb2xw5rYe2l1YShDyyuls83Rq2a83RqxeapkOLUoPEkyyulsmCjSby4sSia(CsGr6HG0OAgWrEduvHNhtyvS0FqykftUNj6rN1CJXobrexaoTFrOEbjafyFzLhjtyVulZEiRyw99kSTw2JcAPRtQ3vXScEyRL95enJ0dbPr1mGJ8gOQcppp6SMBm2jiI4cWP9lc1libOa7lR8izc7LAz2ls3GbYWUV3DQka7rbT01j1dv3GbYWo4yNQcW(85jC8JgM(CKpBa]] )

    storeDefault( [[Brewmaster: Standard ST]], 'actionLists', 20170328.1, [[d0Z7eaGAru16fsQxQiYUeQTrK2NqkMnjZxruRtiLgNkb3wG)ks7uf7LA3qTFvQrjKkdtq)wuxg1qveAWqy4KYbfItjIIJHKZjIslurTuIQfJWYj8qvc9uWJvQNdPjkIktfIMSctxvxKOCAPEgs56kXgfrY3iInJuTDvI(UkPVQiyAIiAEIi8AfPLHOgTsA8cjoPi8zs11esY5rKvkKQoSKnjIuBkJ0GmCrO4HNnCQa2WSGVguOplI2BeWx4rjg3iaKganE3LQJ667m2hYsVGb5SIlu2hYHuscPrrlMYaSfT2BWqK93zmQr6dLrAqgUiu8WZgovaBysS(nciOqxniNvCHY(qoKskLK4qAgsGh9U(SWaoJzdWw0AVbdriAv)KmmL1trdk0v)(q2inidxekE4zdWw0AVHbtSqNE8uwpfnOqxJx0M8KhmXcD6XOA8Ulv6Gv9LSGu8IMb5SIlu2hYHusPKehsZqc8O31NfgWzmBicrR6NKbcbx)AAMEk9wWgovaBywW1VEJit)grs1c2Vp0msdYWfHIhE2aSfT2BWGCwXfk7d5qkPusIdPzibE076Zcd4mMneHOv9tYaHQ2tZlFk6l6PSHtfWgMv1EAE5VraVONY(9jjnsdYWfHIhE2aSfT2ByNZQr(kowBr00j1y9ucbFnEVwcDgnj25SAKVIJ1wenDsnwpLqWxJ3RLqNrtdQOyicrR6NKHV1zrQwPcmKap6D9zHbCgZgovaBazRZIBetSubgKZkUqzFihsjLssCin)(evgPbz4IqXdpBa2Iw7n8fEAJ1tA0V01zrCfKxWF0OTiA6Ks)vbJUMvddriAv)KmWrrtLhnwpDkRBibE076Zcd4mMnCQa2GSOOPYJgRFJysSUb5SIlu2hYHusPKehsZVpsnsdYWfHIhE2aSfT2BWGCwXfk7d5qkPusIdPzibE076Zcd4mMneHOv9tYGybDTX6PjFn40RnEy4ubSb5lORnw)gr0xd(gXeA8WVpsmsdYWfHIhE2aSfT2BWqeIw1pjd71oLyrG(gsGh9U(SWaoJzdNkGnCX1(gX8Ia9niNvCHY(qoKskLK4qA(95cgPbz4IqXdpBa2Iw7nyqoR4cL9HCiLukjXH0mKap6D9zHbCgZgIq0Q(jzyV2PxRlzdNkGnCX1(gXeQlz)(KSgPbz4IqXdpBa2Iw7nyqoR4cL9HCiLukjXH0mKap6D9zHbCgZgIq0Q(jz4BDwKQvQadNkGnGS1zXnIjwQGBerhvY43VHKJPxlQ3Z(Tb]] )

    storeDefault( [[Brewmaster: Standard AOE]], 'actionLists', 20170328.1, [[dOtheaGAQe16PIWlPsQDPs9AvWSP08PsY3Oqxg1of1Ej7gP9RI(jvenmk63aEmqdLkknyvYWPQoifCkQeCmOADurvluOwkISyOSCbpKkv9uLLbkphHjsfftfsnzrMUQUiKCyjpduDDiSrQe50sTzQsBxfY4OsLVsLstJkQ8DvOUTq(ligninEQuCsQIpdrxJksopvyLurQTHOgfvcTWfAnu0cZYjfRnWq7)AAod7TqyFfRrITCrWkdZe3OjCC434AZNb7Y2or9navzyKDNMbWVbOecTY4cTgkAHz5KI1gyO9FnndyTTFhASB8TaPMIeYbgPMhAQbRhiOrbOSwUIynuUX3cKAkYZlxZi1iXwUiyLHzItg34TjC9kdtO1qrlmlNuS2adT)RPrITCrWkdZeNmUXBt4AEOPgSEGGgfGYAgWAB)o0oWiHqeveq1YveR5Ag551IkcO6vgUqRHIwywoPyTbgA)xlXyi869(aJecrura9gHVRCvIXq417nHpd2LfsIT9rCWXncFnsSLlcwzyM4KXnEBcxZdn1G1de0OauwlxrSwCGRh65fG3ZlxQdSMbS22VdnSaxpuiaEH4TdSELDoHwdfTWSCsXAdm0(VMgj2YfbRmmtCY4gVnHR5HMAW6bcAuakRLRiwl2wGhaq8Nx7d9bwZawB73HgMTapaG4Hq8H(aRxzNsO1qrlmlNuS2adT)RPrITCrWkdZeNmUXBt4AEOPgSEGGgfGYA5kI1iHGaAtrEE50vIpVCBttAgWAB)o0ciiG2uKqC5kXqoUPj9ktwO1qrlmlNuS2adT)RPzaRT97qdeAdbdrG418qtny9abnkaL1iXwUiyLHzItg34TjCTCfXAUhAFEfJiq86v2OqRHIwywoPyTbgA)xtJeB5IGvgMjozCJ3MW18qtny9abnkaL1YveR5EO95LBRJyndyTTFhAGqBihxhX6v2DcTgkAHz5KI1gyO9FnnsSLlcwzyM4KXnEBcxZdn1G1de0OauwlxrSg6gjhoVC2YgDE5I4UGMbS22VdTVrYbi(LnsVETCfXAXb(4OI45GZFETVOPkKoVm4KO0lb]] )

    storeDefault( [[SimC Windwalker: default]], 'actionLists', 20170328.1, [[d8tSiaGmaz9KiYMaODjPTbb7JePMPGKdRYSrz(OQUjaEge6BKuopjStHAVe7wX(POrbsnmsLXrIKoTudLejgSadxjoKGuNcqDmi1XfeSqsQwQqYIPWYH6HOspLQhRuRJe1efe1ubjtMstx0ffuEniUmY1vspxIBdQntkBNKyEcQ(kjPPjiY3rfJKer9xGgne9zi5KcPweQY1ir4EcX5ee6GKQ(TQwqlqjEyZzWiROU4HmPDRSuuxCFH29XAL0L9psmqieIIhfXORqsmq6qRMoerJyfT4(g3lP4IRFN9pfbkjgTaL4HnNbJSI6IhFWK4(cDyZaL8nwZapXnesCFJ7Lu88rHIr1EscJxxYcGqNhgfLvlzSQPv3xj7bvDDbyXJES9(Yhl(8djUEJM1PcXll0HbrEJfSK4gcjoxK0gcaVkemnPyiEueJUcjXaPdncOvRQdrXb4TXhmjUKsmqcuIh2CgmYkQlUVX9skE(OqXO6YN9pfaH2yvtRwimnDQOUUWNVXQMwTKpggKoCIe8glOwJP66cF(qh68y0K1cHPPtfvAodgzbmX9aHY6c(31dvZ6urDDby(8nw10QgS)TS1swxx4ZppmkkRzdtG5dABk8iiOdyX1B0Sovi(YN9pIh9y79Lpw85hs84dMexP8z)J46XOkIphmfH3c(z)GISGlphcZt8OigDfsIbshAeqRwvhIIZfjTHaWRcbttkgIdWBJpysCEl4N9dkYcU8CimpjLyefOepS5myKvux84dMehQFDJ0m41mdcz6sKI7BCVKINpkumQU)NzFotbqOZdJIYA2Wey(G2McpsicS4rp2EF5JfF(HexVrZ6uH45VUrc(AGw6sKIZfjTHaWRcbttkgIhfXORqsmq6qJaA1Q6quCaEB8btIlPehscuIh2CgmYkQlUVX9sko05XOjRfcttNkQ0CgmYc4(FM95m1cHPPtfvmbF9ucpIoG5Z3yvtRwimnDQOUUiUEJM1PcX3hJbE7S)bK1Lu8OhBVV8XIp)qIhFWK4CpgZmq)o7FmdcvxsX1JrveFoykcpVH5AgOApwohdcHv2mOqyA6ubpXJIy0vijgiDOraTAvDikoxK0gcaVkemnPyioaVn(GjX55nmxZav7XY5yqiSYMbfcttNk4jPeRecuIh2CgmYkQlUVX9skEOZJrtwleMMovuP5myKfqkew7LfYwT4EG0dkqKpEa3VkegqOHE)pZ(CMQwxYc4RbQTIvuXe81tj8iObCJSR7vmMMuPJGiW85BSQPvl5JHbPdNibVXcQ1yQUUWN)(FM95m1s(yyq6WjsWBSGAnMQBKhgfvIaeF(5HrrznBycmFqBtHhbiLGp)9)m7ZzQ5VUrc(AGw6sKvmbF9uu6ikvLayX1B0Sovi((ymWBN9pGSUKIh9y79Lpw85hs84dMeN7XyMb63z)JzqO6sAganAGfxpgvr85GPi88gMRzGQ9y5CmiewzZGcPXt8OigDfsIbshAeqRwvhIIZfjTHaWRcbttkgIdWBJpysCEEdZ1mq1ESCogecRSzqH04jPeJGaL4HnNbJSI6I7BCVKIh68y0K1cHPPtfvAodgzbm0uiS2llKTAX9aPhuGiF8aUFvimGqd9HZw72zTK4gcb(AGjscKtpw2JTvAodgzbC)pZ(CMAjXnec81atKeiNESShBRyc(6PeEe0HeG7)z2NZu16swaFnqTvSIkMGVEkHhbba3)ZSpNPI7spOalRdiKEdPIj4RNs4rqay(8nw10QL8XWG0HtKG3yb1AmvxxawC9gnRtfIVpgd82z)diRlP4rp2EF5JfF(Hep(GjX5EmMzG(D2)ygeQUKMbqdeWIRhJQi(CWueEEdZ1mq1ESCogecRSzqH04jEueJUcjXaPdncOvRQdrX5IK2qa4vHGPjfdXb4TXhmjopVH5AgOApwohdcHv2mOqA8KuIvtGs8WMZGrwrDXJIy0vijgiDOraTAvDikE8btIZ9ymZa97S)XmiuDjndGgrGfxpgvr85GPi88gMRzGQ9y5CmiewzZahkEIR3OzDQq89XyG3o7FazDjfp6X27lFS4ZpK4CrsBia8QqW0KIH4a824dMeNN3WCnduThlNJbHWkBg4qXtsjfp(GjX9gMRzGQ9y5CmiewzZalPDRSusra]] )

    storeDefault( [[SimC Windwalker: precombat]], 'actionLists', 20170328.1, [[b4vmErLxtvKBHjgBLrMxc51uevMzHvhB05LqEn1uWv2yPfgBPPxy0L2BU5LtYytoEnLuLXwzHnxzE5KmWeZnWmtmZ4smEn1uJjxAWrNxt51ubngDP9MBZ5fvE5umErLxtvKBHjgBLrMxc51utnMCPbhDEnfDVD2zSvMlW9gDP9MBZ51ubjwASLgD551uW9gDP9MBEnvsUrwAJfgDVjNxt52BUvMxt5uyTvMxtb1B0L2BU51ubj3zZ51uUfwBL1JiWj3BS9MBNvgzFb3B3vMCI41usvgBLf2CL5LtYatm2eZnUaZmEn1qOv2yR10B2vwBL5gDEjMxt10BK5uyTvMxtjcCY9gBV52zLr2xW92DLjNiErNx051uofwBL51utLwBd5hyxLMBKDxySTwzYPJFGbNCLn2BTjwy05fDE5f]] )

    storeDefault( [[SimC Windwalker: sef]], 'actionLists', 20170328.1, [[di0(iaqiQqTiQsTjPsJIK4uKunlPe3IkiTlKmme6ysXYOkEMuQPrfexJQK2gc8niLXjvLoNuszDivzEubUhsL9jLKdsvzHqQEiP0eLQIlkvSrPQ6KKuEjvqzMuH4MKIDsIHsfuTue0tjMkvvFfPQ2RQ)cXGPKdRyXKQhlYKf1LrTzQ0NrkJMsDAOEnfA2cUTq7wPFdA4urlh45iA6sUoKSDssFxQY4PkX5PG1lLunFQqA)u0V5(V0zh9aNp6x6d7oOc1r)I4Kt4jGB9PWW9kEiO1Uqih4HKVIhInOrSDtBQMlscGDwxU4lvy4sE)xP5(V0zh9aNp6xuMiFXpMgdmTC4tiErsaSZ6cVmGMbQekaG3IoEzanduXXlDt2yQekaG3YbnxuBZ40uqWLfU8fF64aUmCPW0yaIZjeVO1Mtg1avLJ8wx)cHCGhs(kEi2qqdAueBFrdmRmr(YRR45(V0zh9aNp6xuMiFXhinlBA5hca8wxKea7SUuqA0cmvccdzyVLSRkjBmvC8IdnzJPsOaaERwrxtxEzandufoYifejoEPv0rKYRQFrTnJttbbxw4Yx8PJd4YWLbKMLrkiaWBDrRnNmQbQkh5TU(fc5apK8v8qSHGg0Oi2(IgywzI8LxxP99FPZo6boF0Vqih4HKVIhIne0GgfX2xuMiFr7ecMw(sfgUMwocMSU4dqJ8YorMoVfCuRPf9XBU3emYa6zAPTpEFXNooGldxstiGmPcdxKaMSUO2MXPPGGllC5lAT5Krnqv5iV11VObMvMiFXBbh1AArF8M7nbJmGEMwA7J3VUId5(V0zh9aNp6xuMiFrkii2IPvNbu2TyAnB20QFmGVija2zDPG0OfyQeegYWElzxvCSokxxkYccIi8akBKzZiUyatHYzxvsqyid7TufevYgb6IK5PSPaCCWlPdORVoQJMGWqg2BPkiQKnc0fjZtztb44GxYw1xVQU6xuBZ40uqWLfU8fF64aUmCHSGGicpGYgz2mIlgWx0AZjJAGQYrERRFHqoWdjFfpeBiObnkITVObMvMiF51v869FPZo6boF0VOmr(IuqqSftRodOSBX0A2SPv)yaBAPsJ6xKea7SUuqA0cmvccdzyVLSRkowhLRlfzbbreEaLnYSzexmGPq5SBccdzyVLISGGicpGYgz2mIlgWuj7bqJjPZJ6xuBZ40uqWLfU8fF64aUmCHSGGicpGYgz2mIlgWx0AZjJAGQYrERRFHqoWdjFfpeBiObnkITVObMvMiF51vi4(V0zh9aNp6xuMiFrkii2IPvNbu2TyAnB20QFmGnTuXJ6xKea7SUuqA0cmvccdzyVLSRkowhLRlfzbbreEaLnYSzexmGPq5SBnaACrv4iJuqKmMDaDE8Q6xuBZ40uqWLfU8fF64aUmCHSGGicpGYgz2mIlgWx0AZjJAGQYrERRFHqoWdjFfpeBiObnkITVObMvMiF51vq7(V0zh9aNp6xuMiFrkii2IPvNbu2TyAnB20QFmGnTuPT6xKea7SUuqA0cmvccdzyVLSRkowhLRlfzbbreEaLnYSzexmGPq5SBccdzyVLYftwKiqxexuaduaoo4L0b010nzJPsOaaERwrxB1VO2MXPPGGllC5l(0XbCz4czbbreEaLnYSzexmGVO1Mtg1avLJ8wx)cHCGhs(kEi2qqdAueBFrdmRmr(YRR037)sND0dC(OFrzI8L(XKfPPf010QFuadxKea7SUOJY1LISGGicpGYgz2mIlgWuOCErTnJttbbxw4Yx8PJd4YWfxmzrIaDrCrbmCrRnNmQbQkh5TU(fc5apK8v8qSHGg0Oi2(IgywzI8LxxP1U)lD2rpW5J(fLjYxietIxAMwcQ10YHHtgVija2zDrhLRlfzbbreEaLnYSzexmGPq5SBYgtLqba8w05PlVmGMbQekaG3Yb8YaAgOIJxUO2MXPPGGllC5l(0XbCz4catIxAiKOweJ4KXlAT5Krnqv5iV11Vqih4HKVIhIne0GgfX2x0aZktKV86kneV)lD2rpW5J(fc5apK8v8qSHGg0Oi2(IYe5lANqW0YxQWW10YrWKLPLknQFXhGg5LDImDEl4Owtl6J3CVjyKb0Z0s879fF64aUmCjnHaYKkmCrcyY6IABgNMccUSWLVO1Mtg1avLJ8wx)IgywzI8fVfCuRPf9XBU3emYa6zAj(9(1RlktKVi4Owtl6J3CVjyKb0Z0IKDF9da]] )

    storeDefault( [[SimC Windwalker: serenity]], 'actionLists', 20170328.1, [[d8JGhaGAIQy9OKsVeLKDbKTPOAFevYmjQiltbMnvoSQUjqDisj9nfL7PIyNQ0Ef7wQ9RqJIOQmmvyCevOtl52OYGvKHJsDqsXPiQQogrohrLAHKulLszXKy5u1db4PqpMWZvQjsPktLuzYkz6GUOkQfrkXZijxxbTrIQ0RrXMjLA7eLVtPYxvrAAevW8qjfxg5VOQrtQ6ZuYjrjwhLQ6AevuNhqReLuztOKQ(nfhPOl45(vC0kQdAps7FOdg1br2KOExXAFyz6ChmxUdAJC0VPChCin7qLKkqsbrHVyddguJawMEhD5kfDbp3VIJwrDqBKJ(nL7GdP5sZaDOk495OGaENBCsJawMECsovByqnERDW(5Ot0cwCagNoT6LDVJH82FCcG90sqnkLRGadkENJ)fWY08UAddYsVkXdn(GTPPGa0tcgWgzeh1WOeeSzDFokOwWIdW40PvVS7DmK3(JtaSNwcm3brxWZ9R4Ovuh8(CuqK8uxqGbrHVyddcnwwocKWyClJD9oil9Qep04d2MMcQrPCfeyWn5PUGadcqpjyaBKrCudJsqBKJ(nL7GdP5sZaDOkiyZ6(CuWaZvv0f8C)koAf1bVphfeH(IHgNmApob1tJtNw9Yz8RG2ih9Bk3bhsZLMb6qvqnkLRGadUH(IH4nAZd1t82v9Yz8RGS0Rs8qJpyBAkia9KGbSrgXrnmkbbBw3NJcgyUYHOl45(vC0kQdIcFXgg8fWsgXtnXv0M1OkOgLYvqGb91UAl(9WMNPembzPxL4HgFW20uW7ZrbTv7QTgNWH94eRkbtqnERDqbqHJ4HV3IG7tKcAJC0VPChCinxAgOdvbbau4iDV3IG7Ooia9KGbSrgXrnmkbbBw3NJcgyUY5Ol45(vC0kQdEFokO8wB4ECYO94K8o0dmOnYr)MYDWH0CPzGoufuJs5kiWGAxB4M3OnV2d9adYsVkXdn(GTPPGa0tcgWgzeh1WOeeSzDFokyG5op6cEUFfhTI6G3NJcISRUR2ACcG)BACIvLGjik8fByWxalzep1exrB56evSETY2tY4TelqsG2SRUR2Ix4)M4zkbtqw6vjEOXhSnnfuJs5kiWGB2v3vBXl8Ft8mLGjia9KGbSrgXrnmkbTro63uUdoKMlnd0HQGGnR7Zrbdm3zrxWZ9R4Ovuhef(Inm4lGLmINAIROTCDIQGAukxbbg0x7QT43dBEMsWeKLEvIhA8bBttbVphf0wTR2ACch2JtSQemJtYNK8huJ3Ahuau4iE47Ti4(ePG2ih9Bk3bhsZLMb6qvqaafos37Ti4oQdcqpjyaBKrCudJsqWM195OGbMRCm6cEUFfhTI6G3NJcISRUR2ACcG)BACIvLGzCs(KK)GOWxSHb1kBpjJ3sSajbAZU6UAlEH)BINPembzPxL4HgFW20uqnkLRGadUzxDxTfVW)nXZucMGa0tcgWgzeh1WOe0g5OFt5o4qAU0mqhQcc2SUphfmWCL7Ol45(vC0kQdIcFXgguRS9KmElXcKeif3lymdH8mLGjOgLYvqGbvCVGXmeYZucMGS0Rs8qJpyBAk495OGQDVGXmeooXQsWeuJ3Ahuau4iE47Ti4(ePG2ih9Bk3bhsZLMb6qvqaafos37Ti4oQdcqpjyaBKrCudJsqWM195OGbMR0r0f8C)koAf1bVphf02WT(QTgNyD)IgNoT6vqu4l2WGALTNKXBjwGKa5hU1xTfV88lI3UQxbzPxL4HgFW20uqnkLRGad6hU1xTfV88lI3UQxbbONemGnYioQHrjOnYr)MYDWH0CPzGoufeSzDFokyGbg8(CuqS4amoDA1l7Ehd5T)40M8uxqGbMa]] )

    storeDefault( [[SimC Windwalker: ST]], 'actionLists', 20170328.1, [[dqeUraqiOKwevQYMOKAuusCkkb3IsszxOyyqvhJuwgvYZestJkv4AOezBqfFdQ04qjQohvQQ1HsuMNKs6EuI2hkHdsvAHcXdPunrQuPlcLAJqj6KOKwjLKQxsjjZKkv0nrP2jsnujLQLkP6PetLQ4RuPyVk)fjdwv5WqwmP6XKmzjUmyZi0NPIrdfNwQvlPuETqnBb3gr7w0VPy4uvhNsOLJQNRktxLRJGTtP8DjfJNkLoVKSEjLy(qjSFvvpT5zc2jspaLfzI7cerec3Imr8bvJcDTGU2KJ2foU)K6qaqpy0UWRHl(OArz0MikE7FtM4vDTjFZZO1MNjyNi9auwKj1HaGEWODHxdhnCzWhDcnIeMyhfc)FEvxBY)p3z)UjE5oVjjIeS09KM0()NB6SudkedCw2)ND319M4vVd9vnrHcbkK6Atsf63nH1S0k0z4tstctSJbuXSn2asiVPpHTPqJiHjUN0K2))CtNLAqHyGZY()S7UU3Ur7AEMGDI0dqzrMqJiHjyNa3PRLoD()Wo0UT5tefV9VjqcCNkgfbohYRwHe4ovmKi3ATctZOiW5qE1QLAtynlTcDg(K0KWeV6DOVQjqcCNUw60HccTBB(e7yavmBJnGeYB6tQdba9Gr7cVgoA4YGp6e2McnIeMSB0rNNjyNi9auwKj0isyIxUcLW)NhdNd5nru82)MCghNaWOmMqXut(S2kkmndjYTwnfMMrrGZH8yHLAwdjWDQyUMeOodfjYTSWs8mSKfMWAwAf6m8jPjHjE17qFvtqCfkbQZW5qEtSJbuXSn2asiVPpPoea0dgTl8A4OHld(OtyBk0isyYUr7oMNjyNi9auwKj0isyIC8og()me))omW)NB6Sem8YerXB)BcyrcTVpuyuM0gWDGubugIuerh8S(qbipMhWHSVkgir6bOyTYycftnjZd4q2xfdhirD(yHLA4NWAwAf6m8jPjHjE17qFvtEhVJbkdrQddqvtNLGHxMyhdOIzBSbKqEtFsDiaOhmAx41Wrdxg8rNW2uOrKWKDJMLMNjyNi9auwKj0isyIC8og()me))omW)NB6Sem8Y)Nv0SWerXB)BcyrcTVpuyuM0gWDGubugIuerh8SgRhka5X8aoK9vXajspaLjSMLwHodFsAsyIx9o0x1K3X7yGYqK6Wau10zjy4Lj2XaQy2gBajK30Nuhca6bJ2fEnC0WLbF0jSnfAejmz3OXzEMGDI0dqzrMqJiHjYX7y4)Zq8)7Wa)FUPZsWWl)FwXLfMikE7FtWkyrcTVpuyuM0gWDGubugIuerh8MWAwAf6m8jPjHjE17qFvtEhVJbkdrQddqvtNLGHxMyhdOIzBSbKqEtFsDiaOhmAx41Wrdxg8rNW2uOrKWKDJg35zc2jspaLfzcnIeMGL97E)FgI)FyjbE1erXB)BcyrcTVpuyuM0gWDGubugIuerh8S(qbipMhWHSVkgir6bOyTYycftnjZd4q2xfdhirD(yHLS0ewZsRqNHpjnjmXREh6RAcX(DpkdrkIe4vtSJbuXSn2asiVPpPoea0dgTl8A4OHld(OtyBk0isyYUrZYNNjyNi9auwKj0isycw2V79)zi()HLe4v)FwrZctefV9VjGfj0((qHrzsBa3bsfqzisreDWZASEOaKhZd4q2xfdKi9auMWAwAf6m8jPjHjE17qFvti2V7rzisrKaVAIDmGkMTXgqc5n9j1HaGEWODHxdhnCzWhDcBtHgrct2nA3FEMGDI0dqzrMqJiHjyz)U3)NH4)hwsGx9)zfxwyIO4T)nbRGfj0((qHrzsBa3bsfqzisreDWBcRzPvOZWNKMeM4vVd9vnHy)UhLHifrc8Qj2XaQy2gBajK30Nuhca6bJ2fEnC0WLbF0jSnfAejmz3O1WpptWor6bOSitefV9Vjy1Nd2OCufgnMRDaoLpkqAnKa3PIrrGZH8SesG7uXqICR1kmnJIaNd5vRwg1ADcejY8odNKcq8ddfklueBoWqWFIx9o0x1KRDaoLpkqoH1S0k0z4tstctOrKWepTdW))QDuGCIxUZBIQsfaQdXDG7zP2K6qaqpy0UWRHJgUm4JoXELkaEqCh4ElYe7yavmBJnGeYB6tyBk0isyYUrRPnptWor6bOSitefV9VjGfj0((qHrzsBa3bsfqzisreDWZ6dfG8yEahY(QyGePhGI1kJjum1KmpGdzFvmCGe15Jfw6AIx9o0x1eE)60H6riPIBv8ewZsRqNHpjnjmHgrctQ3VoD()ec5)Nv1Q4jE5oVjQkvaOoe3bUNLAtQdba9Gr7cVgoA4YGp6e7vQa4bXDG7TitSJbuXSn2asiVPpHTPqJiHj7gTMR5zc2jspaLfzIO4T)nbSiH23hkmktAd4oqQakdrkIOdEwJ1dfG8yEahY(QyGePhGYeV6DOVQj8(1Pd1Jqsf3Q4jSMLwHodFsAsycnIeMuVFD68)jeY)pRQvX)FwrZct8YDEtuvQaqDiUdCpl1Muhca6bJ2fEnC0WLbF0j2RubWdI7a3BrMyhdOIzBSbKqEtFcBtHgrct2nATOZZeStKEaklYerXB)BcwblsO99HcJYK2aUdKkGYqKIi6G3eV6DOVQj8(1Pd1Jqsf3Q4jSMLwHodFsAsycnIeMuVFD68)jeY)pRQvX)FwXLfM4L78MOQubG6qCh4EwQnPoea0dgTl8A4OHld(OtSxPcGhe3bU3ImXogqfZ2ydiH8M(e2McnIeMSB0AUJ5zc2jspaLfzcnIeM4gmnp0PZ)N7YroM8)R2jKkmtQdba9Gr7cVgoA4YGp6eV6DOVQj1GP5HoDOkCKJjP8jKkmtynlTcDg(K0KWe7yavmBJnGeYB6tyBk0isyYUrRXsZZeStKEaklYeAejmXohPIdD68)z1rf4)ZD2oyUStNjII3(3eWIeAFFOWCyakG0h4g(JsH8rQ(mCR1jqKiZHbOasFGB4pkfYhP6ZWzEhsfZcl1C)jSMLwHodFsAsyIx9o0x1efhPIdD6qvBOcqfAhmx2PZe7yavmBJnGeYB6tQdba9Gr7cVgoA4YGp6e2McnIeMSB0A4mptWor6bOSitOrKWeXVZStN)p7Cuc)FwvRINikE7FtScsDTnGcsGSHhlSmkwGfp)oZoDOuCucuXTkMrziKhlSmQfSgR(CWgLJQWOX887m70HsXrjqf3Q4jSMLwHodFsAsyIx9o0x1KNFNzNoukokbQ4wfpXogqfZ2ydiH8M(K6qaqpy0UWRHJgUm4JoHTPqJiHj7gTgUZZeStKEaklYeAejmPoHhMoD()S6Oc8)5MoltefV9VjkmndjYTwnfMMrrGZH8yHM1y1Nd2OCufgngoHhMoDOQnubOQPZYewZsRqNHpjnjmXREh6RAcNWdtNou1gQau10zzIDmGkMTXgqc5n9j1HaGEWODHxdhnCzWhDcBtHgrct2nAnw(8mb7ePhGYImru82)MyffMMrrGZH8yHgwGf6eisKr3et5Znkgc(wWAS6ZbBuoQcJgJEaPIneoQ4wfpXREh6RAIEaPIneoQ4wfpH1S0k0z4tstctOrKWKibKk2q4()SQwfpXl35nrvPca1H4oW9SuBsDiaOhmAx41Wrdxg8rNyVsfapiUdCVfzIDmGkMTXgqc5n9jSnfAejmz3O1C)5zc2jspaLfzcnIeMyht))5gKnyIO4T)nbsG7uXCnjqDgksKBzHLUyCXstynlTcDg(K0KWeV6DOVQjkmnvniBWe7yavmBJnGeYB6tQdba9Gr7cVgoA4YGp6e2McnIeMSB0UWpptWor6bOSitOrKWe7y6)Vie4VBIO4T)nbsG7uXCnjqDgksKBzHLUyCXstynlTcDg(K0KWeV6DOVQjkmnLob(7MyhdOIzBSbKqEtFsDiaOhmAx41Wrdxg8rNW2uOrKWKDJ2L28mb7ePhGYImru82)MGvFoyJYrvy0yU2b4u(OajwGfyvNarImy6Jszi1nme8N4vVd9vn5AhGt5JcKtynlTcDg(K0KWeAejmXt7a8)VAhfi))SIMfM4L78MOQubG6qCh4EwQnPoea0dgTl8A4OHld(OtSxPcGhe3bU3ImXogqfZ2ydiH8M(e2McnIeMSB3eAejmrAs7)FUPZsnOqmWzz)FINDBa]] )

    storeDefault( [[SimC Windwalker: CD]], 'actionLists', 20170328.1, [[d4dAjaGEjj0Mqf7srBJIyFsQIhtQdRYSP0ZGsUjQ05PGVbroTQ2PeTxKDR0(jkJIQIHjHgNKKEnQQ)QWGjQgUKYHGs5uuv5yqXXLKGfsrTujWIHQLtYdHOEQOLjjwhfP0eLuzQuOjty6sDrjOzjPQUm46ezJsQsFMQSzuA7Ok(oe(QKennksMhvLUnkglfPy0qA8qP6Kuv1ZPY1OivDpjPohfPYVfoiQstyiJuw4E4wqqMPmRb6)SFv86pwQSIjMokRdypjBtMPSaWcNdOYkfXGurSWG1edLPw91AkPKxD)X6iJujgYiLfUhUfeKzktT6R1u2HNNfM6iSIaX6OS8yak9F5j4dYKBAKGT(YK3OGm5vj63Gm5gFpqrzbGfohqLvkIXeminlIfL8I)2Vnq5V8e8Hb2LGLs)xXRVouuUXcuImkO5Zn4byGTjCk5gIYJbOKAQSczKYc3d3ccYmLPw91Ak7WZZctDewrGyDuwEmaLMTriKjVELugOSaWcNdOYkfXycgKMfXIsEXF73gOe3gHyWkPmqP)R41xhkk3ybkrgf085g8amW2eoLCdr5XausnvIfzKYc3d3ccYmLPw91Ak7WZZctDewrGyDuwEmaLMbLdu8)1JYcalCoGkRueJjyqAwelk5f)TFBGsCq5af)F9O0)v86RdfLBSaLiJcA(CdEagyBcNsUHO8yakPMknfzKYc3d3ccYmLCpS)msmgpLh0okRqzQvFTMYo88SWuhHveiwhhFW2P6N90907SWaxs56jShUfeCWLyzNOVqa7G5CnOCd2qH)cbSJoK0OtPA(rjV4V9Bdu2HKgDeSdbCnkL(VIxFDOOCJfOKxLNJsTbTfg9P8G2vnM6ZCyFOnOTWOpLh0UQRqz5XauAmK0OYKhSYKxhCnkLiBqBbJNYdAhzMYcalCoGkRueJjyqAwelkt0ab3q8SpOCKzkrgf085g8amW2eoLCdr5XausnvA6jJuw4E4wqqMPm1QVwtzhEEwyQJWkceRJJpy7u9ZE6E6DwyGlPC9e2d3ccoydQcsFTAGyI(cbSdMZ1GYnydf(leWo6qsJ6hL8I)2VnqzhsA0rWoeW1OuImkO5Zn4byGTjCklpgGsJHKgvM8GvM86GRrLj3hm(rzbGfohqLvkIXeminlIfLjAGGBiE2huoYmL(VIxFDOOCJfOKBikpgGsQPstiJuw4E4wqqMPK7H9NrIX4P8G2rzfktT6R1uE6(5bgWcmp4QhmC6WZZctDewrGyDC85u9ZE6E6DwyGlPC9e2d3cco4sSSt0xiGDWCUguUbBOWFHa2rhsA0Puno6iSIaXoDT65dJGD0OWaXVcBOetfWC)68TQC0ryfbIDY(U2nc2bRKYWubm3VoFR2uC0ryfbIDQE3VEdN0o4)A(tfWC)68fj)OKx83(Tbk7qsJoc2HaUgLs)xXRVouuUXcuYRYZrP2G2cJ(uEq7Qgt9zoSp0g0wy0NYdAx1vOS8yakngsAuzYdwzYRdUgvMCFQ4hLiBqBbJNYdAhzMYcalCoGkRueJjyqAwelkt0ab3q8SpOCKzkrgf085g8amW2eoLCdr5XausnvIezKYc3d3ccYmLPw91Ak7WZZctDewrGyDC85u9ZE6E6DwyGlPC9e2d3ccoyRplS90bky)2We2d3ccoydxILDI(cbSdMZ1GYnydf(leWo6qsJoLQXrhHvei2PRvpFyeSJgfgi(vydLyQaM7xNVvLJocRiqSt231UrWoyLugMkG5(15B1MIJocRiqSt17(1B4K2b)xZFQaM7xNViXrJ(tTKsbBxpvxXpk5f)TFBGYoK0OJGDiGRrPezuqZNBWdWaBt4uwEmaLgdjnQm5bRm51bxJktUpy5hLfaw4CavwPigtWG0SiwuMObcUH4zFq5iZu6)kE91HIYnwGsUHO8yakPMkRkzKYc3d3ccYmLPw91Ak7WZZctDewrGyDC85u9ZE6E6DwyGlPC9e2d3cco9zHTNoqb73gMWE4wqWbB4sSSt0xiGDWCUguUbBOWFHa2rhsA0Puno6iSIaXoDT65dJGD0OWaXVcBOetfWC)68TQC0ryfbIDY(U2nc2bRKYWubm3VoFR2uC0ryfbIDQE3VEdN0o4)A(tfWC)68fj)OKx83(Tbk7qsJoc2HaUgLsKrbnFUbpadSnHtz5XauAmK0OYKhSYKxhCnQm5(yk)OSaWcNdOYkfXycgKMfXIYenqWnep7dkhzMs)xXRVouuUXcuYneLhdqj1utz5XauMpdYYKxL)kqCw(GY0ktoY1rnr]] )


    storeDefault( [[Windwalker Primary]], 'displays', 20170328.1, [[d8J6haqyQwpe8siu7cLi9AiYVrmtkjpdcz2s58KQBIs40i9nkPYJj0oPyVIDJQ9RI(jKmmjzCusvBJsudLKgSk1WHYbvuhLsGoMcohkr1cvOLIsAXKYYj6He0tbltf8CjMOkKMkunzfz6Q6IQKRsjYLv66OyJsQ(mKAZuQTtGpkP4RQqnnvi(Uu1iPKY6OeA0sLXdrDsuQBHsuUgLGUhkrCBsSwkbCCjLodbpGOJ9ucVoH)WR32aOSeUvSnxbExIEFvbQrlG05OxHDRiszmGwJIac10i9rlGokB7Y(cDSNs4LyQcGmkB7Y(cDSNs4LyQcGjPkUuNTiHdue2yosvafkF(kgefOwMLzNe6ypLWlzmGokB7Y(4Ue9(LyQcybzwMTe8ygcEGlUR12Pmgyw8Pe(5Tv0YhJ1hW4kBaGQi88(ykFQ3BiTslEEJjxrIIM)byDBRx2youny5HQkefaeLuSpWtvwwsv(yoe8axCxRTtzmWS4tj8ZBROLpgRlGXv2aavr459Xu(uV3qALw88EATDM2hG1TTEzJ5q1GLhQQqu(8bkDK(zMNKXaurchWCrkhDmwyG3LO3FMl2rKbgrHJJIfSYUgRHhqpgw2blxfa5yQcG4vxJYNOC0N3WR32yoeajTzUyhrgahLkRSRXA4bejkA(Rk4kAbeDSNs4ZCXoImWikCCuSiGqcM(5nojWXu(uV3qALN3ZOUcu6i9aEgdulZYShLkxXNs4byLDnwdpaNrHTiHxI5ibkyBRvV5LoHKgrg8aEmdb0Izia6ygciJziFGshPxOJ9ucVKXaiJY2US)mJ0JPkGZiDCDSnGgJTDafh5zMNetvaVH15ZTExVOk4kMHaEdRZHosVQGRygc4nSoxirrZFvbxXmeW4kBGJP8PEVH0kpVvLufxQhWB9UErvGAgdiGwOA0g91X1X2aAbeDSNs4ZnkAEaHxg8lwdmrlynxhxhBdmfq6C0lUo2gW1On6RhWzKolO8nJbo6A7mTpJbqsRoH)afHnMHdbaSvK6nkc(tj8yoyzwEaVH154Ue9(QcuJziGokB7Y(S5tur)jYsmvbKBlGWld(fRbkyBRvV5LUOfWByDoUlrVVQGRygcGmkB7Y(S5tur)jYsmvbQLzz2j28jQO)ezjJbuLufxQFEl0XEkHh4Dj69lbCgPpZf7iYaJOWXrXcRUQJh4Dj69Rt4p86TnaklHBfBZvaw4itvyuoVXPkBmiQkaYOSTl7J7s07xIPkaikPyFGaEdRZNB9UErvGAmdbkDK(zgPZMBtIwamjvXL61j8hOiSXmCiaMCfjkA(pRAvaGQi88(ykFQ3BiTslEEJjxrIIM)bCgPZMBtW1X2aAm22buCKNVIPkaU3w(FExJKWGftvG3LO3xvWv0cO1OiGqnns)CRfTaSUT1lBmhQgSUkenGiw6qGP12zA)SQvbaQIWZ7JP8PEVH0kT4590A7mTpW7s07xNW)aQ4N3GZlN3gxkj9bqgLTDzFepwIPkGokB7Y(ZmspMQaEdRZHosVQa1ygcu6i9S5tur)jYsgdu6i9QcUYyaV176fvbxzmGZiDaBBn2hnMQaLos)8vgdisu08xvGA0cGKwDc)dOIFEdoVCEBCPK0hO0r6vfOMXaiPvNWF41BBauwc3k2MRakuoGhtvG3LO3VoH)afHnMHdb0rzBx2hXJLyQci6ypLWRt4Fav8ZBW5LZBJlLK(aEdRZfsu08xvGAmdbU4UwBNYyGcvbRTZOUI5qarh7PeEDc)bkcBmdhcOkPkUu)8wOJ9uc)8EMr6bcq5tur)jYzUyhrgGv21yn8akoYaEmdbkDKEeV6Au(eLJUKXa2e(h4czm5wk9UEGAzwMDUrrZvw(hqmqTmlZoXwKWbkcBmhPkavKWTaeIsmdwyGAzwMDQoH)afHnMHdbkDKECxIE)sgdulZYStiESKXaku(mZtIPkGZiDlXPFaSMRVY8ja]] )

    storeDefault( [[Windwalker AOE]], 'displays', 20170328.1, [[d8d6haqyjRxf1lPizxiPIxdK(nIzsr5zaLzlLZtvDtKKonkFJIupMGDsP9k2nQ2Vk5NaAyuLXriPTPI0qjLbdWWb5GkYrrsKJPqNJqIfQclLqSys1Yj5HeXtHwgq1ZPYersyQGAYQutxvxurDvkcxwPRJuBuQ4ZiXMPW2jsFKIQVQIyAiP8DfmskIwhHuJwQA8aXjju3cjvDnPsDpKe1TjQ1IKkDCPsoJboOqb9mcVdH)4732GanbSzITZb)srzFnPArpOQ4uwj9RaO5iOEJD(S5nYq0d6d0WWTVKc6zeUlwVGGa0WWTVKc6zeUlwVGDrV07TybchzN3yPMxqzgFAowWc2f9sV3skONr4UCe0hOHHBF4srzFxSEbPs0l96cCSJbo4mV0B7Docoj8mc)cGzm3hROg0wYBqKjl5cWjm(9q1aDvI(caKAfiY61huKTTLBJfCVXth98alikOyqFWNjVuzV8XcEGdoZl92ENJGtcpJWVaygZ9XA6G2sEdImzjxaoHXVhQgORs0xaUxJIU9bfzBB52yb3B80rppWYNpORNmmr)KOhuUabHJ1l4xkk7pXf6jQGhaHHbsvreBUjHd6NouVP7(uQDkyIQOaE3G1TP9o1lgup16oObH)bNbbsTo3q5h01tgGlfL9D5iiO6tCHEIkimqnreBUjHdkqK1Rxt6C0dkuqpJWN4c9evWdGWWaPAqeAfyvJDUEgHhl4NkkbD9Kbeohb7IEPxQGPwHNr4bfrS5MeoiNwwSaH7ILAbDqBR1PvUEjKgrf4GvSJbvXogKsSJb1JDmFqxpzqsb9mc3LJGGa0WWT)eTQI1lyrRkyFOnOoTHrq5cKj6NeRxWQb1xtTHY3PjDo2XGvdQVWEYGM05yhdwnO(scrwVEnPZXog0wYBWty87HQb6QUambCoy1gkFNMuTCeukZX0zn27d7dTb1dkuqpJWNAmk8GsMTWZIe8M5GALpSp0guiOQ4uwyFOnyPZAS3pyrRkQY4BoccQEhc)r25n2rWdsfRrr3(CeutXKlL)fajf0Zi8lat0Qkyqjei)laWKGNW43dvd0vDbyc4Cq12ckz2cplsqh02ADALRp6bRguFbxkk7RjDo2XGGeRxWUOx69wm)Mjupr5YrqqaAy42xm)Mjupr5I1lyx0l9o1yu4Yl)dke8lfL97q4p((TniqtaBMy7CqQwGWKPLVaaZK3ybZlyrRQjUqprf8aimmqQA2Ch4GOGIb9bDmoL2gSAq91uBO8DAs1IDmiianmC7dxkk77I1liKIjxk)oe(JSZBSJGhesTcez96N0mliYKLCb4eg)EOAGUkrFbasTcez96d66jdt0Qsm3Ge9GYfitZX6feUAl)VayUIqdfRxWVuu2xt6C0dw0Qsm3Ga7dTb1PnmckY22YTXcU3OP9aBemQZyqFGggU9n1HlwVGGa0WWTVPoCX6f8lfL97q4Fqn4layXDxaSLsrgc66jdAs1YrqFGggU9NOvvSEbD9KbX8BMq9eLlhbRguFH9KbnPAXogSAdLVtt6Coc66jdAsNZrqxpzyAohbfiY61Rjvl6blAvHqBRjMkI1lORNmyQ1xNXVzCkUCeeu9oe(hud(cawC3faBPuKHGYmochlyb)srz)oe(JSZBSJGheu9oe(JVFBdc0eWMj2ohuOGEgH3HW)GAWxaWI7UaylLImeSAq9LeISE9As1IDm4mV0B7Doc6yYqTDc4CSGf8Enk62pPzwqKjl5cWjm(9q1aDvI(cW9Au0TpOEJD(S5nYWuRf9Gcf0Zi8oe(JSZBSJGhuMXNOFsSGfSAq9fCPOSVMuTyhdQPyYLY)cGKc6zeEWVuu23fesXKlLVybchzN3yPMxqMaHJqLaJtj2UdYeiCQlHih7y3b7IEP37oe(JSZBSJGhKXVzc1tutCHEIkOiIn3KWb7IEP3BtD4YrqFGggU9fZVzc1tuUy9cw0QYeC2heQv(RkFca]] )

    storeDefault( [[Brewmaster Primary]], 'displays', 20170328.1, [[dWJAhaGEfQxIIYUuvsEnkIzsjz2k6Xe6MQk1Vr8nfcMMcr7KI9k2nr7hf(PQ0WuW4iapNudfvgmu1WHYbLkhvvj1XOuhNsQfsLwkbAXsXYr6HsPEkyzQkwhksnrfstfIjtqtxLlQkUkkQUSsxhsBKsCAs2mQA7OuFukXZuv1NHkFxQAKeqBtkPrtvnEvvojk5wOi5AQkX5PIdlzTke62uLJDqciwyNIiTqKhCoZnWlZrSIL5jGyHDkI0crEGA8gJ9Na0sIBB7VImjUbAMQXJBzs6ttaNxEE9ETlStrK6ygc87LNxVx7c7uePoMHawJUORqwIejOgVXmYHaEkz3tm)dyn6IUcBxyNIi1XnGZlpVEpKIIBpDmdb(A0fD1bjg7Ge4rwnZvyCd0jEkIKbERu6lg7aMYBdm6YxOZlGG7Cl9gZNb7wThg(haePkSlqUCb0(K(o0Je3akrIeWkrLexmFjWvuC71jf9j0aUViiVFliRweisaNyyQpToeGNiVaDuvnzG3uukPpG2N0JuuC7PJBaM00jf9j0aiVCcYQfbIeqK41uhh7N0eqSWofr2jf9j0aUViiVFhOnbZHbEesax627v6BPmW39(eq7t6bK4gWA0fDhvrxXtrKbeKvlcejGe1JLirQJ5Fan2oNwML2VnzsObjqfJDaAm2bWfJDGMySZfq7t6BxyNIi1XnWVxEE9EDO0kMHafkTqCW2anO88b8QFDOhjMHa1eZV6M9LJMJ9tm2bQjMFb(KEo2pXyhOMy(vBIxtDCSFIXoWOlFHoV4gOM9LJMJnxCdWwPvnQP6CqCW2anbelStrKDtfozG2pgKhbdiuPXMLdId2gqyaAjXTioyBGQrnvNtGcLwFRKBCdWKgle5bQXBm2FcykVnGlD79k9Tug45OkVI6eGJQ8kQdd8TlStrKmW3HsRabSgDr3UPcN0BLxaXa0DgO9Jb5rWaASDoTmlTFAcutm)cPO42JJ9tm2baSvuvt146uezmFAvabSgDrxHSKcvI1rO64gW5LNxVhlPqLyDeQoMHa)ILw)))VTagHVy)raTo0AR)dptnsbe4kkU9SqKhCoZnWlZrSIL5jW31pLhQhd8ikVnM)dbkuA1jf9j0aUViiVFB1JfKaGivHDbcutm)QB2xoAo2CXyhq7t67qPfljpjnbWOkVI6yHipqnEJX(tam6ks8AQRJZQaU0T3R03szAg4hD5l05fOqPfljpbXbBd0GYZhWR(19eZqaKAUYJb(wOeuSygcCff3ECSFstaHlFHoVooRc4s3EVsFlLPzGF0LVqNxaoQYROomW3UWofrg4kkU90bCE5517XmxDmdb(9YZR3dPO42thZqaM0yHip4CMBGxMJyflZtaNxEE9EDO0kMHa1eZVaFsphBUySdO9j9SKcvI1rO64gq7t6z260OKcvsC64gOM9LJMJ9tCdO9j9CSFIBaTpPV7jUbejEn1XXMlnbkuAby7CYA0ygcWKgle5fGdHbEOKAg4nfLs6dO9j9CS5IBapLeqIziWvuC7zHipqnEJX(tGFV8869yMRoMHaIf2Pisle5fGdHbEOKAg4nfLs6dutm)QnXRPoo2CXyh4rwnZvyCdOvEyZT79jMpbAMQXJBzs67MZ0e4kkU94yZLMaEkzh6rIziqnX8lKIIBpo2CXyhWR(biXyhqWDULEJ5ZG9im83()xzhaJQ8kQdlrIeuJ3yg5qaLuOsSocTtk6tObeKvlcejGsKihrcXlg7VeWA0fDfAHipqnEJX(tGRO42ZcrEb4qyGhkPMbEtrPK(awJUORqM5QJBGFV8869yjfQeRJq1XmeOqPfZLQla2SCwAUe]] )

    storeDefault( [[Brewmaster AOE]], 'displays', 20170328.1, [[d0JFhaGEvOxIQs7sLI61Qu1mLk5XeA2k63iUPkvMMkL(gQkomv7Ks7vSBI2ps5NQKHPGXHeCAsgkbdgjnCOCqPQJIeIJjrNtLISqj1sjLSyjSCuEOk4PGLbHwhsOMOuPMkKMmPY0v1fvrxfvvDzLUouTrsXZPyZOY2rQ(OurpJu1NHOVRqJevv2gs0OLKXdbNev5wQu4AsfoVu62sXArcPJtk1PmObeDSxrKAiYh(25g4I)ODXZEgq0XEfrQHiFqDCJTeXamxICpuTI3N6aft1XJDojJPiq7fhNz)do2RistSdbq4IJZS)bh7vePj2HaAJV4RoEIejOoUXE7qGgLS)mw9b0gFXxDhCSxrKMuhO9IJZSpQZqUVj2Haue8fFnbn2YGg4u6fZvxQd0l(kIKg1UuMp2YawVzd09Y54ZpGw7CDZglIdLuwomOpaiYuyFG85dyQiJ94pjfbACea0yhc8od5(9sXkclq9fk61DAXRt(HgOnAUbF6GYBPupfUje7qFh8zGYHWDJB7iahr(b6zkFsJQ1zmYyatfze1zi33K6a3x0lfRiSaOxcAXRt(HgqK0u4Va9Zueq0XEfr2lfRiSa1xOOx3f4abRLgvusGA2o24MFz0O2FDgWurgb0uhqB8fF7wXwXxrKb0IxN8dnGeVHNirAIvFad2oNAMUP6azsybnGhBzGIyldGm2YaSylZhWurgp4yVIinPoacxCCM97XzESdbCCMJ2ITbkW54c04i0J)Kyhc4tSkVFo6Tgb6NXwgWNyvourgfOFgBzaFIv5hinf(lq)m2YaDVCo(8tDaFo6Tgb6cPoaDLrvOMQVfTfBdueq0XEfr2pviLboCArp1kGoLbB6TOTyBaXamxICrBX2aEHAQ(2aooZVtj3uh4(cne5dQJBSLigOrj7XFsS6d4tSkh1zi3xGUqSLb0gFX3(PcPSzLFaXaSDg4WPf9uRagSDo1mDtvkc4tSkh1zi3xG(zSLbq4IJZSppPoLO)eMj2HaAJV4RoEsDkr)jmtQd0EXXz2NNuNs0FcZe7qaLircyUOsIm2oc8od5(AiYh(25g4I)ODXZEg4ohbvdEdnQOQMnw9dbCCM3lfRiSa1xOOx311Pg0aGitH9bmkjY5gWNyvE)C0Bnc0fITmGPIm2JZCEsoskcGXunoRvdr(G64gBjIbWyRiPPW)EHUcuZ2Xg38lJIPrT7LZXNFahN58KCe0wSnqbohxGghH(ZyhcG6Zv(0O2jJGJf7qG3zi3xG(zkcOB5C853l0vGA2o24MFzumnQDVCo(8diWunoRLg1do2RiYaVZqUVjq7fhNzF(wBIDiacxCCM9rDgY9nXoe4(cne5dF7CdCXF0U4zpd0EXXz2VhN5XoeWNyvourgfOleBzatfzKNuNs0FcZK6aMkYiF32cLuNsI0K6a(C0Bnc0ptDatfzuG(zQdyQiJ9NPoGiPPWFb6cPiGJZCaBNtEDh7qG7l0qKFabuAubxAOr16mgzmGPImkqxi1bAusanw9bENHCFne5dQJBSLigaHlooZ(8T2e7qarh7vePgI8diGsJk4sdnQwNXiJb8jwLFG0u4VaDHyldCk9I5Ql1bmQgS52FDgR(aft1XJDojJ9Zzkcy9MnqnBhBCZVmAu7Vod8od5(c0fsrabMQXzT0OEWXEfrsJApoZdeaJPACwlprIeuh3yVDiGw7CDZglIdL8zqFP(BUmGsQtj6pH1lfRiSaAXRt(HgaHOHs961xsb(0rjIuGYbkPuF4UXTuiGsKiPOestSLDeqB8fF1PHiFqDCJTeXaVZqUVgI8diGsJk4sdnQwNXiJb0gFXxD8T2K6aa2kQ8P6O)kImwePKcbCCMZFP6dGn92LLpb]] )

    storeDefault( [[Brewmaster Defensives]], 'displays', 20170328.1, [[d0dxhaGELuVKe0Uib41qIMjLshwYSvQJtPQBQkQRrI0TLspNWoPyVIDJY(jP(PQYWOQ(nIXPkIHskdMKmCOCqPQJscOJjfNJeQfsLwkLWIPklNOhQk8uWYuswhjqtKsLPcXKrQMUkxuv6QKiUSIRdvBKs6zKO2ms2UQQpsP4ZqQPPks9DLyKKq2gLiJMkgpK0jrk3IsuNgvNxQ8ys1AvfjFds40eKa6f2XjmRe2bx3Ec8PeeBPzEdCLe9CA)AXlGSyONhoJokJBaVnF9AB2KL4fO7JIsm3Jc74eMig)aO(rrjM7rHDCcteJFa7Xh8HonDcd4RNywP0aTCw)BmkhWE8bFO)OWooHjIBGUpkkXCiLe9CIy8dOaXh8reKyAcsGxw5Th6XnqV(Xjm1QSLlUywfWuTta7gQHj4)JiGfZEkXeZk)gl147RCaqxYXUa5Yfa1pkkXCiLe9CIy8dW1jmaR05m0XO0axjrpxpt3Hid4(HG89Sf0Srrib6IXYRSKFauJvl)euOyl5RyLvQsvSpkEIIBqrOS8tJIachYcsjrpNiUbqPxpt3HidG8PzbnBuesaDsRxDA)VXlGEHDCcRNP7qKbC)qq(EoaGn68AZxxhNWIzLLEsaHdzbqIBa7Xh8XoUC0poHfWcA2OiKam8wA6eMiMMacSzVTUlHZdYMidsGkMMaEX0eaDmnbKX0KlGWHS8OWooHjIBau)OOeZ1JlRy8du4YcPdBc4HtrfOTqTh)iX4hO2yov)EP6eA)VX0eO2yof4qw0(FJPjqTXCQhKwV60(FJPjGPANaUYzPTe3ivRYUHAyc()icu7LQtO9Rf3a)Cb3JV5xhsh2eWlGEHDCcRFZrZc841G8Ara6Cb2U6q6WMa0dilg6bPdBcuE8n)6cu4Y6zoBIBau6zLWoGVEIPzvGAJ5uiLe9CA)AX0eWUHQW3xCdiNDGhVgKxlciWM926UeoXlqTXCkKsIEoT)3yAcG6hfLyoAm6C96isrm(bShFWh60y0561rKI4gGIWUa9sETvRYusjzjWvs0ZzLWUaAiQvbftOwLPKsYsGRKONZkHDW1TNaFkbXwAM3apxOYBXBvRcH3oXOSFaHdzPh)iXnaOl5yxGa1gZP63lvNq7xlMMafUS6z6oeza3peKVNT91ksamjVTKDwjSd4RNyAwfato6KwV661SnGRCwAlXnsfuTk7gQHj4)JiqHllAmkcsh2eWdNIkqBHA)Bm(bqQ9Wo1QSrsWXIXpWvs0ZP9)gVawm7PetmR8BqHVYnkRaAcOj5TLStTQhf2XjSa0hQcFFb6(OOeZPqxrm(bq9JIsmNcDfX4hq4qw6XLfngfjEbeoKfTFT4gO7JIsmxpUSIXpGWHSqJrNRxhrkIBaHdzP)nUbQ9s1j0(FJBGAJ5uGdzr7xlMMachYI2)BCdOtA9Qt7xlEbeoKffoDECgDodTiUbkCzbyZEtZUy8dGspRe2fqdrTkOyc1QmLuswc0Yzasm(bUsIEoRe2b81tmnRcGspRe2bx3Ec8PeeBPzEdOxyhNWSsyxane1QGIjuRYusjzjqTXCQhKwV60(1IPjWlR82d94gqWBX2t)3BmRcqFOk891RzBax5S0wIBKkOAv2nudtW)hraVnF9AB2KL(9oEb0lSJtywjSd4RNyAwfOLZ6Xpsm(b0K82s2Pw1Jc74eMAv94YkqamjVTKD00jmGVEIrz)aCgDUEDezpt3HidybnBuesa7Xh8PFZrZAh2fqpaxNWEkcPngL9dyp(Gp0TsyhWxpX0SkqBHkGetta7Xh8HUcDfXnq3hfLyoAm6C96isrm(bkCzPeg)cGTRUrMlba]] )


    Commit( 'initializeClassModule', MonkInit )
    Hekili:ReInitialize()

end
