
# ============================================================
# Axivity AX3 CWA to CSV Converter
# Purpose: Read an Axivity .cwa file into R and export to CSV
# ============================================================

# 1. Install GGIRread if it is not already installed
if (!requireNamespace("GGIRread", quietly = TRUE)) {
  install.packages("GGIRread")
}

# 2. Load the package
library(GGIRread)

# 3. Select the Axivity CWA file
cwa_file <- file.choose()

# Check that the selected file exists
if (!file.exists(cwa_file)) {
  stop("The selected CWA file does not exist.")
}

# Check that the file has a .cwa extension
if (!grepl("\\.cwa$", cwa_file, ignore.case = TRUE)) {
  stop("Please select an Axivity .cwa file.")
}

# 4. Read the complete CWA recording into R
cwa_data <- GGIRread::readAxivity(
  filename = cwa_file,
  start = 0,
  end = Inf,
  desiredtz = "America/Regina",
  progressBar = TRUE
)

# 5. Extract the accelerometer data
acc_df <- cwa_data$data

# Check that data were successfully extracted
if (is.null(acc_df) || nrow(acc_df) == 0) {
  stop("No accelerometer data were extracted from the CWA file.")
}

# 6. Create an output folder in the project directory
output_dir <- file.path(getwd(), "output")

if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

# 7. Generate the CSV filename
file_name <- tools::file_path_sans_ext(basename(cwa_file))

csv_file <- file.path(
  output_dir,
  paste0(file_name, "_raw_acc.csv")
)

# 8. Export the data to CSV
write.csv(
  acc_df,
  file = csv_file,
  row.names = FALSE
)

# 9. Confirm successful export
cat("\nCWA processing completed successfully.\n")
cat("Input file:", cwa_file, "\n")
cat("Rows exported:", nrow(acc_df), "\n")
cat("Columns exported:", ncol(acc_df), "\n")
cat("CSV saved to:", normalizePath(csv_file), "\n")


setwd("C:/projects/cwa-ggir-pipeline")

source("scripts/convert_ax3_cwa_to_csv.R")

