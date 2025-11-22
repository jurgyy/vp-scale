if not mods["PlanetsLib"] then return end

-- Also scale (and shift) the moons introduced by PlanetsLib

local get_planet_scale = require("get_scale")

---@diagnostic disable-next-line: undefined-global
local overrides = vp_get_planet_overrides()

local starmap_name_map = {}
for name, planet in pairs(data.raw.planet) do
  if planet.starmap_icon then
    starmap_name_map[planet.starmap_icon] = planet
  end
end

local min_scale = settings.startup["vp-scale-min-moon"].value
local max_scale = settings.startup["vp-scale-max-moon"].value
---@cast min_scale double
---@cast max_scale double

-- Setting scale of child renders such that moons aren't hidden behind their parent body
for name, override in pairs(overrides) do
  if not override.scale then goto continue end

  local sprite = data.raw.sprite["visible-planets-" .. name]
  if not sprite then goto continue end

  log("Setting scale of planet " .. name .. " to: " .. tostring(override.scale))
  for _, layer in pairs(sprite.layers) do
    if not layer.shift then goto continue end -- Assuming shift == nil is the parent

    for _, i in pairs({1, 2, "x", "y"}) do
      if layer.shift[i] then
        layer.shift[i] = layer.shift[i] * override.scale
      end
    end
    log("Shift for planet " .. name .. " and layer " .. layer.filename .. ": " .. serpent.line(layer.shift))

    if not layer.scale then goto continue end

    local child = starmap_name_map[layer.filename]
    if not child then
      error("Couldn't find child for " .. layer.filename)
    end
    if child.name == name then
      error("Found child with same name as parent for " .. layer.filename)
    end

    local scale = layer.scale * get_planet_scale(child)
    if scale < min_scale then
      scale = min_scale
      log("Minimum clamping scale of child of planet " .. name .. ", " .. child.name .. " to: " .. tostring(scale))
    elseif scale > max_scale then
      scale = max_scale
      log("Maximum clamping scale of child of planet " .. name .. ", " .. child.name .. " to: " .. tostring(scale))
    end
    layer.scale = scale
    log("Scale for planet " .. name .. " and layer " .. layer.filename .. ": " .. tostring(scale))
  end
  ::continue::
end