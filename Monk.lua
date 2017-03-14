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
        end)

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


    storeDefault( [[Brewmaster: Default]], 'actionLists', 20170313.1, [[dWZngaGEisAtKu2fPABuO9rsvZgQ5dr53GwNqYTb8yb7Ku2RQDlz)q4NqcdtbJdIuNhsAOqeAWa1WjOdQqNIKkDmk60kTqcSuG0ILQLt0dHe9uultiEoLMievtLenzfnDrxKc(MuYLrUUq5Wu9mPOntc2oj0NHuVwOAAcPY8GiXiHiQVtsgTqkJxivDsG4Ve6AqeCpPulskCisQyuqe5BELNnuEhtZl4mlKcRJxKQNlSUweJi9znhGolqsQaCBsYOqag5KcEmCEguctULUwKbZwdMrmQBEMdYvyE(8yixyzVYRzELNnuEhtZl4mhKRW8CcrJgt6BLKugtyApp2x8MOE2kKCPy08AkAt5gNodsn3GNq55cw0zqjm5w6ArgmnA2sFO5znhGoZcjxIams2RjcWCk340ZRf5kpBO8oMMxWzoixH55eIgnM0dqiEcvvw1qsidz9ykOGEhdHtCmBQhtiYqw6s0uQNlajMqX5siL2ghu3ZJs02ZLdqTH4POkxEESV4nr9SqyUW6mi1CdEcLNlyrNbLWKBPRfzW0Ozl9HMN1Ca6mseMlSEETMx5zdL3X089ZCqUcZZPxX3cTAbiepHQk9vclB8Te7ssLEiAUenzBhGq8eQQ0xjSSX3sSljv6HO5s0KveWJE12kab2cT40bC0KytR6hop2x8MOEELWYgFlXUKuDgKAUbpHYZfSOZGsyYT01ImyA0SL(qZZAoaDgejSSX3cbybss1ZRfDx5zdL3X089ZCqUcZZXSK4KuGk7QizppkrBpxoa1UHajPcWTjjJcbyKtkqLDvKSnop2x8MOEo4ySOhYfwI41MNbPMBWtO8Cbl6mOeMClDTidMgnBPp08SMdqNroPav2vrY(8AiHR8SHY7yAEbN5GCfMNvN0XuL6DShIdJLIbiqhQtL3X0unpKRIKiveWsw1BEEuI2EUCaQDdbssfGBtsgfcWC610LteGhrHHgNh7lEtuphCmw0d5clr8AZZGuZn4juEUGfDguctULUwKbtJMT0hAEwZbOZC610LteGhrHHNxZ4vE2q5DmnVGZCqUcZZPJPk17ypehglfdqGouNkVJPPAEixfjrQiGLSQ388OeT9C5au7gcKKka3MKmkeGrjeOdraEefgACESV4nr9CWXyrpKlSeXRnpdsn3GNq55cw0zqjm5w6ArgmnA2sFO5znhGoJsiqhIa8ikm88ATUYZgkVJP5fCMdYvyEwDshtvQ3XEiomwkgGaDOovEhtt18qUksIuralzBBEEuI2EUCaQDdbssfGBtsgfcWC610LteGzLnop2x8MOEo4ySOhYfwI41MNbPMBWtO8Cbl6mOeMClDTidMgnBPp08SMdqN50RPlNiaZkFEnK(kpBO8oMMxWzoixH550XuL6DShIdJLIbiqhQtL3X0unpKRIKiveWs22MNhLOTNlhGA3qGKub42KKrHamkHaDicWSYgNbLWKBPRfzW0Ozl9HMNbPMBWtO8Cbl6SMdqNrjeOdraMvEESV4nr9CWXyrpKlSeXRnF(8mYjf8y48cE(da]] )

    storeDefault( [[Brewmaster: Defensives]], 'actionLists', 20170313.1, [[dOtveaGEbO2esLSlLSnLQ2NaYSP0VHCBLY6ivIDkf7fSBv2pfgLsLggszCcapMOHsQKgmfnCv5GKkofsfhtkDEcwiuAPeQfJKLl6Hkv0tPAzcLNJWevQWujvnzv10j5IqHtl5YOUUG(jPs51eInlKTtQuTkbYNr00eG8DPAKivQ)cvJMugVq1jrQ6wcOUMaO7jq9mcPdR4BqrdTGEWX4gkl)bSG7pwwJTc4rvOdAITpaaVz2yWXMCFBiuCQlgM7GJ4JO0DMa8DWrtOvbybxmB5HGHMy0AXKwBS9RwWfZZxqFTXGVRHPeHSFu)wVWSIeQJeNk5(sQnjjtGVnXnmdSHPeHSFu)wVWSIeQJeNk5(sQnjjtGhLJuvOBSgM0XWmidtjcz)O(TEHzfjuhjovY9vYsTjjzW1rQk0ra6HMwqp4yCdLL)awWBMngCS2rkIHPUf3WeBYDWfZwEiyOjgT29TyUOjk40F)sokuc(HogCxM1tbUeHSFu)wVWSIeQJeNk5(sQnjjtemnW1HQSLsaCk7ifbhfhNk5oOGMyGEWX4gkl)bSGVZ5Pk0bo4nZgdUUgMvKqDKgMytUdUy2YdbdnXO1UVfZfnrbVRXNyE(cGpHke40F)sokuc(HogCDOkBPea)fMvKqDK4uj3b3Lz9uGdkOruqp4yCdLL)awWDzwpf4seY(r9B9cZksOosCQK7lP2KKmrWseY(r9B9cZksOosCQK7lP2KKmb(2ehCDOkBPeaVs0risD4uj3bN(7xYrHsWp0XG7YSEk9cpgCvTXG3mBm40NOJqK6mmXMChCXSLhcgAIrRDFlMlAIcUyE(c6Rng8DnmLiK9J636fMvKqDK4uj3xsTjjzc8TjUHzGnmLiK9J636fMvKqDK4uj3xsTjjzc8OCKQcDJ1WKogMbzykri7h1V1lmRiH6iXPsUVswQnjjdExJpX88faNqM1tbkOjGa9GJXnuw(dybVz2yWXi(JTgM09KBGlMT8qWqtmAT7BXCrtuW1HQSLsaCo(JT4AtUbo93VKJcLGFOJb3Lz9uGRXJTosCINgN8sIcpvGcULU2vJhRsB95OswQafmHAuRrPgPi4puNZGWCfGbPXJTosCINgN8sIcpfDaVRXNyE(cGpHkeOaf4UmRNcCqba]] )

    storeDefault( [[Brewmaster: Combo ST]], 'actionLists', 20170313.1, [[dOZSdaGAcQA9eaVKqXUivBdfTpcqZMOBdvRJaYob1EP2nQ2pqnkcOggPmocvDyrdLGudgKgUcoOG6ueuCmuAzqPfQilffwmelNKhsqPvrqLhl0ZH0ejiAQsYKbmDPUOaEMGCzKRdInsGYPvAZsQ(Ma9zO4ReeMgbjFNqL)QO2ebsJMqMhbItkP8Af6AekDEGSscu9uv)wInRR8dWtejb4j)hv7q77dN4K)KIehEI2KsGadvyl4ifWqFLVqs1tiY2t(mijLOKHXQXguJfltDwFgucaQAXjF)WXElCuxzywx5hGNiscWt(Wjo5pjZ4ybsdg6B1osGHkWI5cJ)JQDO97us8whrMXXcKEowWrk6eprKeGGMXElC9rcZmkEIksxrjaO5EXjbbteq4y1fRpdkbavT4KVFyKvUniFezghlq6z0wTJKFnoWgZUO85fo5ZGKuIsggRglt2G6AH8FuTdDfObYhDXJUnmwx5hGNiscWt(Wjo5lgcdyOhprf5ZGKuIsggRglt2G6AH8RXb2y2fLpVWj)WiRCBq(JeMzu8evK)JQDO9DB4qUYpaprKeGN8HtCYFsMXXcKgm03QDK8zqskrjdJvJLjBqDTq(14aBm7IYNx4KFyKvUniFezghlq6z0wTJK)JQDO9DByHYv(b4jIKa8K)JQDO99zqskrjdJvJLjBqDTq(14aBm7IYNx4KpCIt(mGGkA5yadvWtacmuHy5a(Hrw52G8vqqfTCmZcFcqZIB5aUnSyDLFaEIijap5)OAhAFacbs966JeMzu8evKoKbFgKKsuYWy1yzYguxlKFnoWgZUO85fo5dN4K)KIYweyOL6GHkyRI8dJSYTb5JOOSfnxQpxFvKBdZ0v(b4jIKa8KpCIt(vlgsbgQqNsCFgKKsuYWy1yzYguxlKFnoWgZUO85fo5hgzLBdYVxmKAEiL4(pQ2H2N4Kcdi9ieLI4TaQ52T)hO4MYvaYElCdJLP4DBd]] )

    storeDefault( [[Brewmaster: Combo AOE]], 'actionLists', 20170313.1, [[dCdPdaGAcfTEvr5LekTlvLTbQ2NQinBs9nKyNISxQDJy)QQ(jHqdJGFlQHsiyWQsdxqhePCmO6XGSqHSuKQfdLLtYdju5PkldiphstKqktfOMmGPRYfHOdl1LrDDiSrcrghHO2SQWNfQtl5Res10iK47eQ6zeP)ckJgjnEvrCsb8Ab6AekCEIyLQIQBtuRJqsBCd2djPX0mGJ8gKQcppprJF0i0NJ8OZAUrzNajGtrahe8pCVfYqvRRN1xLjobcUi7rd6Qmb1GDc3G9qsAmnd4iVulZEiFsOoduK4)xXYXE0zn3OStGeWHJt5tqQxacqb1xw5rYe2JgwPRtIh)KqDgOiXWcYXEdsvHNNpNazWEijnMMbCKxQLzpXYX)VtUrP6rN1CJYobsahooLpbPEbiafuFzLhjtypAyLUojEb5yyOYnkvVbPQWZZNtsnypKKgtZaoYl1YSN4Ow)VriuONhDwZnk7eibC44u(eK6fGauq9LvEKmH9OHv66K4brTGHHqHEEdsvHNNpNefd2djPX0mGJ8sTm7fP4(O()MF8)ksLI9OZAUrzNajGdhNYNGuVaeGcQVSYJKjShnSsxNepmf3hvy5hWEuk2BqQk88aymepE8fKJHHk3Ou)qe6ZjXWG9qsAmnd4iVbPQWZZJoR5gLDcKaoCCkFcs9cqakO(YkpsMWEPwM9OJaLArI)FFEdW)VIEra8OHv66K4PqGsTiXWeZgGHj(Ia4Zj4gShssJPzah5nivfEEmHvXs(GqOum5EQGhDwZnk7eibC44u(eK6fGauq9LvEKmH9sTm7bUIz1)Ri0AzpAyLUojExfZkyHTw2NtumypKKgtZaoYBqQk888OZAUrzNajGdhNYNGuVaeGcQVSYJKjSxQLzViDdfmJ4(F3PQGShnSsxNepmDdfmJ4GHEQki7ZNxQLzViflE5g9yLO()kUSmw()LMiI0Nna]] )

    storeDefault( [[Brewmaster: Standard ST]], 'actionLists', 20170313.1, [[d0Z7eaGAru16fsYlveAxc12qk7tiLMnrZxrWVf1JvX3irphs7uP2l1UHA)QuJseLgMaJtrKBlOHQsWGHOHtkhKK6uIOYXqY5erQfQKwkjzXiA5eEOIOEkyzi06esXefrYuHWKvy6Q6IKWPL6YOUUsSrre9mHyZivBxLOVRs6RQeAAcPQ5jII)ksVwrA0kQXlK4KIWNjvxteHZJGvkKuhwYMesLnLryqbUiL8WRgan(0LSJQ67m2BI0MKHKIPxlY3RguXsUqzVjgqPmGIiTykdWr0AVbdQpFNXOgH3ugHbf4IuYdVAyxHSHjY63iHWcD2GkwYfk7nXakAukJdIyibE0N6Zcd4mMnahrR9gmOMSL9tWWuwpfnSqN97nrJWGcCrk5HxnahrR9ggm5cD6Xtz9u0WcDoErBctyWKl0PhJQXNUKPdw2xYccXlAguXsUqzVjgqrJszCqedjWJ(uFwyaNXSb1KTSFcgifC9ZPz6P0BbByxHSHvbx)8nYm9BKjzly)EhXimOaxKsE4vdWr0AVbdQyjxOS3edOOrPmoiIHe4rFQplmGZy2GAYw2pbdKY6mnV8POVONYg2viByvwNP5L)gj8IEk737O3imOaxKsE4vdWr0AVHtolh5R4yTfrtNqJ1tjf814ZCj0z0K5KZYr(kowBr00j0y9usbFn(mxcDgnnSIIb1KTSFcg(wNfPALm0qc8Op1NfgWzmByxHSbeTolUrEHsgAqfl5cL9MyafnkLXbr87DsyeguGlsjp8Qb4iAT3Wx4Pnwp6q)sxNfXvyEb)rR2IOPti9Nfm6CwomOMSL9tWahfnzE0y90PSUHe4rFQplmGZy2WUczdkIIMmpAS(nYjY6guXsUqzVjgqrJszCqe)EtZimOaxKsE4vdWr0AVbdQyjxOS3edOOrPmoiIHe4rFQplmGZy2GAYw2pbdIf05gRNM81GtV24HHDfYguTGo3y9BKrDn4BKxSXd)ER0imOaxKsE4vdWr0AVbdQjBz)emCM7uYfb6BibE0N6Zcd4mMnSRq2WKN7BKRlc03GkwYfk7nXakAukJdI437jzeguGlsjp8Qb4iAT3GbvSKlu2BIbu0OugheXqc8Op1NfgWzmBqnzl7NGHZCNETUKnSRq2WKN7BKxSUK97DsBeguGlsjp8Qb4iAT3GbvSKlu2BIbu0OugheXqc8Op1NfgWzmBqnzl7NGHV1zrQwjdnSRq2aIwNf3iVqjdVrMSujNF)g2viByvWxdl0NfrZns4l8OeJBKac)2a]] )

    storeDefault( [[Brewmaster: Standard AOE]], 'actionLists', 20170313.1, [[dOtheaGAQe16PIOxsLk7sfTnqz2uA(uP4BiYHLStrTxYUrA)Qu)Kkrggf9BGUTqgkvuzWQKHtvDqe1POIKJbvxg1cfQLsblgklxWdPsvpvzza65imrQOQPcPMSitxvxeI(lapJkCDizJurQtl1MPk2UkuJJkL(kvsMgve(UkKhdYRvbJgunEQK6KuL(meUgvcDEk0kPsW6OIIrrfLw4cTgsAHz5KI1CE2tHY(kwlxrSwCGpkQiEo4m3x7lAQcP7lYUesndSLlcwzGM4KmXbc7exB(mux22jRVbPkdeMB1id9niLqOvgxO1qslmlNuS2GcT)RPrgRT9BuJDTVfm1ueaoWi08stnu9GbnkiL1YveRH01(wWutrCF5ogHMb2YfbRmqtCy4KonDOxzGcTgsAHz5KI1guO9FnndSLlcwzGM4WWjDA6qZln1q1dg0OGuwJmwB73O2bgbaIOIaUwUIyn3XiUVwuraxVYoeAnK0cZYjfRnOq7)AjgdLhpNhyeaiIkc4NO8DJBsmgkpEoj8zOUSasSTpMdgpr5RzGTCrWkd0ehgoPtthAEPPgQEWGgfKYA5kI1IdC9WVVa9CF50DG1iJ12(nQHf46Hda0dapDG1RSti0AiPfMLtkwBqH2)10mWwUiyLbAIddN0PPdnV0udvpyqJcszTCfXAX2c6aiQ)(AFOpWAKXAB)g1WSf0bqupaIp0hy9k7IcTgsAHz5KI1guO9FnndSLlcwzGM4WWjDA6qZln1q1dg0OGuwlxrSMbueWBkI7lxOs89LRAAsJmwB73Owafb8MIaGlxjgWrnnPxzycTgsAHz5KI1guO9FnnYyTTFJAqWBayOceVMxAQHQhmOrbPSMb2YfbRmqtCy4KonDOLRiwZ9W77RyubIxVYKeAnK0cZYjfRnOq7)AAgylxeSYanXHHt600HMxAQHQhmOrbPSwUIyn3dVVVCvDmRrgRT9BudcEd4O6ywVYUvO1qslmlNuS2GcT)RPzGTCrWkd0ehgoPtthAEPPgQEWGgfKYA5kI1q3i4W9LZv2O7lNf3P0iJ12(nQ9ncoaWVSr61RnOq7)A6La]] )

    storeDefault( [[SimC Windwalker: default]], 'actionLists', 20170313.1, [[d8tSiaWAqSEseztQsTljTnvj7JePMPGupwPMnkZhv1nvsDyvUnOopjStHAVe7wX(fyuGudJuzCKiPtl1qjrIbtrdxjoiPQtHiogI64cISqsQwQqYIPWYrArOspLQLPKSosIjki0ubjtMstx0ffu(gjLldDDvXZqKEUeBMu2ojQVJk(kjPPjiyEcQgjjI6VQQrJGpJqNui1HeKCnseUNq8quLZjiQFdSqwGs8WMZGHwrDX9fC3hRvsx2GrIx9kKfp(GrX9gMxGPQ9y5CmiivLatlQDpSu8OqgEfuIxPJSA6iV6vLS4(M2lP4IRFNnykcusmzbkXdBodgAf1fp(GrX9f8ObMk5BSbMEsBiO4(M2lP4jGirgw7jrk9zjlVHopkrmRw04rtRUVs2dX6ZcjIh9y79LaQ4dyqX1B0SoviEzbp6NWn2FjPneuCEeWnK1aLryCsXq8OqgEfuIxPJ8lYQv1rQ4Rb24dgfxsjELaL4HnNbdTI6I7BAVKINaIezyDbKnykVH24rtRwqkoDQO(SWNVXJMwTKak8hpAs4FJ9R1uS(SWNp0HkpgozTGuC6urfNZGH23jThiywxOGD9i2SovuFwiHpFJhnTQbdaSSNswFw4ZppkrmRzdJ)e8TngEKx6irC9gnRtfIVaYgmIh9y79LaQ4dyqXJpyuCLciBWiUEkXI4ZbJr4UqbmWqeT)fahKYv8OqgEfuIxPJ8lYQv1rQ48iGBiRbkJW4KIH4Rb24dgfN7cfWadr0(xaCqkxjLysfOepS5myOvux84dgfhkWZMqGjqlWmeXljiUVP9skEcisKH1naWSaot5n05rjIznBy8NGVTXWJeYKiE0JT3xcOIpGbfxVrZ6uH4j4zt4d0(w8scIZJaUHSgOmcJtkgIhfYWRGs8kDKFrwTQosfFnWgFWO4skXHGaL4HnNbdTI6I7BAVKIdDEmCYAbP40PIkoNbdTV3aaZc4m1csXPtfvkcF9ucpIos4Z34rtRwqkoDQO(SiUEJM1PcX3hJ9VD2G5Z6skE0JT3xcOIpGbfp(GrX5DmwGP(D2GjWm0DjfxpLyr85GXiC9gMxGPQ9y5CmiivLaZcsXPtfCfpkKHxbL4v6i)ISAvDKkopc4gYAGYimoPyi(AGn(GrX56nmVatv7XY5yqqQkbMfKItNk4kPeRecuIh2Cgm0kQlUVP9skEOYJHtwlifNovuX5myO9ngsp9YcARwApq6H4NaGo)nqzK(gAO3aaZc4mvTUKLpq7R9qvuPi81tj8iKFVj019dLItQ0riLe(8nE00QLeqH)4rtc)BSFTMI1Nf(83aaZc4m1scOWF8OjH)n2VwtX6MWrjILiR4ZppkrmRzdJ)e8TngEKvkbF(BaGzbCMAcE2e(aTVfVKqLIWxpfLoIsvjirC9gnRtfIVpg7F7SbZN1Lu8OhBVVeqfFadkE8bJIZ7ySat97SbtGzO7sgycnzsexpLyr85GXiC9gMxGPQ9y5CmiivLaZcQXv8OqgEfuIxPJ8lYQv1rQ48iGBiRbkJW4KIH4Rb24dgfNR3W8cmvThlNJbbPQeywqnUskXVeOepS5myOvuxCFt7Lu8qLhdNSwqkoDQOIZzWq77qHH0tVSG2QL2dKEi(jaOZFdugPVHg6JMT2TZAjPne8d0(jb8ZPhldqTvCodgAFVbaMfWzQLK2qWpq7NeWpNESma1wPi81tj8iKdH3BaGzbCMQwxYYhO91EOkQue(6PeEKxV3aaZc4mvAx6H4V8mFi9gsLIWxpLWJ8Ie(8nE00QLeqH)4rtc)BSFTMI1NfsexVrZ6uH47JX(3oBW8zDjfp6X27lbuXhWGIhFWO48oglWu)oBWeyg6UKbMqVIeX1tjweFoymcxVH5fyQApwohdcsvjWSGACfpkKHxbL4v6i)ISAvDKkopc4gYAGYimoPyi(AGn(GrX56nmVatv7XY5yqqQkbMfuJRKsSAcuIh2Cgm0kQlEuidVckXR0r(fz1Q6iv84dgfN3XybM63zdMaZq3LmWeAsjrC9uIfXNdgJW1ByEbMQ2JLZXGGuvcmDO4kUEJM1PcX3hJ9VD2G5Z6skE0JT3xcOIpGbfNhbCdznqzegNumeFnWgFWO4C9gMxGPQ9y5CmiivLathkUskP4HiQDpSuuxsra]] )

    storeDefault( [[SimC Windwalker: precombat]], 'actionLists', 20170313.1, [[b4vmErLxtvKBHjgBLrMxc51utbxzJLwySLMEHrxAV5MxojJn541uofwBL51utLwBd5hyxLMBKDxySTwzYPJFGbNCLn2BTjwy051usvgBLf2CL5LtYatm3atmYyJlX41utnMCPbhDEnLxtf0y0L2BUnNxu5LtX4fvEnvrUfMySvgzEjKxtn1yYLgC051u092zNXwzUa3B0L2BUnNxtfKyPXwA0LNxtb3B0L2BU51uj5gzPnwy09MCEnLBV5wzEnLtH1wzEnfuVrxAV5MxtfKCNnNxt5wyTvwpIaNCVX2BUDwzK9fCVDxzYjIxtjvzSvwyZvMxojdmXytm34cmZ41udHwzJTwtVzxzTvMB05LyEnvtVrMtH1wzEnLiWj3BS9MBNvgzFb3B3vMCI4fDErNxtruzMfwDSrNxc5fDE5f]] )

    storeDefault( [[SimC Windwalker: sef]], 'actionLists', 20170313.1, [[di0(iaqikv1IOk1MKkgfjvNIKYSKsClkvs7cjddHoMuSmk4zsvnnkvIRrvsBtQY3qqJdsrNtkPSoKQAEiv5Eiv2NusoivLfcP6HKstesHlkLAJqkDsssVKsLYmPuf3KuStsmukvQwkc8uIPsv1xPuXEv9xigmLCyflMu9yrMSOUmQntL(msz0uXPH61ukZwWTfA3k9BqdNQy5aphrtxY1HKTts8DPsJNQeNNcTEPKQ5tPkTFk63C)xAVJEGZh9lIhoHNaU1Ncd3RyOxRDrzI8fbh1AAzh8M7obBmG(MwKS7fc4apK8vmqSHqIng6r1CrsaSN6YfFPcdxY7)kn3)L27Oh48r)IYe5l(X0yGPLDFcXlscG9ux4Lb0msLqba8w0XldOzKkoEPtYbtLqba8w0R5IQBgNMccUSWLV4thhWLXlfMgdq8mH4fToCYMgOkCK366xiGd8qYxXaXMEnesrS)fnWSYe5lVUIH7)s7D0dC(OFrzI8fFG0SSPLFiaWBDrsaSN6sbPrlWujimKHDxYoQNCWuXXl21KdMkHca4TAfDnD4Lb0msv4iJuqK44LwrhrkVQ2fv3monfeCzHlFXNooGlJxgqAwgPGaaV1fToCYMgOkCK366xiGd8qYxXaXMEnesrS)fnWSYe5lVUs)7)s7D0dC(OFHaoWdjFfdeB61qifX(xuMiFr7ecMw(sfgUMw2dMSU4dqJ8YorMoVfCuRPLDWBU7eSXa6BAPfn8(IpDCaxgVKMqazsfgUibmzDr1nJttbbxw4Yx06WjBAGQWrERRFrdmRmr(I3coQ10Yo4n3Dc2ya9nT0IgE)6k2L7)s7D0dC(OFrzI8fPGGylMwThq50IP1Sztl0Ib8fjbWEQlfKgTatLGWqg2Dj7OU91r56srwqqeHhq5GmBgXfdykuE6OEccdzy3LQGOsoiqxKmpLdfGJdEjPhDOP9AVjimKHDxQcIk5GaDrY8uouaoo4LSvOPxvtTlQUzCAki4Ycx(IpDCaxgVqwqqeHhq5GmBgXfd4lAD4Knnqv4iV11Vqah4HKVIbIn9AiKIy)lAGzLjYxEDfVE)xAVJEGZh9lktKVifeeBX0Q9akNwmTMnBAHwmGnTuVrTlscG9uxkinAbMkbHHmS7s2rD7RJY1LISGGicpGYbz2mIlgWuO80jbHHmS7srwqqeHhq5GmBgXfdyQKZaOXK0zqTlQUzCAki4Ycx(IpDCaxgVqwqqeHhq5GmBgXfd4lAD4Knnqv4iV11Vqah4HKVIbIn9AiKIy)lAGzLjYxEDLE3)L27Oh48r)IYe5lsbbXwmTApGYPftRzZMwOfdytl1nO2fjbWEQlfKgTatLGWqg2Dj7OU91r56srwqqeHhq5GmBgXfdykuE6udGgxufoYifejJz6rNbVQ2fv3monfeCzHlFXNooGlJxiliiIWdOCqMnJ4Ib8fToCYMgOkCK366xiGd8qYxXaXMEnesrS)fnWSYe5lVUcH3)L27Oh48r)IYe5lsbbXwmTApGYPftRzZMwOfdytl17R2fjbWEQlfKgTatLGWqg2Dj7OU91r56srwqqeHhq5GmBgXfdykuE6KGWqg2DPCXKfjc0fXffWifGJdEjPhDnDsoyQekaG3Qv01xTlQUzCAki4Ycx(IpDCaxgVqwqqeHhq5GmBgXfd4lAD4Knnqv4iV11Vqah4HKVIbIn9AiKIy)lAGzLjYxEDf08(V0Eh9aNp6xuMiFbTyYI00c6AAHwuaJxKea7PUOJY1LISGGicpGYbz2mIlgWuO8Cr1nJttbbxw4Yx8PJd4Y4fxmzrIaDrCrbmErRdNSPbQch5TU(fc4apK8vmqSPxdHue7FrdmRmr(YRR0A3)L27Oh48r)IYe5leGjXlntlb1AAz3WjBxKea7PUOJY1LISGGicpGYbz2mIlgWuO80j5GPsOaaEl6m0HxgqZivcfaWBrpEzanJuXXlxuDZ40uqWLfU8fF64aUmEbGjXlnesulInCY2fToCYMgOkCK366xiGd8qYxXaXMEnesrS)fnWSYe5lVUsdX7)s7D0dC(OFHaoWdjFfdeB61qifX(xuMiFr7ecMw(sfgUMw2dMSmTuVrTl(a0iVStKPZBbh1AAzh8M7obBmG(MwIFVV4thhWLXlPjeqMuHHlsatwxuDZ40uqWLfU8fToCYMgOkCK366x0aZktKV4TGJAnTSdEZDNGngqFtlXV3VEDbny3bvOo6V(b]] )

    storeDefault( [[SimC Windwalker: serenity]], 'actionLists', 20170313.1, [[d8JGhaGAIk16rjfVeLKDbKTPOSpIkzMOKQEnkMnvEmHBcuhIuWTrLZdODQs7vSBj7xrgfrv1WuHXrubNwQNRudwHgok1bjPofrv5WQ6CevPfsswkfzXKy5u1db4PqlJu16uGAIkqMkP0KvY0bDrvuFtr1LrUUcAJevXZOO2Scy7eLVtk6RQinnIkQ5HskTisH(lQA0KkFMcNeL4ye5AOKk3tfXkjQiBIOc9BkDKI2GNRxXrROkiYMe97AwZdBBLR(zYBW7ZrbXMdW04PDT08DmKFWtJBYtvdbg0e5OFt5Q)qA(HK(zGKcIcFZggmOAbST1oAZvkAdEUEfhTIQGMih9Bkx9hsZKMd6WCW7Zrbb8o30OAbST10iRV3WGQ9g7G1ZrNOrS5amnEAxlnFhd5h80iGbPXGQvAxdbgu8oh)lGTT4D9ggKLA1IhA9blBrbbOJemGTYioQGrjiy76(CuqnInhGPXt7AP57yi)GNgbmingyU6J2GNRxXrROk495OGi5PQHadIcFZggeAnmCeiH16wwnRDqwQvlEO1hSSffuTs7AiWGBYtvdbgeGosWa2kJ4OcgLGMih9Bkx9hsZKMd6WCqW2195OGbMR5On456vC0kQcEFokic9ndnnAhyAeQJMgpTRLZ6xbnro63uU6pKMjnh0H5GQvAxdbgCd9ndXBhGhQJ41SRLZ6xbzPwT4HwFWYwuqa6ibdyRmIJkyucc2UUphfmWCLZrBWZ1R4Ovufef(Mnm4lGTmINkIRPnR1Cq1kTRHad67Dxg87HfptlycYsTAXdT(GLTOG3NJcAQ3DzmnIdRPrw1cMGQ9g7GcGchXdFVbb3Nif0e5OFt5Q)qAM0CqhMdcaOWrAFVbb3rvqa6ibdyRmIJkyucc2UUphfmWCzDrBWZ1R4Ovuf8(Cuq5P3W90ODGPr5zOhyqtKJ(nLR(dPzsZbDyoOAL21qGbhO3WnVDa(bg6bgKLA1IhA9blBrbbOJemGTYioQGrjiy76(CuWaZDw0g8C9koAfvbVphfez3v1LX0ia)x00iRAbtqu4B2WGVa2YiEQiUM2Y1jMLJAGTNKXBiwGKaTz3v1LbVW)fXZ0cMGSuRw8qRpyzlkOAL21qGb3S7Q6YGx4)I4zAbtqa6ibdyRmIJkyucAIC0VPC1FintAoOdZbbBx3NJcgyUZJ2GNRxXrROkik8nByWxaBzepvextB56eZbvR0UgcmOV3DzWVhw8mTGjil1Qfp06dw2IcEFokOPE3LX0ioSMgzvlyMgLFj5lOAVXoOaOWr8W3BqW9jsbnro63uU6pKMjnh0H5GaakCK23BqWDufeGosWa2kJ4OcgLGGTR7Zrbdmx5q0g8C9koAfvbVphfez3v1LX0ia)x00iRAbZ0O8ljFbrHVzddQb2EsgVHybsc0MDxvxg8c)xeptlycYsTAXdT(GLTOGQvAxdbgCZURQldEH)lINPfmbbOJemGTYioQGrjOjYr)MYv)H0mP5GomheSDDFokyG5kVrBWZ1R4Ovufef(MnmOgy7jz8gIfijqkUxWyhc5zAbtq1kTRHadQ4EbJDiKNPfmbzPwT4HwFWYwuW7Zrbv5EbJDiCAKvTGjOAVXoOaOWr8W3BqW9jsbnro63uU6pKMjnh0H5GaakCK23BqWDufeGosWa2kJ4OcgLGGTR7ZrbdmxPJOn456vC0kQcEFokOPHBDDzmnkN(fnnEAxRGOW3SHb1aBpjJ3qSajbYpCRRldE5(xeVMDTcYsTAXdT(GLTOGQvAxdbg0pCRRldE5(xeVMDTccqhjyaBLrCubJsqtKJ(nLR(dPzsZbDyoiy76(CuWadm4GOb(Hoyufyca]] )

    storeDefault( [[SimC Windwalker: ST]], 'actionLists', 20170313.1, [[dqePraqiufwevQ0Miv1OivXPiv4wuPe7cvggu1XiLLrL8mfLPrLs5AqPyBqjFdQ04qvKohvQY6qveZtOkDpsL2huQoivPfkuEiLQjsLkUiuXgHsPtIQ0kPsj9suf1mPsP6MOQ2jsnuHQQLQO6PetLQ4RKQ0EL(lIgSQYHHSyk5XKmzfUmyZiPptfJgkoTsRwOQ8AHmBb3gHDl63umCQQJtQOLJYZvLPRY1rITtP8DHkJNkfNxrwVqvmFQuv7xv1vREQGtIScWOXQi(GArHnEq3AYs7cl3RcnIaQilH9)p9U5iouicy8K)pXtL5qaqpO0UWRHlEnxyXPvruS1)QuXR6wt(QNsRvpvWjrwby0yvMdba9Gs7cVgwA4YHFwfAebuXoke()8QU1K)FU99Dv8YCEvsebOR7klH9)p9U5iouicy8K)p7UJ7wXR1g2BQIcfcKi1TMKmSVRcV5yvOZWQKMeQyhdOI4BSbeqE1QcFZGgravCxzjS))P3nhXHcraJN8)z3DC3EL2v9ubNezfGrJvHgravWjbMZgpB68)HtyDZYQik26FvGeyotCkkmgKx8cjWCM4iqUrFfMLtrHXG8IxD1QWBowf6mSkPjHkET2WEtvGeyoB8SPdjew3SSk2XaQi(gBabKxTQmhca6bL2fEnS0WLd)Sk8ndAebuPxPNvpvWjrwby0yvOreqfVmfkH)ppggdYRIOyR)v5moobGtzmHHjU8PVEuywocKBClkmlNIcJb5HDD10hsG5mXDlbqEgscKBWUU45WgDuH3CSk0zyvstcv8ATH9MQGykucKNHXG8QyhdOI4BSbeqE1QYCiaOhuAx41Wsdxo8ZQW3mOreqLEL2TvpvWjrwby0yvOreqf5yBe8)zO()DyG)p9U5iyyJkIIT(xfqNuwFFyWPmPnG5aPcinujPIo4P)HcqECpGb5EtCqIScWqFLXegM4sUhWGCVjogqG28HDD1WxH3CSk0zyvstcv8ATH9MQ8o2gbKgQKhgGmUnhbdBuXogqfX3ydiG8QvL5qaqpO0UWRHLgUC4NvHVzqJiGk9kn2upvWjrwby0yvOreqf5yBe8)zO()DyG)p9U5iyyJ)p9OPJkIIT(xfqNuwFFyWPmPnG5aPcinujPIo4PppouaYJ7bmi3BIdsKvagv4nhRcDgwL0KqfVwByVPkVJTraPHk5HbiJBZrWWgvSJbur8n2aciVAvzoea0dkTl8AyPHlh(zv4Bg0icOsVsJv9ubNezfGrJvHgravKJTrW)NH6)3Hb()07MJGHn()0JlDuruS1)QWdqNuwFFyWPmPnG5aPcinujPIo4vH3CSk0zyvstcv8ATH9MQ8o2gbKgQKhgGmUnhbdBuXogqfX3ydiG8QvL5qaqpO0UWRHLgUC4NvHVzqJiGk9knU1tfCsKvagnwfAebubB339()mu))WwkSPkIIT(xfqNuwFFyWPmPnG5aPcinujPIo4P)HcqECpGb5EtCqIScWqFLXegM4sUhWGCVjogqG28HDDXMk8MJvHodRsAsOIxRnS3ufQ77EKgQKuPWMQyhdOI4BSbeqE1QYCiaOhuAx41Wsdxo8ZQW3mOreqLELMNwpvWjrwby0yvOreqfSDF37)Zq9)dBPWM()0JMoQik26FvaDsz99HbNYK2aMdKkG0qLKk6GN(84qbipUhWGCVjoirwbyuH3CSk0zyvstcv8ATH9MQqDF3J0qLKkf2uf7yaveFJnGaYRwvMdba9Gs7cVgwA4YHFwf(MbnIaQ0R0Ux9ubNezfGrJvHgravW29DV)pd1)pSLcB6)tpU0rfrXw)RcpaDsz99HbNYK2aMdKkG0qLKk6GxfEZXQqNHvjnjuXR1g2BQc19DpsdvsQuytvSJbur8n2aciVAvzoea0dkTl8AyPHlh(zv4Bg0icOsVsRHVEQGtIScWOXQik26Fv4HpdSr6OgCAC36amsFuGqFibMZeNIcJb5PlKaZzIJa5g9vywoffgdYlE1DM(wuOsL7DggbjGyhgsuoiPUmGJIFfVwByVPk36amsFuGOcV5yvOZWQKMeQqJiGkEwhG9)f)OarfVmNxf1KkaKhI5a3txTkZHaGEqPDHxdlnC5WpRI9jva8GyoW9ASk2XaQi(gBabKxTQW3mOreqLELwtREQGtIScWOXQik26FvaDsz99HbNYK2aMdKkG0qLKk6GN(hka5X9agK7nXbjYkad9vgtyyIl5EadY9M4yabAZh211vfVwByVPkS9TPd5JssgTQOk8MJvHodRsAsOcnIaQmFFB68)juY)pEEvrv8YCEvutQaqEiMdCpD1Qmhca6bL2fEnS0WLd)Sk2NubWdI5a3RXQyhdOI4BSbeqE1QcFZGgrav6vAnx1tfCsKvagnwfrXw)RcOtkRVpm4uM0gWCGubKgQKurh80Nhhka5X9agK7nXbjYkaJkET2WEtvy7BthYhLKmAvrv4nhRcDgwL0KqfAebuz((205)tOK)F88QI()0JMoQ4L58QOMubG8qmh4E6Qvzoea0dkTl8AyPHlh(zvSpPcGheZbUxJvXogqfX3ydiG8Qvf(MbnIaQ0R0AZQNk4KiRamASkIIT(xfEa6KY67ddoLjTbmhivaPHkjv0bVkET2WEtvy7BthYhLKmAvrv4nhRcDgwL0KqfAebuz((205)tOK)F88QI()0JlDuXlZ5vrnPca5HyoW90vRYCiaOhuAx41Wsdxo8ZQyFsfapiMdCVgRIDmGkIVXgqa5vRk8ndAebuPxP1CB1tfCsKvagnwfAeburVywwytN)p3HHCm5)x8tjvyQmhca6bL2fEnS0WLd)SkET2WEtvIdZYcB6qoyihts6tjvyQWBowf6mSkPjHk2XaQi(gBabKxTQW3mOreqLELwdBQNk4KiRamASk0icOIDgsff205)ZTIgW)NBFDWC5MovefB9VkGoPS((WG7WaKaHpWmShPc5Ju7zy6BrHkvUddqce(aZWEKkKpsTNHX9oKkc76Q5Ev4nhRcDgwL0KqfVwByVPkkgsff20Hm(qdGmSoyUCtNk2XaQi(gBabKxTQmhca6bL2fEnS0WLd)Sk8ndAebuPxP1WQEQGtIScWOXQqJiGkI)M5Mo)F2zOe()45vfvruS1)QOhK6wBajKaXcpSR7m339F(BMB6qQyOeiJwveNYqjpSR7mDOpp8zGnsh1GtJ75VzUPdPIHsGmAvrv4nhRcDgwL0KqfVwByVPkp)nZnDivmucKrRkQIDmGkIVXgqa5vRkZHaGEqPDHxdlnC5WpRcFZGgrav6vAnCRNk4KiRamASk0icOYCkpmB68)5wrd4)tVBoQik26FvuywocKBClkmlNIcJb5HDn95HpdSr6OgCACmkpmB6qgFObqg3MJk8MJvHodRsAsOIxRnS3ufgLhMnDiJp0aiJBZrf7yaveFJnGaYRwvMdba9Gs7cVgwA4YHFwf(MbnIaQ0R0A806PcojYkaJgRIOyR)vrpkmlNIcJb5HDn339TOqLkNLjI0NzuCu81H(8WNb2iDudonoRasfzOCKrRkQIxRnS3ufRasfzOCKrRkQcV5yvOZWQKMeQqJiGkXcivKHY9)XZRkQIxMZRIAsfaYdXCG7PRwL5qaqpO0UWRHLgUC4NvX(KkaEqmh4Enwf7yaveFJnGaYRwv4Bg0icOsVsR5E1tfCsKvagnwfAebuXoM9)tViBqfrXw)RcKaZzI7wcG8mKei3GDDDX5cBQWBowf6mSkPjHkET2WEtvuywY4q2Gk2XaQi(gBabKxTQmhca6bL2fEnS0WLd)Sk8ndAebuPxPDHVEQGtIScWOXQqJiGk2XS)FXOWExfrXw)RcKaZzI7wcG8mKei3GDDDX5cBQWBowf6mSkPjHkET2WEtvuywslkS3vXogqfX3ydiG8QvL5qaqpO0UWRHLgUC4NvHVzqJiGk9kTlT6PcojYkaJgRIOyR)vHh(mWgPJAWPXDRdWi9rbIkET2WEtvU1byK(OarfEZXQqNHvjnjuHgrav8Soa7)l(rbI)p9OPJkEzoVkQjvaipeZbUNUAvMdba9Gs7cVgwA4YHFwf7tQa4bXCG71yvSJbur8n2aciVAvHVzqJiGk96vXDaQikHRX61ca]] )

    storeDefault( [[SimC Windwalker: CD]], 'actionLists', 20170313.1, [[d8JQjaWAsy9QeQnbv2LuTnIK9rPI6XeoSsZMkZxkPBksopf62i50i2PuSxu7wv7NcgfrQHjsnovc(Mkv)LQgmfz4qXHuP0PichdQ64uQ0cvjTurWIjQLtQhcL8uflJIADuQknrvIMkLYKHmDjxue6RQeYLbxhP2iLQIptsBMs2UuQVtIMfLkmnvkMNiQNlQXsPQQrRIXtPkNue5zqPUgLQk3tkX5Ouroir0VfMXZ24jXFLDaIVYZGbeK1rU4TiXZnMLYoXtZsb8mekSmy6Iips56uaA7RbtyDjpjaoyZa3yon(7PXBwQoEEgHMGP4Hhjffj(mBJBWZ24jXFLDaIVYtZsb8K03ouagmz)PH3omyQoGbtx0HuGbt2iQGMNrOjykEQqv1bDreouO8Z8K0JiITcnpF8apsktCKYipKVDOa82JgEEW6acfPI2af8flZtcGd2mWnMtJxk837PXMNubQzPaE4IBmZ24jXFLDaIVYtZsb8C1fbYGj7dT2ipJqtWu8uHQQd6IiCOq5N5jPhreBfAE(4bEKuM4iLrEKDrG8w0AJ8G1beksfTbk4lwMNeahSzGBmNgVu4V3tJnpPcuZsb8Wf3GnBJNe)v2bi(kpnlfWZvqNbTcYRYZi0emfpvOQ6GUichku(zEs6reXwHMNpEGhjLjoszKhzqNbTcYRYdwhqOiv0gOGVyzEsaCWMbUXCA8sH)Epn28KkqnlfWdxCZnSnEs8xzhG4R8KAThHIMY2QvHkZJzEgHMGP4Pcvvh0fr4qHYpJt6BxDrSwr1vxh4LP15Qd)k7aeoWU0emyau)qqi49uBUaD2BfAzccbVVcAXbN0y0qBVQa1n3RGwC8HLhbBDATvmAOTxvG6y3RGwC8HLhbBDATvmAOTxvG630RGwC8HLhbBDKqcEKuM4iLrEQGwC8HLhbBD4jPhreBfAE(4bEAwkGhBbT4yWuyzW0LWwhEKuRM5ryu4aFTAvOYTG3oOw75fgfoWxRwfQClM5jbWbBg4gZPXlf(790yZdwgfoW2QvHkZx5bRdiuKkAduWxSmpPcuZsb8Wf3y)yB8K4VYoaXx5PzPaESf0IJbtHLbtxcBDmysA8sWZi0emfpvOQ6GUichku(zCsF7QlI1kQU66aVmToxD4xzhGWDlyxAcgmaQFiie8EQnxGo7TcTmbHG3xbT4ibpj9iIyRqZZhpWJKYehPmYtf0IJpS8iyRdpyDaHIurBGc(IL5jbWbBg4gZPXlf(790yZtQa1SuapCXnsX24jXFLDaIVYtQ1EekAkBRwfQmpM5zeAcMINkuvDqxeHdfk)moPxDrSwr1vxh4LP15Qd)k7aeoWU0emyau)qqi49uBUaD2BfAzccbVVcAXbNichku(9CPjkaFy5Rd4vsEKl0OUgOwYNt(c4er4qHYVBrYv2hwElATXUgOwYNtULBWjIWHcLFxtYKx1NPFVcIqrxdul5ZjFhN0y0qBVQa1n3RGwC8HLhbBDATvmAOTxvG6y3RGwC8HLhbBDATvmAOTxvG630RGwC8HLhbBDKqcEKuM4iLrEQGwC8HLhbBD4jPhreBfAE(4bEAwkGhBbT4yWuyzW0LWwhdMK2Se8iPwnZJWOWb(A1QqLBbVDqT2ZlmkCGVwTku5wmZtcGd2mWnMtJxk837PXMhSmkCGTvRcvMVYdwhqOiv0gOGVyzEsfOMLc4HlU5oBJNe)v2bi(kpnlfWJTGwCmykSmy6syRJbtsJTe8mcnbtXtfQQoOlIWHcLFgN0RUiwRO6QRd8Y06C1HFLDac3T16GV6zqdpPm2HFLDac3TGDPjyWaO(HGqW7P2Cb6S3k0YeecEFf0IdoreouO875stua(WYxhWRK8ixOrDnqTKpN8fWjIWHcLF3IKRSpS8w0AJDnqTKpNCl3GteHdfk)UMKjVQpt)EfeHIUgOwYNt(ooXH0f0An8LDUfZsWtspIi2k088Xd8iPmXrkJ8ubT44dlpc26WdwhqOiv0gOGVyzEsaCWMbUXCA8sH)Epn28KkqnlfWdxCZfyB8K4VYoaXx5PzPaESf0IJbtHLbtxcBDmys6BKGNrOjykEQqv1bDreouO8Z4KE1fXAfvxDDGxMwNRo8RSdq4Q1bF1ZGgEszSd)k7aeUBb7stWGbq9dbHG3tT5c0zVvOLjie8(kOfhCIiCOq53ZLMOa8HLVoGxj5rUqJ6AGAjFo5lGteHdfk)UfjxzFy5TO1g7AGAjFo5wUbNichku(DnjtEvFM(9kicfDnqTKpN8Dj4jPhreBfAE(4bEKuM4iLrEQGwC8HLhbBD4bRdiuKkAduWxSmpjaoyZa3yonEPWFVNgBEsfOMLc4HlU45sWAPDfFLlMb]] )


    storeDefault( [[Windwalker Primary]], 'displays', 20170313.1, [[dWtXeaGEc0UiGABeuZuuOdRYSjAzKQUjG6zIsUTqNNuzNc2R0Ufz)u(jOudJu(TQ60qgkknyQgoHoOO6OKihdfNJaYcbflfk1Ivklxjpuv6PipwvSorPMiu0ubQjdQMoQUiaxLefxwX1bzJeKpdvTzLQ2ou5JIc(kuyAeGVRuzKGs6BKO0OjHXdLCsrr3IKUgOe3JevEoqwljQ61aYLPGlPe0anWnxOFIBoHeCAGrFjwCSMRAo4BHF4DRe7cfVLoZFpro6NmphADLkTgzPxabWaWUKYaAmNehPui5bsr3kXIdG5QMd(w4hE3kXIdG5QMJ5S)GK8ctjwCamx183FC74DReWhwOiu0CWO40qwALu()p2adSuIfhR5QMJ5S)GKCZZLIkUgykXIJ1CvZF)XTJ3TsS4ynx1CmN9hKKxykPRbv9cRvkh2amx1CGpSqrOydALWEKZbAAqVgJYQXOxybMPe2xc)y(RI5biucFPBdjrCDLyXbWCvZF)XTJBEUuuX1atjwCSMRAo4BHF4MNlfvCnWuIfhR5QM)(JBh38CPOIRbMskbnqJ55se(uCs8spLYF4OFY83tKJ(jqfMsy1Gwjs8Eqj8nalLiXrkfsEGuy(7x(xfCPRbMsBnWucFdmLwnWuEP3VOoZb)lHbkbF3jbAwMNdBaLyxO4T0zUq)e3Ccj40aJ(skbnqJ5yIwZdh9tLWoZmaRGlH5S)GK8ctjLGgObU5z(8tMtibNgeGwjH(jEjayjUgqG2D6kbiDBYbEHPe7cfVLoZZ85NmNqconiaTsSlu8w6m)9e5OFQe)w4hoOs5WgG5QMdmkHIqXgYQejopOtIe84OFQb9clqLY85NazoP4Vl1Gakb(KtIBEgwFiXg0krOeE5yUQ5aFyHIqXgykfU4ucduc(Utc0SmNDHI3sxjwCamx1CW3c)WnpxkQ4AGPuoe)BUQ5aJsOiuSbTs5q8V5QMd8HfkcfBqReHs4LJ5QMdmkHIqXg0kPe0anGk4gyk4sas3MCGxykL)Wr)K5zebIxIqXxZXaLGV7KanRSnxCnp)42XlfU4uIqXxZXaLGV7KanRSnxCnp)42XlH9iNd00GEngHz00YQe9SqI8sCuCuoTYBqFbxcq62Kd8ctP8ho6NmpJiq8sek(AogOe8DNeOzLT5WN9hKKxkCXPeHIVMJbkbF3jbAwzBo8z)bj5LWEKZbAAqVgJWmAAzvE5LyXbWCvZXC2FqsU55srfxdmLONfsKxQ8w]] )

    storeDefault( [[Windwalker AOE]], 'displays', 20170313.1, [[d0t2eaGEuQ2fPuABGuhwLzkkPBlYSj5AqvDtq05vs(MQOEUQYofSxPDl0(P8tvrggPACKsXZuIgkbdMQHtKdkQokPKJrOZjkvleKSuuOfRuwoqpuv1trwMOyDkHMikYuHIjdvMoQUOs1vjLQUSIRdQncv5ZqPnRkSDuYhfLYxrbtdLY3vsnsrj8yvPrtkgpkQtQeClI60qUhPu53awROe9Aq4kwmL0cEGhCMJhqKBoHyFAqmtjbwcMlBoMde7W7wjbqu6axz()jXrarZZHbVsLahvP)9aMDglP9FJ5K0Ou4PUpnDRejDVOi2gWVKaRDZLnNP5XbR4fQscS2nx28FG02X7wjipMrj4K5yqPPHL6LYsaGudI4xsGLG5YMZ084GvCZZvsAUgeljWsWCzZ)bsBhVBLeyjyUS5mnpoyfVqvAvXt(z8HMnOxQnzpd(lX)zDO17dz2WVeZnOxIXrn330qgDXN1fZaT2kwIXlIDm)xZ8cbkIT0THui(QscS2nx28FG02XnpxjP5AqSKaikDGRmFHxGO5eI9Pb20ljWsWCzZ)bsBh38CLKMRbXs0lisIx6dfXQMscS2nx2CMMhhSIBEUssZ1GyjcfXQgZLnhsueLGtnSSuomhWCzZH8ygLGtnOxIKgLcp19PX8FafayXu6AqSeydILW2GyPTgelVejnVOtHy)4iGydzGo7LyAECWkEHQKwWd8yotiW5LJaILyCHSLfykLdZbmx2Cirruco1WYsAbpWdoZx4fiAoHyFAGn9scS2nx2Cmhi2HBEUssZ1GyP94TPgCfQscSemx2Cmhi2HBEUssZ1GyjcfXQgZLnhYJzuco1GEP8N2nx2Cirruco1WYsyo1e5MNnqayPg0lTWlq8ZCsdW6ydSvk)PDZLnhYJzuco1GEjbqu6axz()jXraXs8de7W)kjaIsh4kZXdiYnNqSpniMPeEarEPDMLaNVV13QsHlnLyafXT(uqmGMN)0EPFaPvMJbOedOiU1NcIb088N2ljWA3CzZXCGyhE3kPf8apFftdIftP94TPgCfQs5VCeq08SI(4Liu63CgqrCRpfed4IMlboVaPTJxkCPPeHs)MZakIB9PGyax0CjW5fiTD8smoQ5(MgYOlcTOU(Ys0lisIxIJsJ2PxEdzkMs7XBtn4kuLYF5iGO5zf9XlrO0V5mGI4wFkigWfnh384Gv8sHlnLiu63CgqrCRpfed4IMJBECWkEjgh1CFtdz0fHwuxFz5Lxk)LJaIM)FsCeq8Rqvsl4bEmpxHWgttKx6T8wa]] )

    storeDefault( [[Brewmaster Primary]], 'displays', 20170313.1, [[dOZueaGEuKDriX2erZKqsZMQUPc1Hv52IACke7Kk7vA3a2pLFkenmf8BfDnqsdfsdM0WjQdkshff1XG4YkTqc1sjelwvz5cEik8uKLjuEoiMOimvGAYePMouxuv1vjKYZesxxv2ii13isAZcvBhiFuHKpdktdK47OKgPcPEmOA0OuJhL4KcHBrWPr15jI1rivRLiHxtKOlsbxksqBWFs6xjMF7BL2uONaytjotBDiXkHcc1ubtbFbylUFLqd88fKykJtgZNaMM(cxPsH1xIXVd8ViLeniRPK869q7piS7xjs(GZbGvhulHc63ubttSXVNhxXLqb9BQGPmM5Vd3VsJpw45x2uW88wx0HssXCMRdbQLqbHAQGPj243ZJnn1lZ(QdPekiutfmLXm)D4(vcfeQPcMMyJFppUIljPoHyjhkXsHoz0OrrgrQqfj2ijhsMmAJlaLrkjY63dYwxSbePoGelPOGuI53(wtt9Cya5faxcEjuq)MkykJz(7WMM6LzF1HucfeQPcMc(cWwSPPEz2xDiLqbHAQGPmM5VdBAQxM9vhsjcEGlJlvcf0VPcMMyJFpp20uVm7RoKsehaMFnvW0XCaE(LRBOeAGNVGetJa(eWuIZ0whugkrYR3dT)GW2ugt)muWLU6qkfQdPeS6qk9vhsXLymLLyk4zjXHL18bbVbttJ8Vu6dpnvW0Xhl88lx3qjMF7BnnbpSWX8jqjrIyuJgCP0hEAQGPJ5a88lx3qjMF7BL20iGpbmL4mT1bLHsOG(nvWuWxa2Inn1lZ(QdP0pW95xPR4sehaMFnvW0Xhl88lxhsjWNFbWMoQW8jx3qP0i)nvW0XCaE(LRlAPiGpbGykXEYkqDrlX8BFlKcUoKcU0pW95xPR4sPWX8jGPIkhcUK4WYA(GG3GOBAIn(984sUlVLsSXVNhxsK1VhKTUydijrggIwIGh4Y4sfxCj0apFbjMY4KX8jqj8fGTyiLqd88fKyk0taSPeNPToKyLCxEljoSSMpi4nykAGNVGKsqpbWLsd8ZBQ7cHjRLsSXVNhxXLi5fo)8CMomFcuxSKJucf0VPcMc(cWwC)kLg5VPcMo(yHNF56gkLchZNaMY4KX8jaKkUKihaS1ugSx4sjhawP7J75yjf3ca]] )

    storeDefault( [[Brewmaster AOE]], 'displays', 20170313.1, [[dSZzeaGEKIDbIQTrKMjjsMnPomWnvKEnik3wHRbc7uO9kTBvA)u(jsPHjs)wvEgegkugmvdNKoOahLiCmiDoseTqsyPivTyf1Yf1dHkpf1YeuRJeftuenvqzYcIPJ4IQORsIuxwPRRQ2OIyCiv2mr12bvFKevFgKMgr03HQAKKi8yiA0eLXdv5KGi3cjNMW5fHNRcRLeL(MG0fTWktl8nRbj6Czj(7FdX8jVlXCwqZ2iA4YyzXaKty(K3LyolOzBenCzSSyaYjmhhqLiExZd(zq5Y5vxg3ze2j9Lv6J1CwD16jAWHSoxMvbifxOncrzm4NMtzEYvo4Rjvrzm4NMtzoU3ygq6C5Pa8eJ)WCyIX2iI0Yk77nAefIYmYSqLu(qCHQ3YyWXmNYCCVXmG05YyWXmNY8KRCWxtQIYj6eQqHqQKsrqNsggceqeAQ00kNssikJxNifbceO0fkeOHPtAQuPiQCkjPRm9REbhBJHtrdnfnSuihTm9Gl01CCYwKqM4cTmywOfKeLd(KN5uMpfGNy8hnMwgllgGCcZHeY31CwqZ2OKPLzXfQEnNY8PIRy8hnIOSe)9VMhOfqVJ9skJSCasI4DnhhqLiE3JQOCaTNMtz(uaEIXF0yAzm4NMtzomqg6s6CzwD16jAWHmZX90VCHvg0iA55grldTr0Y5grlPmUNAcZH9kRiV4pahKnBEaTNLz1fPaOf0aiI3TXWsPRSe)9VMNuKxKeX7wMEiPCLaw5iySLvKx8hGdYMnpG2ZYs83)gI5qc57AolOzBuY0YtExs5GSaOnpcY5h(LpVGz9gsvugdoM5uMddKHUKoxgllgGCcZXbujI3TmbKHUKJYb0EAoL5tfxX4pAerzj(7FpkSgrlSYNxWSEdPkkhGKiExZvkXbPSI8I)aCq2SYyEYvo4RjLJGXwo5kh81KY0V6fCSngofvkAAkIYmYSqLuUKskdjKV7H5SSh(3gruggqVxI5kp)(QnMwMfxO61CkZNcWtm(Jgtlh8jpZPmFQ4kg)rJikJb)0CkZHbYqxI5bAvzGgrlNCLd(Asvugd(P5uMJ7nMbeZd0QYanIwgdoM5uMddKHUeZd0QYanIwgdoM5uMJ7nMbeZd0QYanIwgd(P5uMNCLd(AI5bAvzGgrlJbhZCkZtUYbFnX8aTQmqJOL0c]] )

    storeDefault( [[Brewmaster Defensives]], 'displays', 20170313.1, [[dSJqeaGEev7IiITHintqPmBHoSQUPsPLrQ62k5zGIDsYEL2TO2pv)uPOHjWVbmoqjdfsdMYWf0bfPJseogeNJuYcjvwks0IvQwUkEis6POEmqToIinrI0ubPjJeMoHlcIRskWLvCDvAJaPtd1MrkBxeFKuOpdQMgPG(UsHrseLVHigns14ruojPu3cHRrk68aXZjQ1ckvVMiQUifA5ntMt8bP7LL4o3Hc3afilCJXKpvHOVmAcQBeUb9pWhr3lJEWR)aIBu)qbgi7w698LlFMyzQquqHqzznqECJdNye04ltV7LrtG4gHBq)d8r09YOjqCJWnPdT)gfvxz0eiUr4gvG1(l6E5Tpz41D5gu8AQcMGYWoaWQkyckZGp4qr5YOjOUr4gvG1(l6Ez0eu3iCt6q7Vrr1vgKQi0tAq50nH4gHBBFYWR7QQGYuoX5LNQ0hGqsaIEsLeKYu(z4JBuPpGLCCgE5FhhXcqkNEfaUr422Nm86UQkOm6bV(diUPnyGSBmM8PkyckZ4m844gHBBXz86UQkOSe35oULgXWZRjlkdUCkybgi7g1puGbYYvxzYkOeWIeTinqly0utTcibwAHqsPrOHKuMdNye04lt3nQarGtHw(RcP8EviLHxfs5tvivuMdhW4pIj)fyGCv6jfwL5WhmodVknllXDUJBsXNbSadKltP2AuYGwg9Gx)be3afilCJXKpvHOVSe35ou4M2GbYUXyYNQ0Rzz1VMY6oZgRxwmh3Ko0MSmozKldj)7XHIQRmOazr50d(JUP(ZbyJYOh86pG4g1puGbYLPyO93OOC6MqCJWTT4mEDxvbtzjUZDKl0Qqk0YqY)ECOO6kNcwGbYUbByzrzDNzJ1llMJK6M0H2KLXjJCz1VMYshAtwgNmYLPCIZlpvPpaHuKGaykZGp4qr5kQOS2GbYYUX0b2ixfszOFCYc304b4gwvqzgNHhh3iCB7tgEDxvHuo9kaCJWTT4mEDxvfugnbIBeUb9pWhHBPXq6FviLLo0(BuuDLrtG4gHBubw7VWT0yi9VkKYOjOUr4g0)aFeULgdP)vHugnb1nc3OcS2FHBPXq6FviLrtG4gHBshA)nkClngs)RcPmAcQBeUjDO93OWT0yi9VkKkAba]] )


    Commit( 'initializeClassModule', MonkInit )
    Hekili:ReInitialize()

end
