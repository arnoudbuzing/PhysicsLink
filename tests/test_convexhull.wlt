VerificationTest[
  PacletDirectoryLoad[FileNameJoin[{DirectoryName[$TestFileName, 2], "PhysicsModelLink"}]],
  {__String},
  SameTest -> MatchQ,
  TestID -> "PacletDirectoryLoad-ConvexHull"
]

VerificationTest[
  Needs["ArnoudBuzing`PhysicsModelLink`"],
  Null,
  TestID -> "NeedsPhysicsModelLink-ConvexHull"
]

(* Test ConvexHullMesh is recognized and creates a body *)
VerificationTest[
  Module[{model, bodies},
    model = CreatePhysicsModel[{
      DynamicBody[ConvexHullMesh[{{0,0,0},{1,0,0},{0.5,1,0},{0.5,0.5,1.0}}]],
      FixedBody[Cuboid[{-5,-5,-1},{5,5,0}]]
    }];
    bodies = model[[1]]["Bodies"];
    DestroyPhysicsModel[model];
    {Length[bodies], bodies[[1]]["ShapeType"], bodies[[2]]["ShapeType"]}
  ],
  {2, "ConvexHull", "Cuboid"},
  TestID -> "ConvexHullMesh-CreateModel"
]

(* Test ConvexHull body falls under gravity *)
VerificationTest[
  Module[{model, model2, zStart, zEnd},
    model = CreatePhysicsModel[{
      DynamicBody[ConvexHullMesh[{{0,0,2},{1,0,2},{0.5,1,2},{0.5,0.5,3.0}}]],
      FixedBody[Cuboid[{-5,-5,-1},{5,5,0}]]
    }];
    zStart = model[[1]]["Bodies"][[1]]["Position"][[3]];
    model2 = PhysicsModelIterate[model, 60, 1/60.0];
    zEnd = model2[[1]]["Bodies"][[1]]["Position"][[3]];
    DestroyPhysicsModel[model2];
    zStart > zEnd
  ],
  True,
  TestID -> "ConvexHullMesh-FallsUnderGravity"
]

(* Test low-level RapierAddColliderConvexHull *)
VerificationTest[
  Module[{worldId, bodyId, colliderId},
    worldId = RapierWorldCreate[{0.0, 0.0, -9.81}];
    bodyId = RapierAddRigidBody[worldId, {0.0, 0.0, 5.0}, "Dynamic"];
    colliderId = RapierAddColliderConvexHull[worldId, bodyId,
      {{-1,-1,-1},{1,-1,-1},{1,1,-1},{-1,1,-1},{-1,-1,1},{1,-1,1},{1,1,1},{-1,1,1}},
      1.0];
    RapierWorldDestroy[worldId];
    colliderId =!= -1
  ],
  True,
  TestID -> "RapierAddColliderConvexHull-Success"
]
