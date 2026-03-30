# RapierWorldCreate

`RapierWorldCreate[{gx, gy, gz}]` initializes a new simulation world and returns its unique ID.

## Usage

```wolfram
RapierWorldCreate[{gx, gy, gz}]
```
- `{gx, gy, gz}`: Gravity vector for the simulation.
- Returns an integer ID that identifies the simulation world.

## Details and Notes

- The gravity vector is given in units of length per time squared. A common value for gravity on Earth is `{0.0, 0.0, -9.81}`.
- The returned ID is used in all other functions that interact with the simulation world.
- Multiple simulation worlds can be active at the same time. Each must be destroyed using `RapierWorldDestroy` when no longer needed.

## Examples

### Basic Example
Create a simulation world with gravity:
```wolfram
worldId = RapierWorldCreate[{0.0, 0.0, -9.81}]
(* 1 *)
```

### Advanced Example
Create multiple independent simulation worlds:
```wolfram
world1 = RapierWorldCreate[{0, 0, -10}];
world2 = RapierWorldCreate[{0, 0, 0}]; (* no gravity *)
{world1, world2}
(* {1, 2} *)
```
