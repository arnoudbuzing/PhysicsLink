$physicsLinkPacletDir = FileNameJoin[{DirectoryName[$InputFileName, 2], "PhysicsModelLink"}];
PacletDirectoryLoad[$physicsLinkPacletDir];
Needs["ArnoudBuzing`PhysicsModelLink`"];

mesh = ConvexHullMesh[{{0,0,0},{1,0,0},{0.5,1,0},{0.5,0.5,1.0}}];
Print["Mesh Head: ", Head[mesh]];
Print["MeshRegionQ: ", MeshRegionQ[mesh]];
Print["BoundaryMeshRegionQ: ", BoundaryMeshRegionQ[mesh]];

info = ArnoudBuzing`PhysicsModelLink`Private`extractPrimitiveInfo[mesh];
Print["Info: ", info];
