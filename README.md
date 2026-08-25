[![Release](https://github.com/jurgyy/vp-scale/actions/workflows/release.yml/badge.svg?branch=main)](https://github.com/jurgyy/vp-scale/actions/workflows/release.yml)

A small mod for [Factorio: Space Age](https://factorio.com/) to enhance the planet backdrops by scaling them based on the planet's gravity and adjust their rotation speed based on the length of their day/night cycle.

# Relative scale

Here's an overview of the relative scale of the different planets:

| Planet   | Gravity | Scale  | Rotation multiplier |
| -------- | ------- | ------ | ------------------- |
| Nauvis   | 10      | 1      | 1                   |
| Vulcanus | 40      | 1.587  | 4.667               |
| Gleba    | 20      | 1.259  | 0.7                 |
| Fulgora  | 8       | 0.928  | 2.333               |
| Aquilo   | 15      | 1.144  | 0.35                |
| Cerys*   | 0.15    | 0.215  | 1.167               |

\* Example for modded planets. [Cerys](https://mods.factorio.com/mod/Cerys-Moon-of-Fulgora) is a modded moon of Fulgora and, as expected, is rendered much smaller than the full sized planets.

# Calculation

Each planet has a gravity property defined in the game files. We can use this as a proxy for size: Nauvis has a gravity of 10, Gleba 20.
Now this doesn't mean Gleba should be twice as big; it has twice the mass, assuming the planets have roughly the same density, Gleba's volume is twice as big.

The volume of a sphere in terms of its radius is as follows: `V = 4/3πr³`
And the other way around: `r = (3V / 4π)^(1/3)`

So if we take Nauvis as the base size and define its radius as 1, filling in the first formula, we get the `V(Nauvis) = 4.19`.
Then doubling that and putting it in the second formula we get `r(Gleba) = 1.26`

So Gleba should be rendered 26% bigger than Nauvis.

# Realism

As mentioned in [one of the discussion pages](https://mods.factorio.com/mod/vp-scale/discussion/67707729f934f2a791830ebd) this mod isn't really realisitc. From a fuel efficiency point of view, space platforms usually want to be as close to the planet as possible which means from the point of the view of the platform the planet would fill up your entire field of view. However if you'd like some visual cue for the size of the planet, or just some more distinction between the planets, this is the mod for you!

# Factorio 2.0

The 2.0 version was build on top of [Visible Planets in Space](https://mods.factorio.com/mod/visible-planets).