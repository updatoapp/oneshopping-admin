# 1Shopping Admin (PRIVATE)

Only GitHub collaborators can open this repo.

## Open the admin panel
1. Clone/pull this repo on your PC  
2. Open `deals-admin.html` in Chrome (double-click)  
3. Edit banners → **Download deals.json** → replace `deals.json` in this folder  
4. Commit & push this private repo  
5. Publish to the app:
   ```powershell
   .\publish-to-public-data.ps1
   ```

That updates the public Pages file the app reads:  
https://updatoapp.github.io/oneshopping-data/deals.json

## Why two repos?
GitHub free plan cannot host Pages on a **private** repo.  
So:
- **oneshopping-admin** (private) = admin panel  
- **oneshopping-data** (public) = JSON/legal the app loads  
