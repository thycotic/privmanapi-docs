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

#### Creating Windows Policy ####
function create_win_policy{
	### Policy Details to be created ##########
	$global:policy_desc       = "Test Windows API Policy"
	$global:policy_os_type    = "Win" 
	$global:timestamp         = "{0:G}" -f (get-date)
	$global:policy_name       = "testwinpolicy $global:timestamp"
	
	#### Passing Policy Inputs as Body Content #########
    $global:api_policy_content_as_body = '{ "Name": "'+$global:policy_name+'", "Description": "'+$global:policy_desc+'", "OS": "'+$global:policy_os_type+'" }'
	
	#### API Create Policy URL #####
	$global:policy_url = "$application/services/api/v1/policies/new"
	
	#### Creating Windows Policy using Post Method #####
	$global:create_policy_result      = Invoke-WebRequest -Uri $global:policy_url -Headers $Headers -ContentType "application/json" -Body $global:api_policy_content_as_body -Method Post
	$global:create_policy_result_json = $global:create_policy_result | ConvertFrom-Json
	$global:created_policy_id         = $global:create_policy_result_json.Result
	Write-Host ""
	Write-Host "----- API Results of Created policy ------"
	$global:positive_case_status = $global:create_policy_result_json.Code
    $global:positive_case_desc   = $global:create_policy_result_json.Status
	$global:positive_case_msg   = $global:create_policy_result_json.Messages
	Write-Host -BackgroundColor:Black -ForegroundColor:Green "Created Policy Name is             : $global:policy_name"
	Write-Host -BackgroundColor:Black -ForegroundColor:Green "Created Policy ID is               : $global:created_policy_id"
	Write-Host -BackgroundColor:Black -ForegroundColor:Green "API Status code is shown as        : $global:positive_case_status" 
	Write-Host -BackgroundColor:Black -ForegroundColor:Green "API Status Description is shown as : $global:positive_case_desc"
	Write-Host -BackgroundColor:Black -ForegroundColor:Green "API Message is shown as            : $global:positive_case_msg"
	Write-Host ""
	Write-Host "----- API Response Shown as per Rest API -----" 
	$global:create_policy_result
}

#### Calling API Functions and Error Validation ##############
	try {
		### Windows Policy Creation with Filters, Actions, targets ###
		create_win_policy
	}
	catch [System.Net.WebException],[System.IO.IOException] {
		Write-Host "" 
		Write-Host "-----------------------" 
        Write-Host "----- API User Error Details/ Exception -----" 
		$negative_case_status = [int]$_.Exception.Response.StatusCode
        $negative_case_desc   = $_.Exception.Response.StatusDescription
        Write-Host -BackgroundColor:Black -ForegroundColor:Red "API Status code is shown as        : $negative_case_status" 
		Write-Host -BackgroundColor:Black -ForegroundColor:Red "API Status Description is shown as : $negative_case_desc"
		Write-Host "Unable to connect API User"
		Write-Host "" 		
        Write-Host "----- API Response Shown as per Rest API -----"
		Write-Host  $_.Exception
		Write-Host  $_.Exception.Response.RawContent
        $result = $_.Exception.Response.GetResponseStream()
        $reader = New-Object System.IO.StreamReader($result)
        $reader.BaseStream.Position = 0
        $reader.DiscardBufferedData()
        $responseBody = $reader.ReadToEnd()
        Write-Host $responseBody 
        Write-Host  "##vso[task.LogIssue type=error;]This is the error"  
        exit 1
    }
	catch {
        Write-Host "" 
		Write-Host "-----------------------" 
        Write-Host "----- API User Error Details/ Exception -----" 
		Write-Host "An error occurred that could not be resolved."
		$negative_case_status = [int]$_.Exception.Response.StatusCode
        $negative_case_desc   = $_.Exception.Response.StatusDescription
        Write-Host -BackgroundColor:Black -ForegroundColor:Red "API Status code is shown as        : $negative_case_status" 
		Write-Host -BackgroundColor:Black -ForegroundColor:Red "API Status Description is shown as : $negative_case_desc"
		Write-Host "Unable to connect API User"
		Write-Host "" 		
        Write-Host "----- API Response Shown as per Rest API -----"
		Write-Host  $_.Exception
		Write-Host  $_.Exception.Response.RawContent
        $result = $_.Exception.Response.GetResponseStream()
        $reader = New-Object System.IO.StreamReader($result)
        $reader.BaseStream.Position = 0
        $reader.DiscardBufferedData()
        $responseBody = $reader.ReadToEnd()
        Write-Host $responseBody 
        Write-Host  "##vso[task.LogIssue type=error;]This is the error"  
        exit 1
	}
