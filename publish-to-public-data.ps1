# Publish deals.json from private admin -> public oneshopping-data Pages
$ErrorActionPreference = "Stop"
$adminRoot = $PSScriptRoot
$dataRoot = Join-Path (Split-Path $adminRoot -Parent) "oneshopping-data"
if (-not (Test-Path $dataRoot)) {
  git clone https://github.com/updatoapp/oneshopping-data.git $dataRoot
}
Copy-Item -Force (Join-Path $adminRoot "deals.json") (Join-Path $dataRoot "deals.json")
# also sync legal pages if present
foreach ($f in @("privacy-policy.html","terms-of-service.html","support.html","styles.css")) {
  if (Test-Path (Join-Path $adminRoot $f)) {
    Copy-Item -Force (Join-Path $adminRoot $f) (Join-Path $dataRoot $f)
  }
}
Push-Location $dataRoot
git add deals.json privacy-policy.html terms-of-service.html support.html styles.css 2>$null
git -c user.email="updatoapp@gmail.com" -c user.name="1Shopping" commit -m "Update deals/legal from admin" 2>$null
git push origin main
Pop-Location
Write-Host "Published: https://updatoapp.github.io/oneshopping-data/deals.json"
