
$versionFile = "version.txt"

if (Test-Path $versionFile) {
    $version = [int](Get-Content $versionFile)
} else {
    $version = 0
}

$version++
Set-Content $versionFile $version

$tag = "1.0.$version"

Write-Host "Building Microservice version $tag"

mvn clean package "-Drevision=$tag"

if ($LASTEXITCODE -ne 0) {
    Write-Host "Maven build failed."
    exit 1
}

docker build -t "my-microservice:$tag" .
if ($LASTEXITCODE -ne 0) {
    Write-Host "Docker build failed."
    exit 1
}

Write-Host "Successfully built version $tag"
