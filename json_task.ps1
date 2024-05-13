$json = Get-Content "tv_shows_and_movies_sample.json" | ConvertFrom-Json
#$additionalJson = Get-Content "output_tv_shows_and_movies_sample.json" | ConvertFrom-Json
$csv_movies = Import-Csv "movies.csv"

# Add logic here to remove properties, add properties, and combine as needed.

foreach ($item in $json) {
        $item.PSObject.Properties.Remove("scraped_at")
        }
#$json | Export-csv modified_json.csv


$combinedData = foreach ($csvEntry in $csv_movies) {
    $titleParam = $csvEntry.Title
    $jsonEntry = $json | Where-Object { $_.name -eq $titleParam }
    
    if ($jsonEntry) {
        $imdbValue = $jsonEntry.imdb_rating
    } else {
        $imdbValue = ""
    }
    
    $newEntry = [PSCustomObject]@{
        Id = $csvEntry.Id
        Title = $csvEntry.Title
        Release_date = $csvEntry.release_date
        imdb_rating = $imdbValue
    }
    
    # Output the combined entry
    $newEntry
}

$combinedData | Export-Csv "output.csv" -NoTypeInformation