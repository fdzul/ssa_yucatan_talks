pyramid <- function(x, year){
    x |>
        dplyr::mutate(age_class = cut(IDE_EDA_ANO,
                                      c(0,1,5,10, 15, 20, 25, 30,
                                        35, 40, 45, 50, 55, 60,65, 
                                        max(IDE_EDA_ANO)),
                                      labels = c("<1", "1-4", "5-9", "10-14",
                                                 "15-19", "20-24", "25-29",
                                                 "30-34", "35-39", "40-44",
                                                 "45-49", "50-54", "55-59",
                                                 "60-64", ">65"),
                                      right = FALSE,
                                      include.lowest = TRUE)) |>
        dplyr::filter(ESTATUS_CASO %in% c(2)) |>
        dplyr::filter(ANO %in% c(year)) |>
        dplyr::filter(DES_EDO_RES %in% c("YUCATAN")) |>
        dplyr::filter(DES_DIAG_FINAL %in% c("DENGUE CON SIGNOS DE ALARMA",
                                            "DENGUE NO GRAVE",
                                            "DENGUE GRAVE")) |>
        dplyr::mutate(IDE_SEX = ifelse(IDE_SEX == 1, 
                                       "Masculino", 
                                       "Femenino")) |>
        dplyr::group_by(ANO, age_class, IDE_SEX) |>
        dplyr::summarise(count = dplyr::n(), .groups = "drop") |>
        apyramid::age_pyramid(age_group = "age_class",
                              split_by = IDE_SEX,
                              show_midpoint = FALSE,
                              proportional = FALSE,
                              pal =  c("#E01E5A", "#2EB67D"),
                              count = count) +
        ggplot2::facet_wrap(facets = "ANO", scales = "free") +
        ggplot2::labs(x = "Grupos Etarios",
                      y = "Número de Casos") +
        ggplot2::theme(legend.direction = "horizontal",
                       legend.position = "none",
                       legend.title = ggplot2::element_text(size = 2),
                       axis.text.x = ggplot2::element_text(size = 6),
                       axis.text.y = ggplot2::element_text(size = 6))
}