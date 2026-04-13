(* Sphere Avalanche — small spheres cascading over a fixed sphere *)

projectDir = DirectoryName[$InputFileName, 3];
PacletDirectoryLoad[FileNameJoin[{projectDir, "PhysicsModelLink"}]];
Needs["ArnoudBuzing`PhysicsModelLink`"];

Print["Generating sphere avalanche video..."];

model = CreatePhysicsModel[{
  PhysicsBoundaryBox[{{-5, -5, -10}, {5, 5, 16}}],
  FixedBody[{Sphere[{0, 0, -6}, 4]}],
  Flatten@
    Table[DynamicBody[{Sphere[{i, j, k} + RandomReal[{-0.01, 0.01}, 3],
        0.25]}], {i, -3, 3}, {j, -3, 3}, {k, 0, 14}]},
  "Graphics3DOptions" -> {PlotRange ->
    1.05 {{-7, 7}, {-7, 7}, {-10, 10}}, Background -> Black,
    Axes -> False, Boxed -> False, ViewPoint -> Front, ImageSize -> Large}
];

Print["Bodies: ", Length[model[[1]]["Bodies"]]];

frames = PhysicsModelEvolve[model, 300, 1/60];
Print["Frames: ", Length[frames]];

video = PhysicsModelVideo[frames,
  PlotRange -> 1.05 {{-7, 7}, {-7, 7}, {-10, 2}}
];
Print["Video head: ", Head[video]];

outDir = FileNameJoin[{DirectoryName[$InputFileName, 2], "videos"}];
outFile = FileNameJoin[{outDir, "sphere_avalanche.mp4"}];
Print["Exporting to: ", outFile];
result = Export[outFile, video, "FrameRate" -> 60, ImageSize -> {Automatic, 720}];
Print["Export result: ", result];

DestroyPhysicsModel[Last[frames]];
Print["Done."];
