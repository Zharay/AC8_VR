-- AC8 modular release.
-- AC8 modular local trial. Core is required; sibling features are optional.
-- Remove a feature file with the game closed; its native work is absent next launch.
local registry=rawget(_G,'AC8VRModules')
if not registry then registry={sections={},state='waiting',completed={}};rawset(_G,'AC8VRModules',registry)end

-- This feature's admission policy. Core supplies only demanded current-owner facts.
local function gameplay(R)
 return not R.settingsBusy('presentation','gameplay')and R.context.flight==true and R.viewTargetName():match('^BP_PlayerPlane_')~=nil and R.matchState()~='WaitingToStart'
end
assert(not registry.sections.gameplay_camera,'Duplicate gameplay camera')
registry.sections.gameplay_camera=function(R)
 local uevr=R.host('camera','gameplay camera stabilization')
local CAM_ANIM_KILL = true     
local CAM_KILL_EVERY = 1       
local function cam_invoke(o, k, ...) return o[k](o, ...) end
local function cam_find_manager()
    return R.objectCall(R.context.pc,'get_property','PlayerCameraManager')
end

local function cam_kill_anims()
    local found, pm = pcall(cam_find_manager)
    if not found or not R.isLiveObject(pm) then return false end

    local anims=pcall(cam_invoke, pm, 'StopAllCameraAnims', true)
    local shakes=pcall(cam_invoke, pm, 'StopAllCameraShakes', true)
    if not anims or not shakes then R.errors.cameraStabilization='Camera animation/shake stop failed';return false end
    return true
end

 local frame_n=0
 uevr.sdk.callbacks.on_post_engine_tick(function()
  if not gameplay(R)or R.settingsBusy('camera','plane')then return end
  if registry.sections.inherited_hud and not R.gameplayCameraReady then return end
  local intent=rawget(_G,'AC8_CinematicIntent');frame_n=frame_n+1
    if CAM_ANIM_KILL and not (intent and intent.active) and frame_n % CAM_KILL_EVERY == 0 then
        cam_kill_anims()
    end
 end)
end

if registry.start then registry.start()end


