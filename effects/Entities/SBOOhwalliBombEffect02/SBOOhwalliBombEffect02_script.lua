--****************************************************************************
--**
--**  File     :  /data/projectiles/SBOKhamaseenBombEffect02/SBOKhamaseenBombEffect02_script.lua
--**  Author(s):  Greg Kohne
--**
--**  Summary  :  Ohwalli Strategic Bomb effect script, non-damaging
--**
--**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
--****************************************************************************
local EffectTemplate = import('/lua/EffectTemplates.lua')

SBOOhwalliBombEffect02 = Class(import('/lua/sim/defaultprojectiles.lua').EmitterProjectile) {
	FxTrails = EffectTemplate.SOhwalliBombHitSpiralFxTrails02,
}
TypeClass = SBOOhwalliBombEffect02
