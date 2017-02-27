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


    storeDefault( [[Brewmaster: Default]], 'actionLists', 20170126.1, [[dWZngaGEisAtKGDrHTje7JIkZgQ5dr1Vb9ybFtk5WuTtszVQ2TK9du)eIYWKIXbrQZdjnuiIAWqy4e0bvOtrsLogP60kTqcSuG0ILQLt0dHeEkQLjKwhfLjcjAQKKjROPl6IuK)sOlJCDHQxluEMcSzsOTts5ZqQBdyAuuL5brWiHiY3jrJMKQgpejojq8CkDnkQQ7PGwKuQdrsfJcIqF9R6SPY7yAEbNzHuyD8Iu9CH11IgbPpJssrpooVGZGsyYT01I2O3QrxVXq)mhKRW885XqUWYEvxt)QoBQ8oMMxWzoixH55eIgnMm2kjPmUW0EESV4nr9Svi5sr171u0MYngDgKAUbpHYZfSOZAoaDMfsUemcKKxtWi4uUXOZGsyYT01I2OhrVLrZGNxl6vD2u5DmnVGZCqUcZZjenAmzeGq8eQSSkGeroY7XvurJogcN4420iUqKJ80LOP0ixasmHIZLqcdJ0OUNhLOTNlhGgcXtrLU88yFXBI6zHWCH1zqQ5g8ekpxWIoR5a0zKmmxyDguctULUw0g9i6TmAg88AdUQZMkVJP57N5GCfMNtVITfAfcqiEcvwgRew2yBj2LKsJG6DjAYomaH4juzzSsyzJTLyxskncQ3LOjRiGJuuyRaeyl0IthWrtIdSMR58yFXBI65vclBSTe7ss5zqQ5g8ekpxWIoR5a0zqKWYgBlWieijLNbLWKBPRfTrpIElJMbpVM5DvNnvEhtZ3pZb5kmph3sItsrQSRAK98OeT9C5a0W2cKKsa3MK0mWiqjPiv2vnY2(8yFXBI65GJXIEixyjIxBEgKAUbpHYZfSOZAoaDgLKIuzx1i7zqjm5w6ArB0JO3YOzWZRz(x1ztL3X08coZb5kmpRoPJPkn6ypedgpfdqGo0GkVJPPcEix1irQiGLSMt)8OeT9C5a0W2cKKsa3MK0mWi40RPlNGrmImtTpp2x8MOEo4ySOhYfwI41MNbPMBWtO8Cbl6SMdqN50RPlNGrmImtNbLWKBPRfTrpIElJMbpVwKR6SPY7yAEbN5GCfMNthtvA0XEigmEkgGaDObvEhttf8qUQrIuralznN(5rjA75YbOHTfijLaUnjPzGrGciqhcgXiYm1(8yFXBI65GJXIEixyjIxBEgKAUbpHYZfSOZAoaDgfqGoemIrKz6mOeMClDTOn6r0Bz0m451ADvNnvEhtZl4mhKRW8S6KoMQ0OJ9qmy8umab6qdQ8oMMk4HCvJePIawYou)8OeT9C5a0W2cKKsa3MK0mWi40RPlNGrWQAFESV4nr9CWXyrpKlSeXRnpdsn3GNq55cw0znhGoZPxtxobJGvDguctULUw0g9i6TmAg88Ai9vD2u5DmnVGZCqUcZZPJPkn6ypedgpfdqGo0GkVJPPcEix1irQiGLSd1ppkrBpxoanSTajPeWTjjndmcuab6qWiyvTpdkHj3sxlAJEe9wgndodsn3GNq55cw05X(I3e1ZbhJf9qUWseV28SMdqNrbeOdbJGv985znhGolqskbCBssZaJaLKIECC(8ha]] )

    storeDefault( [[Brewmaster: Defensives]], 'actionLists', 20170126.1, [[dOtveaGEbO2euQSlLSnsf7taz2u63qUTszDKkXofQ9c2Tk7NcJckLHbfJta4XenusL0GPOHRkhKq6ukv6ysX5jyHiLLsOwmswUOhQurpLQLjL65imrLkmvsvtwvnDsUOsvNwYLrDDb9tsLYRrQSzHSDsLQvjq(mIMMaKVlvJekv9xOA0KY4Lsojsv3sa11eaDpbQNrioSIVbLm0a6bF)nuw(d0a3FSSgBfWJQqhe3wNaa84zJbNwY9THqXPUyyUdoIpIs3zcW3bhnHwfqdCXSLhcgIBJPblmnnywnGlMNVG(AJbhBgMseY(r9B9cZksOosCQK7lP2KKmb(20YWmWgMseY(r9B9cZksOosCQK7lP2KKmbEuosvHUXAyURHzqgMseY(r9B9cZksOosCQK7RKLAtsYGlQuvOJa0dXnGEW3FdLL)anWJNngCA2rsNHPU1YWKwYDWfZwEiyiUnMgDAWAHreWP)(LCuOe8dDm4Isv2sjaoLDK0HJAHtLChCxM1tbUeHSFu)wVWSIeQJeNk5(sQnjjtemgqbXTb9GV)gkl)bAGhpBm46Aywrc1rAysl5o4UmRNcCW358uf6ahCXSLhcgIBJPrNgSwyebC6VFjhfkb)qhdUOuLTucG)cZksOosCQK7G314tmpFbWNqfcuqSiGEW3FdLL)anWDzwpf4seY(r9B9cZksOosCQK7lP2KKmrWseY(r9B9cZksOosCQK7lP2KKmb(20cCrPkBPeaVs0rqxD4uj3bN(7xYrHsWp0XG7YSEk9cpgCvTXGhpBm40NOJGU6mmPLChCXSLhcgIBJPrNgSwyebCX88f0xBm4yZWuIq2pQFRxywrc1rItLCFj1MKKjW3MwgMb2WuIq2pQFRxywrc1rItLCFj1MKKjWJYrQk0nwdZDnmdYWuIq2pQFRxywrc1rItLCFLSuBssg8UgFI55laoHmRNcuqCab6bF)nuw(d0apE2yW336XwdtSFYnW7A8jMNVa4tOcbUy2YdbdXTX0OtdwlmIao93VKJcLGFOJb3Lz9uGRXJTosCINgN8sIcpvGcUb7WMgpwL26ZrLSubkyc1OwJsns6WFOoNbH1kadsJhBDK4epno5LefEQDbxuQYwkbW5wp2IRn5gOaf4UmRNcCqba]] )

    storeDefault( [[Brewmaster: Combo ST]], 'actionLists', 20170126.1, [[dOZSdaGAcuTEsPAtOuyxKQxRG9HsjZMKBdvRdLsTti2l1Ur1(bXOqPIHrOXHsrhw0qjGAWa1WvuhuqofbIJHILHswOcTuO0Ib1Yj6HeO8uvpwONdPjsG0uLKjdy6sDrb6VkYLrUoiTrcqNwPnlP6BcQpdfFfLQAAeq(oPKMhkvAveaJMu8mbCsjLTrqxJuIZdKvIsvEjPu(TeBgx5hKNWkcWJ(pk3523hjXj)rjPv8eTjjBdbSGvWHlqa)kFbLQNqvTh9XskkrjJWsKjSidJOoJpwkbavT4KVFOyVfoQRmcJR8dYtyfb4r)hL7C73PI4ToSkJdfO9uSGdx0jEcRia2iJ9w46deMju8evJUKsaqt9ItSlMiGaWORfFKeN8hvzCOaTHa(TChiiGzhTDbXpe8Q2gKpSkJdfO9eAl3bYhlPOeLmclrgHmH1fd4xJdSXSlsFEHt(yPeau1It((pk35Uc0m5JU4r3gHLR8dYtyfb4rFKeN81gHbc4JNOA8XskkrjJWsKrityDXa(14aBm7I0Nx4K)JYDU99dbVQTb5pqyMqXtunUnsax5hKNWkcWJ(ijo5pQY4qbAdb8B5oq(yjfLOKryjYiKjSUya)ACGnMDr6ZlCY)r5o3((HGx12G8HvzCOaTNqB5oqUnIa5k)G8ewraE0)r5o3((yjfLOKryjYiKjSUya)ACGnMDr6ZlCYpe8Q2gKVekQMLJzsWtaAsRlhWhjXjFSqr1SCmqaZEjabbm7VCa3grlUYpipHveGh9FuUZTpabdTED9bcZekEIQrh6SpwsrjkzewImczcRlgWVghyJzxK(8cN8dbVQTb5dlPS1mvQpvFLKpsIt(JskBnqaxQdbSaUsYTre6k)G8ewraE0hjXj)QfdjHawGtfUpwsrjkzewImczcRlgWVghyJzxK(8cN8FuUZTpXjjgq6rOsjXB2s0pe8Q2gKFVyi50CQWD72)ZuCt1Q9S3c3iSeYMUTb]] )

    storeDefault( [[Brewmaster: Combo AOE]], 'actionLists', 20170126.1, [[dCdPdaGAcfTEvr6LQIyxQQETa2NQOmBsDBIANISxQDJy)Qk)KqWWi43IAOesAWQsdxqhejogKwNQOAHczPivlgILtYdju5PkpgONdLjsiLPcvMmGPRYfbvhwQlJ66G0gjKQNrK2SQWNfQtl5ReImncj(oHsJJquFdPmAOQXtOQtkq)fuUgHcNNiwjHqldeBdjTrnop4KgrZaoYBGQk888sTm7fPyXk3yhRE(3R4YYi5VxkIaCp6SMBm2jicO0eqrf(r9widwTUEAFvM4eeQIShfWRYemJZjuJZdoPr0mGJ8sTm7bx8H6mqrI)EFch7rN1CJXobraLkkTFbPEbjafyFzLhjtyVbQQWZZJcsPRtIhl(qDgOiXWcWX(CcIX5bN0iAgWrEPwM9Ech)9o5gdVhDwZng7eebuQO0(fK6fKauG9LvEKmH9gOQcpppkiLUojEb4yyyYngEFoj148GtAend4iVulZEIdF99gbvHDE0zn3yStqeqPIs7xqQxqcqb2xw5rYe2BGQk888OGu66K4bIVGHavHD(Csumop4KgrZaoYl1YSxKI7d)3B(X3ROxk2JoR5gJDcIakvuA)cs9csakW(YkpsMWEduvHNhaJa9XJ)aCmmm5gd)p0qpkiLUojEikUp8WYpG9OuSpNedJZdoPr0mGJ8gOQcppp6SMBm2jicOurP9li1libOa7lR8izc7rbP01jXtbfdFrIHjMnadtSfbWl1YShDOy4ls83Ri2a83RiveaFor148GtAend4iVbQQWZJjSkwYpiuLIj3Ze8OZAUXyNGiGsfL2VGuVGeGcSVSYJKjShfKsxNeVRIzfSWwl7LAz2dxfZQVxrT1Y(CIMX5bN0iAgWrEduvHNNhDwZng7eebuQO0(fK6fKauG9LvEKmH9OGu66K4HOBWazOhmStvbyVulZEr6gmqg699UtvbyF(8en(rdvFoYNna]] )

    storeDefault( [[Brewmaster: Standard ST]], 'actionLists', 20170126.1, [[d0Z7eaGAru16fsPxQiQDjuBJeTpHKA2enFfH(TOESsDBb9xrANQyVu7gQ9drJsePggPACQe6YOgQkbdgcdNuoij1PesLJHKZjIOfQOwkszXiSCcpurKNcwgIADIOYefrPPQsnzfMUQUij50s9mH46kPnkKQ(gs1MjHTlK47QK(QIGPjKI5jIIxRi9CinALy8QeDsr4ZcCnreopISsHKCyjBsejBkFBqfUiK8WZganE3LSJ267m2hYkVOHtfYgMf81Wc9zrYHeb8fEuIbseWTbASKlu2hY6u01PO0JPmaBrR9gmOE)DgJ6BFO8Tbv4IqYdpB4uHSHjZbiraHf6IbASKlu2hY6ukPOhRhXqc8O31NfgWzmBqnrl7NKHPCqkAyHUya2Iw7n43hY(2GkCri5HNnaBrR9ggmXQcfXt5Gu0WcDjEvBItCWeRkueJQX7UKPdw2rHfKIx1mqJLCHY(qwNsjf9y9igsGh9U(SWaoJzdNkKnml46xqIiRajIOVfSb1eTSFsgieC9lPzfPkAb73Ni(2GkCri5HNnaBrR9gmqJLCHY(qwNsjf9y9igsGh9U(SWaoJzdNkKnmlR9086Jeb8IEkBqnrl7NKbczTNMx)u0x0tz)(en(2GkCri5HNnaBrR9g25SCKVIJ1wfTcsnoiLqWxJ3lLiGrtMDolh5R4yTvrRGuJdsje8149sjcy00W6sdQjAz)Km8Dals1kzOHe4rVRplmGZy2anwYfk7dzDkLu0J1Jy4uHSH7oGfirCHsg63NKW3guHlcjp8SbylAT3Wx4PnoiPq)kiGfXvyEf)rT2QOvqk9xem6swomOMOL9tYaFPMmpACq6uoWqc8O31NfgWzmBGgl5cL9HSoLsk6X6rmCQq2GQl1K5rJdqIyYCGFFu6BdQWfHKhE2aSfT2BWanwYfk7dzDkLu0J1JyibE076Zcd4mMnCQq2aTv0LghGeruvdgjIj04Hb1eTSFsgeROlnoin5RbNETXd)(q33guHlcjp8SbylAT3Gb1eTSFsg2lDkXQa9nKap6D9zHbCgZgOXsUqzFiRtPKIESEedNkKnmPLgjI5vb673Nl6BdQWfHKhE2aSfT2BWanwYfk7dzDkLu0J1JyibE076Zcd4mMnCQq2WKwAKiMqff2GAIw2pjd7Lo9Aff2VpjPVnOcxesE4zdWw0AVbd0yjxOSpK1PusrpwpIHe4rVRplmGZy2WPczd3DalqI4cLmejIKMk6mOMOL9tYW3bSivRKH(9Bizzf1Q89SFBa]] )

    storeDefault( [[Brewmaster: Standard AOE]], 'actionLists', 20170126.1, [[dOtheaGAQe16PIWlPsv7sLABiLztP5tLKVHKoSKDkQ9s2nI9Rs(jvKAyu0Vb8yGgkvuAWQOHtvDqKQtrffhduJJkvwOqTukyXq1Yf8qQK6PkldcphktKkQmvKyYImDvDri1Rvbxg11HOnsLiNwQntvSDvO(li(kvknnQi57QqUTqEgfA0G04PsXjPk9zi5Aur05PcRKkbRJkQAuuj0cwu0qtkClNuSMZXEkK2xXAdm0(VMMb2YfgRmctyQMWWM3WAZNb7Y2or9narze0CNgDWVbiyIIYWIIgAsHB5KI1gyO9Fnn64TTFhASB8TaPMGcYbgLMxsQbRhiOraiSMb2YfgRmctyAWuVnnQLRiwdTB8TaPMG6609mk9kJqu0qtkClNuS2adT)RPzGTCHXkJWeMgm1BtJAEjPgSEGGgbGWA5kI1CpJ66Crfgun64TTFhAhyuqWIkmO6v2OOOHMu4woPyTbgA)xlX4i945(aJccwuHb9gPVRCvIXr6XZnMpd2LfsIT9XCWXnsFndSLlmwzeMW0GPEBAuZlj1G1de0iaewJoEB73HgEGRhkeapq80bwlxrSwCGRh61jGNRtxQdSELDkrrdnPWTCsXAdm0(VMMb2YfgRmctyAWuVnnQ5LKAW6bcAeacRrhVT97qd3wGhaq(qW(qFG1YveRfBlWdai)RZ9H(aRxzNuu0qtkClNuS2adT)RPzGTCHXkJWeMgm1BtJAEjPgSEGGgbGWA0XBB)o0ciXG2euqC5kXqoQjjTCfXAgqIbTjOUoDHkXxNUTjj9kttu0qtkClNuS2adT)RPrhVT97qdeAdbhza718ssny9abncaH1YveR5AO91zmYa2RzGTCHXkJWeMgm1BtJ6vMQOOHMu4woPyTbgA)xtZaB5cJvgHjmnyQ3Mg18ssny9abncaH1OJ32(DObcTHCuDmRLRiwZ1q7Rt3whZ6v2DIIgAsHB5KI1gyO9FnndSLlmwzeMW0GPEBAuZlj1G1de0iaewJoEB73H23O4ae)YgPLRiwJsJIdxNoBzJUoDryNrVETCfXAXb(OOc75GZFDUViPkKUoP70O1lb]] )

    storeDefault( [[SimC Windwalker: default]], 'actionLists', 20170126.1, [[d8tUiaWyLA9KeYMaODjPTbsTpbHMPGuhwLzJY8rvDtaCBq9nsLopjStHAVe7wX(PuJcqnms04ijsNwQHssOgSadxjoKGKtHOCme54cISqsklvq1IPKLJ0drvEkvldqwhPIjkiQPcsMmftx0ffsEniUm01vspxINHOAZKY2jjnpbLVss10ijQVJkgjjr8xGgnc(mcDsHulcv6AKeCpH4CccoiPQFRQfscuIh1Cwm0iQjUVG7(yTk6Y(hjgiOdbXdzu7wzPOM4HJm8kOedKss6QKejLvsI7BAVKIlU(D2)ueOKyscuIh1Cwm0iQjUVP9skE(ejYWApjsPRlzbqGZJseZQbTw10Q7RK9qSUUqM4XhmkUVGh1oqLCJXoWtAdbfxVvZ6uH4Lf8OGeUXawsAdbfpCKHxbLyGuscAs6wvsU48iGBia8QIW4KIL4rpMEF5tfF(bfhG3eFWO4skXajqjEuZzXqJOM4(M2lP45tKidRlF2)uaeyRvnTAbP40PI66cF(wRAA1s(uyq8OjbWBmGAnfRRl85dCOYJHtwlifNovuX5SyObWK2demRl0FxpInRtf11fY4Z3AvtRAX(3WwlzDDHp)8OeXSMnmcMpOPXWIaTsYexVvZ6uH4lF2)iE0JP3x(uXNFqXJpyuCv8N9pIRNsSi(CWyeUl0N9dr0aU8CqkxXdhz4vqjgiLKGMKUvLKlopc4gcaVQimoPyjoaVj(GrX5UqF2perd4YZbPCLuIjxGs8OMZIHgrnX9nTxsXZNirgw3)ZmpNPaiW5rjIznByemFqtJHfjeit84dgfhQFDtWo41Sdcz8scIR3QzDQq88x3eaFnqdEjbXdhz4vqjgiLKGMKUvLKlopc4gcaVQimoPyjE0JP3x(uXNFqXb4nXhmkUKsSklqjEuZzXqJOM4(M2lP4aNhdNSwqkoDQOIZzXqdG7)zMNZulifNovuPi81tjSikjJpFRvnTAbP40PI66I46TAwNkeFFmg4TZ(hqwxsXJEm9(YNk(8dkE8bJIZ7ym7a97S)Xoi0DjfxpLyr85GXiC9gMNDG69y4Cmiivh7GcsXPtfCfpCKHxbLyGuscAs6wvsU48iGBia8QIW4KIL4a8M4dgfNR3W8SduVhdNJbbP6yhuqkoDQGRKsSkiqjEuZzXqJOM4(M2lP4HkpgozTGuC6urfNZIHgaXqATxwqt1q7bspebj80bC)QIuabg49)mZZzQADjlGVgO2kvrLIWxpLWIqcWnHUUxPuCYqmc5KXNV1QMwTKpfgepAsa8gdOwtX66cF(7)zMNZul5tHbXJMeaVXaQ1uSUjCuIyjcq85V)NzEotEuIywZggbZh00yyrasf4ZF)pZ8CMA(RBcGVgObVKqLIWxpLqmIkvfitC9wnRtfIVpgd82z)diRlP4rpMEF5tfF(bfp(GrX5DmMDG(D2)yhe6UK2batImX1tjweFoymcxVH5zhOEpgohdcs1XoOGACfpCKHxbLyGuscAs6wvsU48iGBia8QIW4KIL4a8M4dgfNR3W8SduVhdNJbbP6yhuqnUskXqlqjEuZzXqJOM4(M2lP4HkpgozTGuC6urfNZIHgadfgsR9YcAQgApq6HiiHNoG7xvKciWaF0S1UDwljTHGGVgysab50JH9utfNZIHga3)ZmpNPwsAdbbFnWKacYPhd7PMkfHVEkHfHKkd4(FM55mvTUKfWxduBLQOsr4RNsyrGgW9)mZZzQ0U0drWY6acP3qQue(6PeweOjJpFRvnTAjFkmiE0Ka4ngqTMI11fYexVvZ6uH47JXaVD2)aY6skE0JP3x(uXNFqXJpyuCEhJzhOFN9p2bHUlPDaWarM46PelIphmgHR3W8SduVhdNJbbP6yhuqnUIhoYWRGsmqkjbnjDRkjxCEeWneaEvryCsXsCaEt8bJIZ1ByE2bQ3JHZXGGuDSdkOgxjLyDfOepQ5SyOrutC9wnRtfIVpgd82z)diRlP4XhmkoVJXSd0VZ(h7Gq3L0oayYjtC9uIfXNdgJW1ByE2bQ3JHZXGGuDSdCO4kE4idVckXaPKe0K0TQKCXJEm9(YNk(8dkopc4gcaVQimoPyjoaVj(GrX56nmp7a17XW5yqqQo2bouCLusXJpyuCVH5zhOEpgohdcs1XoWGA3klLue]] )

    storeDefault( [[SimC Windwalker: precombat]], 'actionLists', 20170126.1, [[b4vmErLxtvKBHjgBLrMxc51utbxzJLwySLMEHrxAV5MxojJn541uevMzHvhB05LqEnLuLXwzHnxzE5KmWeZnWetmW4smEn1uJjxAWrNxt51ubngDP9MBZ5fvE5umErLxtvKBHjgBLrMxc51utnMCPbhDEnfDVD2zSvMlW9gDP9MBZ51ubjwASLgD551uW9gDP9MBEnvsUrwAJfgDVjNxt52BUvMxt5uyTvMxtb1B0L2BU51ubj3zZ51uUfwBL1JiWj3BS9MBNvgzFb3B3vMCI41usvgBLf2CL5LtYatm2eZnUaZmEn1qOv2yR10B2vwBL5gDEjMxt10BK5uyTvMxtjcCY9gBV52zLr2xW92DLjNiErNx051uofwBL51utLwBd5hyxLMBKDxySTwzYPJFGbNCLn2BTjwy05fDE5f]] )

    storeDefault( [[SimC Windwalker: sef]], 'actionLists', 20170126.1, [[di0(iaqiQqTiQsTjPsJIK4uKunlPe3IkiTlKmmi1XKILrv8miX0OcIRrvsBdH8neyCqs6CsjL1HuL5rf4Eiv2NusoivLfIGEiP0eHK4IsP2iKuNKKYlPckZKke3KuStsmuQGQLIq9uIPsv1xrQQ9Q6Vqmyk5WkwmP6XImzrDzuBMk9zKYOPuNgQxtHMTGBl0Uv63Ggov0YbEoIMUKRlvTDssFxQy8uL48uW6LsQMpviTFk63C)xAVJEGZNWlItoHNaU1Ncd3R4HOw7cQWUtFOoHxiMd8qYxXd6gcq30GMQ5IKayN1Ll(sfgUK3)vAU)lT3rpW5t4fjbWoRl8YaAgOs9aaVfD8YaAgOIJx6MSXuPEaG3YbnxuMiFXpMgdmTC4tiEXNooGldxkmngG4CcXleZbEi5R4bDdrneqHgLlAT5Krnqv5iV11VO2MXPPGGllC5lAGzLjYxEDfp3)L27Oh48j8IKayN1LcsJwGPsqyid7SKDvjzJPIJxCOjBmvQha4TAfDnD5Lb0mqv4iJuqK44LwrhAkVQ(fLjYx8bsZYMw(HaaV1fF64aUmCzaPzzKcca8wxiMd8qYxXd6gIAiGcnkx0AZjJAGQYrERRFrTnJttbbxw4Yx0aZktKV86kOC)xAVJEGZNWl(0XbCz4sAcbKjvy4IeWK1fLjYx0oHGPLVuHHRPLJGjRl(a0iVStKPZBbh1AArF8M7mbJmGEMwArfVVqmh4HKVIh0ne1qafAuUO2MXPPGGllC5lAT5Krnqv5iV11VObMvMiFXBbh1AArF8M7mbJmGEMwArfVFDfhY9FP9o6boFcVija2zDPG0OfyQeegYWolzxvCSEVRlfzbbreEaLnYSzexmGP6D2vLeegYWolvb7t2iqxKmpLnfGJdEjDaDOQJ6OjimKHDwQc2NSrGUizEkBkahh8s2ku1RQR(fLjYxKccITyA1EaLDlMwZMnTqngWx8PJd4YWfYccIi8akBKzZiUyaFHyoWdjFfpOBiQHak0OCrRnNmQbQkh5TU(f12monfeCzHlFrdmRmr(YRR417)s7D0dC(eErsaSZ6sbPrlWujimKHDwYUQ4y9ExxkYccIi8akBKzZiUyat17SBccdzyNLISGGicpGYgz2mIlgWuj7bqJjPZJ6xuMiFrkii2IPv7bu2TyAnB20c1yaBAPsJ6x8PJd4YWfYccIi8akBKzZiUyaFHyoWdjFfpOBiQHak0OCrRnNmQbQkh5TU(f12monfeCzHlFrdmRmr(YRRq09FP9o6boFcVija2zDPG0OfyQeegYWolzxvCSEVRlfzbbreEaLnYSzexmGP6D2TganUOkCKrkisgZoGopEv9lktKVifeeBX0Q9ak7wmTMnBAHAmGnTuXJ6x8PJd4YWfYccIi8akBKzZiUyaFHyoWdjFfpOBiQHak0OCrRnNmQbQkh5TU(f12monfeCzHlFrdmRmr(YRRqW9FP9o6boFcVija2zDPG0OfyQeegYWolzxvCSEVRlfzbbreEaLnYSzexmGP6D2nbHHmSZs5IjlseOlIBpWafGJdEjDaDnDt2yQupaWB1k6qr9lktKVifeeBX0Q9ak7wmTMnBAHAmGnTubf1V4thhWLHlKfeer4bu2iZMrCXa(cXCGhs(kEq3qudbuOr5IwBozuduvoYBD9lQTzCAki4Ycx(IgywzI8LxxbvV)lT3rpW5t4fjbWoRl69UUuKfeer4bu2iZMrCXaMQ35fLjYxqnMSinTGUMwOUhy4IpDCaxgU4IjlseOlIBpWWfI5apK8v8GUHOgcOqJYfT2CYOgOQCK366xuBZ40uqWLfU8fnWSYe5lVUsRD)xAVJEGZNWlscGDwx07DDPiliiIWdOSrMnJ4IbmvVZUjBmvQha4TOZtxEzanduPEaG3Yb8YaAgOIJxUOmr(cXys8sZ0s6xtlhgoz8IpDCaxgUaWK4Lgcz)IyeNmEHyoWdjFfpOBiQHak0OCrRnNmQbQkh5TU(f12monfeCzHlFrdmRmr(YRR0G((V0Eh9aNpHx8PJd4YWL0ecitQWWfjGjRlktKVODcbtlFPcdxtlhbtwMwQ0O(fFaAKx2jY05TGJAnTOpEZDMGrgqptlXV3xiMd8qYxXd6gIAiGcnkxuBZ40uqWLfU8fT2CYOgOQCK366x0aZktKV4TGJAnTOpEZDMGrgqptlXV3VEDrzI8fbh1AArF8M7mbJmGEMwKS7RFa]] )

    storeDefault( [[SimC Windwalker: serenity]], 'actionLists', 20170126.1, [[d8JGhaGAIk16rjfVufPDbKTPOAFevYmrjv9ycZMkhwv3eO(lr(MIY5b0ovP9k2Tu7xrgfrv1WuHXrubNwYTrLbRqdhL6GKKtruvogQ6CevPfssTukLftILtvpeGNcTmf0ZvQjsPktLuzYkz6GUOkQdrk0LrUUcSrIQyrKc2mPOTtu(oLkFfLKPrurnpusP1rPQEgPQrtk9zk5KOeVgfxdLu5EQiwjrfztevOFtXHp6cEUFfhTI6GiBsuVRynpSmDUdNlVbThP5pWbJ6G2ih9Bk3Hh8Zo45paXhef(Inmyqvcyz6D0LlF0f8C)koAf1bvPuUccmO4DoPxaltl5Qnm495OGaENBAuLawMEAK1xByqvERDW(5Ot0awCaMgzv1l7Ehd5T)0ia7PHG2ih9Bk3Hh8Z5Nb6qFqw6vjEOXhSnnfeGwsWa2iJ4OggLGGnR7Zrb1awCaMgzv1l7Ehd5T)0ia7PHaZDy0f8C)koAf1brHVyddcnwwocKWyClJD9o495OGi5PUGadQsPCfeyWn5PUGadAJC0VPChEWpNFgOd9bbOLemGnYioQHrjil9Qep04d2MMcc2SUphfmWC1hDbp3VIJwrDW7ZrbrOVyOPrJMtJqT00iRQE5m(vqvkLRGadUH(IHKmAkb1ss2v9Yz8RG2ih9Bk3Hh8Z5Nb6qFqw6vjEOXhSnnfeGwsWa2iJ4OggLGGnR7Zrbdmx5C0f8C)koAf1brHVydd(cyjJKOM4kAZA1huLs5kiWG(AxTL0EqlXucMGS0Rs8qJpyBAk495OG2QD1wtJ4GEA80sWeuL3Ahuau4ij47Ti4(e(G2ih9Bk3Hh8Z5Nb6qFqaafos37Ti4oQdcqljyaBKrCudJsqWM195OGbMlRl6cEUFfhTI6G3NJckp1gUNgnAonkpd8adQsPCfeyqnRnClz0usZbEGbTro63uUdp4NZpd0H(GS0Rs8qJpyBAkiaTKGbSrgXrnmkbbBw3NJcgyUZJUGN7xXrROoik8fByWxalzKe1exrB56e9YrnY2tYKSelq8G2SRUR2ss4)MKykbtW7Zrbr2v3vBnncW)nnnEAjycQsPCfeyWn7Q7QTKe(VjjMsWe0g5OFt5o8GFo)mqh6dcqljyaBKrCudJsqw6vjEOXhSnnfeSzDFokyG5ol6cEUFfhTI6GOWxSHbFbSKrsutCfTLRt0huLs5kiWG(AxTL0EqlXucMGS0Rs8qJpyBAk495OG2QD1wtJ4GEA80sWmnk)8YxqvERDqbqHJKGV3IG7t4dAJC0VPChEWpNFgOd9bbau4iDV3IG7OoiaTKGbSrgXrnmkbbBw3NJcgyUYHOl45(vC0kQdIcFXgguJS9KmjlXcepOn7Q7QTKe(VjjMsWe8(CuqKD1D1wtJa8FttJNwcMPr5Nx(cQsPCfeyWn7Q7QTKe(VjjMsWe0g5OFt5o8GFo)mqh6dcqljyaBKrCudJsqw6vjEOXhSnnfeSzDFokyG5kVrxWZ9R4Ovuhef(InmOgz7jzswIfiEqkUxWygaLykbtqvkLRGadQ4EbJzauIPembzPxL4HgFW20uW7Zrbv7EbJzaCA80sWeuL3Ahuau4ij47Ti4(e(G2ih9Bk3Hh8Z5Nb6qFqaafos37Ti4oQdcqljyaBKrCudJsqWM195OGbMl)r0f8C)koAf1brHVyddQr2EsMKLybIhKFWwB1wsY9Vij7QEf8(CuqBd2AR2AAuo9lAAKvvVcQsPCfeyq)GT2QTKK7Frs2v9kOnYr)MYD4b)C(zGo0heGwsWa2iJ4OggLGS0Rs8qJpyBAkiyZ6(CuWadm495OGyXbyAKvvVS7DmK3(tJBYtDbbgyc]] )

    storeDefault( [[SimC Windwalker: ST]], 'actionLists', 20170126.1, [[dqePraqiufwevQ0Miv1OivXPiv4wuPe7cvggu6yKYYOsEMIY0OsPCnOc2guLVbv14qvKohvQY6qveZtOkDpsL2hurhKQ0cfkpKs1ePsfxeQ0gHk0jrvALuPKEjQIAMuPuDtuv7ePgQqv1svu9uIPsv8vsvAVs)frdwv5WqwmL8ysMScxgSzK0NPIrdfNwPvluvETqMTGBJWUf9Bkgov1Xjv0Yr55QY0v56iX2Pu(UqLXtLIZRiRxOkMpvQQ9RQ6QvpvWnrwby0yveFqTOWgpOBnzPDHN7vXDaQikHRXQmhca6bL2fwn8XQPHLtRIOyR)vPIx1TM8vpLwREQGBIScWOXQ41Ad7nvrHcbsK6wtsg23vHgravSJcH)pVQBn5)NBFFxfVmNxLera66UYsy))tVBoIdfIagp5)ZU74UvMdba9Gs7cRgEA4ZHDwfEZXQqNHvjnjuXogqfX3ydiG8Qvf(MbnIaQ4UYsy))tVBoIdfIagp5)ZU74U9kTR6PcUjYkaJgRIOyR)vbsG5mXPOWyqEXlKaZzIJa5g9vywoffgdYlE1vRcnIaQGBcmNnE205)d3W6MLvXR1g2BQcKaZzJNnDiHW6MLvzoea0dkTlSA4PHph2zvSJbur8n2aciVAvH3CSk0zyvstcv4Bg0icOsVspREQGBIScWOXQik26FvoJJta4ugtyyIlF6RhfMLJa5g3IcZYPOWyqE4uxn9HeyotC3saKNHKa5gCQlwoCqhvOreqfVmfkH)ppggdYRIxRnS3ufetHsG8mmgKxL5qaqpO0UWQHNg(CyNvXogqfX3ydiG8QvfEZXQqNHvjnjuHVzqJiGk9kTBREQGBIScWOXQik26FvaDsz99HbNYK2aMdKkG0qLKk6GN(hka5X9agK7nXbjYkad9vgtyyIl5EadY9M4yabAZho1vdBfAeburo2gb)FgQ)Fhg4)tVBocg2OIxRnS3uL3X2iG0qL8WaKXT5iyyJkZHaGEqPDHvdpn85WoRIDmGkIVXgqa5vRk8MJvHodRsAsOcFZGgrav6vACOEQGBIScWOXQik26FvaDsz99HbNYK2aMdKkG0qLKk6GN(84qbipUhWGCVjoirwbyuHgravKJTrW)NH6)3Hb()07MJGHn()0JMoQ41Ad7nv5DSncinujpmazCBocg2OYCiaOhuAxy1WtdFoSZQyhdOI4BSbeqE1QcV5yvOZWQKMeQW3mOreqLELgV6PcUjYkaJgRIOyR)vHhGoPS((WGtzsBaZbsfqAOssfDWRcnIaQihBJG)pd1)Vdd8)P3nhbdB8)Phx6OIxRnS3uL3X2iG0qL8WaKXT5iyyJkZHaGEqPDHvdpn85WoRIDmGkIVXgqa5vRk8MJvHodRsAsOcFZGgrav6vA8RNk4MiRamASkIIT(xfqNuwFFyWPmPnG5aPcinujPIo4P)HcqECpGb5EtCqIScWqFLXegM4sUhWGCVjogqG28HtDXHk0icOcoUV79)zO()HJuytv8ATH9MQqDF3J0qLKkf2uL5qaqpO0UWQHNg(CyNvXogqfX3ydiG8QvfEZXQqNHvjnjuHVzqJiGk9knpTEQGBIScWOXQik26FvaDsz99HbNYK2aMdKkG0qLKk6GN(84qbipUhWGCVjoirwbyuHgravWX9DV)pd1)pCKcB6)tpA6OIxRnS3ufQ77EKgQKuPWMQmhca6bL2fwn80WNd7Sk2XaQi(gBabKxTQWBowf6mSkPjHk8ndAebuPxPDV6PcUjYkaJgRIOyR)vHhGoPS((WGtzsBaZbsfqAOssfDWRcnIaQGJ77E)FgQ)F4if20)NECPJkET2WEtvOUV7rAOssLcBQYCiaOhuAxy1WtdFoSZQyhdOI4BSbeqE1QcV5yvOZWQKMeQW3mOreqLELwdB9ub3ezfGrJvruS1)QWdFgyJ0rn404U1byK(OaH(qcmNjoffgdYtxibMZehbYn6RWSCkkmgKx8Q7m9TOqLk37mmcsaXomKOCqsDzahf)kET2WEtvU1byK(OarfEZXQqNHvjnjuHgrav8Soa7)l(rbIkEzoVkQjvaipeZbUNUAvMdba9Gs7cRgEA4ZHDwf7tQa4bXCG71yvSJbur8n2aciVAvHVzqJiGk9kTMw9ub3ezfGrJvruS1)Qa6KY67ddoLjTbmhivaPHkjv0bp9puaYJ7bmi3BIdsKvag6RmMWWexY9agK7nXXac0MpCQRRkET2WEtvy7BthYhLKmAvrv4nhRcDgwL0KqfAebuz((205)tOK)F88QIQ4L58QOMubG8qmh4E6Qvzoea0dkTlSA4PHph2zvSpPcGheZbUxJvXogqfX3ydiG8Qvf(MbnIaQ0R0AUQNk4MiRamASkIIT(xfqNuwFFyWPmPnG5aPcinujPIo4PppouaYJ7bmi3BIdsKvagv8ATH9MQW23MoKpkjz0QIQWBowf6mSkPjHk0icOY89TPZ)Nqj))45vf9)PhnDuXlZ5vrnPca5HyoW90vRYCiaOhuAxy1WtdFoSZQyFsfapiMdCVgRIDmGkIVXgqa5vRk8ndAebuPxP1MvpvWnrwby0yvefB9Vk8a0jL13hgCktAdyoqQasdvsQOdEv8ATH9MQW23MoKpkjz0QIQWBowf6mSkPjHk0icOY89TPZ)Nqj))45vf9)Phx6OIxMZRIAsfaYdXCG7PRwL5qaqpO0UWQHNg(CyNvX(KkaEqmh4Enwf7yaveFJnGaYRwv4Bg0icOsVsR52QNk4MiRamASk0icOIEXSSWMo)FUdd5yY)V4NsQWuXR1g2BQsCywwythYbd5yssFkPctL5qaqpO0UWQHNg(CyNvH3CSk0zyvstcvSJbur8n2aciVAvHVzqJiGk9kTgoupvWnrwby0yvefB9VkGoPS((WG7WaKaHpWmShPc5Ju7zy6BrHkvUddqce(aZWEKkKpsTNHX9oKkcN6Q5EvOreqf7mKkkSPZ)NBfnG)p3(6G5YnDQ41Ad7nvrXqQOWMoKXhAaKH1bZLB6uzoea0dkTlSA4PHph2zvSJbur8n2aciVAvH3CSk0zyvstcv4Bg0icOsVsRHx9ub3ezfGrJvruS1)QOhK6wBajKaXcpCQ7m339F(BMB6qQyOeiJwveNYqjpCQ7mDOpp8zGnsh1GtJ75VzUPdPIHsGmAvrvOreqfXFZCtN)p7muc)F88QIQ41Ad7nv55VzUPdPIHsGmAvrvMdba9Gs7cRgEA4ZHDwf7yaveFJnGaYRwv4nhRcDgwL0Kqf(MbnIaQ0R0A4xpvWnrwby0yvefB9VkkmlhbYnUffMLtrHXG8WPM(8WNb2iDudonogLhMnDiJp0aiJBZrfAebuzoLhMnD()CROb8)P3nhv8ATH9MQWO8WSPdz8HgazCBoQmhca6bL2fwn80WNd7Sk2XaQi(gBabKxTQWBowf6mSkPjHk8ndAebuPxP14P1tfCtKvagnwfrXw)RIEuywoffgdYdNAUV7BrHkvoltePpZO4O4Rd95HpdSr6OgCACwbKkYq5iJwvufVwByVPkwbKkYq5iJwvufEZXQqNHvjnjuHgravIfqQidL7)JNxvufVmNxf1KkaKhI5a3txTkZHaGEqPDHvdpn85WoRI9jva8GyoW9ASk2XaQi(gBabKxTQW3mOreqLELwZ9QNk4MiRamASkIIT(xfibMZe3Tea5zijqUbN66IZfouHgravSJz))0lYguXR1g2BQIcZsghYguzoea0dkTlSA4PHph2zvSJbur8n2aciVAvH3CSk0zyvstcv4Bg0icOsVs7cB9ub3ezfGrJvruS1)QajWCM4ULaipdjbYn4uxxCUWHk0icOIDm7)xmkS3vXR1g2BQIcZsArH9UkZHaGEqPDHvdpn85WoRIDmGkIVXgqa5vRk8MJvHodRsAsOcFZGgrav6vAxA1tfCtKvagnwfrXw)Rcp8zGnsh1GtJ7whGr6Jcev8ATH9MQCRdWi9rbIk8MJvHodRsAsOcnIaQ4zDa2)x8Jce)F6rthv8YCEvutQaqEiMdCpD1Qmhca6bL2fwn80WNd7Sk2NubWdI5a3RXQyhdOI4BSbeqE1QcFZGgrav61RcnIaQilH9)p9U5iouicy8K)pXtVw]] )

    storeDefault( [[SimC Windwalker: CD]], 'actionLists', 20170126.1, [[d8JQjaWycRxLqTjOQDjvBJkX(ivsDyLUnsMnLMVus3uK68uOVPs1PrStPyVO2TQ2pPQrreggvQXPsWxvjKNbvAWuKHdfhsLsNIuXXGshNuPwOkPLkIAXe1Yj5HqfpvXYeH1rLu1evPyQuutgY0LCrrsVMiDzW1rQnsQK8zszZuX2Ls9DkywKkX0ujAEIi)LQglvsPrRIXtLKtks8CrDnQKk3tkX5Osk(TWbjIMXYM5j1FLTaIVYZGbeK1sU4TiXZnjCX1WZnGZsBl(kpjdwyZa3KWn27UXI1DhlpJqrWu8WJKIIeFMnZnyzZ8K6VYwaXx5zekcMINk00SqxeHffg(mpnlfWtkF7qkO3KRLgEDrVP6a6nDrhsb6nzMObkEKuMyjLrEiF7qk4Dfn88KmyHndCtc3yDb79UBC5bNdiKMoAduWxSmpP8iIyRqXZhpWt6a1SuapCXnjyZ8K6VYwaXx5zekcMINk00SqxeHffg(mpnlfWZvBei9M0v0kJ8iPmXskJ8iBJa5DOvg5jzWcBg4MeUX6c27D34YdohqinD0gOGVyzEs5reXwHINpEGN0bQzPaE4IBWLnZtQ)kBbeFLNrOiykEQqtZcDrewuy4Z80SuapxbvgusjVgpsktSKYipYGkdkPKxJNKblSzGBs4gRlyV3DJlp4CaH00rBGc(IL5jLhreBfkE(4bEshOMLc4HlU5s2mpP(RSfq8vEsVUIqrtzEvAqL5jbpJqrWu8uHMMf6IiSOWWNXlXTRQioRO6ARf8Y0QC1HFLTacpOBAcgmaQFiie8EQnxGk7DcLmbHG3xbT4GxcmkOTxtG6j6vqlo(WXJGToT2kgf02RjqDC7vqlo(WXJGToT2kgf02Rjq9l7vqlo(WXJGTo6OdpsktSKYipvqlo(WXJGTo8KYJiITcfpF8apnlfWJ5GwC0BkC0B6gyRdpsQ0Y8imkSGVwLgu5wWQluRR8cJcl4RvPbvULe8KmyHndCtc3yDb79UBC5bhJclyEvAqL5R8GZbesthTbk4lwMN0bQzPaE4IBCDSzEs9xzlG4R8mcfbtXtfAAwOlIWIcdFgVe3UQI4SIQRTwWltRYvh(v2ci83c6MMGbdG6hccbVNAZfOYENqjtqi49vqlo6WtZsb8yoOfh9Mch9MUb26O3Key1HhjLjwszKNkOfhF44rWwhEsgSWMbUjHBSUG9E3nU8GZbesthTbk4lwMNuEerSvO45Jh4jDGAwkGhU4gxyZ8K6VYwaXx5j96kcfnL5vPbvMNe8mcfbtXtfAAwOlIWIcdFgVeRQioRO6ARf8Y0QC1HFLTacpOBAcgmaQFiie8EQnxGk7DcLmbHG3xbT4GxeHffg(EUuePGpC81b8gipYgkuxbul5ZjDb8IiSOWW3Di5k7dhVdTYyxbul5Zj1YL4fryrHHVRizYR5Z0VxkriTRaQL85KUJxcmkOTxtG6j6vqlo(WXJGToT2kgf02RjqDC7vqlo(WXJGToT2kgf02Rjq9l7vqlo(WXJGTo6OdpsktSKYipvqlo(WXJGTo8KYJiITcfpF8apnlfWJ5GwC0BkC0B6gyRJEtsKqhEKuPL5ryuybFTknOYTGvxOwx5fgfwWxRsdQClj4jzWcBg4MeUX6c27D34YdogfwW8Q0GkZx5bNdiKMoAduWxSmpPduZsb8Wf3CNnZtQ)kBbeFLNrOiykEQqtZcDrewuy4Z4LyvfXzfvxBTGxMwLRo8RSfq4VTwl8vpdk4jLXo8RSfq4Vf0nnbdga1peecEp1MlqL9oHsMGqW7RGwCWlIWIcdFpxkIuWho(6aEdKhzdfQRaQL85KUaErewuy47oKCL9HJ3HwzSRaQL85KA5s8IiSOWW3vKm518z63lLiK2va1s(Cs3XloKUGwPGV01TKqhEAwkGhZbT4O3u4O30nWwh9MKaxD4rszILug5PcAXXhoEeS1HNKblSzGBs4gRlyV3DJlp4CaH00rBGc(IL5jLhreBfkE(4bEshOMLc4HlU5cSzEs9xzlG4R8mcfbtXtfAAwOlIWIcdFgVeRQioRO6ARf8Y0QC1HFLTacFTw4REguWtkJD4xzlGWFlOBAcgmaQFiie8EQnxGk7DcLmbHG3xbT4GxeHffg(EUuePGpC81b8gipYgkuxbul5ZjDb8IiSOWW3Di5k7dhVdTYyxbul5Zj1YL4fryrHHVRizYR5Z0VxkriTRaQL85KURdpnlfWJ5GwC0BkC0B6gyRJEtsCPo8iPmXskJ8ubT44dhpc26WtYGf2mWnjCJ1fS37UXLhCoGqA6OnqbFXY8KYJiITcfpF8apPduZsb8Wfx80SuapdHch9MUiYJmSwPGY1R3eo3WfZa]] )


    storeDefault( [[Windwalker Primary]], 'displays', 20170126.1, [[dWtXeaGEc0UiG61GIzkuYHvz2KSmLk3uPQNju52copr1oj1EL2Ti7NYpbLAye63QQtdzOiAWunCICqLYrjihdHZjuOfcOwkuyXIQLRKhQk9uupwv8CGAIqjtfitgunDKUiaxvOOUSIRdYgjO(mu1MbKTdv(OqP(kuQPra(UO0ijG8nHcgnrz8qrNuOQBjKRbkX9ekY6efwlOK2MOOlrbvwiObAGBUW)e1Cgj4unXUYK4inpYCq3c)qBEzYfkCl5M)Esu0pz(g06kxEnQYVa0GaGr5yg8yolnkLWQdSSMxMehaZJmh0TWp0MxMehaZJmhRbOdsrlWLjXbW8iZF)H8J28Y7pmrbOG5GqHP64eldR)FOAcyPmjosZJmhRbOdsrnFtjj7QMOmjosZJm)9hYpAZltIJ08iZXAa6Gu0cCz5vhTltXYBWgG5rMV)WefGcvlwgJrnh4P6DIeXGibHOatugJlHFm)v28adkHV8LJuiQ8YK4ayEK5V)q(rnFtjj7QMOmjosZJmh0TWpuZ3usYUQjktIJ08iZF)H8JA(Mss2vnrz(zHKOLltIdG5rMJ1a0bPOMVPKKDvtuwiObAaxqvtuqLbKUC1aVaxE7HI(jZJfcmTmJcVMJnkbp7PGzwzyU0AE(H8JwwFHPmJcVMJnkbp7PGzwzyU0AE(H8JwgJrnh4P6DIezsikgxz(zHKOLPOWetILw9UcQmG0LRg4f4YBpu0pzESqGPLzu41CSrj4zpfmZkdZHpaDqkAz9fMYmk8Ao2Oe8SNcMzLH5WhGoifTmgJAoWt17ejYKqumUslTmJs4vJ5rMVhLqbOq1ILzPrPewDGLz(7x9xfu5RAIYRQjkJVAIY5vtuA53VKCZb9lJnkbp7PGzwMVbBaL3GOFZJmF)HjkafQwSSqqd0yowO18qr)uzmIp2ceOYBq0V5rMVhLqbOq1ILfcAGg4Mh)ZpzoJeCQwaILjXbW8iZbDl8d18nLKSRAIYasxUAGxGlRVWugBucE2tbZSmNCHc3sEzgLWRgZJmF)HjkafQMO8gSbyEK57rjuakuDCLbDQjrnp2RpKu1ILJ)5NaBol7NnvTakZsZd6uibpk6NQExMXyzYfkCl5M)Esu0pvMEl8dfCzYfkCl5Mh)ZpzoJeCQwaILf(NOLbGP0Aado7jVmwdqhKIwGltUqHBj3CH)jQ5msWPAIDLzP7bLWxnSugZQflV9qr)K5VNef9tGlWLfcAGgZ3ui8PWKOLFkTf]] )

    storeDefault( [[Windwalker AOE]], 'displays', 20170126.1, [[d0t2eaGEcQDrQkTnOkhwLzkQOxdIMnjxdbDtq48kHBlYZvv2PG9kTBH2pLFkQQHrKXrQQ8mLudLqdMQHtkhuuokPkhdrNtujlekSueyXkLLd0dvv9uultjzDQImreQPcstgQmDKUOs1vjvfxwX1b1gHI(muAZQcBNaFuuP(kuvtJG8DLOrkQqpwvA0KkJhHCsrvUfrDAi3tub)gWAjvv9nvrDjl0Y6bpWdoZXeisnNrcpnqUQSOarZLnh6bIDODRSiikDGlm))0OiGO5zWGx5YGJQ8)Ea6obL1NVXCwBukmv3NUUvM1UxueBdewwuWU5YMt884Gv0Irzrb7MlB(pqA7ODRmehrOeCYCOO00WAPY6paqQbscllkq0CzZjEECWkQ5zknDxdKLffiAUS5)aPTJ2TYIcenx2CINhhSIwmkVOyk)mH4jeER1VCTIW1e(SeEs9HSqewMOgKktWOM7BAyLe5ZsKKs6lzzcUi2X8FDZlKOi2Y3gsHOlklky3CzZ)bsBh18mLMURbYYIGO0bUW88EbIMZiHNgesQSOarZLn)hiTDuZZuA6UgilRh8apMNPqyJPjsl)wo7LIaIM)FAueq8Ryuwp4bE(k0gil0Y7XBtn4kgLZEPiGO55e9rlZO0V54JI4wEkihWNmxdCEbsBhTC4stzgL(nhFue3Ytb5a(K5AGZlqA7OLjyuZ9nnSsIepsjP1L5xqKgTmfLMCqQ0gwvOL3J3MAWvmkN9srarZZj6JwMrPFZXhfXT8uqoGpzoU5XbROLdxAkZO0V54JI4wEkihWNmh384Gv0YemQ5(MgwjrIhPK06slTSOGDZLnh6bIDODRmRnkfMQ7tN5)akaWcT81az5TgilJTbYYGnqwAzwBErNcj8rraXgwHxUk)dOTWCOaLXhfXT8uqoGMNL)Ez9Gh4XCIrGZlfbeltqE5ohHwoCPPm(OiULNcYb08S83lRh8ap4mpVxGO5ms4PbHKkJjqKwENinW57B5TO8E82udUIrzrqu6axyoMarQ5ms4PbYvLfbrPdCH5)NgfbeltpqSd9RCw(7MlBoeOikbNAyD5S83nx2CioIqj4udsLZ7fi(zoRdyzSbHkd9utKAEUbbG1AqQmJIyvJ5YMdXrekbNAqQSOarZLnh6bIDOMNP00DnqwwuWU5YMd9aXouZZuA6UgilNbtbmx2Ciqruco1W6YzWuaZLnhIJiuco1GuzgfXQgZLnhcueLGtnSUm)cI0OL)qrSQPSOGDZLnN45XbROMNP00DnqwM45XbROfJsBb]] )

    storeDefault( [[Brewmaster Primary]], 'displays', 20170126.1, [[dOZueaGEuKDriX2uiZKqsZMQUPc1Hv52I61ejStQSxPDdy)u(PcyyIyCePUgiPHcPbtA4e1bfPJII6yqCzLwirSucXIvvwUGhIcpfzzkONdIjkKMkqnzHOPd1fvvDvcP8mHY1vLncs9nIK2Sq12bYhvG8zqzAGeFhL0ivG6XGQrJsnEuItkeUfbNgvNNqToIeTwcP63k6IuWLga0g8N4(vI53(2inf6ja2uIZ0whYWsOGqnvWuWxa2I7xj0apFbXMY4KX8jGPPVWvQuy9Ly87a)lsjrdYAkjVEp0(dc7(vIKp4Cay1b1sOG(nvW0OB875Xvsjuq)MkykJz(7W9R04JfE(LnfmpV1flPKOpN56qGAjuqOMkyA0n(98ytt9YSV6qkHcc1ubtzmZFhUFLqbHAQGPr343ZJRKsIRty4OKsSuOhflwmePLkurgk9OKrJI14cqr6sIS(9GS1nmbrQjiijIcsjMF7Bnn1ZHbKxaCj4Lqb9BQGPmM5VdBAQxM9vhsjuqOMkyk4laBXMM6LzF1HucfeQPcMYyM)oSPPEz2xDiLe5aGTMYG9cxk4aWkDFCphlUukCmFcykJtgZNaqQKsPd8BQGPJpw45xUUKsOG(nvWuWxa2I7xjsE9EO9he2MYy6NHcU0vhsPV6qkbRoKsH6qkUeJPSytbpljjSSMpi4nyA6a)Li5fo)8CMomFcu3WrsxI53(wtJYdlCmFcusKig0Gbxk6g)EECLuI53(2innc4tatjotBDqjPe0taCP0a)8M6UqyYAPFG7ZVrwjLCxEljjSSMpi4nykAGNVG4sObE(cInf6ja2uIZ0whYWsPd8BQGPJ5a88lxxSsObE(cInLXjJ5tGs4laBXqkX8BFlKcUoKcU0pW953iRKsPWX8jGPIkhcUKKWYA(GG3GuAA0n(984sUlVLIUXVNhxsK1VhKTUHjiJqssIvIGh4Y4sfxCPiGpbGykXEYkqDXkb(8la20bfMp56skrCay(1ubthFSWZVCDiLqb9BQGPGVaSfBAQxM9vhsP0hEAQGPJ5a88lxxsP0hEAQGPJpw45xUUKsObE(cInnc4tatjotBDqjPeXbG5xtfmDmhGNF56skHc63ubtJUXVNhBAQxM9vhsjcEGlJlvCl]] )

    storeDefault( [[Brewmaster AOE]], 'displays', 20170126.1, [[dSZzeaGEKIDbIQTrcZKejZMuhg4MksVgeLBRW1aHDk0EL2TkTFk)eP0WeXVvLNbHHcLbt1WjPdkWrjchdsNJerlKOSuKQwSIA5I6HqLNIAzkI1rIIjksMkOmzbX0rCrv0vjrQlR01vvBuKACiv2mr12bvFKevFgKMgr03HQAKKi8yiA0ePXdv5KGi3cjNMW5fupxfwljk9nbPlAHvMw4Bwdc35Ys83)gI5PFxI5SGMTr0jLXYIbih280VlXCwqZ2i6KYyzXaKdBooGkr8UMh8ZGYLZRUmUZiSt6lR0hR5S6Q1P1GdPDUmRcqkUqBeIYyWpnNY8uRCWxtQSYyWpnNYCCVXmG05Ytb4jg)H5WeJTrejLv23B0ikeLzKzHkP8H4cvVLXGJzoL54EJzaPZLXGJzoL5Pw5GVMuzLd30uHcHcjvGGoLCceiGi0efjvoLKqugVMwbceiqPluiqNqNIefkqu5ussxz6x9co2gNKGgAckAcKJwMEWf6AooPlsitCHwgml0cs4YbFYZCkZNcWtm(JgtkJLfdqoS5qc57AolOzBuYKYS4cvVMtz(uXvm(JgrugdoM5uMNALd(AI5bAvPGgrlJb)0CkZtTYbFnX8aTQuqJOLXGJzoL54EJzaX8aTQuqJOLXGJzoL5WazOlX8aTQuqJOLz1vRtRbhsnh3t)YfwzqJOLZnIwgAJOLNBeTKY4EQHnh2RSS8I)aCq2S5b0Ewgd(P5uMJ7nMbeZd0QsbnIwwI)(xZtjYlsI4DltpKuUsaRCQvo4Rjvwzj(7FdXCiH8DnNf0Snkzszm4NMtzomqg6smpqRkf0iA5ZlywVHuzLd(KN5uMpvCfJ)OreLzXfQEnNY8Pa8eJ)OXKYb0EAoL5tfxX4pAerzya9EjMR887R2ysziH8DpmNL(W)2iIYs83)EuynIwyLpVGz9gsLvoajr8UMRuIdszz5f)b4GSzLX8uRCWxtkhbJTCQvo4RjLPF1l4yBCscQc0KeeLzKzHkPCjLugllgGCyZXbujI3TmbKHUKJYyWXmNYCyGm0L05YPFxs5GSaOnpcY5h(LJGXwwwEXFaoiB28aAplZQlsbqlObqeVBJtuqxzm4NMtzomqg6s6C5aApnNY8Pa8eJ)OXKYbijI31CCavI4DpQSYs83)AEGwa9o2lPmYsAb]] )

    storeDefault( [[Brewmaster Defensives]], 'displays', 20170126.1, [[dSJqeaGEeLDbHQTPGmtiuMTqhwv3eiEoPCBL8miyNKSxPDRO9t1pvqnmI63agheYqH0GPmCboOcDuKOJbQZrQQfQalfr1IvQwUkEis6POEmiToIeMirmvqmzKW0jCrG6QeP4YIUUkTrG0PHAZiLTlOpsKQpdrtJirFNuLrsKsFdrA0ivJhrCssf3cHRrQ05vkEnrsTwIKSmLsx4cP8WH5j(B6EzkV5nPWnqbMc3ymzzvWBlJgI6gHBq(dYu09YOh86pBCJ6hiWat3gVNVC5tgltfSccyYllnAPBCqgJGgFn6DVmAiy3iCdYFqMIUxgneSBeUjjP93OOdkJgc2nc3OcS2Fr3ldYtcEDxUbbVYQqqUSubaSQcb5Ym0doquUmAiQBeUrfyT)IUxgne1nc3KK0(Bu0bL3ufX2HKlpomy3iCdKNe86UQsUm5zmFTSQTYWKkddlJ4WLj)Nit3OspHk14jYY)ooIfBkpEfaUr4gipj41DvLCz0dE9NnUPduGPBmMSSkeKlZ4jYy6gHBGGN41DvLCz0qu3iCtss7VrHBJXa6FvWLrdb7gHBssA)nkCBmgq)RcUmAiQBeUrfyT)c3gJb0)QGlZbzmcA81O7gvGiWPqk)vbx(ufCzKvbxEVk4kkZbju8hXK9cmWSQTdHOYOHOUr4gK)GmfUngdO)vbxMYBEt3KGpjubgywMCDKU0cPmAiy3iCJkWA)fUngdO)vbxMYBEtkCthOat3ymzzvB1TSKK2FJIoOm45Vhtk6GYOHGDJWni)bzkCBmgq)RcU84va4gHBGGN41DvLC5XHb7gHBGGN41DvfcLz8ezmDJWnqEsWR7Qk4Yq(yofUj9dWnOk5Y6afyQ5gthqVzvWLP8M3uRqQcUqkdE(7XKIoO8iubgy6gIH1eLhCs9wVMipsHBssA5udhMALv)klljPLtnCyQvM8mMVww1wz4HGLLrOmd9GdeLROIYOh86pBCJ6hiWaZYuK0(BuuguGPO84b)r3u)5aOxz1VYYdoPERxtKh3KK0YPgom1kJEWR)SXnqbMc3ymzzvWBlZbpu8ezv6wMKckbIiv)HK1hbD1vFzsrK(WKwAesjPLhHkWat3O(bcmWuRdkt5nVPBJrmY5kNIYqROf]] )


    Commit( 'initializeClassModule', MonkInit )
    Hekili:ReInitialize()

end
