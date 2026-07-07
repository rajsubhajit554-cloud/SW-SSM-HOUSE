@echo off
:: This script automates staging, committing, and pushing changes to GitHub.
:: Created by Antigravity AI Coding Assistant

title Git Repository Auto-Update Tool
color 0B
cls

echo =====================================================================
echo                     GIT REPOSITORY QUICK UPDATE
echo =====================================================================
echo.

:: Check if git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    color 0C
    echo [ERROR] Git is not installed or not in your system PATH.
    echo Please install Git and try again.
    echo.
    pause
    exit /b
)

:: Show current repository status
echo Current Git Status:
echo ---------------------------------------------------------------------
git status -s
echo ---------------------------------------------------------------------
echo.

:: Ask the user for confirmation
set /p confirm="Do you want to stage and commit all changes? (Y/N, default Y): "
if /i "%confirm%"=="N" (
    echo.
    echo Update cancelled.
    pause
    exit /b
)

:: Prompt for commit message
echo.
set /p commit_msg="Enter commit message (or press Enter for 'Auto Update'): "
if "%commit_msg%"=="" set commit_msg=Auto Update

echo.
echo [1/3] Staging all files...
git add .

echo.
echo [2/3] Committing changes...
git commit -m "%commit_msg%"

echo.
echo [3/3] Pushing changes to GitHub (main branch)...
git push origin main

echo.
if %errorlevel% equ 0 (
    color 0A
    echo =====================================================================
    echo SUCCESS: Repository successfully updated and pushed to GitHub!
    echo =====================================================================
) else (
    color 0C
    echo =====================================================================
    echo ERROR: Something went wrong during the push process.
    echo Please check your internet connection or git permissions.
    echo =====================================================================
)
echo.
pause
