# ==============================================================================
# Script 05: Testes de Homogeneidade (Pettitt, Buishand e SNHT)
# Projeto: Monitoramento Indicadores Climáticos - TPO e TB
# Laboratório de Arqueologia e Geociências (LAG)
# ==============================================================================

library(tidyverse)
library(trend)

data_clean <- read_csv("data/processed/dados_limpos.csv")

temp_series <- data_clean %>%
  group_by(data = as.Date(datetime)) %>%
  summarise(temp_media = mean(temperatura, na.rm = TRUE)) %>%
  pull(temp_media)

# Teste de Pettitt
print(pettitt.test(temp_series))

# Teste de Buishand
print(buishand.test(temp_series))

# Teste SNHT
print(snht.test(temp_series))


