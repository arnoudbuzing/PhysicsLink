# RapierAddColliderSphere

`RapierAddColliderSphere[worldId, bodyId, radius, density]` adds a spherical collider to a rigid body.

## Usage

```wolfram
RapierAddColliderSphere[worldId, bodyId, radius, density]
```
- `worldId`: The ID of the simulation world.
- `bodyId`: The ID of the rigid body to attach the collider to.
- `radius`: The radius of the sphere.
- `density`: The density of the collider material.
- Returns an integer ID for the added collider.

## Details and Notes

- **Colliders**: Colliders define the shape and physical properties of a rigid body. A rigid body can have multiple colliders attached to it.
- **Dimensions**: The sphere is defined by its radius. A sphere with radius 1.0 has a diameter of 2.0.
- **Static vs. Dynamic**: If the rigid body is `"Fixed"`, the collider will act as a static object. If the body is `"Dynamic"`, the collider's mass (calculated from its volume and density) will contribute to the total mass of the body.

## Examples

### Basic Example
Add a spherical collider to a dynamic rigid body:
```wolfram
worldId = RapierWorldCreate[{0.0, 0.0, -9.81}];
bodyId = RapierAddRigidBody[worldId, {0.0, 0.0, 10.0}, "Dynamic"];
RapierAddColliderSphere[worldId, bodyId, 0.5, 1.0]
(* 123456789 *)
```

### Advanced Example
Add multiple spherical colliders to a dynamic body:
```wolfram
bodyId = RapierAddRigidBody[worldId, {0.0, 0.0, 5.0}, "Dynamic"];
RapierAddColliderSphere[worldId, bodyId, 1.0, 1.0];
RapierAddColliderSphere[worldId, bodyId, 0.5, 1.0]; (* Attached at the same center *)
```
