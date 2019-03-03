nuget install xunit.runner.console -OutputDirectory packages -Version 2.4.1

nuget install OpenCover -OutputDirectory packages -Version 4.7.922

dotnet tool install coveralls.net --tool-path packages

.\packages\OpenCover.4.7.922\tools\OpenCover.Console.exe -register:user -target:dotnet.exe "-targetargs:"".\packages\xunit.runner.console.2.4.1\tools\netcoreapp2.0\xunit.console.dll"" "".\tests\UnitTests\bin\Release\netcoreapp2.0\ResultCore.UnitTests.dll"" -noshadow -appveyor" -filter:"+[ResultCore]* -[ResultCore.UnitTests]*" -oldStyle -output:coverage.xml

.\packages\csmacnz.coveralls.exe --opencover -i coverage.xml --repoToken $env:COVERALLS_REPO_TOKEN --commitId $env:APPVEYOR_REPO_COMMIT --commitBranch $env:APPVEYOR_REPO_BRANCH --commitAuthor $env:APPVEYOR_REPO_COMMIT_AUTHOR --commitEmail $env:APPVEYOR_REPO_COMMIT_AUTHOR_EMAIL --commitMessage $env:APPVEYOR_REPO_COMMIT_MESSAGE --jobId $env:APPVEYOR_JOB_ID