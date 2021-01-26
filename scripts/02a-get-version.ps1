try 
{
	$version_r = Invoke-RestMethod "$application/services/api/v1/version/current" -Method Get -ContentType "application/json"
    $version = $version_r.Result
    Write-Host "Current Version : $version"
}
catch 
{
    Write-Host "----- API User Error Details -----" 
    Write-Host -BackgroundColor:Black -ForegroundColor:Red "API Status Description is shown as : $negative_case_desc"
    Write-Host "----- Exception -----"
    Write-Host  $_.Exception
    Write-Host  $_.Exception.Response.RawContent
    Write-Host "----- Exception Details -----"
    $result = $_.Exception.Response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($result)
    $reader.BaseStream.Position = 0
    $reader.DiscardBufferedData()
    $responseBody = $reader.ReadToEnd() | ConvertFrom-Json
    Write-Host $responseBody 
}