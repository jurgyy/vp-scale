[![Release](https://github.com/jurgyy/vp-scale/actions/workflows/release.yml/badge.svg?branch=main)](https://github.com/jurgyy/vp-scale/actions/workflows/release.yml)

A small mod for [Factorio: Space Age](https://factorio.com/) to enhance the mod [Visible Planets in Space](https://mods.factorio.com/mod/visible-planets) by adjusting the scale of individual planets based on their gravity.

Automatically works for modded planets and mods that adjust the gravity of any given planet. If Nauvis' gravity is adjusted, its scale will still be 1 which means other planets will shrink or grow relative to it.
This mod's scale is an aditional multiplier independent of Visible Planets' "Planet final scale" map setting. In other words, adjusting the setting scales all planets while keeping this mod's individual adjustments.

# Relative scale

Here's an overview of the relative scale of the different planets:

| Planet   | Scale  |
| -------- | ------ |
| Nauvis   | 1      |
| Vulcanus | 1.587  |
| Gleba    | 1.259  |
| Fulgora  | 0.928  |
| Aquilo   | 1.144  |
| Cerys*   | 0.215  |

\* Example for modded planets. [Cerys](https://mods.factorio.com/mod/Cerys-Moon-of-Fulgora) is a modded moon of Fulgora and, as expected, is rendered much smaller than the full sized planets.

# Realism

As mentioned in [one of the discussion pages](https://mods.factorio.com/mod/vp-scale/discussion/67707729f934f2a791830ebd) this mod isn't really realisitc. From a fuel efficiency point of view, space platforms usually want to be as close to the planet as possible which means from the point of the view of the platform the planet would fill up your entire field of view. However if you'd like some visual cue for the size of the planet, or just some more distinction between the planets, this is the mod for you!

# For other modders

Are you manually setting the scale yourself, or are you creating a black hole with a huge gravitational pull or a cloud formation with hardly any and you don't want your sprites to scale? Add the desired planet(s) to the blacklist by calling `vp_scale_add_planets_to_scale_blacklist({"vulcanus", "gleba"})` in your data stage. Just replace Vulcanus and Gleba with your own `PlanetPrototype.name` names.