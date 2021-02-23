#Define application url
$application = "https://mpt-web01.muppets.local/TMS/"

# Define API User credentials
$username = "replace with your API Client User ID"; # Read-Host -Prompt "Enter API UserName"
$password = "replace with your API Client User secret"; # Read-Host -Prompt "Enter API User Password"

# Passing API User credentials as Body Content
$body = '{"Password": "'+$password+'", "UserName": "'+$username+'"}'

# Get token
$r = Invoke-WebRequest "$application/services/api/logon/token" -Method Post -Body $body -ContentType "application/json"
$token = $r.Content

# Return token
$token