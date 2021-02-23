#Define application url
$application = "https://mpt-web01.muppets.local/TMS/"

# Define API User credentials
$username = "replace with your API Client User ID"; # Read-Host -Prompt "Enter API UserName"
$password = "replace with your API Client User secret"; # Read-Host -Prompt "Enter API User Password"

# Passing API User credentials as Body Content
$body = '{"Password": "'+$password+'", "UserName": "'+$username+'"}'

Function Get-Token
{
	try 
    {
		$token = Invoke-RestMethod "$application/services/api/logon/token" -Method Post -Body $body -ContentType "application/json"
        Write-Host "----- API User Logged on Successfully -----"
        Write-Host -BackgroundColor:Black -ForegroundColor:Green "API Status Description is shown as : $positive_case_desc" 
        Write-Host "----- Token -----" 
        $token
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
}

Get-Token