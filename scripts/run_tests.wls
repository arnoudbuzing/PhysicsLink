testsDir = FileNameJoin[{DirectoryName[$InputFileName], "..", "tests"}];
files = FileNames["*.wlt", testsDir];
report = TestReport[files];
Print[report];
If[report["TestsFailedCount"] > 0, Exit[1], Exit[0]];
