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
                    return stagger.v1

                elseif k == 'ticks_remain' then
                    return math.floor( stagger.remains / 0.5 )

                elseif k == 'amount' then
                    return stagger.v2

                elseif k == 'time_to_death' then
                    return math.ceil( health.current / stagger.v1 )

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

        addSetting( 'group_threshold', 75, {
            name = "Brewmaster: Group Purify Threshold",
            type = "range",
            min = 0,
            max = 1000,
            step = 1,
            desc = "Specify the amount of damage, as a percentage of your maximum health, that must be Staggered before Purifying Brew can be recommended by the addon.  " ..
                "This setting is used only when you are in a group, as you presumably have a healer with you under those circumstances.\r\n\r\n" ..
                "If set to 0, Purifying Brew can be recommended regardless of your Stagger damage, based solely on the criteria of your action lists.\r\n\r\n" ..
                "Remember, tanking is complex and you may want to use your defensive abilities proactively to manage mechanics that the addon cannot see.",
            width = "full"
        } )

        addSetting( 'solo_threshold', 40, {
            name = "Brewmaster: Solo Purify Threshold",
            type = "range",
            min = 0,
            max = 1000,
            step = 1,
            desc = "Specify the amount of damage, as a percentage of your maximum health, that must be Staggered before Purifying Brew can be recommended by the addon.  " ..
                "This setting is used only when you are playing solo, as you presumably are not receiving outside healing during those times.\r\n\r\n" ..
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
            return state.settings.strike_of_the_windlord
        end )

        addMetaFunction( 'settings', 'artifact_cooldown', function()
            return state.settings.strike_cooldown
        end )

        addMetaFunction( 'state', 'gcd', function()
            return 1.0
        end )

        addMetaFunction( 'state', 'purify_threshold', function()
            if not spec.brewmaster then return 0 end
            return group and state.settings.group_threshold or state.settings.solo_threshold
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
            if buff.serenity.up then return 0 end
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
            setCooldown( 'global_cooldown', 4 * haste )
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
                if group then return stagger.amount >= health.max * ( settings.group_threshold / 100 ) end
                return stagger.amount > health.max * ( settings.solo_threshold / 100 )
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
            return x * haste
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
            if buff.serenity.up then return 0 end
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
            if buff.serenity.up then x = x / 2 end
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

        addHandler( 'touch_of_death', function ()
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


    storeDefault( 'SimC Import: default', 'actionLists', 20161128.1, [[dKtriaGEcrAtuODr02ukMjqvZgY8PKUnuTtaTxs7w0(LkJskmmc63Q6XkzOeIyWsPHlvDqcCkPOJbKZriQfsOAPuuTyk1Yb9qOupvXYakRdGAIaKmveYKLy6uDrkkhwLlJ66kvphPZdfBgrNw4zesFhbtdOY8uknsas9xjnAOKxtbNeaFMsCnaI7rr(gHYHiewec1kiLiDmlpBexuX1b4HZ6mbo2DTaG3)qhWDTfM82rUotpVIdfI0ZJpvGGTrK1XCgXhLvGGje0gqcbdqKG0zwWO31rhblp(KQePabPePJz5zJ4IkUoZcg9Uo(BXcILr6meU37uDeyhOWXOdTNpyfRllvQdddSoaKLyD(d1j)K1b4HZ6m98b7Ab0xw6AhhggyDmNr8rzfiycbTbKysHIQUcemLiDmlpBexuX1zwWO31XFlwqSC9pQ8esQXg27KKskd5mCmY9ERwT3jjLu)H4v(Gow1llvYaYY9ERwBic)qC6skd5mCmsopBexm6WinWUSh(l5zjqHJrU330Qv7DssPn6)cAN6Y9ERw9dAHDPh4C1)Aj4TM2iSPocGwO6KhoB6rLkHdQJa7afogD6Fp(uhaYsSo)H6KFY6a8WzDejVhFQJ5mIpkRabtiOnGetkuu1vGIQePJz5zJ4IkUoZcg9Uon8dXPlPmKZWXi58SrCX46Fu5jKskd5mCmsiJFrs3AsytJnACqpiVLlPommW1NS6yXvcrwqpSi58SrCX46Fu5jKsQdddC9jRowCLqKf0dlsiJFrs3Ace4mU(hvEcPeg0iTuP7z1qSmiHm(fjDRjW10Qv7DssjLHCgog5EFtDeaTq1jpC2eXtGJDxla49p0bCxlLHCgogI1rGDGchJoRdHQ3YJpROG66aqwI15puN8twhGhoRd2hc11ky5XNDTGpOUoMZi(OScemHG2asmPqrvxbcoLiDmlpBexuX1zwWO31re(H40LugYz4yKCE2iUySrJd6b5TCj1HHbU(KvhlUsiYc6HfjNNnIlgx)JkpHusDyyGRpz1XIReISGEyrcz8ls6wtGaNX1)OYtiLKb1P1NSsUdXiHm(fjDRPngx)JkpHucdAKwQ09SAiwgKqg)IKU10MMwTAVtskP(dXR8bDSQxwQKbKL79n1ra0cvN8Wztepbo2DTaG3)qhWDTuMKyDeyhOWXOZ6qO6T84ZkkOUoaKLyD(d1j)K1b4HZ6G9HqDTcwE8zxl4dQ312autDmNr8rzfiycbTbKysHIQUcequI0XS8SrCrfxNzbJExNg(H40LugYz4yKCE2iUyC9pQ8esjLHCgogjKXViPBnjSPXgI4GEqElxsDyyGRpz1XIReISGEyrY5zJ4IX1)OYtiLuhgg46twDS4kHilOhwKqg)IKUfe4mU(hvEcPKmOoT(KvYDigjKXViPBnbcqmU(hvEcPeg0iTuP7z1qSmiHm(fjDRynTA1ENKusziNHJrU3RJaOfQo5HZMiEcCS7AbaV)HoG7APmKZWXqSocSdu4y0zDiu9wE8zffuxhaYsSo)H6KFY6a8WzDW(qOUwblp(SRf8b17ABawtDmNr8rzfiycbTbKysHIQUcCJsKoMLNnIlQ46mly076ic)qC6skd5mCmsopBexm2OHioOhK3YLuhgg46twDS4kHilOhwKCE2iUyC9pQ8esjzqDA9jRK7qmsiJFrs3AsKnU(hvEcPeg0iTuP7z1qSmiHm(fjDRjaPPvR27KKsQ)q8kFqhR6LLkzaz5EFtDeaTq1jpC2eXtGJDxla49p0bCxlLjjwhb2bkCm6SoeQElp(SIcQRdazjwN)qDYpzDaE4SoyFiuxRGLhF21c(G6DTneTPoMZi(OScemHG2asmPqrvxbkMsKoMLNnIlQ46a8WzDW(qOUwblp(SRf8b17ABaUM6iaAHQtE4SjINah7UwaW7FOd4U2HiI1rGDGchJoRdHQ3YJpROG66aqwI15puN8twhZzeFuwbcMqqBajMuOOQRUoakM82rUkU6Qc]] )

    storeDefault( 'SimC Import: precombat', 'actionLists', 20161128.1, [[b4vmErLxtvKBHjgBLrMxc51uofwBL51utLwBd5hyj1gCVjhD64hyWjxzJ9wBIfgDEn1uWv2yPfgBPPxy0L2BU5LtYytoEnLuLXwzHnxzE5KmWeJnXaJm14smEn1uJjxAWrNxt51ubngDP9MBZ5fvE5umErLxtvKBHjgBLrMxc51utnMCPbhDEnfDVD2zSvMlJ92BSr2B352CEnvqYD2CEnLBH1wz98gBK91DHjNxtfKyPXwA0LNxtb3B0L2BU51uj5gzPnwy09MCEnLBV5wzEnLtH1wzEnfuVrxAV5MxtjvzSvwyZvMxojdmXytm34cmZ4fDErNxtruzMfwDSrNxc5fDE5f]] )

    storeDefault( 'SimC Import: sef', 'actionLists', 20161128.1, [[dGJrdaGEIuBck0UOsBJISpOIMjuKzd62QQDc0Ef7wP9JsJckvdJs(nHhtvdgfdNcDqf5uqfogeNdkWcPGLsfwScwoQEiLQNISmvP1PkyIqjMkatMOMUKlcOdRYLjDDOK2OQqEoK2mfLZtPCAPMfuutdkOVdLYZOI(MQOrdv14HQCsI4wQc11OO6EqL(SIArej)vHoibqiG7nav5yie491qu)TZYi5BuWRhyzqvZcrgvFFWw6RAXgWxtyqihkupunGVwiMqSEn3fje55TXkuOjF1Ifnacisaec4EdqvogcbEFneWv5ZT09oZYae2418qtdnSlBH0v5ZT09opQWgVMhsYk3(Re8qRy1qouOEOAaFTqmH801YzQa(gaHaU3auLJHqKN3gRqLyEgQUEHaklW2IIrS7XVD)hEp2JF76XkNRBHtCrWOUkF2MB1FDSeJ)dpCIRLR54i00qd7YwOJ7VvhlbNRBfsYk3(Re8qRy1qG3xdnX93QSmaeCUUvihkupunGVwiMqE6A5mvaDgaHaU3auLJHqG3xdz)GqwMjF1ILLbtnAfAIpJgAVVIRuu)TZYi5BuWRhyzSJfPcnn0WUSfYFq445RwSJWgTcjzLB)vcEOvSAihkupunGVwiMqE6A5mvaXWaieW9gGQCmeI882yfQeZZq11leqzb2w0qtdnSlBHqlb)pQhVWF8w5rZAUgsYk3(Re8qRy1qG3xdrLG)XmldWJx4JzwMBLzzEuZ1qouOEOAaFTqmH801YzQaAEaec4EdqvogcbEFnK9dczzM8vlwwgm1Ofld2rWrOj(mAO9(kUsr93olJKVrbVEGLHaivOPHg2LTq(dchpF1IDe2OvijRC7VsWdTIvd5qH6HQb81cXeYtxlNPsfclQzhwHvmKkba]] )

    storeDefault( 'SimC Import: serenity', 'actionLists', 20161128.1, [[daeZjaqicPwKuOAtsvzusbNIuPvjfs2fv1WKkhdslJO8mc10KsHRjvHTrL8nvW4KcPoNukADsPI5ri5Esv1(ie6Gq0cjv9qcrtukuUivQnkvrNukALsHWlLQ0mLcr7KGLsu9uKPkL8vPuQ9Q8xrnyQYHbTys5Xqnzv1LrTzi8zQy0KkonLvlLk9AImBHUTG2TKFRkdxLSCsEUith46QOTRc9DPu14LsjNxLA9ec2Vap01AK7cQf5)0psagYJiluKbEndVEkq7e4Lyfxg4EeDXydgnracSxnbzUAZrY5idt8eK1H6cTtwp8rhryLDbgncjgyVkTwtaDTg5UGAr(p9JeGH8i3fRCmrWkNap3rRTm1iKAw0a3J4IvoMiyLtMJwBzQrnRVHHGNAu9kEKCoYWepbzDOUqp43jEGjiBTg5UGAr(p9JeGH8ircJXapKyG9QaVgPLaJqQCsJkyi3FJtwOid8AgE9uG2jWtKnwJpcPMfnW9immgZqmWEvoAjWOM13WqWtnQEfpsohzyINGSouxOh87epWeeVwJCxqTi)N(rewzxGrGNJtK9XVx8)AFLgHuZIg4EuIvCzG7rnRVHHGNAu9kEKamKhrSIldCpsohzyINGSouxOh87epWeAJ1AK7cQf5)0psagYJiGYK4aVhIapGoCGxBB1p(u)ri1SObUhLaktIZpezGoCU9w9Jp1FuZ6Byi4PgvVIhjNJmmXtqwhQl0d(DIhyc9yTg5UGAr(p9JiSYUaJ0orGWpXkUmWT)5vFANiq4Nyfxg42xXHqRsIQFh8VrH63Jri1SObUhHWsGu(HiJ4uDpQz9nme8uJQxXJeGH8OEAjqkW7HiWRNNQ7aVg46R7i5CKHjEcY6qDHEWVt8atW1AnYDb1I8F6hryLDbgbXa7iN5IdnojkX91WN1orGWpeQKYpezGoCgRGf7FE1hedSJC()a(HqLu(Hid0HZyfSyrbXa7iN5IdnoP7iKkN0i8noYzau5WGu)OJqQzrdCpszjRCYPZklzyPrnRVHHGNAe(gh5rcWqEKClzLtGhDwbE9AyPaVgq1DKCoYWepbzDOUqp43jEGjCyTg5UGAr(p9JiSYUaJGyGDKZCXHgNeL4rivoPrJqQzrdCpszjRCYPZklzyPrnRVHHGNAu9kEKamKhj3sw5e4rNvGxVgwAKCoYWepbzDOUqp43jEGj0OxRrUlOwK)t)ibyipQNwcKc8Eic865P6EesnlAG7riSeiLFiYiov3JAwFddbp1O6v8i5CKHjEcY6qDHEWVt8icRSlWObMqBUwJCxqTi)N(rewzxGrqmWoYzU4qJtIy)I7t0xk(y2b)9txwvw5KXkyXzjdlncPMfnW9O0LvLvozScwCwYWsJAwFddbp1O6v8ibyipIUSQSYjWtKkyXbE9AyPrY5idt8eK1H6c9GFN4bMaA3AnYDb1I8F6hryLDbgbXa7iN5IdnojI9lUVg(S2jce(HqLu(Hid0HZyfSy)ZR(GyGDKZ)hWpeQKYpezGoCgRGflkigyh5mxCOXjDhHu5KgHVXrodGkhgK6hDesnlAG7rklzLtoDwzjdlnQz9nme8uJW34ipsagYJKBjRCc8OZkWRxdlf41GyDhjNJmmXtqwhQl0d(DIhycOOR1i3fulY)PFeHv2fyeedSJCMlo04Ki2V4rivoPrJqQzrdCpszjRCYPZklzyPrnRVHHGNAu9kEKamKhj3sw5e4rNvGxVgwkWRbz6osohzyINGSouxOh87epWeqLTwJCxqTi)N(rewzxGrI(sXhZo4VVweILENGSKHL6RHpRDIaHFiujLFiYaD4mwbl2)8Qpigyh58)b8dHkP8drgOdNXkyXIcIb2roZfhACs3rivoPr4BCKZaOYHbP(rhHuZIg4EKweILENGSKHLg1S(ggcEQr4BCKhjad5r6JqS07ee41RHLc8Aav3rY5idt8eK1H6c9GFN4bMaQ41AK7cQf5)0pIWk7cms0xk(y2b)91IqS07eKLmS0iKkN0Ori1SObUhPfHyP3jilzyPrnRVHHGNAu9kEKamKhPpcXsVtqGxVgwAKCoYWepbzDOUqp43jEGjG2gR1i3fulY)PFeHv2fyKOVu8XSd(7NUSQSYjJvWIZsgwAesnlAG7rPlRkRCYyfS4SKHLg1S(ggcEQr1R4rcWqEeDzvzLtGNivWId861WsbEnGQ7i5CKHjEcY6qDHEWVt8ataThR1i3fulY)PFeHv2fyKOVu8XSd(7Rot6yLtUDHFo3ER(JqQzrdCpsDM0XkNC7c)CU9w9h1S(ggcEQr1R4rcWqEK8ZKow5e41iGFoWRTT6psohzyINGSouxOh87epWaJAmgb8mcM(b2aa]] )

    storeDefault( 'SimC Import: ST', 'actionLists', 20161128.1, [[di0ilaqisPArIkvBIIYOKKCkjPULOszxizyc1XG0YirptiMMuLY1iLY2eOVjQACIkKZbsfRtQs18ev09OOAFsvCqsyHc4Hsv1efvWffsBuQsCsjXkbPsVuujZuuHANi1qLQILkipLyQuKVkvL2RYFLyWsLddSyk8yetguxg1MfuFMKgnP40uTAPkPxlIztPBtQ2Tk)wkdxuwouphIPRQRlsBhK8DsjnEqkNheRhKQMpPe7xs9qNPjrpGHLHxGj0aDEI469x3vrpRH)EVUtmnrYyIdSo0dEVDJwzqOZKqSLbi8OvgJgenwP2OqNieSN9tMOG8E7qMPrJottIEadldVatOb68K(bwBDNcY7TRUlh7i)efyvKjhqNnp3fxV)6Uk6zn8371D9Nd5(efgU1FitiaRTaiV3UI1r(jvoyNa(gEY1oEsi2YaeE0kJrdIMNkoY(rRCMMe9agwgEbMieSN9t(MQQLPiTMfUP1dXSQiACkDa0YnIgNIKIX899yoQz8XyviuVRZLVv0bqRhZJP0w1tuy4w)HmbGjGJlFdJ57Nu5GDc4B4jx74j0aDEIcmbCCDNPggZ3pjeBzacpALXObrZtfhz)OJmttIEadldVatec2Z(j8XyviuKumMVpN8Xyviu6aOzgrJtrsXy((CAo6efgU1Fit4JXQo07NAHTo0C8KkhStaFdp5AhpHgOZtIEmw1HE)uR7IADO54jHyldq4rRmgniAEQ4i7hDVnttIEadldVatec2Z(jpWY3tHWy(8hcfFadldRfTaiVdfx4J1DgjNbNOWWT(dzcYJ9eU0cxEnCrR(bBBy4jvoyNa(gEY1oEcnqNNip2t46Uw46Uxdx31x)GTnm8KqSLbi8OvgJgenpvCK9JwBZ0KOhWWYWlWeAGopPxCKhPURfUURxsXqMOWWT(dzsyh5rkTWLWPyitQCWob8n8KRD8KqSLbi8OvgJgenpvCK9Jo4mnj6bmSm8cmriyp7NaiVdfx4J1DgPha5DO4cC7PWoIFQfK0RK4KeZGzJ0WHPWoIFQfK0RK4KeQ0SjkWQitiqiwU8aSk)iMJorHHB9hYeSJ4NAbj9kjojzsLd2jGVHNqGqS8eAGopjKJ4NADNKE1D5Yjj1DvHw9KqSLbi8OvgJgenpvCK9Jo)mnj6bmSm8cmHgOZtc5i(Pw3jPxDxUCsYefyvKjtuy4w)Hmb7i(PwqsVsItsMu5GDc4B4jx74jHyldq4rRmgniAEQ4i7hDoAMMe9agwgEbMqd05j9vJJT(Pw3LdyGA7Q76t6r0mrHHB9hYeTQXXw)ulWyGA7kzPhrZKkhStaFdp5AhpjeBzacpALXObrZtfhz)OHoZ0KOhWWYWlWeHG9SFcG8ouCHpw3zKEmpIzApdZqvujWuiz(D(PwiyWXLeNKmrHHB9hYeKm)o)ulem44sItsMu5GDc4B4jx74j0aDEIK535NADx)yWX1D5YjjtcXwgGWJwzmAq08uXr2pA04zAs0dyyz4fyIqWE2pHOXP0bql3iACkskgZ33dQzApdZqvujWu4uen(Pw6vamx0QFWtuy4w)HmbNIOXp1sVcG5Iw9dEsLd2jGVHNCTJNqd05jHsr04NADh0faZ1D91p4jHyldq4rRmgniAEQ4i7hnk6mnj6bmSm8cmriyp7NufrJtrsXy((Eq1IwmsdhMYOLuYWncvAw1MP9mmdvrLatzybKKw6xsCsIzvbZgPHdtPdWjLw4YRHlem4yQ0mZaK3HIlWTNshGtkTWLxdxiyWX5eqEhkUWhR7ms1tuGvrMqGqSC5byv(rmhDIcd36pKjgwajPL(LeNKmPYb7eW3WtiqiwEcnqNNeWcijT0VUlxojPURk0QNeITmaHhTYy0GO5PIJSF0OkNPjrpGHLHxGjcb7z)KQiACkskgZ33dQw0IrA4WugTKsgUrOsZQ2mTNHzOkQeykdlGK0s)sItsMOaRImzIcd36pKjgwajPL(LeNKmPYb7eW3WtU2XtOb68KawajPL(1D5YjjtcXwgGWJwzmAq08uXr2pA0iZ0KOhWWYWlWeHG9SFcFmwfc176C5BfDa06XCLuk12efgU1FitiA8IwbqXtQCWob8n8KRD8eAGopPFnEDxFbqXtcXwgGWJwzmAq08uXr2pA0EBMMe9agwgEbMieSN9t4JXQqOExNlFROdGwpMRKsP2MOWWT(dzcrJxmsXi)KkhStaFdp5AhpHgOZt6xJx3fifJ8tcXwgGWJwzmAq08uXr2pAuTnttIEadldVatec2Z(jApdZqvujWuVRY4sgWQBwvWSrA4Wu6aCsPfU8A4cbdoMknZma5DO4cC7P0b4KslC51WfcgCCobK3HIl8X6oJu9efyvKjeielxEawLFeZrNOWWT(dzY7QmUKbS6tQCWob8n8eceILNqd05jMCvgx31hGvVURk0QNeITmaHhTYy0GO5PIJSF0ObNPjrpGHLHxGjcb7z)eTNHzOkQeyQ3vzCjdy1NOaRImzIcd36pKjVRY4sgWQpPYb7eW3WtU2XtOb68etUkJR76dWQpjeBzacpALXObrZtfhz)OrZpttIEadldVatOb68etUkJR76dWQx3vvCDx)A8QNeITmaHhTYy0GO5PIJmPYb7eW3WtU2Xtec2Z(jenofjfJ57npEIcd36pKjVRY4sgWQVF)KCGddsT)cSFd]] )

    storeDefault( 'SimC Import: CD', 'actionLists', 20161128.1, [[dWZKgaGEqrAtqXUu02uIoSkZMOht45u58G0TvWPv1ofP9IA3a7heJsemmO04af1Lr(lvnyLQHRKoOs4uuOoMO64uiwOO0sbvwmfTCs9qqjEQulJsADGc1effMkLyYqMUKlcQAwui9mLIRtInckKptsBMsTDqP(of8vqrmnrOMNOOxRqglOaJgQgViKtQu6Bkuxdus3te5qIOohOG(TWCoBHB4bNPKqCwUtVbI7(hGfi7BhwdDbJHSdlzWDVsI)Kpm9QpaCQ1LWqUHJK05io1k28L5yTcRZCUBH(xlU5EHO(a4ylCAoBHB4bNPKqCwUBH(xlURqvvstresuya44EH5l)ck3pa2XiYNifcW9wa6fxfAUbbG4o9giU3cGDmIGSdduiGrHSx4eKDyc(xeKDlVkP5gossNJ4uRyZxMpEIDdxCQv2c3WdotjH4SC3c9VwCxHQQKMIiKOWaWX9cZx(fuUnLrG82kAOCVfGEXvHMBqaiUtVbI7SYiqq2HrkAOCdhjPZrCQvS5lZhpXUHloDdBHB4bNPKqCwUBH(xlURqvvstresuya44EH5l)ck3MK2r6rpqL7Ta0lUk0CdcaXD6nqCNL0osp6bQCdhjPZrCQvS5lZhpXUHlonXSfUHhCMscXz5Uf6FT4UcvvjnfrirHbGdtcjF66Tprnvpj5nv0UAsGZusimKru(1vcnXFeIa(HZvK25TdT5JqeWxHIahtYRAc2EvbAwHIa3h2EeDfUXCVqR64wavijFDAvQCjLB0HlrEbuHK81PvPYLKvUxy(YVGYDfkcCFy7r0v4CVfGEXvHMBbuHK4o9giUTekcCi7HnK9mORW5gossNJ4uRyZxMpEIDdxCkSYw4gEWzkjeNL7wO)1I7kuvL0ueHefgaomjK8PR3(e1u9KK3ur7QjbotjHWKmzeLFDLqt8hHiGF4CfPDE7qB(ieb8vOiWnM7fMV8lOCxHIa3h2EeDfo3BbOxCvO5geaI70BG42sOiWHSh2q2ZGUchYEc5gZnCKKohXPwXMVmF8e7gU40LSfUHhCMscXz5Uf6FT4UcvvjnfrirHbGdtcNUE7tut1tsEtfTRMe4mLecdzeLFDLqt8hHiGF4CfPDE7qB(ieb8vOiWXiIqIcdGPR0)iYh2(cN8gEasgA0utd3dCzcZyerirHbW0(DLZh2EBfn0PMgUh4YmPeJreHefgat97EGQ3Pa8JEXOPMgUh4YCmMKx1eS9Qc0ScfbUpS9i6kCJ5EHw1XTaQqs(60Qu5sk3OdxI8cOcj5RtRsLljRCVW8LFbL7kue4(W2JORW5Ela9IRcn3cOcjXD6nqCBjue4q2dBi7zqxHdzpbRgZnCKKohXPwXMVmF8e7gU40XSfUHhCMscXz5Uf6FT4UcvvjnfrirHbGdtcNUE7tut1tsEtfTRMe4mLectYKru(1vcnXFeIa(HZvK25TdT5JqeWxHIahJicjkmaMUs)JiFy7lCYB4bizOrtnnCpWLjmJreHefgat73voFy7Tv0qNAA4EGlZKsmgresuyam1V7bQENcWp6fJMAA4EGlZXgZ9cZx(fuURqrG7dBpIUcN7Ta0lUk0CdcaXD6nqCBjue4q2dBi7zqxHdzpHngZnCKKohXPwXMVmF8e7gU4I7mi7trwCwUyga]] )

    storeDefault( 'Brewmaster: Default', 'actionLists', 20161128.1, [[dWZngaGEisAtKO2fPABuO9rcA2qnFsGFd60kDBahMQDsk7v1ULSFG6NqcdtknoikopK0qHi0GHWWjOdQOoferogf9AHQfcPwkqAXkSCIEiKONI6XcwNqYeHOAQKutwQMUOlsbltiUmY1fkFdiEMu0Mjr2oj0NjWFj00esL5brIrcruFNKmAHugVqQ6KkspNsxdIu3trSiPWHGO0OGi4BE1Nnu(at9J(mlKcRJxKQNlSUweJiZzKtk5XW5hNbLWKBPRfP10OzBeKw38mhKRW8855qUWYE1xZ8QpBO8bM6h9zoixH55ekqaM03kjPmMW0EEES4nr9Svi5sXO5vx0MYnoDEA13GNq55cw0znhGoZcjxcgbs2RoyeCk340zqjm5w6ArAnnAcIEBZNxlYvF2q5dm1p6ZCqUcZZjuGamPhGqChQQSkJeuGcgXusj9bgc74y2upMqfOG0LcOupxasmHI9Lqktm2IKoplfypxoanbI7IQC555XI3e1ZcH5cRZtR(g8ekpxWIoR5a0zKimxyDguctULUwKwtJMGO32851AE1Nnu(at9J(mhKRW8C6v8TeOCacXDOQsFLWYgFlXHKuPhIMlfq2jbie3HQk9vclB8TehssLEiAUuazfb8Ox5TcqGTei2Daxaj20QW2ZZJfVjQNxjSSX3sCijvNNw9n4juEUGfDwZbOZtLWYgFlWiqljvNbLWKBPRfP10Oji6TnFETO7QpBO8bM6h9zoixH55ywsStkrLDvKSNNLcSNlhGM0aTKub42KKrbgbYjLOYUks2gNNhlEtuphCmw0d5clr8AZZtR(g8ekpxWIoR5a0zKtkrLDvKSNbLWKBPRfP10Oji6TnFEnK(QpBO8bM6h9zoixH5zKnDmvP(a7H4WyPyacmG6u5dm1v2d5QijsfbSKvHMNNLcSNlhGM0aTKub42KKrbgbNE1DzhmIzuyOX55XI3e1ZbhJf9qUWseV2880QVbpHYZfSOZAoaDMtV6USdgXmkmCguctULUwKwtJMGO32851mE1Nnu(at9J(mhKRW8C6yQs9b2dXHXsXaeya1PYhyQRShYvrsKkcyjRcnpplfypxoanPbAjPcWTjjJcmcucbgqWiMrHHgNNhlEtuphCmw0d5clr8AZZtR(g8ekpxWIoR5a0zucbgqWiMrHHZGsyYT01I0AA0ee92MpVgix9zdLpWu)OpZb5kmpJSPJPk1hypehglfdqGbuNkFGPUYEixfjrQiGLStmpplfypxoanPbAjPcWTjjJcmco9Q7YoyeS6gNNhlEtuphCmw0d5clr8AZZtR(g8ekpxWIoR5a0zo9Q7YoyeS6ZGsyYT01I0AA0ee92MpVgYC1Nnu(at9J(mhKRW8C6yQs9b2dXHXsXaeya1PYhyQRShYvrsKkcyj7eZZZsb2ZLdqtAGwsQaCBsYOaJaLqGbemcwDJZGsyYT01I0AA0ee92MNNw9n4juEUGfDEES4nr9CWXyrpKlSeXRnpR5a0zucbgqWiy1pFEwZbOZOLKka3MKmkWiqoPKhdNp)ba]] )

    storeDefault( 'Brewmaster: Defensives', 'actionLists', 20161128.1, [[dGJ6caGEGI2eqLDbvBJsSpGsZMu3wr2ju2R0UvA)us)ei0WOsJdi45agkqHbtsgoOoOaDkGKogjoSklublvOAXGSCv9msQvbu1YqH1HkvteivtLs1KrvthYffW5vuxg56OOtl61ukBgvSDGu(Mq8zbnnGO(oknsuP8yQA0k04fkNui9xQ4AajUhQKrbe5Pe)MIRsTxjWEqAIVdvWUjQYWtSthaIEUBvfOtCOfibncOsCsthavmgUkwuCDvxr8FcJQujOhLMfO2lMsTxjWEqAIVdvWUjQYG(82SQceJzv1WtSvItA6aOIXWvXIseCx1vIU8P)qMVYAwQsqOuNO5kq6ZBZXeZb6j2kI)tyufVXO5nSlomZp5mNBOd0tS4(X7djaUClQymQ9kb2dst8DOc2nrvI(MfWwUwvn8eBL4KMoaQymCvSOeb3vDLOlF6pK5RSMLQi(pHrvq3Al3qW5ngnVHDXHz(jN5CdDGEIf3pEFibWL3y08g2fhM5NCMZn0b6jwC)49HeGZ0fRsqOuNO5k5BwaB56a9eBrftDTxjWEqAIVdvWUjQcyW8toZ5gAv1WtSvItA6aOIXWvXIseCx1vIU8P)qMVYAwQsqOuNO5kWm)KZCUHoqpXwr8FcJQuuXa5AVsG9G0eFhQGDtuLaXGjTvvC7(PkXjnDauXy4QyrjcUR6krx(0FiZxznlvjiuQt0CfkgmPDgVFQI4)egvzKoDUHoaWJ0t4EdZfbwUuahinsNgnIZtCsFIalxaOdHFi05T5aByPh8rWbfWpsNo3qha4r6jCVH5Ia1IkQIat(80jyEO0SfJHfqOOwa]] )

    storeDefault( 'Brewmaster: Combo ST', 'actionLists', 20161128.1, [[dKJEdaGAuvP1li1MeKSlb2gkAFOky2K62O0ovP9sTBO2VIAuOkYWiY4qvH1HQqdfvfnyfA4q4GeLtHQsogQ8yjTqfzPeyXQYYj5HOQINcwgk8Ci9nb1uHOjRIPl1fjQEjQQ6YixxvzJOQuNwPnRGETe9zvvFfvjnnuLQVli8mczEOkQrtqRcvPCsf4Vs4AcIopHALOkXHf9BH2CgPb548PPJNmCtwYWKIcbBI2KIhNh5Ni7lopciniG0uIs(YqIJjNKKidqvTiAdgKv7nIrnsF5msdYX5tthpzaQQfrBOtnH7GNoRLXVUOgzFXacNpnDcvw7nIdkP)cu2evyGIYJ4IEzjE(VE4nUGqAq2B1Bl2WtN1Y4xxG2QTKmmaF2A2rLbCetgUjlzysN1Y4xppcTAlP5rEI)aFzqaPPeL8LHehtUWbsIC7ldJ0GCC(00XtgUjlzG)0)8iWMOcniG0uIs(YqIJjx4ajrggGpBn7OYaoIjdqvTiAdgK9w92Inus)fOSjQq3(kYinihNpnD8KHBYsgM0zTm(1ZJqR2sYGastjk5ldjoMCHdKezya(S1SJkd4iMmav1IOnyq2B1Bl2WtN1Y4xxG2QTKC7lVBKgKJZNMoEYauvlI2GbbKMsuYxgsCm5chijYWa8zRzhvgWrmzq2B1Bl2G6dv4I)l438qfHyXhd3KLmi4dv4I)Nh5L8qZJ86IpU9nKgPb548PPJNmav1IOnCO33WHbL0FbkBIkm4dHbbKMsuYxgsCm5chijYWa8zRzhvgWrmzq2B1Bl2WtrzlSioSy4Qid3KLmmPOSfopghopY3RIC7ltJ0GCC(00XtgUjlza5(tQ5r(m1SgeqAkrjFziXXKlCGKiddWNTMDuzahXKbOQweTbctQFXb1pLIWnpizq2B1Bl2qV)KQarQzD72aGGQBQ3qN9gX(YGjF42ga]] )

    storeDefault( 'Brewmaster: Combo AOE', 'actionLists', 20161128.1, [[dyZLdaGAcPA9ii9scL2fOABa1(qqmBsDBIANISxQDd1(vr)ebvddP(TOgkHedwfgUGoiI6yeSqHSuK0IHy5K8qcv9uLLbKNdP1HGYubLjRstxvxeepgWZqKRJqBKqkhwQnJaFwOoTKVsiY0ie67ek(gr8xqA0iX4ju5Kc0RfW1ie15jsRKqWLrnocjTfmmpi4grZxh5LAz2lsXIrUrFwryNhIplJKppit4q8OYAUrzNarlawGMMK3auv475rg4Rmg1WCsWW8GGBenFDKxQLzpiIluNVfo(8qSCShvwZnk7eiAbWcsGttYli(wa9NvE4mM9gGQcFppYiLUEPES4c15BHJHgGJ97eidZdcUr081rEPwM9elhFEm5gLIhvwZnk7eiAbWcsGttYli(wa9NvE4mM9gGQcFppYiLUEPEb4yOOYnkf)orYW8GGBenFDKxQLzpXtPopIiQqFpQSMBu2jq0cGfKaNMKxq8Ta6pR8Wzm7navf(EEKrkD9s9aOuqriQqF)ojIgMheCJO5RJ8sTm7fP4(PCEKj48q0kf7rL1CJYobIwaSGe40K8cIVfq)zLhoJzVbOQW37YiejGa4b4yOOYnkf4ed9iJu66L6HO4(Pantauckf73jr2W8GGBenFDK3auv475rL1CJYobIwaSGe40K8cIVfq)zLhoJzpYiLUEPEkIOukCmurVVmuXu4RxQLzpQerPu44ZdrOV85Hiv4RFNaByEqWnIMVoYBaQk89ymRILchGOsX4NqO9OYAUrzNarlawqcCAsEbX3cO)SYdNXShzKsxVuVVIzf0Wwl7LAz2dwfZQZdrP1Y(DsIH5bb3iA(6iVbOQW3ZJkR5gLDceTaybjWPj5feFlG(ZkpCgZEKrkD9s9q0nqGmXhk6RQaSxQLzViDdeit8pp2RQaSF)ElKbQwxeA)vg7eiWIQFBa]] )

    storeDefault( 'Brewmaster: Standard ST', 'actionLists', 20161128.1, [[dWJ4eaGAruA9qu6LkIAxc12qI9jKKztY8HOyDcj1Tf0JvYovQ9sTBO2VQ0OesXWiQFlQ)ksdvrObRQmCs5GKkNsejhdPoNisTqvXsjslgHLt4HkcEkyziQNdPVjetvv1Kvy6QCrI40sUmQRdHnkIW4er1MjvTDiQ(oe5RkImnHu18esLxRi9mK0OvuJxiXjfHplW1erX5rKvkKshwQnjIOnT)nib3ekE4hd7oKn8iyKcB0Jfr97hCnE0IX7h8BqkR4gL9MSmnfAzzQganEvTQq2(Qm2BYusUbDRRYyu)7nT)nib3ekE4hd7oKnmzo49dcB0zdszf3OS3KLPPqhjwMQHe4rT6llmGZy2GoIsvhjdt5Gu0WgD2aSeL2zWN3K9Vbj4MqXd)yawIs7mmyce61hpLdsrdB05yeAidYmyce61hJQXRQvPdwviNfKIrOzqkR4gL9MSmnf6iXYunKapQvFzHbCgZg2DiB4rW9n)(L1)(LeLGnOJOu1rYaHG7BonRpvFjyFEt1)gKGBcfp8JbyjkTZGbPSIBu2BYY0uOJelt1qc8Ow9LfgWzmBy3HSHhvVMMrCVFWjQPSbDeLQosgiu9AAgXLIEIAk7Z7O3)gKGBcfp8JbyjkTZWkNvJms4yneIspPchKsiyKIxZTiGrJUvoRgzKWXAieLEsfoiLqWifVMBraJMg2rXGoIsvhjdxfWIuTwfAibEuR(Ycd4mMniLvCJYEtwMMcDKyzQg2DiB4VcyX73eBvOpVtg)BqcUju8WpgGLO0odxJNw4GKe96Gawe3Hze4lQ0qik9KsVzbJoNvdd6ikvDKmWrrtLhfoiDkhyibEuR(Ycd4mMniLvCJYEtwMMcDKyzQg2DiBqsu0u5rHdE)Mmh4ZBk(3GeCtO4HFmalrPDgmiLvCJYEtwMMcDKyzQgsGh1QVSWaoJzd7oKnifb6CHdE)I2EWVFtQWdd6ikvDKmiqGox4G0KThCksfE4Z7i(3GeCtO4HFmalrPDgmOJOu1rYWAUsjqiqpdjWJA1xwyaNXSbPSIBu2BYY0uOJelt1WUdzdtyUE)EqiqpFENC)BqcUju8WpgGLO0odgKYkUrzVjlttHosSmvdjWJA1xwyaNXSHDhYgMWC9(nPg5SbDeLQosgwZvksnYzFEN0(3GeCtO4HFmalrPDgmiLvCJYEtwMMcDKyzQgsGh1QVSWaoJzd7oKn8xbS49BITk89lAOtkd6ikvDKmCvals1AvOpFgGLO0od(Sb]] )

    storeDefault( 'Brewmaster: Standard AOE', 'actionLists', 20161128.1, [[dOZgeaGAQe16PIuVKkf7sLABqy2uA(uj13OqpgODkQ9s2nI9Rs(jvcnmk63aUmQHsLGbRcdNQ6GivNIkrogsoSKfQIwkfSyqTCbpKkvEQYYGKNdvtKksMkuAYImDvDri61cLNHuUoKAJur0PLAZuL2UqvJJkjFLkLMgvu67cvUTq(ligninEQu1jPk(muCnQOY5PcRKkkwhvu1OOIWIsy1qskylN0PMtXEl02xWAdm0(VMMb2YfoRmktkeuMM00Mpd2LTD66BaIYOq4kn6GFdqWfwLPewnKKc2YjDQnWq7)AA0HBB)o0y37BbsnbdKymgnpKudwpqqJaqyndSLlCwzuMuiOmEBstlxrSgs37BbsnbZ1HBym6vgLWQHKuWwoPtTbgA)xtZaB5cNvgLjfckJ3M008qsny9abncaH1YveR5ggZ1XIkCOA0HBB)o0IXyGGhv4q1RmnHvdjPGTCsNAdm0(VwIHr717Dmgde8Och6nAFx76edJ2R3BCFgSllKeB745GJB0(Agylx4SYOmPqqz82KMMhsQbRhiOraiSgD422Vdn4axpuiaEH4TdSwUIyTZaxp0RdaVxhozhy9k7ScRgssbB5Ko1gyO9FnndSLlCwzuMuiOmEBstZdj1G1de0iaewJoCB73HgSTaJbG(HG)HogRLRiw70wGXaq)xh7dDmwVYoNWQHKuWwoPtTbgA)xtZaB5cNvgLjfckJ3M008qsny9abncaH1Od32(DOfqJdTjyG4YvIHextsA5kI1mGghAtWCD4mvIVoCBts6vgHWQHKuWwoPtTbgA)xtJoCB73Hgi0gcm6a(R5HKAW6bcAeacRLRiwZDq7RJt0b8xZaB5cNvgLjfckJ3M00RSrHvdjPGTCsNAdm0(VMMb2YfoRmktkeugVnPP5HKAW6bcAeacRrhUT97qdeAdjUkEwlxrSM7G2xhUTIN1RSRewnKKc2YjDQnWq7)AAgylx4SYOmPqqz82KMMhsQbRhiOraiSgD422VdTVXWbi(LnslxrSg2gdhUoCHYgDD4euUKE9A5kI1odCCrf(ZbN)6yFrsviDDq3frQxc]] )


    storeDefault( 'Windwalker Primary', 'displays', 20161128.1, [[dStIeaGEcyxqQQTrqntjPmBjoSQUPIQlR0Tj1JvP2jr7vSBPA)u(jKkdJK(TcNxsmuKmyQgosDqP4OeOJbX5KKuleqwkKYILslxfpeepf1YiupxLmrqXubyYsQMoIlQixvscptsPRd0gjiNgQndkTDi5Jsk8vjfnnaLVROyKss06KKQrtiJhKCsqQBrIRbO6EqQYNbvRvssETIshKaiSGGl4w3CHgDI5mwGnseXHPqrzUI5a(d8LK2WuhS(pvmhYttWJU5nGNpC4ZwcdzscycTWvX1AotVLIqL)suAdtHAYCfZb8h4ljTHPqnzUI5WSW(GfsakmfQjZvmhYq3(K0gE(dfwdQnhawVrwRAybbxW9kaIejacp1)2YwpafU5MGhDZRg(IeP4WYxVHzSgI5qRPhhs1nN(S3dD7tcJ2w2)AJuSkIWiQQ1gMVpyAsycwVONAirkoacp1)2YwpafU5MGhDZRg(Iejsy5R3WmwdXCO10JdP6MxFH9blKWOTL9V2ifRIimIQATHesy((GPjHdtHIYCfZHm0TpjTHPqrzUI5WSW(GfsakCLivelSA4g0nzUI5ZFOWAqDKQHrBl7FTrkwfryevXah9rcJ23HVMdr0EplUdp83IlysLWnGKH5kMp)HcRb1rQgMcfL5kMd4pWxI5nfArFKiHzChEznxX854owdQJunSGGl4AEtbdVR3oj8D4MBcE0nhYttWJ(vakmurQgMP)BChEKapmtVLIqL)sK5qgLXjac)rIeUnsKWWJej8jsKqcdzqxXCaJW1e3RpZxMDpM3GUPWuhS(pvmxOrNyoJfyJerCybbxW1CyWN9MGh9WObDnQsaHHzH9blKauybbxWTU5qFp6MZyb2ibMAyHgDs4jOOp711mFLWt9VTS1dqHPoy9FQyo03JU5mwGnsGPgM6G1)PI5qEAcE0dt(d8LCfUbDtMRy(CChRb1rwByMEVXFblWtWJEKIfUQdd99OFzolAmtpsGfgWx2oX8ACgG0rQgMXD4L1CfZN)qH1G6irclF9gUM4E9z(YS7XCQdw)NkHPqnzUI5a(d8LyEtHw0hjs4gqYWCfZNJ7ynOos1WuOMmxXCidD7tmVPql6JejmfkkZvmhYq3(eZBk0I(irctHIYCfZHzH9bleZBk0I(irctHAYCfZHzH9bleZBk0I(ircxvJHoseGhsca]] )

    storeDefault( 'Windwalker AOE', 'displays', 20161128.1, [[d0tNeaGEcv7IquBduCyGzkfX3KIYSL4XQIBQs68sPUTKonu7KK9k2Tc7NYpLsmms53kACsb1qr0GPA4eCqs1rjKogcNtkKfQs1sHOwSkA5G8qi8uulJi9CvyIqKPQknzPIPJ0fLQUQuaptQ01vvBes6ZGQnRsz7qQpkfPVkfvtJq57sjnsPaToPqnAIy8GsNesClI6AQe3tkixwP1siYRjeoe5nSO)9VDmh15GAoJfFJIqAys0KMlB(lac(sZzysiCfa12CeabkEomx)dbchgAlHr0RE7roCdCSMZcBPGAbCijNHjr3BUS5Vai4lnNHjr3BUS5iT3a)cn3dtIU3CzZrmRNaAodFfalU(RM)IRBuD1cl6F)7rEJIiVH7hGZY2j3dR)qXZH5nbFqJsAyfOUHzCfH5OufMq0gBUa0(mRNaAyK3Yco2OKQradHMw3W8dewGgMIRBdPfAusZB4(b4SSDY9W6pu8CyEtWh0OicRa1nmJRimhLQWeI2yZ7S3a)cnmYBzbhBus1iGHqtRBOHgMenP5YMJ0Ed8luZ1lcsarreMenP5YMJywpb0CgMenP5YMJ0Ed8l0CpC7GQCZUaJyW0THBK0lDV0mny0YnzXUeg2O0cJ8wwWXgLuncyi0KErKjcJmyaFnhHK9re4b8WGtCbtBhMeDV5YMJywpbuZ1lcsarreMecxbqTnhLN5WCgl(gLyAHjrtAUS5iM1ta1C9IGequeH5hiSan8bEaVSHjr3BUS5iT3a)c1C9IGequeHz8aEznx28R4bU(Rr1nS(Nonx28RayX1FnkTWSWwkOwahsmhXSmHYByqueHHIIim8OicFgfrOHrmfAB(7mCZXJoTckIyHmxVL(W6F60CzZVIh46Vgv3WI(3)AosyO9HINJWiJstBW3WiT3a)cn3dl6F)BhZr5zomNXIVrjMwys09MlB(lac(snxViibefr4(b4SSDY9WKOjnx28xae8LAUErqcikIWmEaVSMlB(vaS46VgLwy9w6nx28R4bU(Rr1n8lOSdQ5nfA(fIslmkpZXH5SKzRJOelSEl9MlB(vaS46VgLwysiCfa12CeabkEoctbqWx6rysiCfa12CuNdQ5mw8nkcPHrDoOH7HvaApoAf0oScu3Wnhp60kOiIfYC9w6dZc7dguWIdO45ikPW0OWSa4bpGh1LWI(3)AUEbdFu3bn8ty9hkEomhbqGINJJCpSinN1OiUeAca]] )

    storeDefault( 'Brewmaster Primary', 'displays', 20161128.1, [[dGZheaGEOITrf1mvO0SL4Muv9nIeoSs7KWEf7wr7N0pPcggv53s1RjsXqb1GPmCI6GuPJcv6yO4zuHwOczPqPwScwUKEii9uKLbiphiteqnvv0KPImDuDraUkrkDzvDDvAJqjFgeBgkSDv4JkuCAittHQVtvPrsKupgOgnu14HIojvf3cLUgrQoprmoIeTwIKCBPCyYziho(AzLKHq4E)77KAy1NC1ieoFemafc(awnw1o3kKNNHqWvuBRsud6kZr9PAU36gku9lHGcqCca7qslOxns(lfSkli8zie8ba1yv7CRqEEgcbFaqnw1a(XyVfEgfc(aGASQbT3gwEgc5FXe1Un1orTpch9cjv9ElcgPhc(awnw1a(XyVfUAUfz8BemHGpGvJvnO92WYZqi4dy1yvd4hJ9w4zuijrWcKZEHCDaGASQ5FXe1UTi8cH9x(f0hbqEmoZ455yiCV)9vZTGGmB)KhcCi4daQXQg0EBy5Q5wKXVrWec(awnw1o3kKNRMBrg)gbti4dy1yvdAVnSC1ClY43iycrGRizEOqWhauJvnGFm2BHRMBrg)gbti3lVRgRA(xmrTBlcVqK8xkyvwq4vdAV0R5m0gbtOAemHGebtOHiycpej)GrBbHZYr9zea5SugIqtiLxnw18JMO2TfHxiCV)9vdyu9bZr9ziS9zms9zi4kQTvjQ5d4(uncHZhX4EHW9(33j18bCFQgHW5JyCVqUxExnw18JMO2TfHxiaZDO8oLrHGpaOgRANBfYZvZTiJFJGjeHMqkVASQ5FXe1UTiyc56aa1yvZpAIA3weog6Cl)KR2yQ9RCeEH8bCFcsncF33zeJhc37FFq5mcMCgcWChkVtzuixWCuFQ2yrG4rifHeB7db8JXEl8qy)LFb9raKhJZmEEogIaxrY8qHhEi4kQTvjQbDL5O(meFRqEoOqWvuBRsudR(KRgHW5JGbOqy1N8qUv0wutS1A33qIT9HgvFFBli(xvdUIABvsisEbJMqIq6HWENqE1GI)blnOjKq7aQG4scbTllrTZEOr1332cI)v1CDaqixWCuFQg0vMJ6tqzuimJWl8ea]] )

    storeDefault( 'Brewmaster AOE', 'displays', 20161128.1, [[dKJpeaGEuW2afZuPQmBsDtf4WaFtcCzv2jr7vSBLSFQ(jeAysYVv01KqnuinykdNKoijokk0Xi4CeQAHkvwkkQflPwUu9qi6PiltI65QQMOc1ubXKvQY0r1fvkxLqjptHCDvzJqWRjuyZkOTdsFKqLpRQmnqPVlbnsLQQhdQgnHmEuKtkHClu60qDEjY4iuQ1sOOBlLJqGecrOxxdkL6qm(U3TNBimxC3imdxKcLdH2XnqVKBimxC3imdxKcLdH2XnqVKBibQC8C5MYRdcfQF6qi3Kq2yoKy9FUrQNwJGg8lk1HivaC86lYIdHcDZnw3gFdbpnp7cHcDZnw3qoB1aEQdnaWeU9AUbb3UihvfsmNZwKcfhcfkQBSUn(gcEAUBkAvrGifcHcf1nw3qoB1aEQdHcf1nw3gFdbpnp7cvkiWwqXWalmJepSWuUC5ceFbvzilSfhIPiRcX8PpW)fz5kbyeQQgfIX39o3u04Vv7w8qWdHcDZnw3qoB1aUBkAvrGifcHcf1nw3Ga6Fh3nfTQiqKcHqHI6gRBiNTAa3nfTQiqKcHuqCZnw3gayc3ETiRcPaNJNl3qcu5456p7cXmy9DUHu0bxmWRVqGASgZlfcf6MBSUbb0)oEQdrQNwJGg8lYnKt9ShiHarkeQosHqFrkeQhPq4Hqovl5gKzOD9RWg4NFD3uqClePEWXanMbahpxrwggXoeJV7DUng3p4C8CfI5Ie3(HescAxOD9RWg4NFD3uqCleJV7D75wrWNl3imdxKWwfcH5IhsPJbA3KGEFwyOTfOwF7LDHqHI6gRBqa9VJN6qODCd0l5gsGkhpxH4G(3X)dPG4MBSUnaVWTxlYrHy8DV7pqIuiqcTTa16BVSlKcCoEUCBF4FEKfescAxOX3qWtZdX8PpW)fz5kbyeQQgfIG3XQ8qHhEOIGpx)UrIMfUIe2qqa6BXDtC95tnYQqeE9Pp3yDBaGjC71ISkKYJpDJ1Tb4fU9Arokek0n3yDdcO)DC3u0QIarkeA8ne808uhcTJBGEj3kc(C5gHz4Ie2QqeE9Pp3yDBaEHBVwKJcP84t3yDBaGjC71ISkek0n3yDB8ne80C3u0QIarkeIG3XQ8q)41N(cpba]] )

    storeDefault( 'Brewmaster Defensives', 'displays', 20161128.1, [[dOtmeaGEeY2qqZebYSf6WQ6MIQEnjs3wPEMOYojAVs7wW(P6Nardtu(nGhdQgkugmLHtkhuKokc1XGQZjISqG0srQSyL0YvPhIuEkQLjcpNKMOs0ubPjduMoHlckxfbQlR46QyJavNgYMjHTtQ(ijIpdIPHa(oqyKivX4ernAe14rKojjQBHKRHioVs4VivL1IuL(gsv1fVqlds95g)fDTmXN5mG5g4abHBmIOPs8eLX0XCJYnO)fYi6AzSlA)3fUr71eiGGBPN7xU8DILPbtcfgDLjy1XnwBIrWJVk5UwgthMBuUb9VqgrxlJPdZnk3wok(tuuqlJPdZnk3ObSxFrxlN)jfTpB3GI2tL5YktVaa7kZLvgthZnk3wok(tu4wAuJ8xjEzmDm3OCJgWE9fDTmMoMBuUTCu8NOOGwErbNIe8KtIWKiHa4jLe9NJWCzvbfbiq5uqcZnk3Y)KI2NDLzLPBIZRovMidNq8SSCLj(mNXT0icsypbrz4LX0H5gLB0a2RVWT0Og5Vs8Yy6yUr5g0)czeULg1i)vIxgthZnk3ObSxFHBPrnYFL4LjTYSYPWfiGGB0EnbciOwqlZAtmcE8vj7gnGiWTql)vIxETs8YqQeV8Ts8kkZAdC0hre9ceqOYeeMCz6(aKXnAKh4kffGu(xrrKyrzIpZzCBj6oWfiGqz6uwj0d0YS2dhfGujjLj(mNbm3ugoqWngr0uzcskJDr7)UWnWbcc3yertL4jkdl8RXbScAz5VNYGEhqSFvXCDB5OycQi9rTm4abr50l6JUj)7faeLtbjm3OClpkG2NDL5kJDr7)UWnAVMabekd2O4prrzIpZzul0kXl0YWc)ACaRGwofUabeCJGqQIktUS83t5LJIjOI0h1Y0nX5vNktKHtiEwwUYm8lstu(Oo0hyJIjOI0h1kQOSYWbcQUXKbarOYeLH(XjiCtjxGJwLzLzuasCCJYT8pPO9zxjEzmDyUr5g0)czeULg1i)vIxo9iaCJYT8OaAF2vMvg7I2)DHBkdhi4gJiAQmbjLzuasCCJYT8OaAF2vMvo9iaCJYT8pPO9zxzwzmDyUr52YrXFIc3sJAK)kXlZWVinrzXhukkaPIwa]] )


    Commit( 'initializeClassModule', MonkInit )
    Hekili:ReInitialize()

end
