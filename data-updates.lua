local get_planet_scale = require("get_scale")

local min_scale = settings.startup["vp-scale-min"].value
local max_scale = settings.startup["vp-scale-max"].value
---@cast min_scale double
---@cast max_scale double

local blacklist = vp_scale_get_planet_scale_blacklist()
---@diagnostic disable-next-line: undefined-global
local overrides = vp_get_planet_overrides()
for _, planet in pairs(data.raw.planet) do
    if blacklist[planet.name] then
        log("Skipping setting scale for blacklisted " .. planet.name)
        goto continue
    end
    if overrides[planet.name] then
        log("Skipping setting scale for overriden " .. planet.name)
        goto continue
    end

    local scale = get_planet_scale(planet)
    if scale < min_scale then
        scale = min_scale
        log("Minimum clamping scale of planet " .. planet.name .. " to: " .. tostring(scale))
    elseif scale > max_scale then
        scale = max_scale
        log("Maximum clamping scale of planet " .. planet.name .. " to: " .. tostring(scale))
    end

    log("Setting scale of planet " .. planet.name .. " to: " .. tostring(scale))

    ---@diagnostic disable-next-line: undefined-global
    vp_override_planet_scale(planet.name, scale)

    ::continue::
end