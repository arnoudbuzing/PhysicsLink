# RapierGetBodyPositions

`RapierGetBodyPositions[worldId]` returns a matrix containing the current positions and rotations of all rigid bodies in the simulation world.

## Usage

```wolfram
RapierGetBodyPositions[worldId]
```
- `worldId`: The ID of the simulation world.
- Returns a matrix of shape `{N, 8}`, where `N` is the number of rigid bodies.

## Details and Notes

- **Matrix Structure**: Each row in the returned matrix contains 8 values for a single rigid body:
    - `[BodyHandleRaw, X, Y, Z, QX, QY, QZ, QW]`
- **Column Definitions**:
    - `BodyHandleRaw`: The unique ID of the rigid body.
    - `X, Y, Z`: Current position of the body's center in the simulation world.
    - `QX, QY, QZ, QW`: Current rotation of the body as a quaternion.
- This function is typically used after calling `RapierWorldStep` to retrieve the updated state of the simulation for visualization or analysis.
- If there are no rigid bodies in the world, an empty list `{}` is returned.

## Examples

### Basic Example
Get the positions of all bodies in a world:
```wolfram
worldId = RapierWorldCreate[{0.0, 0.0, -9.81}];
(* Add bodies and colliders *)
RapierWorldStep[worldId, 60, 1/60.0];
positions = RapierGetBodyPositions[worldId]
(* {{123456789., 0., 0., 5., 0., 0., 0., 1.}, ...} *)
```

### Advanced Example
Extract just the $Z$ positions of all bodies:
```wolfram
positions = RapierGetBodyPositions[worldId];
zPositions = positions[[All, 4]]
(* {5.0, -1.0, ...} *)
```
