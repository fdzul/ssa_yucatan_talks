

# load the dengue cases hotspots
load("~/Library/CloudStorage/Dropbox/hotspots_2022/8.RData/cases_hotspots_agebs19.RData")
library(magrittr)
cases_hotspots_agebs19 |>
    sf::st_make_valid() |>
    dplyr::filter(loc == "Ticul") |>
denhotspots::staticmap_intensity(pal = rcartocolor::carto_pal,
                                 pal_name = TRUE,
                                 name = "OrYel",
                                 breaks = 1,
                                 dir_pal = -1,
                                 x_leg = 0.5,
                                 y_leg = 0.1,
                                 ageb = TRUE)

#
load("~/Library/CloudStorage/OneDrive-Personal/proyects/hotspots_eggs/8.RData/31_yucatan/betas/31_yucatan_zinb1_betas.RData")
source("~/Library/CloudStorage/Dropbox/r_developments/r_new_functions/3.Functions/eggs_hotspots_intensity_map_year.R")

betas_31_yucatan |>
    dplyr::filter(year == 2019) |>
eggs_hotspots_intensity_map_year(
                                 locality = "Merida",
                                 cve_ent = "31",
                                 palette = rcartocolor::carto_pal,
                                 name = "SunsetDark")
betas_31_yucatan |>
    dplyr::filter(year == 2019) |>
    intensity_eggs(locality = "Valladolid",
                    cve_ent = "31",
                    palette = rcartocolor::carto_pal,
                    name = "SunsetDark")

#########
# load the dengue cases hotspots
load("~/Library/CloudStorage/Dropbox/hotspots_2022/8.RData/cases_hotspots_agebs19.RData")
hotspots <- cases_hotspots_agebs19 |>
    sf::st_make_valid()
# load the betas 
load("~/Library/CloudStorage/OneDrive-Personal/proyects/hotspots_eggs/8.RData/31_yucatan/betas/31_yucatan_zinb1_betas.RData")

###
source("~/Library/CloudStorage/Dropbox/r_developments/r_new_functions/3.Functions/risk_agebs.R")
source("~/Library/CloudStorage/Dropbox/r_developments/r_new_functions/3.Functions/risk_map.R")
risk <- risk_agebs(spde_model = betas_31_yucatan,
                   hotspots = cases_hotspots_agebs19,
                   locality = "Ticul",
                   cve_ent = "31",
                   intensity_perc = 25)
risk_map(risk = risk, staticmap = TRUE) 
