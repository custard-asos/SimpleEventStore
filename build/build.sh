dotnet build ../src/SimpleEventStore/SimpleEventStore.sln -c Release

dotnet test ../src/SimpleEventStore/SimpleEventStore.Tests/SimpleEventStore.Tests.csproj -c Release --no-build
dotnet test ../src/SimpleEventStore/SimpleEventStore.AzureDocumentDb.Tests/SimpleEventStore.AzureDocumentDb.Tests.csproj

dotnet pack ../src/SimpleEventStore/SimpleEventStore/SimpleEventStore.csproj -c Release -o /packages --no-build
dotnet pack ../src/SimpleEventStore/SimpleEventStore.AzureDocumentDb/SimpleEventStore.AzureDocumentDb.csproj -c Release -o /packages --no-build

dotnet nuget push /packages/*.nupkg -s $NUGET_SOURCE -k $NUGET_KEY