# ==============================================================================
# Script 04: Correlação de Pearson e Detecção de Anomalias de Covariação
# Projeto: Monitoramento Indicadores Climáticos - TPO e TB
# Laboratório de Arqueologia e Geociências (LAG)
# ==============================================================================

library(tidyverse)

data_clean <- read_csv("data/processed/dados_limpos.csv")

# Correlação de Pearson Geral
cor_overall <- cor.test(data_clean$temperatura, data_clean$umidade, method = "pearson")
print(cor_overall)

# Correlação por Ano
cor_by_year <- data_clean %>%
  mutate(ano = year(datetime)) %>%
  group_by(ano) %>%
  summarise(
    r = cor(temperatura, umidade, use = "complete.obs"),
    p_valor = cor.test(temperatura, umidade)$p.value
  )

print(cor_by_year)

# Detecção de Anomalias de Covariação (Subida Simultânea de Temp e UR)
anomalias <- data_clean %>%
  mutate(
    diff_temp = temperatura - lag(temperatura),
    diff_ur = umidade - lag(umidade),
    anomalia_covariacao = diff_temp > 0 & diff_ur > 0
  ) %>%
  filter(anomalia_covariacao == TRUE)

message(paste("Total de momentos com anomalia de covariação:", nrow(anomalias)))
