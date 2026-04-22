$physicsLinkPacletDir = FileNameJoin[{DirectoryName[$InputFileName, 2], "PhysicsModelLink"}];
PacletDirectoryLoad[$physicsLinkPacletDir];
Needs["ArnoudBuzing`PhysicsModelLink`"];

testFile = FileNameJoin[{DirectoryName[$InputFileName, 2], "tests", "test_convexhull.wlt"}];
report = TestReport[testFile];

Print["Tests Succeeded: ", report["TestsSucceededCount"]];
Print["Tests Failed: ", report["TestsFailedCount"]];
Print["Tests with Messages: ", Length[report["TestsFailedWithMessagesKeys"]]];

Do[
  obj = report["TestResults"][key];
  If[obj["Outcome"] =!= "Success",
    Print["Test ID: ", obj["TestID"]];
    Print["Outcome: ", obj["Outcome"]];
    Print["Actual Messages: ", obj["ActualMessages"]];
  ],
  {key, Keys[report["TestResults"]]}
]
