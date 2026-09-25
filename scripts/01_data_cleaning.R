# ==============================================================================
# Script 01: Limpeza e Padronização dos Dados
# Projeto: Monitoramento Indicadores Climáticos - TPO e TB
# Laboratório de Arqueologia e Geociências (LAG)
# ==============================================================================

library(tidyverse)
library(lubridate)

# Leitura dos dados
data_raw <- read_csv("data/raw/dados_clima_tpo_tb.csv")

# Tratamento preliminar
data_clean <- data_raw %>%
  mutate(datetime = ymd_hms(datetime)) %>%
  filter(!is.na(datetime)) %>%
  arrange(datetime)

# Exportação dos dados processados
write_csv(data_clean, "data/processed/dados_limpos.csv")
message("Dados processados e salvos em data/processed/dados_limpos.csv")
