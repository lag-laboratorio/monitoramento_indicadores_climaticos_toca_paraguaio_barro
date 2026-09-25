# ==============================================================================
# Script 03: Análise de Sazonalidade Multiescala (Lomb-Scargle)
# Projeto: Monitoramento Indicadores Climáticos - TPO e TB
# Laboratório de Arqueologia e Geociências (LAG)
# ==============================================================================

library(tidyverse)
library(lomb)

data_clean <- read_csv("data/processed/dados_limpos.csv")

# Aplicação do Periodograma de Lomb-Scargle para dados com gaps
time_hours <- as.numeric(difftime(data_clean$datetime, min(data_clean$datetime), units = "hours"))

# Ciclo Anual
lsp_annual <- lsp(data_clean$temperatura, times = time_hours, from = 100, to = 10000, ofac = 4)

# Ciclo Diário (24h)
lsp_daily <- lsp(data_clean$temperatura, times = time_hours, from = 1, to = 48, ofac = 4)

print(lsp_annual)
print(lsp_daily)
