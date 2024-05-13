$csv = Import-Csv "https://github.com/NadijaK/Tiago/blob/main/goodreads_cleaned.csv"
$i = 1

foreach ($entry in $csv) {
Write-Host "The name $($entry.authorName) and the average rating $($entry.average_rating) is the $i the entry in the CSV."
$i++
}