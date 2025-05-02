## code to prepare `toy_dataset` dataset goes here
toy_dataset <- read.csv("data-raw/toydata.csv")
usethis::use_data(toy_dataset, overwrite = TRUE)

checkhelper::use_data_doc("toy_dataset")
