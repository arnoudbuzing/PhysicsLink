# RapierAddRigidBody

`RapierAddRigidBody[worldId, {x, y, z}, {qx, qy, qz, qw}, type]` adds a rigid body to the simulation.

## Usage

```wolfram
RapierAddRigidBody[worldId, {x, y, z}, {qx, qy, qz, qw}, type]
RapierAddRigidBody[worldId, {x, y, z}, type]
```
- `worldId`: The ID of the simulation world.
- `{x, y, z}`: Initial position of the rigid body.
- `{qx, qy, qz, qw}`: Initial rotation as a quaternion (default is `{0, 0, 0, 1}`).
- `type`: The type of rigid body: `"Dynamic"`, `"Fixed"`, `"KinematicPosition"`, or `"KinematicVelocity"`.
- Returns an integer ID for the newly created rigid body.

## Details and Notes

- **Body Types**:
    - `"Dynamic"`: Affected by gravity and forces.
    - `"Fixed"`: Static part of the environment, not affected by forces.
    - `"KinematicPosition"`: Position is manually updated.
    - `"KinematicVelocity"`: Velocity is manually updated.
- **Rotation**: The quaternion `{qx, qy, qz, qw}` defines the body's orientation.
- Rigid bodies do not have a shape until a collider is attached using `RapierAddColliderCuboid` or `RapierAddColliderSphere`.

## Examples

### Basic Example
Add a fixed floor at `{0, 0, -1}`:
```wolfram
floorId = RapierAddRigidBody[worldId, {0, 0, -1}, "Fixed"]
(* 123456789 *)
```

### Advanced Example
Add a dynamic body with an initial rotation:
```wolfram
bodyId = RapierAddRigidBody[worldId, {0, 0, 10}, {0.707, 0, 0, 0.707}, "Dynamic"]
(* 987654321 *)
```
