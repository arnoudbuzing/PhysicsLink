# RapierWorldStep

`RapierWorldStep[worldId, steps, dt]` advances the simulation by a specified number of time steps.

## Usage

```wolfram
RapierWorldStep[worldId, steps, dt]
```
- `worldId`: The ID of the simulation world.
- `steps`: The number of simulation steps to perform.
- `dt`: The duration of each time step.
- Returns `Null`.

## Details and Notes

- This function advances the simulation world by `steps * dt` units of time.
- Common values for `dt` are `1/60` (60 FPS) for smooth real-time simulations.
- Large values for `steps` will perform more calculations in a single call, which can be more efficient than multiple calls but can also cause simulation artifacts if `dt` is too large.
- The state of all dynamic bodies in the simulation world will be updated based on their forces, velocities, and collisions.

## Examples

### Basic Example
Advance the simulation by 60 steps at a rate of 60 steps per second:
```wolfram
worldId = RapierWorldCreate[{0.0, 0.0, -9.81}];
RapierWorldStep[worldId, 60, 1/60.0]
(* Advances 1.0 second in the simulation world *)
```

### Advanced Example
Perform multiple simulation steps and update the visualization:
```wolfram
Do[
  RapierWorldStep[worldId, 1, 1/60.0];
  positions = RapierGetBodyPositions[worldId];
  (* Use positions to update graphics *)
, {120}]
```
