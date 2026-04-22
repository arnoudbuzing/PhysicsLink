$physicsLinkPacletDir = FileNameJoin[{DirectoryName[$InputFileName, 2], "PhysicsModelLink"}];
PacletDirectoryLoad[$physicsLinkPacletDir];
Needs["ArnoudBuzing`PhysicsModelLink`"];

Print["Library Path: ", ArnoudBuzing`PhysicsModelLink`Private`physicsLinkLibraryPath[]];
Print["Library Exists: ", FileExistsQ[ArnoudBuzing`PhysicsModelLink`Private`physicsLinkLibraryPath[]]];
Print["Library Var: ", ArnoudBuzing`PhysicsModelLink`Private`$physicsLinkLib];
Print["Rapier Version (Private): ", ArnoudBuzing`PhysicsModelLink`Private`RapierVersion[]];
Print["iRapier Version: ", ArnoudBuzing`PhysicsModelLink`Private`$iRapierVersion[]];
