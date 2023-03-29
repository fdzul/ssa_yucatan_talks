# step 1. define the path for the historic dataset ####
path_vect <- "/Users/fdzul/Library/CloudStorage/OneDrive-Personal/datasets/CENAPRECE/2023/31_yucatan"
path_coord <- paste(path_vect, "DescargaOvitrampasMesFco.txt", sep = "/")


library(sf)
rgeomex::extract_locality(cve_edo = "31", locality = "Merida")

# Step 2. run the spde model ####
x <- deneggs::eggs_hotspots_week(cve_mpo = "050",
                                 cve_edo = "31",
                                 year = "2023",
                                 hist_dataset = FALSE,
                                 locality = "Merida",
                                 path_vect = path_vect,
                                 path_coord = path_coord,
                                 integration_strategy = "eb",
                                 aproximation_method = "gaussian",
                                 fam_distribution = "zeroinflatednbinomial1",
                                 kvalue = 40,
                                 plot = FALSE,
                                 palette.viridis = "viridis",
                                 cell.size = 500,
                                 alpha.value = .99)

# Step 3. Visualize the hotspots intensity #### 
deneggs::eggs_hotspots_intensity_map(spde_betas = x$betas,
                                     years = 2023,
                                     locality = "Mérida",
                                     cve_ent = "31",
                                     palette = rcartocolor::carto_pal,
                                     name = "SunsetDark")

ggplot2::ggsave("talks/reunion_interstatal/eggs_hotspots_merida.jpg",
                dpi = 300)


