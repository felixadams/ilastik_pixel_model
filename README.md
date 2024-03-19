# Run photo imaging - pixel classification

this takes a folder of brightfield images and then performs pixel classification using a pretrained model from ILAStik. 

our fine tuned model is present in the project. 

for this to work it requires us to download ilastik. 
The windows veriosn for this link is below. This is the version we have used: 

https://files.ilastik.org/ilastik-1.4.0.post1-win64.exe

please download. It will likely suggest to download it to program files. That is where mine is so thats fine, probably preferable.

You will be able to go to the program when downloaded by going to windows powershell and then goign to the directory PS C:\Program Files\ilastik-1.4.0.post1>.

For the batch file to work, you will need to edit it so that it contains the correct "pointers" for you directories.

For example below is what I have for mine, and the one I've posted here. 



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




