# Rapier

A Wolfram Language paclet providing high-performance 3D physics simulation bindings to the Rust [rapier3d](https://rapier.rs/) physics engine via `wolfram-library-link`.

## Overview 

This paclet acts as a wrapper around the Rapier physics engine. To bridge the gap between Mathematica's functional nature and Rapier's stateful dependencies, it implements an internal Handle-Based Global memory map inside the dynamically linked Rust library.

The simulation world is persistent in memory, isolated securely per session. You iteratively create a world, populate it dynamically with bodies and colliders, step the physics pipeline, and retrieve flat matrix transformation arrays back instantly over WSTP for zero-latency 3D visual plotting.

## Building the Project

Ensure you have Rust/Cargo installed, as well as the Wolfram Engine or Mathematica.

1. Navigate to the project root.
2. Run the build script to compile the shared library and automatically route it to your OS-specific `$SystemID` paclet directory:
   ```bash
   ./scripts/build.wls
   ```

## Usage Example (Cuboids + Spheres + Cylinders)

Load the paclet from a local checkout:

```wl
PacletDirectoryLoad[FileNameJoin[{NotebookDirectory[], "Rapier"}]];
Needs["Rapier`"];
```

Create a world with gravity:

```wl
worldId = RapierWorldCreate[{0.0, 0.0, -9.81}];
```

Add fixed objects (a floor cuboid and a fixed sphere obstacle):

```wl
floorId = RapierAddRigidBody[worldId, {0.0, 0.0, -1.0}, "Fixed"];
RapierAddColliderCuboid[worldId, floorId, {8.0, 8.0, 1.0}, 1.0];

fixedSphereId = RapierAddRigidBody[worldId, {2.0, 0.0, 0.8}, "Fixed"];
RapierAddColliderSphere[worldId, fixedSphereId, 0.8, 1.0];
```

Add dynamic objects (a cuboid, a sphere, and a cylinder):

```wl
dynCuboidId = RapierAddRigidBody[worldId, {-1.5, 0.0, 4.5}, "Dynamic"];
RapierAddColliderCuboid[worldId, dynCuboidId, {0.5, 0.5, 0.5}, 1.0];

dynSphereId = RapierAddRigidBody[worldId, {0.0, 0.0, 6.0}, "Dynamic"];
RapierAddColliderSphere[worldId, dynSphereId, 0.5, 1.0];

dynCylinderId = RapierAddRigidBody[worldId, {1.5, 0.0, 5.2}, "Dynamic"];
RapierAddColliderCylinder[worldId, dynCylinderId, {0.6, 0.35}, 1.0];
```

Step the simulation and capture body transforms:

```wl
dt = 1.0/60.0;
steps = 240;

frames = Table[
  RapierWorldStep[worldId, 1, dt];
  RapierGetBodyPositions[worldId],
  {steps}
];
```

Visualize by mapping each body handle to its current position (columns `2;;4`):

```wl
handleToPos[mat_] := Association @ Map[(#[[1]] -> #[[2 ;; 4]]) &, mat];

ListAnimate[
  Table[
    Module[{p = handleToPos[frame]},
      Graphics3D[
        {
          Gray, Translate[Cuboid[{-8, -8, -1}, {8, 8, 1}], p[floorId]],
          Darker@Blue, Translate[Sphere[{0, 0, 0}, 0.8], p[fixedSphereId]],

          Orange, Translate[Cuboid[{-0.5, -0.5, -0.5}, {0.5, 0.5, 0.5}], p[dynCuboidId]],
          Red, Translate[Sphere[{0, 0, 0}, 0.5], p[dynSphereId]],
          Purple, Translate[Cylinder[{{0, 0, -0.6}, {0, 0, 0.6}}, 0.35], p[dynCylinderId]]
        },
        PlotRange -> {{-6, 6}, {-6, 6}, {-2, 8}},
        Axes -> True,
        Boxed -> True
      ]
    ],
    {frame, frames}
  ],
  AnimationRate -> 60
]
```

Cleanup:

```wl
RapierWorldDestroy[worldId]
```
