local rotation_speed_base = 0.04 --settings.startup["visible-planets-rotation-speed"].value
---@cast rotation_speed_base double

local nauvis = data.raw.planet["nauvis"]
if not nauvis then
    error("Nauvis not found")
end

--- Get the day-night-cycle property of a planet
---@param planet data.PlanetPrototype
---@return number?
local function get_day_night_cycle(planet)
    local surface_properties = planet.surface_properties
    if surface_properties then
        return surface_properties["day-night-cycle"]
    end
    return nil
end

local nauvis_day_night_cycle = get_day_night_cycle(nauvis)
if not nauvis_day_night_cycle then
    nauvis_day_night_cycle = 25200 -- Vanilla value
end

--- Get a planet's rotation speed relative to Nauvis
---@param planet data.PlanetPrototype
---@return number
local function get_planet_rotation_multiplier(planet)
    local planet_day_night_cycle = get_day_night_cycle(planet)
    if not planet_day_night_cycle then
        return rotation_speed_base
    end
    return nauvis_day_night_cycle / planet_day_night_cycle
end

return get_planet_rotation_multiplier