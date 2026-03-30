# RapierCuboidMass

`RapierCuboidMass[hx, hy, hz, density]` returns the theoretical mass of a cuboid.

## Usage

```wolfram
RapierCuboidMass[hx, hy, hz, density]
```
- `hx, hy, hz`: Half-extents of the cuboid in the $x, y, z$ directions.
- `density`: The density of the material.
- Returns the mass of the cuboid as a real number.

## Details and Notes

- The values for `hx, hy, hz` should be positive real numbers representing half of the total dimensions of the cuboid along each axis.
- The mass is calculated by multiplying the volume ( $8 \times hx \times hy \times hz$ ) by the density.
- This function is useful for pre-calculating the mass of bodies before adding them to the simulation.

## Examples

### Basic Example
Calculate the mass of a $2 \times 2 \times 2$ cube with density 1.0:
```wolfram
RapierCuboidMass[1.0, 1.0, 1.0, 1.0]
(* 8.0 *)
```

### Advanced Example
Compare the mass of two different cuboids:
```wolfram
mass1 = RapierCuboidMass[10.0, 10.0, 1.0, 0.5];
mass2 = RapierCuboidMass[5.0, 5.0, 2.0, 2.0];
{mass1, mass2}
(* {400.0, 200.0} *)
```
