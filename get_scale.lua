-- You could use gravity as a proxy for size: Nauvis has a gravity of 10, Gleba 20.
-- Now this doesn't mean Gleba should be twice as big; it has twice the mass,
-- assuming the planets consist of roughly the same elements, Gleba's volume is twice as big.

-- The volume of a sphere in terms of its radius is as follows: V = 4/3πr³
-- And the other way around: r = (3V / 4π)^(1/3)

-- So if we take Nauvis as the base size and define its radius as 1, filling in the second formula, we get the V(Nauvis) = 4.19.
-- Then doubling that and putting it in the first formula we get r(Gleba) = 1.26

-- So Gleba should be rendered 26% bigger than Nauvis.

local nauvis = data.raw.planet["nauvis"]
if not nauvis then
    error("Nauvis not found")
end

--- Get the gravity property of a surface, or default to 10 if it isn't set
--- Which it isn't in the case of Nauvis and its gravity is equal to 10
---@param planet data.PlanetPrototype
---@return number
local function get_gravity(planet)
    local surface_properties = planet.surface_properties
    if surface_properties  then
        return surface_properties["gravity"] or 10
    end
    return 10
end

local g_nauvis = get_gravity(nauvis)

---Get the scale of a planet relative to Nauvis by using the gravity as proxy
---@param planet data.PlanetPrototype
---@return number
local function get_relative_scale(planet)
    return get_gravity(planet) / g_nauvis
end

---@param volume number
---@return number
local function get_radius(volume)
    return math.pow((3 * volume) / (4 * math.pi), 1/3)
end

---@param radius number
---@return number
local function get_volume(radius)
    return 4 / 3 * math.pi * math.pow(radius, 3)
end

local v_nauvis = get_volume(1)

--- Get a planet's scale relative to Nauvis
---@param planet data.PlanetPrototype
---@return number
local function get_planet_scale(planet)
    local v_planet = v_nauvis * get_relative_scale(planet)
    return get_radius(v_planet)
end

return get_planet_scale