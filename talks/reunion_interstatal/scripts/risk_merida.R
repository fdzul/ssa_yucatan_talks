

# load the dengue cases hotspots
load("~/Library/CloudStorage/Dropbox/hotspots_2022/8.RData/cases_hotspots_agebs19.RData")
hotspots <- cases_hotspots_agebs19 |>
    sf::st_make_valid() |>
    dplyr::filter()
# Step  load the hotspots map ####
source("~/Library/CloudStorage/Dropbox/r_developments/r_new_functions/3.Functions/hotspots_map.R")
hotspots_map(cve_ent = "31",
             locality = "Merida",
             hotspots = cases_hotspots_agebs19,
             static_map = FALSE)

library(magrittr)
denhotspots::staticmap_intensity(x = hotspots,
                                 pal = rcartocolor::carto_pal,
                                 pal_name = TRUE,
                                 name = "OrYel",
                                 breaks = 1,
                                 dir_pal = -1,
                                 x_leg = 0.5,
                                 y_leg = 0.1,
                                 ageb = TRUE)
