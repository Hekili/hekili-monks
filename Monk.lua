-- Monk.lua
-- Testing modularization of class modules.
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


    storeDefault( 'SimC Import: default', 'actionLists', 20161025.1, [[dKJciaGEuK0MOu2ffBtHAMOiMnK5JQ62iStGSxs7wY(LkJskmmuPFRQdRYqbGAWsvdxbherDkPOJbOZHIulef1srvAXuYYb9qOspvPhRO1bGMiaKPcv1Kf10P6IOkwgaDzIRlLEosNhr2muoTWZqj9DuyAafZdOAKOiXFfz0qfVgL6KkKpJkUga4EuQ(gkXHakTiOkRav81LN6Sqswzw3DqMXHcM65XxkiahZ06c6ieD3Ga3U(redp0byxFwWUwKRlVcsoQOGaKlWXa5ciayaQ7oHXGRRUKNE8fvXxbbuXxxEQZcjzLzD3jmgCD9NdhKyIYfiSDWP2A4hKJ4MSy1IHzMh1JIJPDOPUKTcu4K0LoihmHZv5e1HbBr3rvoMN)qDRVeDbDeIU7GCWUEMYv5U(1HbBrxEfKCurbbixGJbYIHlRQRGauXxxEQZcjzLzD3jmgCD9NdhKyM)JYpJIARHvlgMHkqPcNKPDGpFRwmmd1FirsoOJt6QCclGIPDGp)gG1pKuUHkqPcNKrQZcjzBomk2IBgG)0CCcu4KmTdn5Z3QfdZyH(pJAPUPDGpF)GCe34bHK8pLdbC7J52uxYqouDRJqS)OCIXb1LSvGcNKUdVhFP7OkhZZFOU1xIUGocrxa87Xx6YRGKJkkia5cCmqwmCzvDfeRk(6YtDwijRmR7oHXGRRFiPCdvGsfojJuNfsY2A04GEGDt3qDyWwspwYXrsmIkJEy2i1zHKST5)O8ZOmuhgSL0JLCCKeJOYOhMnqH4IIcUDGGX28Fu(zugyqJItI2wj2XKTbkexuuWTdMM85B1IHzOcuQWjzAhAQlzihQU1ri2XBdcC76hrm8qhGD9ubkv4KWtxYwbkCs6opekDtp(kHcQR7OkhZZFOU1xIUGocrxCpeQRN80JV66zsqDD5vqYrffeGCbogilgUSQUccmk(6YtDwijRmR7oHXGRly9djLBOcuQWjzK6Sqs2wJgh0dSB6gQdd2s6XsoosIruz0dZgPolKKTn)hLFgLH6WGTKESKJJKyevg9WSbkexuuWTdem2M)JYpJYGfuNMESewlKKbkexuuWTp228Fu(zugyqJItI2wj2XKTbkexuuWTpUjF(wTyygQ)qIKCqhN0v5ewaft7qtDjd5q1TocXoEBqGBx)iIHh6aSRNky4PlzRafojDNhcLUPhFLqb11DuLJ55pu36lrxqhHOlUhc11tE6XxD9mjOExFdGn1LxbjhvuqaYf4yGSy4YQ6kiaqXxxEQZcjzLzD3jmgCDBa2d6b2nDd1HbBj9yjhhjXiQm6HzJuNfsY2M)JYpJYqDyWwspwYXrsmIkJEy2afIlkk4abJT5)O8ZOmyb1PPhlH1cjzGcXfffC7abaBZ)r5NrzGbnkojABLyht2gOqCrrbNLM85B1IHzOcuQWjzAh0LmKdv36ie74TbbUD9JigEOdWUEQaLkCs4PlzRafojDNhcLUPhFLqb11DuLJ55pu36lrxqhHOlUhc11tE6XxD9mjOExFdaBQlVcsoQOGaKlWXazXWLv1vqJv81LN6Sqswzw3DcJbxxW6hsk3qfOuHtYi1zHKSTgna7b9a7MUH6WGTKESKJJKyevg9WSrQZcjzBZ)r5NrzWcQttpwcRfsYafIlkk42zABZ)r5NrzGbnkojABLyht2gOqCrrb3oa0KpFRwmmd1FirsoOJt6QCclGIPDOPUKHCO6whHyhVniWTRFeXWdDa21tfm80LSvGcNKUZdHs30JVsOG66oQYX88hQB9LOlOJq0f3dH66jp94RUEMeuVRVbRn1LxbjhvuqaYf4yGSy4YQ6kiwu81LN6SqswzwxqhHOlUhc11tE6XxD9mjOExFdW0uxYqouDRJqSJ3ge421pIy4Hoa76x8XtxYwbkCs6opekDtp(kHcQR7OkhZZFOU1xIU8ki5OIccqUahdKfdxwvxDDbqc21ICLz1vf]] )

    storeDefault( 'SimC Import: precombat', 'actionLists', 20161025.1, [[b4vmErLxtvKBHjgBLrMxc51utbxzJLwySLMEHrxAV5MxojJn541uofwBL51utLwBd5hyj1gCVjhD64hyWjxzJ9wBIfgDEnLuLXwzHnxzE5KmWeJnXaJm14smEn1uJjxAWrNxt51ubngDP9MBZ5fvE5umErLxtvKBHjgBLrMxc51utnMCPbhDEnfDVD2zSvMlJ92BSr2B352CEnvqYD2CEnLBH1wz98gBK91DHjNxtfKyPXwA0LNxtb3B0L2BU51uj5gzPnwy09MCEnLBV5wzEnLtH1wzEnfuVrxAV5MxtjvzSvwyZvMxojdmXytm34cmZ4fDErNxtruzMfwDSrNxc5fDE5f]] )

    storeDefault( 'SimC Import: sef', 'actionLists', 20161025.1, [[dGJrdaGEIuBckLDrL2gfzFqfntOiZg0Tvv7eO9k2Ts7hLgfuQggL8BchwLbJIHtHoOI6uqrDmiohuGfsblLszXkYYr1dPIEkYJPQ1PkyIqjMkGMmrnDjxeGNdPlt66qjTrvHSmvPntr58uQoTuZcQW0Gc67qHEgv4BQIgnrY4HQCsI4wQc11OO6Eqv9zfSiOs)vHoibyia7nbv5yiezu99bBPVQfBaFnHbHaVVgI6VtwgjFJcE9aldQAwiBkupunGVwiMqSEn3fje55TXkuOzF1IfnadisagcWEtqvogcbEFneGv5dT09oWYaa2418qZtnSl7H0v5dT09omQWgVMhsYk3(Re8qRy1q2uOEOAaFTqmH801YrQa(gGHaS3euLJHqKN3gRqLyyaQUEHaklW4IInS7LQD)hEp2lv76XkNRBHt8rWMUkFWUB1FDSeJ)dpCIVLR5yo08ud7YEOJ7VvhlbNRBfsYk3(Re8qRy1qG3xdnZ93QSmafCUUviBkupunGVwiMqE6A5ivaDeGHaS3euLJHqG3xd58GqwMzF1ILLbtnAfAMpGgAVVIpUu)DYYi5BuWRhyzCIfCdnp1WUShYFq445RwSJWgTcjzLB)vcEOvSAiBkupunGVwiMqE6A5ivaXWameG9MGQCmeI882yfQeddq11leqzbgx0qZtnSl7Hqlb)pQhVKA8w5rZAUgsYk3(Re8qRy1qG3xdrLG)XbldGJxsHdwMBLzzEuZ1q2uOEOAaFTqmH801YrQaAEagcWEtqvogcbEFnKZdczzM9vlwwgm1Ofld2rWCOz(aAO9(k(4s93jlJKVrbVEGLHaIBO5Pg2L9q(dchpF1IDe2OvijRC7VsWdTIvdztH6HQb81cXeYtxlhPsfclQzhwHvmKkba]] )

    storeDefault( 'SimC Import: serenity', 'actionLists', 20161025.1, [[d8tpiaGAkvP1RiLxkuSlezBus7tOuZevk6WGMnfpxH)IW5vs3wrDAs7eWEL2TO9tvgfIsdtiJtrQ6HksEnknyQQHRehuvCkevDmGohLkzHuILIIwSalNklIsv1tHwgQyDuQWePurtvqnzv10v5IukhcrLltCDuyJuQuFgvTzfHTJk5BcvFLsvmnuP08qLkptv67cLmAefJNsv5KcYJr6AOsv3tr0krLcBsrQ8BL6c2WfTLWaJ8RLI4IqvOrNg80DwaowTRIaWzPiQZt55hAEz7o7WZFioj1BTitXiWHuaorGwbJ4W9KalIuNUCfl(qpDNJgUaGnCrBjmWi)APiaCwkAlfhVonn598Tzu7tDfFcuJERfLuC8600KNqmQ9PUIHYVsH32vm3PuKPye4qkaNiqRGXjf92RaCA4I2syGr(1sra4SuCkOX45)qpDNE(CtDCfFC8JIjCwM0(rDEkp)qZlB3zhE(tzN2FXNa1O3Ark0yiG0t3jHrhxXq5xPWB7kM7ukYumcCifGteOvW4KIE7vG3gUOTegyKFTuePoD5kEBEEJqIU3M)ow5O4tGA0BT4qCsQ3AXq5xPWB7kM7ukcaNLIO4KuV1ImfJahsb4ebAfmoPO3EfGBB4I2syGr(1sra4SuepNYkE(7j88pYiE(2JMFZ29l(eOg9wlooNYke7jioYieXsZVz7(fdLFLcVTRyUtPitXiWHuaorGwbJtk6Txb4(gUOTegyKFTuePoD5kcPNYLqiPmRYG7El(44hfl(eOg9wl60HM8edgjbRszlgk)kfEBxXCNsra4SuKPo0K3ZhzKE(XOu2ImfJahsb4ebAfmoPO3EfWAdx0wcdmYVwkIuNUCfH0t5siKuMvzWDVfFC8JI0vQrioOJxUXKGfFcuJERfD6qtEIbJKGvPSfdLFLcVTRiDLAKIaWzPitDOjVNpYi98JrPSE(KfK8fzkgboKcWjc0kyCsrV9kq8gUOTegyKFTueaolfTBDCdp)9eE(2nd3AXNa1O3AXj0Xni2tqmbd3AXq5xPWB7kM7ukYumcCifGteOvW4KIE7vGPVHlAlHbg5xlfrQtxUIq6PCjeskZQmI9KVth5wCcxe80pPXIMPM8euhmfcwLYw8jqn6TwCSOzQjpb1btHGvPSfdLFLcVTRyUtPiaCwkIlAMAY75pLdMINFmkLTitXiWHuaorGwbJtk6TxbSRgUOTegyKFTuePoD5kcPNYLqiPmRYi2t(w8XXpkw8jqn6Tw0Pdn5jgmscwLYwmu(vk82UI5oLIaWzPitDOjVNpYi98JrPSE(KLd5lYumcCifGteOvW4KIE7vaWOgUOTegyKFTuePoD5kcPNYLqiPmRYi2t(w8XXpksxPgH4GoE5gtcw8jqn6Tw0Pdn5jgmscwLYwmu(vk82UI0vQrkcaNLIm1HM8E(iJ0ZpgLY65t2xYxKPye4qkaNiqRGXjf92RaGGnCrBjmWi)APisD6YvKCloHlcE6NuGbsz3mocwLYw8XXpkw8jqn6TwmWaPSBghbRszlgk)kfEBxXCNsra4Su0Ibsz3mop)yukBrMIrGdPaCIaTcgNu0BVcaYPHlAlHbg5xlfrQtxUIKBXjCrWt)Kcmqk7MXrWQu2Ipo(rr6k1ieh0Xl3ysWIpbQrV1IbgiLDZ4iyvkBXq5xPWB7ksxPgPiaCwkAXaPSBgNNFmkL1ZNSGKVitXiWHuaorGwbJtk6TxbaFB4I2syGr(1srK60LRi5wCcxe80pPXIMPM8euhmfcwLYw8jqn6TwCSOzQjpb1btHGvPSfdLFLcVTRyUtPiaCwkIlAMAY75pLdMINFmkL1ZNSGKVitXiWHuaorGwbJtk6Txba52gUOTegyKFTuePoD5ksUfNWfbp9tYXyqgn5jSx4xiILM)IpbQrV1IogdYOjpH9c)crS08xmu(vk82UI5oLIaWzPitgdYOjVNp3a(fpF7rZFrMIrGdPaCIaTcgNu0BVEfTtzcidZvl9Aba]] )

    storeDefault( 'SimC Import: ST', 'actionLists', 20161025.1, [[diuSmaqiuvSiLOYMusnkukDkuuDluuAxqAyk0XGyzOkptszAkrvxtqQTjH(MsyCiO05qqvRdbvMNGi3dvv7df5GOKfkbpebzIccDrjPnIGItkPALcI6LkrzMcc2jQmuuvQLkjEkXufuFfff7v1FLYGvQomOftjpgPjlvxM0Mvs(mIgncDAQwnkfVwGztXTPu7w0VfA4ky5q9CfnDGRlrBhLQVJaJxjY5rH1JQsMVGK9Ru(ip8LQj0YO9x4ImOuhAC(cc8yEoEfj8x4G26fXTj02ED7Higq422LWxQOgfo1ZXBePiYiVqJICrOyFaC5clkWJ58HphYdFPAcTmA)fUWbT1lecAmB7SOapMB7HGpbxyHjNxsOTY)YjUnH22RBpeXac32oHcXL7cll34agxOqJPbPapMnJpbxQNDNcbr8LmM6LkQrHt9C8grkISaDS2bNJ3dFPAcTmA)fUiuSpaUaIKKgfLgJMEKGCUMTuIoQnCjMLs0rPLySMaM4hzTMkMKbkWT1gi2SHlXe)JOHM5xyz5ghW4cetHP2armwtWL6z3PqqeFjJPEHdARxyHPWu32dhXynbxQOgfo1ZXBePiYc0XAhCUAp8LQj0YO9x4IqX(a4IMkMKbkTeJ1eesAQysgO2WLwtj6O0smwtqiXpYfwwUXbmUOPIjD(YtYMA8LC8L6z3PqqeFjJPEHdARxQMkM05lpj32RA8LC8LkQrHt9C8grkISaDS2bNB5F4lvtOLr7VWfHI9bWfa0OjaDQynDadunHwgThQqbPaNDTPPA76mKkEHLLBCaJlta2d0wCvdquBe4z3eX9l1ZUtHGi(sgt9ch0wViaShOB7XvB7aI62oZ4z3eX9lvuJcN654nIuezb6yTdoxOF4lvtOLr7VWfoOTEHW4tWCBpUABNWuIzCHLLBCaJlR8jy2IRARkXmUup7ofcI4lzm1lvuJcN654nIuezb6yTdoxXh(s1eAz0(lCHdARxQ4tpj32LYCBFzon4clm58YfwwUXbmUG9PNKTzz2cCAWL6z3PqqeFjJPEPIAu4uphVrKIilqhRDW5w8WxQMqlJ2FHlcf7dGlqkWzxBAQ2Uozcsbo7ARhbOyF6jzBwMTaNgCHLLBCaJlyF6jzBwMTaNgCPE2DkeeXxYyQx4G26Lk(0tYTDPm32xMtd22zlcZVurnkCQNJ3isrKfOJ1o4Ce2h(s1eAz0(lCHdARxygIo24j52EiIHKXCBNVltkXlSSCJdyCHaIo24jzRJHKXSnuMuIxQNDNcbr8LmM6LkQrHt9C8grkISaDS2bNJW)WxQMqlJ2FHlcf7dGlqkWzxBAQ2UozI)AR5ZawzVrs7OZbptpjBumm1wGtdUWYYnoGXL5GNPNKnkgMAlWPbxQNDNcbr8LmM6foOTErg8m9KCBNqyyQB7lZPbxQOgfo1ZXBePiYc0XAhCoKXh(s1eAz0(lCrOyFaCHs0rTHlXSuIokTeJ1eWeYA(mGv2BK0okUCs0tYgBGDTrGN9lSSCJdyCbxoj6jzJnWU2iWZ(L6z3PqqeFjJPEHdARxQuoj6j52Eid762oZ4z)sf1OWPEoEJifrwGow7GZHG8WxQMqlJ2FHlcf7dGlSLs0rPLySMaMqcvOSkxTc1kg0gWrkA5aZxZNbSYEJK2rTmqAqSe0cCAWfwyY5LlSSCJdyCXYaPbXsqlWPbxQNDNcbr8LmM6foOTEPGbsdILGT9L50GlvuJcN654nIuezb6yTdohcVh(s1eAz0(lCrOyFaCHTuIokTeJ1eWesOcLv5QvOwXG2aosrlhy(A(mGv2BK0oQLbsdILGwGtdUWctoVqzqnAdaXKkyYpYfwwUXbmUyzG0GyjOf40Gl1ZUtHGi(cLb1Ox4G26Lcginiwc22xMtd22zlcZVurnkCQNJ3isrKfOJ1o4Ci1E4lvtOLr7VWfHI9bWfnvmjduGBRnqSzdxIj(5HYl0xyz5ghW4cLO3iaYUEPE2DkeeXxYyQx4G26fcr032zgi76LkQrHt9C8grkISaDS2bNdz5F4lvtOLr7VWfHI9bWfnvmjduGBRnqSzdxIj(5HYl0xyz5ghW4cLO3SkXtWL6z3PqqeFjJPEHdARxierFBVqjEcUurnkCQNJ3isrKfOJ1o4CiH(HVunHwgT)cxek2hax4ZawzVrs7OaNuXTbOX(clm58YfwwUXbmUaCsf3gGg7l1ZUtHGi(sgt9ch0wVe2jv82oFdn2xQOgfo1ZXBePiYc0XAhCoKIp8LQj0YO9x4IqX(a4cFgWk7nsAhf4KkUnan2xyHjNxOmOgTbGysfm5h5cll34agxaoPIBdqJ9L6z3PqqeFHYGA0lCqB9syNuXB78n0yVTZweMFPIAu4uphVrKIilqhRDW5qw8WxQMqlJ2FHlcf7dGlaOrtakUCs0tYgBGDTrGNDunHwgTVMs0rTHlXSuIokTeJ1eWpY6bSYEJK2rTmqAqSe0cCAWAAmA6rcsuSp9KSnlZwGtdqXQn0ZjtiRPXOPhjirx5tWSfx1wvIzGIvBONtMqwtJrtpsqIobypqBXvnarTrGNDte3rXQn0ZjtiRPXOPhjirXLtIEs2ydSRnc8SJIvBONtMqUWctoV4jqX4Yba)ixyz5ghW4cfdPbgpjBSb21MXjjcspjVup7ofcI4lzm1lCqB9cHWqAGXtYT9qg21T9qWjjcspjVurnkCQNJ3isrKfOJ1o4Cie2h(s1eAz0(lCrOyFaCHpaOrtakUCs0tYgBGDTrGNDunHwgTVMs0rTHlXSuIokTeJ1eWpY6bSYEJK2rTmqAqSe0cCAWAAmA6rcsuSp9KSnlZwGtdqXQn0ZjtiRPXOPhjirx5tWSfx1wvIzGIvBONtMqwtJrtpsqIobypqBXvnarTrGNDte3rXQn0ZjtixyHjNx8eOyC5aGFKlSSCJdyCHIH0aJNKn2a7AZ4KebPNKxQNDNcbr8LmM6foOTEHqyinW4j52Eid762Ei4KebPNKB7SfH5xQOgfo1ZXBePiYc0XAhCWLquxblnGx4GFa]] )

    storeDefault( 'SimC Import: CD', 'actionLists', 20161025.1, [[dWZKgaGEqrAtqXUu02uIoSkZMOLrj9CQCEq62k40QANI0ErTBG9dIrjcgguACGI6Yi)LQgSs1WvshuHCkkuhtuDCkeluuAPGklMIwoPEiOepvQhtyDGc1effMkLyYqMUKlcQAwui9mLIRtInckKptsBMsTDqP(of8vqrmnrOMNOOxRqnwqbgnunEriNuP03ucxdus3te5qIOohOG(TWCoBHB4bNPKqCwU7vs8N8HPx9bGtTUegYD6nqC3)aSazF7WAOlymKDyjdUHJK05io1k28L5yTcRZCUBH(xlU5EKO(a4ylCAoBHB4bNPKqCwUBH(xlURqvvstresuya44EK5l)ck3pa2XyYNifcW9wa6fxfAUbbG4o9giU3cGDmMGSdduiGrHSx4eKDyc(xeKDlVkP5gossNJ4uRyZxMVyIDdxCQv2c3WdotjH4SC3c9VwCxHQQKMIiKOWaWX9iZx(fuUnLrG82kAOCVfGEXvHMBqaiUtVbI7SYiqq2HrkAOCdhjPZrCQvS5lZxmXUHloDdBHB4bNPKqCwUBH(xlURqvvstresuya44EK5l)ck3MK2r6XpqL7Ta0lUk0CdcaXD6nqCNL0osp(bQCdhjPZrCQvS5lZxmXUHlonXSfUHhCMscXz5Uf6FT4UcvvjnfrirHbGdtcjF66Tprnvpj5nv0UAsGZusimKru(1vcnXFeIa(HZvK25TdT5JqeWxHIahtYRAc2EvbAwHIa3h2EeDfUXCpsR64wavijFDAvQCjLB0HlrEbuHK81PvPYLKvUhz(YVGYDfkcCFy7r0v4CVfGEXvHMBbuHK4o9giUTekcCi7HnK9mORW5gossNJ4uRyZxMVyIDdxCkSYw4gEWzkjeNL7wO)1I7kuvL0ueHefgaomjK8PR3(e1u9KK3ur7QjbotjHWKmzeLFDLqt8hHiGF4CfPDE7qB(ieb8vOiWnM7rMV8lOCxHIa3h2EeDfo3BbOxCvO5geaI70BG42sOiWHSh2q2ZGUchYEc5gZnCKKohXPwXMVmFXe7gU40LSfUHhCMscXz5Uf6FT4UcvvjnfrirHbGdtcNUE7tut1tsEtfTRMe4mLecdzeLFDLqt8hHiGF4CfPDE7qB(ieb8vOiWXiIqIcdGPR0)yYh2(cN8gEasgA0utd3dCzcZyerirHbW0(DLZh2EBfn0PMgUh4YmPeJreHefgat97EGQ3Pa8JFX4PMgUh4YCbMKx1eS9Qc0ScfbUpS9i6kCJ5EKw1XTaQqs(60Qu5sk3OdxI8cOcj5RtRsLljRCpY8LFbL7kue4(W2JORW5Ela9IRcn3cOcjXD6nqCBjue4q2dBi7zqxHdzpbRgZnCKKohXPwXMVmFXe7gU40fSfUHhCMscXz5Uf6FT4UcvvjnfrirHbGdtcNUE7tut1tsEtfTRMe4mLectYKru(1vcnXFeIa(HZvK25TdT5JqeWxHIahJicjkmaMUs)JjFy7lCYB4bizOrtnnCpWLjmJreHefgat73voFy7Tv0qNAA4EGlZKsmgresuyam1V7bQENcWp(fJNAA4EGlZfgZ9iZx(fuURqrG7dBpIUcN7Ta0lUk0CdcaXD6nqCBjue4q2dBi7zqxHdzpHngZnCKKohXPwXMVmFXe7gU4I7mi7trwCwUyga]] )


    storeDefault( 'Windwalker Primary', 'displays', 20161025.1, [[dOZFeaGEcLDrOITraZuIOztQBQqoSQUTKEMev7KK9k2TuTFQ(jiPHru)wrpwfnuOAWugosDqP4OirhdkNdiPfQqTuKWILslhWdbQNIAzeYZbXebLMQkmzjy6iUOcUkHQ6YkDDvAJeOZlH2mqSDq1hLi5RsKAAGeFxIYijuLtdz0e04bfNeK6we5AajUhHkTojcFgj9AGuhSCeMY7E3cUj4StCJrITrHjkmoCC3KC74bOUK0gghavFGIUb(PjOz3TMlWhomWQddEqDmqryXhY6gtVATG6hIW0ggh(GBsUD8auxsAdJdFWnj3GDb5VAsghgh(GBsUbEwBFsAdp6HbvVv3oq1nQYLdt5DVlKCefwocp0)w9wiJd3CsqZUBLebHeLOWQVUHzufSBqxPNaKs4gnWEoRTpjmfREFiBuIKXeatwU8W8jaIMeMGQR4khsuIYr4H(3Q3czC4MtcA2DRKiiKOWcR(6gMrvWUbDLEcqkHBfwq(RMeMIvVpKnkrYycGjlxEiHeMpbq0KWHXHJ7MKBGN12NK2W4WXDtYnyxq(RMKXHlgLKibKd3a1b3KCB0ddQERrjhMIvVpKnkrYycGjlcuehSWu8DQRBGfUNGg1Pg(BrAePy4Mlz6MKBJEyq1Bnk5W4WXDtYTJhG6sCRrtl8JclmJ6u1RBsUnc1r1Bnk5W4WXDtYnyxq(RM4wJMw4hfwyC4dUj5gSli)vtCRrtl8JclmoCC3KCd8S2(e3A00c)OWcZ0RwlO(Hi0nWt9eihH)OWcdefwyQrHfUnkSqcdEsx0TJz4sJ6fk71GEbCRbQdHXHp4MKBGN12N4wJMw4hfwykV7DDdweWEsqZEykGUuI3ry1x3WLg1lu2Rb9c4goaQ(afdt5DVBb3G(C2DJrITrbf5WnxY0nj3gH6O6TgLC4H(3Q3czCyC4dUj52XdqDjU1OPf(rHfMrDQ61nj3g9WGQ3AuyHBG6GBsUnc1r1BnQYdF86TtCRuaZlDuYHH(C2H4glCwwpkOeMP3t0RrI9e0ShLiba1W4aO6du0nWpnbn7HlSG8xnjmoaQ(afDd6Zz3ngj2gfuKdl4StcpadnWcbszFXWWUG8xnjJdJdGQpqr3eC2jUXiX2OWefMP)tuNAuGsyyIsoCZjbn7Ub(PjOzhsghMY7Ex3A0iQ962jHpdjb]] )

    storeDefault( 'Windwalker AOE', 'displays', 20161025.1, [[dWZKeaGEcLDPqvBtLYmfrCyGzl4zIu3uL4XQIBl05fj7KK9kTBrTFk)uHYWiLFRItd1qrQbt1Wj4GKQJsO6yi5CIqwOkvlfsAXkYYvvpeuEkQLrKEUIAIqKPQknzfY0rCrfCvcrDzLUoiBes8zq1MvjTDi1hfH6RkuzAesFxe1ifbADIGgnrmEi0jHGBruxdI6EIaghHiFtePxtiCP6BzXHwODK5OCYeZzSyBvusltJM2CzZFbF4lPtLP)4i4NYCyabc(Knxh6dkx(VHYWguVdOwwKNxZzHneqjaML0PY0Ohmx28xWh(s6uzA0dMlBos7vauG07LPrpyUS5WoXjaPtLVaqehHIM)IJBvP1klo0cTZ9TkQ(wEidMc7OEVS(dbFYMNe8mPkPLvG4wMXryMJqu48jj0CH)(CItaszu3WcM3QKQrDJstlDz(5JfiLj44MaALuL0(wEidMc7OEVS(dbFYMNe8mPkQYkqClZ4imZrikC(KeA(O9kakqkJ6gwW8wLunQBuAAPlPKY0OPnx2CK2RaOaXC9GGeqvuLPrtBUS5WoXjaPtLPrtBUS5iTxbqbsVxovrroPiFt0BPfPejf50iNuTBA9QSOixgXQ0kJ6gwW8wLunQBuAsrE8uLrfKHVMdtY(icCgEzWeoGjPktJEWCzZHDItaI56bbjGQOkt)XrWpL5i8CYMZyX2QevRmnAAZLnh2jobiMRheKaQIQS4ql0AUEadph3mP8tz9hc(KnhgqGGp55EVmlaEWz4vHCzwydbucGzjMd7eo)(wgufv5PQOkdVkQY)QOkPmSJqkZFpLhhopkzqqe73C9XgkZc7dgeWIbi4tUkP3suzXHwO1CKW)9HGp5YOIqItW3Y0FCe8tzokNmXCgl2wfL0YIdTq7iZr45KnNXITvjQwzfiULhhopkzqqe73C9XgkpKbtHDuVxgLtMuEarH)opNmivz6poc(PmhgqGGp5YeWh(sMlRp2G5YMFbNXrOyvPlRp2G5YMFbGiocfRsRmcpN8S5SKtY5QeT8liSzI5j(FGeQsRmJZWdR5YMFbGiocfRsRmnAAZLn)f8HVeZ1dcsavrvMg9G5YM)c(WxI56bbjGQOkRdroMlB(fCghHIvLUms7vauG07L1HihZLn)carCekwLwzgNHhwZLn)coJJqXQsxMg9G5YMJ0EfafiMRheKaQIQm)8XcKYZ4m8Wwsla]] )


    Commit( 'initializeClassModule', MonkInit )
    Hekili:ReInitialize()

end


