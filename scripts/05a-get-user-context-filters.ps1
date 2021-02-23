## Define application url
$application = "https://mpt-web01.muppets.local/TMS/"

## Define API User credentials
$username = "replace with your API Client User ID"; # Read-Host -Prompt "Enter API UserName"
$password = "replace with your API Client User secret"; # Read-Host -Prompt "Enter API User Password"

## Passing API User credentials as Body Content
$body = '{"Password": "'+$password+'", "UserName": "'+$username+'"}'

## Get token
try 
{
    $token = Invoke-RestMethod "$application/services/api/logon/token" -Method Post -Body $body -ContentType "application/json"
  #  Write-Host "----- API User Logged on Successfully -----"
  #  Write-Host -BackgroundColor:Black -ForegroundColor:Green "API Status Description is shown as : $positive_case_desc" 
  #  Write-Host "----- Token -----" 
  #  $token
}
catch 
{
    Write-Host "----- API User Auth Error Details -----" 
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

## Pass API Response as Bearer Token
$Headers =@{Authorization='Bearer '+$token} 

## Get All Filters
try 
{
    $all_filters_r = Invoke-RestMethod "$application/services/api/v1/filters/getall" -Method Get -Headers $Headers -ContentType "application/json"
  #  $all_filters_r
    Write-Host "----- User Contect Filters -----" 
    $all_filters = $all_filters_r.Result
    $all_user_context_filters = $all_filters | Where-Object Type -EQ "User Context Filter"
    $all_user_context_filters
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
