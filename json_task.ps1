$json = Get-Content "data.json" | ConvertFrom-Json
$additionalJson = Get-Content "additional_data.json" | ConvertFrom-Json
# Add logic here to remove properties, add properties, and combine as needed.


$combinedData | Export-Csv "output.csv" -NoTypeInformation