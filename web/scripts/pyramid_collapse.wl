(* Pyramid Collapse — a pyramid of cuboids hit by a heavy sphere *)

projectDir = DirectoryName[$InputFileName, 3];
PacletDirectoryLoad[FileNameJoin[{projectDir, "PhysicsLink"}]];
Needs["PhysicsLink`"];

Print["Generating pyramid collapse video..."];

(* Build a 4-layer pyramid of cuboids *)
blockSize = 0.45;
layers = {};
Do[
  Do[
    Do[
      AppendTo[layers,
        DynamicBody[{MaterialShading["Brass"],
          Cuboid[
            {col - blockSize/2, row - blockSize/2, layer*blockSize*2},
            {col + blockSize/2, row + blockSize/2, (layer + 1)*blockSize*2}
          ]}]
      ],
      {col, -blockSize*(3 - layer), blockSize*(3 - layer), blockSize*2}
    ],
    {row, -blockSize*(3 - layer), blockSize*(3 - layer), blockSize*2}
  ],
  {layer, 0, 3}
];

(* Wrecking sphere *)
wrecker = DynamicBody[{MaterialShading["Chrome"],
  Sphere[{-3.5, 0, 1.5}, 0.6]},
  "Density" -> 8.0];

model = CreatePhysicsModel[{
  PhysicsBoundaryBox[{{-4, -4, 0}, {4, 4, 6}}, "Thickness" -> 1],
  FixedBody[{HatchShading[.6, Gray], Cuboid[{-4, -4, -1}, {4, 4, 0}]}],
  layers,
  wrecker
},
  "Gravity" -> {0, 0, -9.81},
  "Graphics3DOptions" -> {Background -> Black, Axes -> False,
    Boxed -> False, ViewPoint -> Front, ImageSize -> Large}
];

frames = PhysicsModelEvolve[model, 300, 1.0/60.0];

video = PhysicsModelVideo[frames,
  PlotRange -> 1.03 {{-4, 4}, {-4, 4}, {-0.5, 6}}
];

outDir = FileNameJoin[{DirectoryName[$InputFileName, 2], "videos"}];
outFile = FileNameJoin[{outDir, "pyramid_collapse.mp4"}];
Export[outFile, video, "FrameRate" -> 60, ImageSize -> {Automatic, 720}];

Print["Exported: ", outFile];

DestroyPhysicsModel[Last[frames]];
Print["Done."];
