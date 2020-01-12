require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/icemachine.zip"),
}

local prefabs =
{
	"collapse_small",
	"ice",
}

local function spawnice(inst)
	inst:RemoveEventCallback("animover", spawnice)	
	local ice = SpawnPrefab("ash")
		if IsDLCEnabled(1) or IsDLCEnabled(2) or IsDLCEnabled(3) then ice = SpawnPrefab("ice") end
    local pt = Vector3(inst.Transform:GetWorldPosition()) + Vector3(0,2,0)
    ice.Transform:SetPosition(pt:Get())
	
    local down = TheCamera:GetDownVec()
    local angle = math.atan2(down.z, down.x) + (math.random()*60)*DEGREES
    local sp = 3 + math.random()
    ice.Physics:SetVel(sp*math.cos(angle), math.random()*2+8, sp*math.sin(angle))
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
    
	--Machine should only ever be on after spawning an ice
	inst.components.fueled:StartConsuming()
	inst.AnimState:PlayAnimation("idle_on", true)
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle_on")
	inst.SoundEmitter:PlaySound("dontstarve/common/researchmachine_place")
end

local function onhammered(inst, worked)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_metal")
	inst:Remove()
end

local function getstatus(inst)
	local sec = inst.components.fueled:GetCurrentSection()
	
	if STRINGS.CHARACTERS.WALANI 	== nil then STRINGS.CHARACTERS.WALANI 	= { DESCRIBE = {},} end -- DLC002
	if STRINGS.CHARACTERS.WARBUCKS 	== nil then STRINGS.CHARACTERS.WARBUCKS = { DESCRIBE = {},} end -- DLC003
	if STRINGS.CHARACTERS.WARLY 	== nil then STRINGS.CHARACTERS.WARLY 	= { DESCRIBE = {},} end -- DLC002
	if STRINGS.CHARACTERS.WATHGRITHR == nil then STRINGS.CHARACTERS.WATHGRITHR = { DESCRIBE = {},} end -- DLC001
	if STRINGS.CHARACTERS.WEBBER 	== nil then STRINGS.CHARACTERS.WEBBER 	= { DESCRIBE = {},} end -- DLC001
	if STRINGS.CHARACTERS.WHEELER 	== nil then STRINGS.CHARACTERS.WHEELER 	= { DESCRIBE = {},} end -- DLC003
	if STRINGS.CHARACTERS.WILBA 	== nil then STRINGS.CHARACTERS.WILBA 	= { DESCRIBE = {},} end -- DLC003
	if STRINGS.CHARACTERS.WINONA 	== nil then STRINGS.CHARACTERS.WINONA 	= { DESCRIBE = {},} end -- DST
	if STRINGS.CHARACTERS.WOODLEGS 	== nil then STRINGS.CHARACTERS.WOODLEGS = { DESCRIBE = {},} end -- DLC002
	if STRINGS.CHARACTERS.WORMWOOD 	== nil then STRINGS.CHARACTERS.WORMWOOD = { DESCRIBE = {},} end -- DLC003
	if STRINGS.CHARACTERS.WORTOX 	== nil then STRINGS.CHARACTERS.WORTOX 	= { DESCRIBE = {},} end -- DST
	if STRINGS.CHARACTERS.WURT 		== nil then STRINGS.CHARACTERS.WURT 	= { DESCRIBE = {},} end -- DST
	
    if sec == 0 then
        STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEMAKER            = "It needs more fuel."
        STRINGS.CHARACTERS.WILLOW.DESCRIBE.ICEMAKER             = "It's out of fuel."
        STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ICEMAKER           = "Small machine is out of juice."
        STRINGS.CHARACTERS.WENDY.DESCRIBE.ICEMAKER              = "It gave up."
        STRINGS.CHARACTERS.WX78.DESCRIBE.ICEMAKER               = "FUEL IS DEPLETED"
        STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ICEMAKER       = "It's out of energy."
        STRINGS.CHARACTERS.WOODIE.DESCRIBE.ICEMAKER             = "It's hooped."
        STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ICEMAKER            = "It's not doing its job."
        STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ICEMAKER         = "It needs more fire!"
        STRINGS.CHARACTERS.WARLY.DESCRIBE.ICEMAKER         		= "It's run dry."
        STRINGS.CHARACTERS.WARBUCKS.DESCRIBE.ICEMAKER         	= "Bother! It's out of fuel."
		STRINGS.CHARACTERS.WALANI.DESCRIBE.ICEMAKER           	= "Illin'."
		STRINGS.CHARACTERS.WAGSTAFF.DESCRIBE.ICEMAKER           = "It requires fuel to convert to endothermic energy."
        STRINGS.CHARACTERS.WEBBER.DESCRIBE.ICEMAKER             = "Dead."
		STRINGS.CHARACTERS.WHEELER.DESCRIBE.ICEMAKER            = "Drat. I let the fuel get too low."
		STRINGS.CHARACTERS.WILBA.DESCRIBE.ICEMAKER            	= "WHEREFORE ART MINE FUEL?"
		STRINGS.CHARACTERS.WOODLEGS.DESCRIBE.ICEMAKER           = "'Tis outta fuel."
		STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.ICEMAKER           = "Needs food"
        return "OUT"
    elseif sec == 1 then
        STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEMAKER            = "I can hear it sputtering."
        STRINGS.CHARACTERS.WILLOW.DESCRIBE.ICEMAKER             = "It's nearly out of fuel."
        STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ICEMAKER           = "Machine will not last much longer."
        STRINGS.CHARACTERS.WENDY.DESCRIBE.ICEMAKER              = "It's running on fumes."
        STRINGS.CHARACTERS.WX78.DESCRIBE.ICEMAKER               = "MACHINE IS RUNNING ON EMPTY"
        STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ICEMAKER       = "Nearly empty."
        STRINGS.CHARACTERS.WOODIE.DESCRIBE.ICEMAKER             = "It'll give out any second."
        STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ICEMAKER            = "It's on its last legs."
        STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ICEMAKER         = "Its fire is about to go out."
		STRINGS.CHARACTERS.WARLY.DESCRIBE.ICEMAKER         		= "Nearly out!"
        STRINGS.CHARACTERS.WARBUCKS.DESCRIBE.ICEMAKER         	= "I'd best refuel it, promptly."
		STRINGS.CHARACTERS.WALANI.DESCRIBE.ICEMAKER          	= "Little bit of illin'."
		STRINGS.CHARACTERS.WAGSTAFF.DESCRIBE.ICEMAKER           = "The fuel must be replenished immediately!"
        STRINGS.CHARACTERS.WEBBER.DESCRIBE.ICEMAKER             = "This thing's on its last legs. Maybe it can borrow some of ours?"
		STRINGS.CHARACTERS.WHEELER.DESCRIBE.ICEMAKER            = "It's desperate for something to burn into ice."
		STRINGS.CHARACTERS.WILBA.DESCRIBE.ICEMAKER            	= "'TIS BUT THE TEENIEST OF FUEL LEFT"
		STRINGS.CHARACTERS.WOODLEGS.DESCRIBE.ICEMAKER           = "'Tis chokin'!"
		STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.ICEMAKER           = "It's getting hungry"
        return "VERYLOW"
    elseif sec == 2 then
        STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEMAKER            = "It seems to be slowing down."
        STRINGS.CHARACTERS.WILLOW.DESCRIBE.ICEMAKER             = "It needs more fuel."
        STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ICEMAKER           = "Little machine looks tired"
        STRINGS.CHARACTERS.WENDY.DESCRIBE.ICEMAKER              = "It seems a little depressed."
        STRINGS.CHARACTERS.WX78.DESCRIBE.ICEMAKER               = "FUEL IS REQUIRED FOR FURTHER PRODUCTION"
        STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ICEMAKER       = "Its pace is dropping."
        STRINGS.CHARACTERS.WOODIE.DESCRIBE.ICEMAKER             = "Gettin' low."
        STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ICEMAKER            = "I'd better fill it up."
        STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ICEMAKER         = "It is spitting considerably less ice forth."
		STRINGS.CHARACTERS.WARLY.DESCRIBE.ICEMAKER         		= "It's still running."
        STRINGS.CHARACTERS.WARBUCKS.DESCRIBE.ICEMAKER         	= "Rather in need of a top up."
		STRINGS.CHARACTERS.WALANI.DESCRIBE.ICEMAKER           	= "Not so chillin'."
		STRINGS.CHARACTERS.WAGSTAFF.DESCRIBE.ICEMAKER           = "Theoretically, it will require more fuel soon."
        STRINGS.CHARACTERS.WEBBER.DESCRIBE.ICEMAKER             = "I think it needs our help."
		STRINGS.CHARACTERS.WHEELER.DESCRIBE.ICEMAKER            = "Needs more fuel to make more frozen."	
		STRINGS.CHARACTERS.WILBA.DESCRIBE.ICEMAKER            	= "'TIS NAUGHT MUCH FUEL LEFT"
		STRINGS.CHARACTERS.WOODLEGS.DESCRIBE.ICEMAKER           = "'Tis sputterin'."
		STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.ICEMAKER           = "Slow"
        return "LOW"
    elseif sec == 3 then
        STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEMAKER            = "It's putting along."
        STRINGS.CHARACTERS.WILLOW.DESCRIBE.ICEMAKER             = "Make that ice."
        STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ICEMAKER           = "Thank you for good ice, machine"
        STRINGS.CHARACTERS.WENDY.DESCRIBE.ICEMAKER              = "It's feeling okay."
        STRINGS.CHARACTERS.WX78.DESCRIBE.ICEMAKER               = "MACHINE IS OPERATING SATISFACTORILY"
        STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ICEMAKER       = "The output is quite regular."
        STRINGS.CHARACTERS.WOODIE.DESCRIBE.ICEMAKER             = "It's pumping along nicely."
        STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ICEMAKER            = "It appears to be doing its job."
        STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ICEMAKER         = "Ice from fire!"
		STRINGS.CHARACTERS.WARLY.DESCRIBE.ICEMAKER         		= "A small luxury."
        STRINGS.CHARACTERS.WARBUCKS.DESCRIBE.ICEMAKER         	= "A fine example of what civilization can do."
		STRINGS.CHARACTERS.WALANI.DESCRIBE.ICEMAKER           	= "Just chillin'."
		STRINGS.CHARACTERS.WAGSTAFF.DESCRIBE.ICEMAKER           = "A practical electric refrigeration unit that doesn't require electricity!"
        STRINGS.CHARACTERS.WEBBER.DESCRIBE.ICEMAKER             = "Looks alright to us."
		STRINGS.CHARACTERS.WHEELER.DESCRIBE.ICEMAKER            = "I'm used to making ice the old fashioned way. By freezing water."
		STRINGS.CHARACTERS.WILBA.DESCRIBE.ICEMAKER            	= "'TIS A MAKER O' ICE"
		STRINGS.CHARACTERS.WOODLEGS.DESCRIBE.ICEMAKER           = "'Tis runnin' fine."
		STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.ICEMAKER           = "Cold Rock machine"
        return "NORMAL"
    elseif sec == 4 then
        STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEMAKER            = "It's running great!"
        STRINGS.CHARACTERS.WILLOW.DESCRIBE.ICEMAKER             = "It's fully fueled!"
        STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ICEMAKER           = "Machine is doing very good job!"
        STRINGS.CHARACTERS.WENDY.DESCRIBE.ICEMAKER              = "It's in great shape."
        STRINGS.CHARACTERS.WX78.DESCRIBE.ICEMAKER               = "MACHINE IS OPERATING AT OPTIMAL LEVEL"
        STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ICEMAKER       = "Icetastic!"
        STRINGS.CHARACTERS.WOODIE.DESCRIBE.ICEMAKER             = "Furiously icy! Reminds me of home."
        STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ICEMAKER            = "It's working hard to make ice for me."
		STRINGS.CHARACTERS.WARLY.DESCRIBE.ICEMAKER         		= "Whistle while you work!"
        STRINGS.CHARACTERS.WARBUCKS.DESCRIBE.ICEMAKER         	= "Quite sufficiently fueled."
        STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.ICEMAKER         = "The machine is fired up!"
		STRINGS.CHARACTERS.WALANI.DESCRIBE.ICEMAKER           	= "Super chillin'."
		STRINGS.CHARACTERS.WAGSTAFF.DESCRIBE.ICEMAKER           = "Producing endothermic reactions at an alarming rate!"
        STRINGS.CHARACTERS.WEBBER.DESCRIBE.ICEMAKER             = "It's running pretty good!"
		STRINGS.CHARACTERS.WHEELER.DESCRIBE.ICEMAKER            = "There'll be little pellets of ice as far as the eye can see!"
		STRINGS.CHARACTERS.WILBA.DESCRIBE.ICEMAKER            	= "'TIS LOTS O' ICE TO BE MADE"
		STRINGS.CHARACTERS.WOODLEGS.DESCRIBE.ICEMAKER           = "'Tis chuggin' along."
		STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.ICEMAKER           = "Making lots of cold rocks"
        return "HIGH"
    end
end

------------------------------------------------------------------------------------------------------------------------
--Fuel management

local function fueltaskfn(inst)
	inst.AnimState:PlayAnimation("use")
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_metal")
	inst.components.fueled:StopConsuming() --temp pause fuel so we don't run out in the animation.
	inst:ListenForEvent("animover", spawnice)
end

local function ontakefuelfn(inst)
	inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
	inst.components.fueled:StartConsuming()
end

local function fuelupdatefn(inst, dt)
	inst.components.fueled.rate = 1
end

------------------------------------------------------------------------------------------------------------------------
--Icemaker

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	local minimap = inst.entity:AddMiniMapEntity()
	if TUNING.ICEMAKER_MINIMAP == 0 then
		minimap:SetIcon( "icemachine.tex" )
	end

	MakeObstaclePhysics(inst, .4)

	inst.AnimState:SetBank("icemachine")
	inst.AnimState:SetBuild("icemachine")

    inst:AddTag("structure")

	inst:AddComponent("fueled")
	inst.components.fueled.maxfuel = TUNING.ICEMAKER_FUEL_MAX
	inst.components.fueled.accepting = true
	inst.components.fueled:SetSections(4)
	inst.components.fueled.ontakefuelfn = ontakefuelfn
	inst.components.fueled:SetUpdateFn(fuelupdatefn)
	inst.components.fueled:SetSectionCallback(
		function(section)
			if section == 0 then
				inst.AnimState:PlayAnimation("turn_off")
				inst.AnimState:PushAnimation("idle_off", true)
				inst.SoundEmitter:KillSound("loop")
				if inst.fueltask ~= nil then
					inst.fueltask:Cancel()
					inst.fueltask = nil
				end
			elseif section > 0 then
					inst.AnimState:PlayAnimation("turn_on")
					inst.AnimState:PushAnimation("idle_on", true)
				if not inst.SoundEmitter:PlayingSound("loop") then
					inst.SoundEmitter:PlaySound("dontstarve/common/researchmachine_lvl1_idle_LP", "loop")
				end
				if inst.fueltask == nil then
					inst.fueltask = inst:DoPeriodicTask(TUNING.ICEMAKER_SPAWN_TIME, fueltaskfn)
				end
			end
		end
	)
	inst.components.fueled:InitializeFuelLevel(TUNING.ICEMAKER_FUEL_MAX/2)
	inst.components.fueled:StartConsuming()

	inst:AddComponent("inspectable")
	inst.components.inspectable.getstatus = getstatus
	
	inst:AddComponent("lootdropper")

	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

return Prefab("common/objects/icemaker", fn, assets, prefabs),
	MakePlacer("common/icemaker_placer", "icemachine", "icemachine", "idle_off")
