$ErrorActionPreference= 'silentlycontinue'
$token = Read-Host "Please enter your discord token"
$house = Read-Host "Enter the number corresponding to the house that you wish to join.`r`n[1]: Bravery`r`n[2]: Brilliance`r`n[3]: Balance`r`n`r`nInput"
try{
	$response = Invoke-WebRequest -Headers @{"Authorization" = "$token"} -Method POST -Body (@{"house_id"=$house;}|ConvertTo-Json) -Uri https://discord.com/api/v9/hypesquad/online -ContentType application/json
	if ($response.StatusCode -eq 204) {
		Write-Host Success!
	}
} catch {
	Write-Host Error: $_.Exception.Response.StatusDescription
}