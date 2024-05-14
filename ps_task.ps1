$resources = Get-AzResource
$resourceByType = New-Object PSObject
$resourceByType | Add-Member -MemberType NoteProperty -Name "ResourceTypes" -Value @{} -Force
foreach($resource in $resources){
        if($resourceByType.ResourceTypes.keys -notcontains $resource.ResourceType){
                $resourceByType.ResourceTypes.Add($resource.ResourceType, @())
        }
        $resourceByType.ResourceTypes[$resource.ResourceType] += $resource.Name
}
$resourceByTypeJson = $resourceByType | ConvertTo-Json -Depth 10
New-Item -Name test.json -Path .\_PowershellPlayground\ -Value $resourceByTypeJson -Force