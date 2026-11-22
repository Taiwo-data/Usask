# Axivity AX3 CWA to CSV Converter

## Overview

This project provides an R script for reading raw accelerometer data from Axivity AX3 devices (`.cwa` files) and exporting the extracted data into CSV format.

## Requirements

- R
- GGIRread package

## Usage

1. Clone or download this repository.
2. Open the project in RStudio.
3. Set the working directory to the repository's root folder.
4. Run the conversion script:

```r
source("scripts/convert_ax3_cwa_to_csv.R")
```

5. When the file selection window opens, select the Axivity `.cwa` file.
6. The extracted accelerometer data will be exported as a CSV file in the `output` folder.

## Output

The script generates a CSV file using the original filename, followed by `_raw_acc.csv`.

The output folder is created automatically if it does not already exist.

## Time Zone

America/Regina (Saskatchewan).

## Notes

Raw `.cwa` files and generated CSV files are excluded from Git tracking through `.gitignore` to protect participant data and avoid uploading large datasets.
