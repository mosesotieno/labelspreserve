## code to prepare `DATASET` dataset goes here

library(readxl)
library(dplyr)
library(stringr)
library(magrittr)


sample_data <- read_excel("inst/exdata/sample_data.xlsx",
                          na = "---")



usethis::use_data(sample_data, overwrite = TRUE,
                  compress = "xz")


