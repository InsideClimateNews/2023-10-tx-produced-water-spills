# set working directory to the folder containing this script (requires script to be run in RStudio)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# required packages
library(tidyverse)

# load data
tx_spills_central_prod_water <- read_csv("data/central_cleaned.csv")
tx_spills_district_prod_water <- read_csv("data/district_cleaned.csv")

# anti joins to find spills potentially only present in either central or district logs for further scrunity
central_not_district <- anti_join(tx_spills_central_prod_water, tx_spills_district_prod_water, by = c("district_edit","rrc_job_number"))
write_csv(central_not_district,"central_not_district.csv", na = "")


district_not_central <- anti_join(tx_spills_district_prod_water, tx_spills_central_prod_water, by = c("district_edit","rrc_job_number"))
write_csv(district_not_central,"district_not_central.csv", na = "")