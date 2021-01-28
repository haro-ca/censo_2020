library(tidyverse)

# Lectura ====
censo <- data.table::fread("data/raw/ITER_NALCSV20.csv") %>% 
            tibble() %>% 
            janitor::clean_names()

# Limpieza =====
censo_subset <- censo %>% 
    select(nom_ent, nom_mun, nom_loc, pobtot, pobfem, pobmas)

tot_pob_entidad <- censo_subset %>% 
    mutate(nom_loc = str_to_lower(nom_loc)) %>% 
    filter(nom_loc == "total de la entidad") %>% 
    select(nom_ent, pobtot)

# Escritura ====
tot_pob_entidad %>% 
    summarise(total = sum(pobtot)) %>% 
    write_csv("data/interim/tot_pob_entidad.csv")











