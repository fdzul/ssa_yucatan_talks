
# Step 1. load the dengue dataset ####
load("~/OneDrive/automatic_read_sinave/8.RData/den/den2008_2022.RData")

# Step 2. load the function #####
source("~/Library/CloudStorage/Dropbox/r_developments/r_talks/2023/ssa_yucatan_talks/talks/vector_control_schools/piramyd_plot.R")

pyramid(x = den2016_2022,
        year = "2022")
