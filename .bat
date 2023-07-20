@echo off
setlocal enabledelayedexpansion

REM Set the output directory and file path
set "output_dir=C:\Users\R\Downloads\cic-processing"
set "file_path=C:\Users\R\Downloads\cic-processing\file.csv"

REM Get the commit hashes
for /f "delims=" %%i in ('git log --pretty=format:"%%h" -- %file_path%') do (
    set "commit=%%i"

    REM Checkout the commit
    git checkout !commit!

    REM Copy the CSV file to the output directory with the commit hash in the filename
    copy "%file_path%" "%output_dir%\!commit!_file.csv"
)

REM Return to the main branch when done
git checkout main

endlocal
