@echo off
set ILASTIK_DIR="C:\Program Files\ilastik-1.4.0.post1"
set PROJECT_FILE="C:\Users\felix\MyProject.ilp"
set INPUT_DIR="C:\Users\felix\Documents\confluence_measure\input_photos"
set OUTPUT_DIR="C:\Users\felix\Documents\confluence_measure\output_photos"

REM Create output directory if it doesn't exist
if not exist %OUTPUT_DIR% mkdir %OUTPUT_DIR%

REM Loop through each file in the input directory
for %%f in ("%INPUT_DIR%\*.jpg") do (
    echo Processing %%~nxf...
    %ILASTIK_DIR%\ilastik.exe --headless --project %PROJECT_FILE% "%%f" --output_format hdf5 --output_filename_format "%OUTPUT_DIR%\%%~nf_probabilities" >> "%OUTPUT_DIR%\ilastik_log.txt"
)

echo All photos processed.
pause
