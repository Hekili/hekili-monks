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


    storeDefault( 'SimC Import: default', 'actionLists', 20161130.1, [[dOtriaGEcs1MOq7IOTbGzcu1SHmFkXTHQdRYobYEjTBr7xQmkPWWOGFRQNJ0qjiPblLgUu1bjWPKIogGohaHfsqTukklMsTCqpek1tvSmGY6aQmrcszQiKjlX0P6IuunocsCzuxxP68qXPf2mIESs(mL0FL00aOMNsXibi61eQrdL8DeCsLspJqCnas3JI8ncPdrqSieQvGkr6yEE2iUOcRJqJjVDKRcRdOdN1zcCS7A3I3)qhCDTfM82rUoMXi(OSccmdabaiqWeksG6mly076OJGLhFsvIuqavI0X88SrCrfwNzbJExh)TAfXYiDgc37DQocSdu4y0H2ZhSI1LLk1HHywNTzjwN)qDYpzDaD4SotpFWUwa5LLU2XHHywhZyeFuwbbMbGaauuPbruxbbMsKoMNNnIlQW6mly0764VvRiwU(hvEcj1yd7DssjLHCgog5EVfl27KKsQ)q8kFqhR6LLkzaz5EVflneIFioDjLHCgogjNNnIlgDyKIzx2d)L8SgOWXi37BAXI9ojP0g9FbTtD5EVfl(bTYU0dCU6FTe8gtayOPocGwP6KhoB6rLkHdQJa7afogD6Fp(uNTzjwN)qDYpzDaD4Soc13Jp1XmgXhLvqGzaiaafvAqe1vqIOePJ55zJ4IkSoZcg9Uon8dXPlPmKZWXi58SrCX46Fu5jKskd5mCmsiJFrs3yYqtJnACqpiVLlPomeZ1NS6yXvcrwqpSi58SrCX46Fu5jKsQddXC9jRowCLqKf0dlsiJFrs3yciGnU(hvEcPeg0iTwP7zvCSelHm(fjDJja30If7DssjLHCgog5EFtDeaTs1jpC2eXtGJDx7w8(h6GRRLYqodhdX6iWoqHJrN1Hq1B5XNvuqDD2MLyD(d1j)K1b0HZ6G9HqDTcwE8zxl4dQRJzmIpkRGaZaqaakQ0GiQRGaSsKoMNNnIlQW6mly076ie)qC6skd5mCmsopBexm2OXb9G8wUK6WqmxFYQJfxjezb9WIKZZgXfJR)rLNqkPomeZ1NS6yXvcrwqpSiHm(fjDJjGa246Fu5jKsYG606twj3HyKqg)IKUXeagx)JkpHucdAKwR09SkowILqg)IKUXeanTyXENKus9hIx5d6yvVSujdil37BQJaOvQo5HZMiEcCS7A3I3)qhCDTuMKyDeyhOWXOZ6qO6T84ZkkOUoBZsSo)H6KFY6a6WzDW(qOUwblp(SRf8b17ABaSPoMXi(OSccmdabaOOsdIOUccqvI0X88SrCrfwNzbJExNg(H40LugYz4yKCE2iUyC9pQ8esjLHCgogjKXViPBmzOPXgc5GEqElxsDyiMRpz1XIReISGEyrY5zJ4IX1)OYtiLuhgI56twDS4kHilOhwKqg)IKUbiGnU(hvEcPKmOoT(KvYDigjKXViPBmbeqnU(hvEcPeg0iTwP7zvCSelHm(fjDJOnTyXENKusziNHJrU3RJaOvQo5HZMiEcCS7A3I3)qhCDTugYz4yiwhb2bkCm6SoeQElp(SIcQRZ2SeRZFOo5NSoGoCwhSpeQRvWYJp7AbFq9U2gG1uhZyeFuwbbMbGaauuPbruxbbGsKoMNNnIlQW6mly076ie)qC6skd5mCmsopBexm2OHqoOhK3YLuhgI56twDS4kHilOhwKCE2iUyC9pQ8esjzqDA9jRK7qmsiJFrs3ycqyC9pQ8esjmOrATs3ZQ4yjwcz8ls6gtaAtlwS3jjLu)H4v(Gow1llvYaYY9(M6iaALQtE4SjINah7U2T49p0bxxlLjjwhb2bkCm6SoeQElp(SIcQRZ2SeRZFOo5NSoGoCwhSpeQRvWYJp7AbFq9U2gI0uhZyeFuwbbMbGaauuPbruxbjQsKoMNNnIlQW6a6WzDW(qOUwblp(SRf8b17ABa4M6iaALQtE4SjINah7U2T49p0bxx7qeX6iWoqHJrN1Hq1B5XNvuqDD2MLyD(d1j)K1XmgXhLvqGzaiaafvAqe1vxNPNxXHcH(5XNkiWaaqOUQa]] )

    storeDefault( 'SimC Import: precombat', 'actionLists', 20161130.1, [[b4vmErLxtvKBHjgBLrMxc51uevMzHvhB05LqEnLtH1wzEn1uP12q(bwsTb3BYrNo(bgCYv2yV1MyHrNxtjvzSvwyZvMxojdmXytmXidoUeJxtn1yYLgC051uEnvqJrxAV52CErLxofJxu51uf5wyIXwzK5LqEn1uJjxAWrNxtr3BNDgBL5YyV9gBK92DUnNxtfKCNnNxt5wyTvwpVXgzFDxyY51ubjwASLgD551uW9gDP9MBEnvsUrwAJfgDVjNxt52BUvMxt5uyTvMxtb1B0L2BU51usvgBLf2CL5LtYatm2eZnUaZmErNx051utbxzJLwySLMEHrxAV5MxojJn54fDE5f]] )

    storeDefault( 'SimC Import: sef', 'actionLists', 20161130.1, [[dKJrdaGEkkBckXUOITrb7dkQzcfz2qUTQANaTxXUvz)OyuqfnmQ0Vj8CqDyLgmknCk0bvKtbLYXa5CePAHuKLsPSyfSCuTiOQEkYYuLwNQGjsKYub0KjQPl1fbyCQc5YKUousBekW5PeBMIQtl5ZkQzbLQPPkuFhQWZOK(MQOrdvA8qvojrClOGUguO7rK8yQ6HuQ(RcDGcWqaUDaPYXuiPPMVyf1XuiW9RHO6BNHvY3OG3pWWcRMhYMI0fwd4RlKbiO3h5afI88Yyhk0KVlXbhGbekadb42bKkhtHa3VgcWP85YS6MzybGk8kEOPHcvTLq6P85YS6MhvuHxXdj5Kl)2cEOtCAiBksxynGVUqgGE64AnDaFdWqaUDaPYXuiYZlJDOwmpJuhVqGKf44GXco94wo)fpm0JB54XkNRxJzPGWIEkF2ItxFDSfJ)fpmlLRdgXwOPHcvTLql3VNo2coxVoKKtU8Bl4HoXPHa3VgAI73tzybk4C96q2uKUWAaFDHma90X1A6aAnadb42bKkhtHa3VgY(IqmSt(UehdlMk4o0eFgo0TFvk8P6BNHvY3OG3pWWAxA4hAAOqvBjKFrOX13L4grfChsYjx(Tf8qN40q2uKUWAaFDHma90X1A6a(4ameGBhqQCmfI88YyhQfZZi1Xleizboo4qtdfQAlHGBb)pQlVXDCp5rZlUgsYjx(Tf8qN40qG7xdrTG)XodlGL34IDg29KzyXGIRHSPiDH1a(6cza6PJR10beJbyia3oGu5yke4(1q2xeIHDY3L4yyXub3mS4ecBHM4ZWHU9RsHpvF7mSs(gf8(bgwci(HMgku1wc5xeAC9DjUrub3HKCYLFBbp0jonKnfPlSgWxxidqpDCTMoDiYO6RfvMTDjUa(Aq6Pta]] )

    storeDefault( 'SimC Import: serenity', 'actionLists', 20161130.1, [[daeZjaqisLSisLQnjv0OOs6uujwLku1UOQgMu1XG0YikpJqnnPu4Aec2gvQVjvACsPOZjLkToPuX8iKCpvi7JqkheIwiPQhsiAIKkLlkf2OkuoPu0kjKQEPuHzsiv2jblLO6Pitvk5RsPu7v5VIAWuLddAXKYJHAYQQlJAZq4ZuXOjvCAkRwfQ8AImBHUTG2TKFRkdxLSCsEUith46QOTRc(UuQA8sPKZRsTEcH2Vap01AuJcQf5)0ps3yeWZiy6hjad5rKfkYaVMHxpfODc8sSIldCpsohzyINGSEu3OOYAtF0rewzxGrJqIb2RsR1eqxRrnkOwK)t)ibyipQrXkhteTYjWRr0AltncPMfnW9iUyLJjIw5K5O1wMAuZ6Byi4PgvVIhjNJmmXtqwpQB0U(9IhycYwRrnkOwK)t)ibyipsKWymWdjgyVkWt0zjWiKkN0OcgYhP7KfkYaVMHxpfODc8ePUP7JqQzrdCpcdJXmedSxLJwcmQz9nme8uJQxXJKZrgM4jiRh1nAx)EXdmbXR1OgfulY)PFeHv2fye454ezF87f)V2xPri1SObUhLyfxg4EuZ6Byi4PgvVIhjad5reR4Ya3JKZrgM4jiRh1nAx)EXdmH2yTg1OGAr(p9JeGH8icOmjoW7HiWdOdh412w9Jp1FesnlAG7rjGYK48drgOdNBVv)4t9h1S(ggcEQr1R4rY5idt8eK1J6gTRFV4bMGiSwJAuqTi)N(rewzxGrANiq4Nyfxg42)8QtTtei8tSIldC7R4qOvjrDKd(F8O(IWiKAw0a3Jqyjqk)qKrCQUh1S(ggcEQr1R4rcWqE0XSeif49qe4DSt1DGNRC9DzKCoYWepbz9OUr763lEGj4ETg1OGAr(p9JiSYUaJGyGDGZCXHgNeL4oD9ZANiq4hcvs5hImqhoJvWI9pV6eIb2bo)Fa)qOsk)qKb6WzScwSOGyGDGZCXHgNCzesLtAe(gh5maQCyq6i0ri1SObUhPSKvo50zLLmS0OM13WqWtncFJJ8ibyipsULSYjWJoRaVomSuGNROUmsohzyINGSEu3OD97fpWe6UwJAuqTi)N(rewzxGrqmWoWzU4qJtIs8iKkN0Ori1SObUhPSKvo50zLLmS0OM13WqWtnQEfpsagYJKBjRCc8OZkWRddlnsohzyINGSEu3OD97fpWeAZ1AuJcQf5)0psagYJoMLaPaVhIaVJDQUhHuZIg4Eeclbs5hImIt19OM13WqWtnQEfpsohzyINGSEu3OD97fpIWk7cmAGj0UR1OgfulY)PFeHv2fyeedSdCMlo04KODK4o11LIpKDWF)0LvLvozScwCwYWsJqQzrdCpkDzvzLtgRGfNLmS0OM13WqWtnQEfpsagYJOlRkRCc8ePcwCGxhgwAKCoYWepbz9OUr763lEGjG2VwJAuqTi)N(rewzxGrqmWoWzU4qJtI2rI701pRDIaHFiujLFiYaD4mwbl2)8Qtigyh48)b8dHkP8drgOdNXkyXIcIb2boZfhACYLrivoPr4BCKZaOYHbPJqhHuZIg4EKYsw5KtNvwYWsJAwFddbp1i8noYJeGH8i5wYkNap6Sc86WWsbEUk2LrY5idt8eK1J6gTRFV4bMak6AnQrb1I8F6hryLDbgbXa7aN5IdnojAhjEesLtA0iKAw0a3JuwYkNC6SYsgwAuZ6Byi4PgvVIhjad5rYTKvobE0zf41HHLc8CvMlJKZrgM4jiRh1nAx)EXdmbuzR1OgfulY)PFeHv2fyKUUu8HSd(7RfHyP3jilzyPoD9ZANiq4hcvs5hImqhoJvWI9pV6eIb2bo)Fa)qOsk)qKb6WzScwSOGyGDGZCXHgNCzesLtAe(gh5maQCyq6i0ri1SObUhPfHyP3jilzyPrnRVHHGNAe(gh5rcWqEK(iel9obbEDyyPapxrDzKCoYWepbz9OUr763lEGjGkETg1OGAr(p9JiSYUaJ01LIpKDWFFTiel9obzjdlncPYjnAesnlAG7rAriw6DcYsgwAuZ6Byi4PgvVIhjad5r6JqS07ee41HHLgjNJmmXtqwpQB0U(9IhycOTXAnQrb1I8F6hryLDbgPRlfFi7G)(PlRkRCYyfS4SKHLgHuZIg4Eu6YQYkNmwblolzyPrnRVHHGNAu9kEKamKhrxwvw5e4jsfS4aVomSuGNROUmsohzyINGSEu3OD97fpWeqfH1AuJcQf5)0pIWk7cmsxxk(q2b)9vNjDSYjFCWpNBVv)ri1SObUhPot6yLt(4GFo3ER(JAwFddbp1O6v8ibyips(zshRCc8e9Wph412w9hjNJmmXtqwpQB0U(9IhyGr0fJny0eriWE1eK5UDhyda]] )

    storeDefault( 'SimC Import: ST', 'actionLists', 20161130.1, [[di0ilaqikkwKOs1MiLAussoLKu3suPSlKmmr6yqSms0ZeIPjvPCnrLSnb6BIQgNuLQZjvfwNuv08ev09OOAFsvCqsyHc4Hsv1ePOKlkK2OuL4KsIvsrP8srfMjfLQDIudvQkTub5PetLI8vqu2RYFLyWsLddSyk8yetgsxg1MfuFMKgnP40uTAPkPxluZMs3MuTBv(TugUiwouphutxvxxu2oi8DsjnEqKZdsRhevZNuI9lPEiZ0KOhWWYOlWeZIddYS)cmHgOZtexV)6Uk6jn83N1DIPjHyldG5rRmfjicIYENczIqWEYpzIcY7TdEMgnYmnj6bmSm6cmHgOZt6hyT1DkiV3U6oZUd)tuGvHNCaD28CxC9(R7QON0WFFw31VzL7tuy4w)HoHaS2cG8E7kwh(Nu5qDc4B4jx74jHyldG5rRmfjisEQ0i7hTYzAs0dyyz0fyIqWEYp5BQQwMI0Aw0MwpyTRIOXP0bqk3iACksggZ33J5iAZhJvHs9Uox(wrhaPEmpLkxvprHHB9h6eaMaoU8nmMVFsLd1jGVHNCTJNqd05jkWeWX1DMAymF)KqSLbW8OvMIeejpvAK9JoYmnj6bmSm6cmriyp5NWhJvHsrYWy((CYhJvHsPdGK2enofjdJ57ZP5ituy4w)HoHpgR6qUFQf26qYXtQCOob8n8KRD8eAGopj6XyvhY9tTUlQ1HKJNeITmaMhTYuKGi5PsJSF092mnj6bmSm6cmriyp5N8alFpfmJ5ZFOu8bmSmQw0cG8oeCHpw3z4CgCIcd36p0jWp2J5slC51WfT6hQTHrNu5qDc4B4jx74j0aDEI8ypMR7AHR7EnCDhK5hQTHrNeITmaMhTYuKGi5PsJSF05AMMe9agwgDbMqd05j9Id)W1DTW1D9sgg6efgU1FOtc7WpCPfUeoddDsLd1jGVHNCTJNeITmaMhTYuKGi5PsJSF0bNPjrpGHLrxGjcb7j)ea5Di4cFSUZW9aiVdbxqBpf2H9tTaNDLyNeRnkBKfomf2H9tTaNDLyNetLLmrbwfEcbkXYLhGv5h2CKjkmCR)qNGDy)ulWzxj2jXtQCOob8n8ecuILNqd05jHCy)uR7KSRUlhojUURkKQNeITmaMhTYuKGi5PsJSF05NPjrpGHLrxGj0aDEsih2p16oj7Q7YHtINOaRcpzIcd36p0jyh2p1cC2vIDs8KkhQtaFdp5AhpjeBzampALPibrYtLgz)O79zAs0dyyz0fycnqNNazACS1p16oZcduBxDxFZoIMjkmCR)qNOvno26NAbfduBxjj7iAMu5qDc4B4jx74jHyldG5rRmfjisEQ0i7hDFmttIEadlJUatec2t(jaY7qWf(yDNH7X8iABMemdrrLGsbN435NAHGbhxIDs8efgU1FOtGt878tTqWGJlXojEsLd1jGVHNCTJNqd05jsIFNFQ1D9Jbhx3LdNepjeBzampALPibrYtLgz)OrsNPjrpGHLrxGjcb7j)eIgNshaPCJOXPizymFFpiABMemdrrLGsHZG14NAPxbOCrR(HorHHB9h6eCgSg)ul9kaLlA1p0jvouNa(gEY1oEcnqNNekdwJFQ1DMnakx3bz(HojeBzampALPibrYtLgz)OrqMPjrpGHLrxGjcb7j)KQiACksggZ33dIw0Irw4WugT4scUrOYsQwBZKGzikQeukdlGe3Y(sStI1Uku2ilCykDaoU0cxEnCHGbhtLLOnG8oeCbT9u6aCCPfU8A4cbdooNaY7qWf(yDNHREIcSk8ecuILlpaRYpS5ituy4w)HoXWciXTSVe7K4jvouNa(gEcbkXYtOb68KawajUL91D5WjX1DvHu9KqSLbW8OvMIeejpvAK9Jgr5mnj6bmSm6cmriyp5NufrJtrYWy((Eq0IwmYchMYOfxsWncvws1ABMemdrrLGszybK4w2xIDs8efyv4jtuy4w)HoXWciXTSVe7K4jvouNa(gEY1oEcnqNNeWciXTSVUlhojEsi2YayE0ktrcIKNknY(rJezMMe9agwgDbMieSN8t4JXQqPExNlFROdGupMRKszUMOWWT(dDcrJx0kacEsLd1jGVHNCTJNqd05j9RXR7Gmae8KqSLbW8OvMIeejpvAK9JgP3MPjrpGHLrxGjcb7j)e(ySkuQ315Y3k6ai1J5kPuMRjkmCR)qNq04fJmm8pPYH6eW3WtU2XtOb68K(141DbYWW)KqSLbW8OvMIeejpvAK9JgjxZ0KOhWWYOlWeHG9KFIzsWmefvck17QmUKaS6AxfkBKfomLoahxAHlVgUqWGJPYs0gqEhcUG2EkDaoU0cxEnCHGbhNta5Di4cFSUZWvprbwfEcbkXYLhGv5h2CKjkmCR)qN8UkJljaR(KkhQtaFdpHaLy5j0aDEIjxLX1D9fy1R7QcP6jHyldG5rRmfjisEQ0i7hnsWzAs0dyyz0fyIqWEYpXmjygIIkbL6Dvgxsaw9jkWQWtMOWWT(dDY7QmUKaS6tQCOob8n8KRD8eAGopXKRY46U(cS6tcXwgaZJwzksqK8uPr2pAK8Z0KOhWWYOlWeAGopXKRY46U(cS61DvLw31VgV6jHyldG5rRmfjisEQ0itQCOob8n8KRD8eHG9KFcrJtrYWy(EZtNOWWT(dDY7QmUKaS673prsyIdSoKdEVDJwzW(y)g]] )

    storeDefault( 'SimC Import: CD', 'actionLists', 20161130.1, [[dWZKgaGELIQnri7srBtjCyvMnrpNQgNiOZdk3wbNwv7uK2lYUb2Vs1OOqnmc1VfEmu)LkdgedxjDiruNIc5yIQZPuuwOO0sbvwmfTCs9qrapvQLrjwNsrAIIitLsAYqMUKlcQAwkf8mqY1jXgvkIptsBMsTDqQ(of8vLczAIqnprrVwjASkfQrtW4fHCsLsxg11eb6EIchhKYbviFtHAkNSsn8GZuYikl1jX2NISOSuNEdm19pKa7q2oSg6At3HKajrnCSKpptPweNVip3scN5u3y9Vwut9iC9bWtwP0CYk1WdotjJOSu3y9VwuxHQQKN4iKOWaWt9iZx(fmQFa0JLSlrkmG6Ta0JVk0udcatD6nWuVfa9yjVdzJvyWg2Huc8oKns4lEhI1xL1udhl5ZZuQfX5lYhpfdfvuQfYk1WdotjJOSu3y9VwuxHQQKN4iKOWaWt9iZx(fmQnLrGC2kAyuVfGE8vHMAqayQtVbM6SYiq7q2efnmQHJL85zk1I48f5JNIHIkkfkYk1WdotjJOSu3y9VwuxHQQKN4iKOWaWt9iZx(fmQnzTN1lFGk1BbOhFvOPgeaM60BGPolR9SE5duPgowYNNPulIZxKpEkgkQO0etwPgEWzkzeLL6gR)1I6kuvL8ehHefgaErgN8PR3(W1u9KSZur7RjdotjJeXqt5xxz0u4rig4goFXAVZo0MpcXaxfkybrjVQzO7uXOzfkybxy7q8vcgr9iTQNAmmSKD1Pv5YNr(ggUe5WWWs2vNwLlFgwOEK5l)cg1vOGfCHTdXxjq9wa6XxfAQXWWsM60BGP2AOGf2He27qsIVsGA4yjFEMsTioFr(4PyOOIstqYk1WdotjJOSu3y9VwuxHQQKN4iKOWaWlY4KpD92hUMQNKDMkAFnzWzkzKOKzOP8RRmAk8iedCdNVyT3zhAZhHyGRcfSGrupY8LFbJ6kuWcUW2H4ReOEla94Rcn1GaWuNEdm1wdfSWoKWEhss8vc7qmo3iQHJL85zk1I48f5JNIHIkkDbzLA4bNPKruwQBS(xlQRqvvYtCesuya4fz8PR3(W1u9KSZur7RjdotjJeXqt5xxz0u4rig4goFXAVZo0MpcXaxfkybr4iKOWay6l9VKDHTReyNHhGKHgn18W9aFMjueocjkmaM2VV8UW2zROHn18W9aFMzKyr4iKOWayQF)duDEfGB5Jxo18W9aFMJfL8QMHUtfJMvOGfCHTdXxjye1J0QEQXWWs2vNwLlFg5By4sKdddlzxDAvU8zyH6rMV8lyuxHcwWf2oeFLa1BbOhFvOPgddlzQtVbMARHcwyhsyVdjj(kHDigBXiQHJL85zk1I48f5JNIHIkkDmzLA4bNPKruwQBS(xlQRqvvYtCesuya4fz8PR3(W1u9KSZur7RjdotjJeLmdnLFDLrtHhHyGB48fR9o7qB(iedCvOGfeHJqIcdGPV0)s2f2UsGDgEasgA0uZd3d8zMqr4iKOWayA)(Y7cBNTIg2uZd3d8zMrIfHJqIcdGP(9pq15vaULpE5uZd3d8zo2iQhz(YVGrDfkybxy7q8vcuVfGE8vHMAqayQtVbMARHcwyhsyVdjj(kHDigdLrudhl5ZZuQfX5lYhpfdfvurDVY4)K)MF1hak1YInJkIa]] )

    storeDefault( 'Brewmaster: Default', 'actionLists', 20161130.1, [[dWZngaGEir1Mib7IuTnHyFuuA2qnFijpNshMQBdyzcPDsk7vz3s2pe(jKIHPc)g05HunuiHmyiA4e0bvrNcsuogfoTQwiqTuGyXQ0Yj6Hqk9uupwW6OOAIqsnvsYKLQPl6IuKXrsvxg56cLNjf9nG0MjPSDsOptG)sOPrsLMhKinsir8Ds0OPOy8qcCsPuVwO6Aqc6EsjlskCisQyuqc1ZyQgBQ8lM6d8ynhGgdwskbCBssZrGe1KAEmCoMfsH3Xpk3ZhwtlAe1pgectULMw0dJiggrvVUXyoiFH54XNH8HLDQMMXun2u5xm1h4XCq(cZXjuGamP)vsszmHPD859XFI(yRqYLIMXRUOnLFCAC7Q)bpHYXfSOXAoanMfsUebsuIxDei5u(XPXGqyYT00IEyeXau9JMlNw0PASPYVyQpWJ5G8fMJtOabyspaH4ouzzvafJkuDJPMA6xme2XXSPEmHOcvPlfqPE(aKycf7pHsBf5aLn(ukWoUCaQfe3fv6YXN3h)j6JfcZhwJBx9p4juoUGfnwZbOXOiy(WAmieMClnTOhgrmav)O5YP1CQgBQ8lM6d8yoiFH540R4FjqHaeI7qLL(lHLn(xIxjPupygxkGSTcqiUdvw6Vew24FjELKs9GzCPaYkc4Oaf(kab(sGy3bCbKytRzpgFEF8NOp(LWYg)lXRKuoUD1)GNq54cw0ynhGg3wclB8VqGeSKuogectULMw0dJigGQF0C50u3PASPYVyQpWJ5G8fMJJzjXoPgv2xrYo(ukWoUCaQvdWssjGBtsAocKOMuJk7RizBm(8(4prFCWXyrpKpSeXVnh3U6FWtOCCblASMdqJrnPgv2xrYogectULMw0dJigGQF0C50qHt1ytLFXuFGhZb5lmhRoPJPk1VypehglfdqGluNk)IPUcEiFfjrQiGNSM1y8PuGDC5auRgGLKsa3MK0Cei50RUl7iqEIgtngFEF8NOpo4ySOhYhwI43MJBx9p4juoUGfnwZbOXC6v3LDeiprJPXGqyYT00IEyeXau9JMlNwKPASPYVyQpWJ5G8fMJthtvQFXEiomwkgGaxOov(ftDf8q(ksIurapznRX4tPa74YbOwnaljLaUnjP5iqIwiWfIa5jAm1y859XFI(4GJXIEiFyjIFBoUD1)GNq54cw0ynhGgJwiWfIa5jAmngectULMw0dJigGQF0C50aDQgBQ8lM6d8yoiFH5y1jDmvP(f7H4WyPyacCH6u5xm1vWd5Rijsfb8KTLX4tPa74YbOwnaljLaUnjP5iqYPxDx2rGKv1y859XFI(4GJXIEiFyjIFBoUD1)GNq54cw0ynhGgZPxDx2rGKvngectULMw0dJigGQF0C50u)un2u5xm1h4XCq(cZXPJPk1VypehglfdqGluNk)IPUcEiFfjrQiGNSTmgFkfyhxoa1QbyjPeWTjjnhbs0cbUqeizvngdcHj3stl6Hredq1pAoUD1)GNq54cw04Z7J)e9XbhJf9q(Wse)2CSMdqJrle4crGKvTC5yutQ5XW5aVCd]] )

    storeDefault( 'Brewmaster: Defensives', 'actionLists', 20161130.1, [[dGZ9caGEqI2eiv7csBJuzFGKMnj3wr2jk2R0UvA)uIFcIYWuOFtXJPQHcsyWKQgoQCqbCkqKogknoqklublvqTyalxvhwLNsSmq1ZbAIGIMkLQjtkthQlsjDEf1LrUoeoTOVjK2meTDqu9mb5ZuPPbc8Du1ibb9AkLrluJxioPa9xQ4AGqUhO0OaHAvGcRdeXLT2RyDpafPvGkWKqEiu4our8FYHRujmPOdKkd8rwDSSWHgkBfHJ85PsO8WPzldCDqRsaponlyTxg2AVI19auKwhQWCtuLb15TzrpKfXI(HN4ReMu0bsLb(iRo2OOJHQeC1s)HnFL1SuLaaPkXZvauN3MJjIdWt8ve)NC4kEJrPz4xuoeFICoxxhGN4r9X37sGWowCzGx7vSUhGI06qfMBIQe8nlOTCTOF4j(kHjfDGuzGpYQJnk6yOkbxT0FyZxznlvr8FYHRGV1wUUq3Bmknd)IYH4tKZ566a8epQp(ExcewVXO0m8lkhIproNRRdWt8O(47DjqNPlsLaaPkXZvY3SG2Y1b4j(IltOAVI19auKwhQWCtufOaXNiNZ11I(HN4ReMu0bsLb(iRo2OOJHQeC1s)HnFL1SuLaaPkXZv4q8jY5CDDaEIVI4)KdxP4Yab1EfR7bOiTouH5MOkwJWrkl6HW7NQeMu0bsLb(iRo2OOJHQeC1s)HnFL1SuLaaPkXZvOiCKYj((PkI)toCLy6u566aYftpH6niwmuHLf6qCmDkCmQgHm9jgQWcIpm6HXN3MdNHNEyeffIGrmDQCDDa5IPNq9gelgslU4km3evz4j(PdetpKyrpmjK0cMqobwCla]] )

    storeDefault( 'Brewmaster: Combo ST', 'actionLists', 20161130.1, [[dOZSdaGAcQA9eq2ebWUiLTHI2hbOztYTHQ1ra1oHyVu7gv7hKgfbIHjWVL4WIgkbjdgOgUI6GcYPii1XqPNrQSqfAPOWIH0Yj6Heu8uvldkEoOMibvMQKmzatxQlsQ6BsQUmY1bYgji60kTzjLXri5ZqPVsGQPrqPVti6VkY8iqA0eQvrq4KcQxsiCncPopiwjbkpwOxRGnRR81Ztufb4r)hL7C77JK4K)OKejEc3KuGHcwyk4OfOGFLVWr1sqQ2J(mifLWKrWeWYKLfJO0y9zqjaKQfN89df7TWHDLryDLVEEIQiap6)OCNB)oveV1qvzCOaQNIfC0IgXtufbiazS3cxBGWobJNWI1KucazQxCsqXgbecwnr7JK4K)OkJdfqnuWVL7abfSGiIl0(mifLWKrWeWYKTUwGo)qORABi(OQmoua1tWTChiFgucaPAXjF)WCGnMDr6ZlCY)r5o3vqMjF4fp62iyCLVEEIQiap6JK4KViiSqbF8ewSpdsrjmzembSmzRRfOZpmhyJzxK(8cN8FuUZTVFi0vTne)bc7emEcl2Tr05kF98evraE0hjXj)rvghkGAOGFl3bYNbPOeMmcMawMS11c05hMdSXSlsFEHt(pk3523pe6Q2gIpQkJdfq9eCl3bYTrewx5RNNOkcWJ(pk3523NbPOeMmcMawMS11c05hMdSXSlsFEHt(Hqx12q8LGGfVCStcFcqtIC5a(ijo5ZaeS4LJfkyblbiOGf8Ld42iI2v(65jQIa8O)JYDU9biuq1QPnqyNGXtyXAGM9zqkkHjJGjGLjBDTaD(H5aBm7I0Nx4KFi0vTneFujLT4PsTPARK8rsCYFuszlgk4snOGfYvsUnctx5RNNOkcWJ(ijo5xTyjjuWcvQW9zqkkHjJGjGLjBDTaD(H5aBm7I0Nx4K)JYDU9jojXcrlcskjElGb(Hqx12q87fljNMtfUB3(FMIBQwbk7TWncgMIYTn]] )

    storeDefault( 'Brewmaster: Combo AOE', 'actionLists', 20161130.1, [[dCdPdaGAcqRxOKxku0UuOTbH9juQztYTjQDkYEP2nI9Ri)ePsggr(TOgksfnyf1Wf0brkhdQEmiluilfjTyiTCs9qcKNQAza55qzIivLPcutgW0v6Iq04iGUmQRdQ2isL6BeQnlu9zfCAjFfPQAAivX3jq9mc5VGYOrIXlu4Kc41c01iaopbTsKkCyPwhsvAJBW(ijnQIbCKp9XXB4Q1r(hsxHRVpvwXng7eijCe44Ge4iU)dzOQvvS6TYeNaHqG(0G2ktWmyNWnyFKKgvXaoYp1YSpYyeQYafzyAoM8GpvwXng7eijCe4IhLe5hGauq9M1(KmH9pKUcxFFAOLQwH(CmcvzGImalip41jqgSpssJQyah5NAz2pM8W08LBmk(uzf3yStGKWrGlEusKFacqb1Bw7tYe2)q6kC99PHwQAf6hKhGHj3yu86Kid2hjPrvmGJ8tTm7lik10CeCn26tLvCJXobschbU4rjr(biafuVzTpjty)dPRW13NgAPQvOpeLcgkCn261j6XG9rsAufd4i)ulZ(rAUxktZ54tZ0DPzFQSIBm2jqs4iWfpkjYpabOG6nR9jzc7FiDfU(amk84XhdYdWWKBmkJWd9PHwQAf6JQ5EPalhhw8sZEDsamyFKKgvXaoY)q6kC99PYkUXyNajHJax8OKi)aeGcQ3S2NKjSpn0svRqFnCmkfzaMa2ammbxea)ulZ(uHJrPidtZ0rdWtZ0Fra86ecd2hjPrvmGJ8pKUcxFMW6bHJqW1AMSXwYNkR4gJDcKeocCXJsI8dqakOEZAFsMW(0qlvTc93AG1WcBLSFQLzFW1aRNMPZwj71jXgSpssJQyah5FiDfU((uzf3yStGKWrGlEusKFacqb1Bw7tYe2NgAPQvOpQQHcMHVWWwDfK9tTm7hPAOGz4708xDfK961p1YSFKMfSCJTSMENMfuwgnpntJUq61ga]] )

    storeDefault( 'Brewmaster: Standard ST', 'actionLists', 20161130.1, [[d0Z7eaGAfbTEsr8svc2Lq2gszFKI0SjA(kcTme8BrDBbEoK2PsTxQDd1(HOrjIWWeQXPs03ivnufrgSk1WjPdskDkru6yi5CIi1cvILIuTyeTCcpuLqpf8yvSorenrsr1uHWKvy6Q6IKOtl1LrDDL0gfrXZiv2mjSDsH(UkPVQiQPjIkZtev9xr61ksJwrnEsbNue(SGUMisopcTssr5Ws2KIaBkJWGsCrk5HxmO5SIAv(EXaOYNUKTMuFNXEtG2LgOZsUqzVjetrJIIWLrugGJOvFdg0E(oJrncVPmcdkXfPKhEXWUcydxGdrEdbf6Sb6SKlu2BcXu0O0hfRZqc8Op1NfgWzmBqlzl7NOHPCykAqHoBaoIw9n43BcgHbL4IuYdVyaoIw9nmyYvfkIMYHPObf6C0Q6eN4GjxvOicvLpDjthSS1iligTQAGol5cL9Mqmfnk9rX6mKap6t9zHbCgZg2vaByrW1pJ8oRa5DY0c2GwYw2prdKcU(50SIufTG97ToJWGsCrk5HxmahrR(gmqNLCHYEtiMIgL(OyDgsGh9P(SWaoJzd7kGnSiRZ086J8gErpLnOLSL9t0aPSotZRFk6l6PSFVtoJWGsCrk5HxmahrR(go5SCKVIJuxfTcInomLuWxJoZLiKrt(tolh5R4i1vrRGyJdtjf81OZCjcz00Gsdg0s2Y(jA47qwKQwYadjWJ(uFwyaNXSb6SKlu2BcXu0O0hfRZWUcydi6qwG8EsLmWV3jLryqjUiL8WlgGJOvFdFHN24Wja9RWqwevb5v8RPQRIwbX0FwWOZz5WGwYw2prdSguL5rJdtNYHgsGh9P(SWaoJzd0zjxOS3eIPOrPpkwNHDfWguQbvzE04qK3xGd97nnJWGsCrk5HxmahrR(gmqNLCHYEtiMIgL(OyDgsGh9P(SWaoJzd7kGnqFfDUXHiV1SAWiVNCJhg0s2Y(jAqSIo34W0jSgC61gp87TEJWGsCrk5HxmahrR(gmOLSL9t0WzUtjxfOVHe4rFQplmGZy2aDwYfk7nHykAu6JI1zyxbSHlo3iVxwfOVFVV0imOexKsE4fdWr0QVbd0zjxOS3eIPOrPpkwNHe4rFQplmGZy2WUcydxCUrEp5sJSbTKTSFIgoZD61sJSFVtAJWGsCrk5HxmahrR(gmqNLCHYEtiMIgL(OyDgsGh9P(SWaoJzd7kGnGOdzbY7jvYaK3jbvYAqlzl7NOHVdzrQAjd873WUcydlc(AqH(SijrEdFHhLyG8gq43ga]] )

    storeDefault( 'Brewmaster: Standard AOE', 'actionLists', 20161130.1, [[dOtheaGAQK06Pa5Luj1UujBdsnBknFQu1TfYZryNIAVKDJ0(vP(jfKggvmokGdlzOujQbRIgov1bruNIcIJbQlJAHc1srKfdvlxWdPsLNQ8yqwhvcnrkOAQqPjlY0v1fHKxRcEgf11HWgPGYPLAZufBxfYVb6RuP00OsIVRc13Oq)fqJgIgpvkojvPpdfxJkbNNISskqTmagfvISGfwnu0c3YjfRLRiwloWhhvephCX7Z9fnvH09jzdfLMHZEke2xXAKylxeSYaCGrdddWaxWAZNH6Y2gu9nivzaOnGgzOVbPecRYWcRgkAHB5KI1guO9FnnY4TTFtASB8TGPMIb4bgJMxAQHQhmOrbPSgj2YfbRmahy0WgVCmRLRiwdLB8TGPMI5(01mg9kdqy1qrlClNuS2GcT)RPrITCrWkdWbgnSXlhZAEPPgQEWGgfKYA5kI1CnJ5(CrfbsnY4TTFtAhymajIkcK6v2SWQHIw4woPyTbfA)xlX4i8456aJbirurG8cHV7DFIXr4XZfHpd1LfyIT9rCW0fcFnsSLlcwzaoWOHnE5ywZln1q1dg0OGuwJmEB73KgEGRhjqqpa90bwlxrSwCGRh59jON7tdRdSELDfHvdfTWTCsXAdk0(VMgj2YfbRmahy0WgVCmR5LMAO6bdAuqkRrgVT9Bsd3wqhar8aj(qFG1YveRfBlOdGi(7Z9H(aRxzxqy1qrlClNuS2GcT)RPrITCrWkdWbgnSXlhZAEPPgQEWGgfKYAKXBB)M0ciiq2umaD1kXapUPjTCfXAKqqGSPyUpn4kX3NUTPj9kJwy1qrlClNuS2GcT)RPrgVT9BsdczdehrG418stnu9GbnkiL1YveR5oK99zmIaXRrITCrWkdWbgnSXlhZ6v2OWQHIw4woPyTbfA)xtJeB5IGvgGdmAyJxoM18stnu9GbnkiL1iJ32(nPbHSbECDeRLRiwZDi77t3whX6v2acRgkAHB5KI1guO9FnnsSLlcwzaoWOHnE5ywZln1q1dg0OGuwJmEB73K23y4aq)YgPLRiwdBJHd3NUCzJUpDjydrVETbfA)xtVe]] )


    storeDefault( 'Windwalker Primary', 'displays', 20161130.1, [[dWtIeaGEc0UGuLTraZusHdRQzlXYiu3eqUMIsUnPoVKyNeTxXULQ9t1pHuzyK0VvyCss0qrYGPmCK6GsXrjOogOoNKKSqfvlfKAXsPLRIhcINI6XQK1jjLjcHMkatws10rCrf5QqQQlR01bAJeKpdjBgKSDi6Jsk6Rss10au9DffJuss9mjLgnHmEiLtcb3IeNgQ7jjHNRsTwfL61akh4aiSWGl4w3nHgDIBmwWnsyXHPoy9FQ4MqJoXngl4gjS4WuhS(pvCdYttWJUBnGNpC4Zwcdzscyc6WO)96gtVLIqL)wuAdZ0)fUJkYzfMc5KBkUH4c1dwizEykKtUP4gKHU9jPnmqpAynO2nay9gzTQHfgCb37ais4ai8u)BlB9mpCZfbp6Uvd8njsXHLVEdZyne3qqtpoKQ5g9zVg62Neg6TS)9gPyvybGvvRnmFDW0KWeSERc1qIuCaeEQ)TLTEMhU5IGhD3Qb(MejCy5R3WmwdXne00JdPAUvFH6blKWqVL9V3ifRclaSQATHesy(6GPjHdtHKYnf3Gm0TpjTHPqs5MIBiUq9GfsMhUsKkIfqnmArQgg6TS)9gPyvybGHfxLOhCyHbxW1TMcgvxVDs4RWnGKHBkUb0JgwdQJunmfsk3uCdWFqTe3Ak0I(iHdZ4oQY6MIBaH7ynOos1WZEm0rcpRWuiNCtXnexOEWcXTMcTOps4WuiPCtXnexOEWcXTMcTOps4WuiPCtXnidD7tCRPql6JeomtVLIqL)wKBqgLXjac)rch(ejCyurchUns4qcdzqxXnaJWvh3RpZxa2ECRbDtHPqo5MIBqg62N4wtHw0hjCyHbxW1neXN9IGh9WqJqnRAaHBajd3uCdiChRb1rQgwyWfCR7gcxJUBmwWnsGRgMc5KBkUb4pOwIBnfArFKWHN6FBzRN5HLVEdxDCV(mFby7XnQdw)NkHzChvzDtXnGE0WAqDKWHBq3KBkUbeUJ1G6iRnmGVSDIB18maPJunmcxJ(TBSOXm9ibEyMEVWFbl4tWJEKIfOQctDW6)uXnipnbp6Hj)b1sUdtDW6)uXneUgD3ySGBKaxnSqJoj8eA0N9(EMVsyexOEWcjZdtHKYnf3a8huljTHPqo5MIBa(dQLK2WnOBYnf3a6rdRb1rQgU5IGhD3G80e8OFN5HH(7Ow3GiAVagUJk83IlysLqsa]] )

    storeDefault( 'Windwalker AOE', 'displays', 20161130.1, [[d0tNeaGEcQDbbABQuDyGzkfQVjfvZwIhRkUPkX5LsDBjDAO2jj7vSBf2pLFkLyyKYVv04KI0qr0GPA4e6GKQJsqogcNtkIfQszPqulwfTCqEiO6POwgr65QWeHitvvAYsfthPlkvDvPG6zsLUUQAJeWNbLnRsA7qQpkfLVcbmnc03LsAKsbzDsHmAIy8qsNesClI6AqO7jfWLvATsb61qqhI8gwO)(3oMlWCqnNXcVrrinmjAsZLn)fabBP5mmjeUcGABoCGifphMR)HaHddTLWW7vV9ihUHpwZzXTueOaoKKZWKO7nx28xaeSLMZWKO7nx2CK2RGFHMBHjr3BUS5WN1tanNHVaqfx)vZFX1nQUAHf6V)9iVrrK3W9dWzz7KBH1FO45W8gJpOrjnScu3WmUc3CuQItiAJmxeAFM1tanmYBzbhBus1iUtOP1nm)aHfPHP462aAHgL08gUFaolBNClS(dfphM3y8bnkIWkqDdZ4kCZrPkoHOnY8o7vWVqdJ8wwWXgLunI7eAADdn0W8dewKg(apGv2WKOjnx2C4Z6jGMZWKOjnx2CK2RGFHMBHBhbKBoI3f8E3M2ePi2fXMRDxlxLfeXWOgLwyK3Yco2OKQrCNGqAtrqIWidgWwZHlzFqiEalm4exW02H1)0P5YMFbGkU(RrPfMecxbqTnhLN5WCgl8gLGAHz8awznx28l4bU(Rr1nCdoN1OiqmS(dfphMdhisXZXrUfwO)(xZ1lyyJ6oOHFcZIGh8awuigMf3srGc4qI5WNLjuEddIIi8zueHHffryOOicnm8PyBZFNHra8OtRGccxiZ1BPpmlUpyqblmGINJOKEVjHf6V)1CKWq7dfphHrgLM1qVHvG6ggbWJoTckiCHmxVL(Wc93)2XCuEMdZzSWBucQfwG5GgUhvrO94Ovq7W9dWzz7KBHjHWvauBZfyoOMZyH3OiKgMecxbqTnhoqKINJWuaeSLEewVLEZLn)cEGR)AuDdR3sV5YMFbGkU(RrPfgLN54WCwYS1rucg(fu2b18Mbn)IrPfMXdyL1CzZVaqfx)1O0ctIM0CzZFbqWwQ56frjGOictIU3CzZFbqWwQ56frjGOicJ0Ef8l0ClS(Nonx28l4bU(Rr1nmj6EZLnh(SEcOMRxeLaIIimjAsZLnh(SEcOMRxeLaIIimj6EZLnhP9k4xOMRxeLaIIimjAsZLnhP9k4xOMRxeLaIIi0ea]] )

    storeDefault( 'Brewmaster Primary', 'displays', 20161130.1, [[dKdleaGEuHDbsLTrLyMGu1SPQBQsCBPCyL2jH9k2Tk2pLFsL0WKkJtLe)wHHcQbtA4e1bLKJIk6yq8mvsTqQulLiSyPQLlXdHKNISmjvphOMOKYub0KPIA6OCrvQRseLlRQRROncP6ZGyZGKTdWhPc60qnnqkFNk0ijIQhdKrJknEiLtsf5wOQRrf48ePxteP1seX3ujPdsagYvaFXVstFioN)8D2u0hhMPeMJpcK6HGbaBkVPa3cKNL(qWfCBlsnf1kZWJJPvZYgku59HqDlaElrijd8Bkj)Ep6(fm30hcgWTP8McClqEw6dbd42uEtR9qTtplUdbd42uEtrnA9ll9HUSOHBZMPaXTpIR7cjjJrlceheIavWYSqHGbaBkVPOgT(LL(qWaGnL30Apu70ZI7qsJGVUlDHQC92uEtVSOHBZweDHK49)c(JOEhIlii1Vc0HeIZ5pFtR8yiN2FyHafQAYgMYB6LfnCB2IOleCb32IutDc04ykH54JaADHi8bI)nL30l4dUnBr0fcTi6cvbIHhhtrTYm84aoUdjXEG8MII7dssXhiH2EShZKgIKFq41J5yz4XjI6UCLqK879O7xWCnf1WpkbyOncKq9rGecseiHkrGewiudzPMcCeYD5DSTGzFX0kxVdrYli8bseoieNZF(MwdxEqm84escNCOKdmuThQD6zXDioN)8D2uNanoMsyo(iGwxi0hhwOQcE9Mk2sz4yO7Z27FNJ7qIT9HCxEhBly2xmfUGBBrAi4cUTfPMI(4WmLWC8rGupuLR3MYB6f8b3MTiUoeCb32IutrTYm84eITfipdCioN)8bhGrGeGHUpBV)DoUdvbIHhhtHEmywexnKyBFOApu70ZcjX7)f8hr9oexq66UoebQGLzHclSqobACaBkXD44jcOfc46)dZuhwgt5i6cr4de)BkVPxw0WTzlcKqWaUnL3uGBbYZmTYlZDJaju1KnmL30l4dUnBr0fcgWTP8MIA06xMPvEzUBeiHGbaBkVPa3cKNzALxM7gbsiyaWMYBkQrRFzMw5L5UrGecgWTP8Mw7HANEMPvEzUBeiHGbaBkVP1EO2PNzALxM7gbsyja]] )

    storeDefault( 'Brewmaster AOE', 'displays', 20161130.1, [[dOdqeaGEOIDjb02aOzkbQztQBkPCyvDBP8Aji2jr7vSBLSFQ(jeAyaACsq9mqXqH0GPmCsCqs6OqLoguoNeIfkjTuOQwScTCP6Hq0trwgH65a1ebWubXKLOA6O6Ik4Qsq6YQCDLAJGsFgiBws12bPpkH0PrzAqW3Linsjq(MeQrtiJhQYjLOClcUMeX5LepguTwja)wrhSajeIqVU(RKXq4UV9vUBWoxC3igoxKyIdH2zTVxXnyNlUBedNlsmXHq7S23R4gYxHZMl3u39puO(PdHCqcza)qfk4Zns50Ay1pyrzmek0b3eCdY3bD8mgcf6GBcUbWv)3AEQgcf6GBcUHC2gFEgdv7XJ12n3GWAxKWamubmNTiXkjekuu3eCdGR(V1C3u1kI(iXcHcf1nb3qoBJppJHqHI6MGBaC1)TMNQHQeyfkUearaqykccakwS4IlsXatDbekjKkIdUj4wThpwB3Ieyi8p99GVifdedqmmXfUaXcH7(2NBQAgOv7w8qWdHcDWnb3qoBJp3nvTIOpsSqOqrDtWniFh0XDtvRi6Jelekuu3eCd5Sn(C3u1kI(iXcrW7mfEiWSfi9fcf6GBcUbWv)3AUBQAfrFKyHu38PBcUv7XJ12TibgIylq6Znb3QXwS2UfjmHiLtRHv)Gf5gYPE2dKqFKyH6rIfcuKyHgJel8qKYbN9AgopNnxrkgWchcTZAFVIBLbFUCJy4CrIaWq4UV95gaS(bNZMRq4xwrliiHa4Q)BnpvdH7(2x5Uvg85YnIHZfjcadHcDWnb3G8Dqh3nvTIOpsSqdRFuFLNQHu38PBcUvJTyTDlsycrSfi95MGB1E8yTDlsGHurCWnb3QXwS2UfjmHG86BXDRO95wjsGHkd(Cb2ns0S0vKiec39TpWbsKybsOH1pQVYt1qQW5S5YTcMbMhzXHKF7cbWv)3AEi8p99GVifdedqmGaHjebVZu4Hcp8qODw77vCd5RWzZvi(3bDCWHqHI6MGBq(oOJNXqWox8qQD2RDt(9(S0qYVDHQ2VsBpy(1DtfXHqiNkvCdYmu1(vA7bZVUBQioeIuE4SfOiljeErcmKkCoBUCd5RWzZf4une()c05gsrh8cHTaf6hzAgVs4ja]] )

    storeDefault( 'Brewmaster Defensives', 'displays', 20161130.1, [[dSJpeaGEeXUacTneYmjIy2cDyvDtrLFRs3wPUgcANKSxPDly)u(jqQHPIghPupdOmuinyQgoP6GIYrrKogeNJu0cfvTuIWIvHLd4HiQNIAzePNtutuKmvqAYavtNWfbvxLiQUSIRRKnIaFJuqBgjTDr8rGGpdIPbe9DGKrsePhdkJgjgpc1jjLClK60qDErQ)skWAjIYRjf6IuOLbDYae)09OmPRznGBob3GWCgtYufI0YOa49dK2CcUbH5mMKPkePLrbW7hiT5KFDb(gmpBb8LldmXYKHRGcxIYsU8yoRpXibXxMspkZ6pmCasvewgnbU50MNAO(ROO5lJMa3CAZjF3hVOhLZ9eJ3RT5qX7PkWollz37UkWolJMGAoT5PgQ)kkmplQt5RcPmAcQ50Mt(UpErpkJMGAoT5PgQ)kkA(YPlb0eIOTMePjHGertn1qWicSZsLgKGSmXvDwwIjoV8uL0teIqqKQniIuM01SgZZIyiH9eeLHvgnbU50Mt(UpEH5zrDkFviLrtqnN2COpaKryEwuNYxfsz0euZPnN8DF8cZZI6u(QqkZWaW6IYIpOrCasz0e4MtBEQH6VIcZZI6u(QqkNTexZPnp3tmEV2vDwM1NyKG4ltXCY34fOql)vHugOkKYqQcP8rvivuM1hy4pIj5f4BOkPePDzghGehZPnphoG3RDvNLjDnRX8uyGbMaFdLLqlqqsHwgfaVFG0MRfSBWCgtYuLuclt6Awd4MRfSBWCgtYuLuclNAO(ROO5ldp8hXb8MVmAcCZPnh6dazeMNf1P8vHuoBjUMtBEoCaVx7QolNbA4MtBEoCaVx7QaRmJdqIJ50MN7jgVx7Qqkd9JtqyoiaCx6vDwwly3GS5mLlOcvjTmPRznYfAvifAz4H)ioG38LZGjW3G5scwwuL2Lv)EkNAOobzCYixwIjoV8uL0teIqopbRmddaRlkVKhna8H6eKXjJCfvugfaVFG0Mt(1f4BOm4d1FffLj4geLZaWF0C1daCbvz1VNY5bgqTFzXayEQH6eKXjJCz0euZPnh6daze9OSeFaYyozkdmnIdqk)h4iwKUmAcCZPnh6daze9OCgmb(gmN8RlW3GCZxod0WnN28CpX49Ax1zfT]] )


    Commit( 'initializeClassModule', MonkInit )
    Hekili:ReInitialize()

end
