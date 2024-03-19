# Run Photo Imaging - Pixel Classification

This script processes a folder of brightfield images and performs pixel classification using a pretrained model from ILAStik. Our fine-tuned model is included in the project.

## Dependencies

To use this script, you need to download ILAStik. Here's the link to download the Windows version: [ILAStik 1.4.0.post1 (Windows 64-bit)](https://files.ilastik.org/ilastik-1.4.0.post1-win64.exe).

## Setup

**Download ILAStik**: Download and install ILAStik from the link provided above. The installation directory is typically `C:\Program Files\ilastik-1.4.0.post1`.


you will need to edit the .bat file. you will need to do this in notepad. You will need to change the directories so that they point to yours (where you have downloaded the given folders). You should then be able to run it and then it will automate the rest. 

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


## Run Script

Once you've edited the batch file with the correct file paths, save it and run the batch file. It will process each image in the input directory and generate output files in HDF5 format in the output directory.

## Notes

- Ensure your project file (`project.ilp`) contains the correct settings for pixel classification (the one provided will do).
- The script will create a log file (`ilastik_log.txt`) to track any potential errors.
- Feel free to reach out if you encounter any issues or have questions: felix.adams1@gmail.com

## Once finished go to the confluence calculator!!!!
