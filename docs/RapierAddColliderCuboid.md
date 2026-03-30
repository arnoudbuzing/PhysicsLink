# RapierAddColliderCuboid

`RapierAddColliderCuboid[worldId, bodyId, {hx, hy, hz}, density]` adds a cuboid collider to a rigid body.

## Usage

```wolfram
RapierAddColliderCuboid[worldId, bodyId, {hx, hy, hz}, density]
```
- `worldId`: The ID of the simulation world.
- `bodyId`: The ID of the rigid body to attach the collider to.
- `{hx, hy, hz}`: Half-extents of the cuboid along the $x, y, z$ axes.
- `density`: The density of the collider material.
- Returns an integer ID for the added collider.

## Details and Notes

- **Colliders**: Colliders define the shape and physical properties of a rigid body. A rigid body can have multiple colliders attached to it.
- **Dimensions**: The half-extents are the distances from the center of the cuboid to its faces along each axis. For example, a cube with side length 2.0 has half-extents `{1.0, 1.0, 1.0}`.
- **Static vs. Dynamic**: If the rigid body is `"Fixed"`, the collider will act as a static object. If the body is `"Dynamic"`, the collider's mass (calculated from its volume and density) will contribute to the total mass of the body.

## Examples

### Basic Example
Add a cuboid collider representing a floor to a fixed rigid body:
```wolfram
worldId = RapierWorldCreate[{0, 0, -9.81}];
floorId = RapierAddRigidBody[worldId, {0, 0, -1}, "Fixed"];
RapierAddColliderCuboid[worldId, floorId, {10.0, 10.0, 1.0}, 1.0]
(* 123456789 *)
```

### Advanced Example
Create a long, thin rod by attaching a narrow cuboid collider to a dynamic body:
```wolfram
bodyId = RapierAddRigidBody[worldId, {0, 0, 5}, "Dynamic"];
RapierAddColliderCuboid[worldId, bodyId, {0.1, 0.1, 2.0}, 1.0];
```
