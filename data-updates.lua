local get_planet_scale = require("get_scale")

local nauvis_size = settings.startup["vp-scale-nauvis-size"].value --[[@as int]]
local min_scale = settings.startup["vp-scale-min"].value --[[@as double]]
local max_scale = settings.startup["vp-scale-max"].value --[[@as double]]

for name, prototype in pairs(data.raw.planet) do
    local backdrop = (prototype.platform_surface_render_parameters and prototype.platform_surface_render_parameters.platform_backdrop)
    if not backdrop then goto continue end
    
    local radius =  backdrop.radius
    if not radius then goto continue end
    
    local scale = get_planet_scale(prototype)
    if scale < min_scale then
        scale = min_scale
        log("Minimum clamping scale of planet " .. name .. " to: " .. tostring(scale))
    elseif scale > max_scale then
        scale = max_scale
        log("Maximum clamping scale of planet " .. name .. " to: " .. tostring(scale))
    end
    
    local new_radius = nauvis_size * scale
    
    log("Setting " .. name .. " radius from " .. radius .. " to " .. new_radius .. " (x " .. scale .. ")")
    backdrop.radius = new_radius

    ::continue::
end

if settings.startup["vp-scale-enable-rotation-multiplier"].value then
    local get_planet_rotation_speed = require("get_rotation")

    for name, prototype in pairs(data.raw.planet) do
        local backdrop = (prototype.platform_surface_render_parameters and prototype.platform_surface_render_parameters.platform_backdrop)
        if not backdrop then goto continue end
        if not backdrop.rotation_seconds then goto continue end
        
        local rotation_multiplier = get_planet_rotation_speed(prototype)
        local new_rotation_seconds = backdrop.rotation_seconds * rotation_multiplier
        log ("Setting " .. name .. " rotation time from " .. backdrop.rotation_seconds .. " to " .. new_rotation_seconds .. " (x " .. rotation_multiplier .. ")")
        backdrop.rotation_seconds = new_rotation_seconds
        
        ::continue::
    end
else
    log("Rotation multiplier disabled, skipping rotation speed adjustments")
end