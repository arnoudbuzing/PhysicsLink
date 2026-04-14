(* Diagnose empty PhysicsModelPlot *)

$projectDir = DirectoryName[$InputFileName, 2];
PacletDirectoryLoad[FileNameJoin[{$projectDir, "PhysicsModelLink"}]];
Needs["ArnoudBuzing`PhysicsModelLink`"];

model = CreatePhysicsModel[{
  DynamicBody[ConvexHullMesh[{{0, 0, 2}, {1, 0, 2}, {0.5, 1, 2}, {0.5, 0.5, 3}}]],
  FixedBody[Cuboid[{-5, -5, -1}, {5, 5, 0}]]
}];

assoc = model[[1]];
bodies = assoc["Bodies"];
Print["Number of bodies: ", Length[bodies]];

(* Check each body *)
Do[
  body = bodies[[i]];
  Print["\n--- Body ", i, " ---"];
  Print["ShapeType: ", body["ShapeType"]];
  Print["ShapeParams: ", Short[body["ShapeParams"], 3]];
  Print["Directives: ", body["Directives"]];
  Print["Position: ", body["Position"]];
  Print["Quaternion: ", body["Quaternion"]];

  prim = ArnoudBuzing`PhysicsModelLink`Private`bodyToGraphics[body];
  Print["bodyToGraphics result: ", Short[prim, 3]];
  Print["Head of result: ", Head[prim]];
  ,
  {i, Length[bodies]}
];

(* Check the full plot *)
plot = PhysicsModelPlot[model];
Print["\nPlot Head: ", Head[plot]];
Print["Plot first arg: ", Short[plot[[1]], 3]];
