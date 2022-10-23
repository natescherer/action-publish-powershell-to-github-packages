function Copy-FilesToModuleDirectory {
    [CmdletBinding()]
    param(
        [parameter(Mandatory = $true)]
        [string]$Path
    )
    # PowerShellGet currently requires the module be in a folder named the same as the manifest

    $OutputPath = ""

    Write-Host "Creating directory for module publishing..."

    $ManifestName = Split-Path -Path $Path -LeafBase
    $ManifestDir = Split-Path -Path $Path -Parent

    $OutputPath = "$env:RUNNER_TEMP\$ManifestName"

    Write-Host "Copying files from $ManifestDir to $OutputPath..."
    New-Item -Path $OutputPath -Type Directory | Out-Null
    Copy-Item -Path "$ManifestDir\*" -Destination $OutputPath -Recurse

    $OutputPath
}