VerificationTest[
  PacletDirectoryLoad[FileNameJoin[{DirectoryName[$TestFileName, 2], "PhysicsModelLink"}]],
  {__String},
  SameTest -> MatchQ,
  TestID -> "PacletDirectoryLoad"
]

VerificationTest[
  Needs["ArnoudBuzing`PhysicsModelLink`"],
  Null,
  TestID -> "NeedsPhysicsModelLink"
]

VerificationTest[
  StringQ[RapierVersion[]],
  True,
  TestID -> "RapierVersionCall"
]
