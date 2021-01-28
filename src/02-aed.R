library(tidyverse)

# Lectura ====
pob_entidad <- read_csv("data/interim/tot_pob_entidad.csv")

# AED

factor(c("a", "b", "c"), levels = c("c", "b", "a"))

# vector un pipe
pob_entidad %>% 
    arrange(desc(pobtot)) %>%
    .$nom_ent

# vector con asignación
vec_interim <- pob_entidad %>% 
    arrange(desc(pobtot)) 
vec_interim$nom_ent

# fct_reorder 
pob_entidad %>% 
    mutate(pobtot = pobtot / 1e6, 
           nom_ent_factor = fct_reorder(nom_ent, pobtot)) %>% 
    ggplot() + 
    geom_bar(aes(y = nom_ent_factor, x = pobtot), stat = "identity", 
             fill = "red", 
             color = "black", 
             alpha = 0.5) +
    labs(title = "El estado de mayor población es el Edo. de México", 
         subtitle = "Habitantes por estado en millones", 
         x = NULL, 
         y = NULL) +
    scale_x_continuous() +
    ggthemes::theme_clean() +
    ggsave("figs/pob_estatal.png", height = 7, width = 11)





