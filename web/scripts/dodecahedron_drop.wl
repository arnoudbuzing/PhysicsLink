(* Dodecahedron Drop — a convex hull dodecahedron bouncing on a sloped convex hull floor *)

projectDir = DirectoryName[$InputFileName, 3];
PacletDirectoryLoad[FileNameJoin[{projectDir, "PhysicsModelLink"}]];
Needs["ArnoudBuzing`PhysicsModelLink`"];

Print["Generating dodecahedron drop video..."];

dodecahedron =
  Translate[
    ConvexHullMesh[N[PolyhedronData["Dodecahedron", "Points"]]], {3, 0, 5}];

model = CreatePhysicsModel[{
  DynamicBody[{StandardOrange, HatchShading[], dodecahedron}],
  PhysicsBoundaryBox[{{-5, -5, 0}, {5, 5, 7}}],
  FixedBody[{Gray, HatchShading[],
    ConvexHullMesh[{{-5, -5, 0}, {-5, 5, 0}, {5, 5, 0}, {5, -5, 0},
      {-5, -5, 1}, {-5, 5, 1}, {5, 5, 3}, {5, -5, 3}}]}]},
  "Graphics3DOptions" -> {ViewPoint -> Front,
    PlotRange -> 1.01 {{-5, 5}, {-5, 5}, {0, 7}},
    Background -> Black, Axes -> False, Boxed -> False,
    ImageSize -> Large}
];

frames = PhysicsModelEvolve[model, 500, 1/60.0];

video = PhysicsModelVideo[frames,
  PlotRange -> 1.01 {{-5, 5}, {-5, 5}, {0, 7}}
];

outDir = FileNameJoin[{DirectoryName[$InputFileName, 2], "videos"}];
outFile = FileNameJoin[{outDir, "dodecahedron_drop.mp4"}];
Export[outFile, video, "FrameRate" -> 60, ImageSize -> {Automatic, 720}];

Print["Exported: ", outFile];

DestroyPhysicsModel[Last[frames]];
Print["Done."];
