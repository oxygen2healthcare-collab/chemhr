@echo off
REM ==== ChemOps one-click deploy ====
REM Keep this file inside the chemops-firebase-deploy folder.
REM After dropping a new index.html into the "public" folder, just double-click this file.

cd /d "%~dp0"

echo.
echo === Staging changes ===
git add .

echo.
echo === Committing ===
git commit -m "Update ChemOps %date% %time%"
if errorlevel 1 (
  echo.
  echo No changes to deploy ^(did you replace public\index.html?^).
  echo.
  pause
  exit /b
)

echo.
echo === Pushing to GitHub ^(auto-deploys via Actions^) ===
git push

echo.
echo ============================================
echo   Done. GitHub Actions is now deploying.
echo   Check: https://github.com/oxygen2healthcare-collab/chemhr/actions
echo   Live site: https://chemops-86fe2.web.app
echo   ^(hard-refresh with Ctrl+Shift+R once it's green^)
echo ============================================
echo.
pause
