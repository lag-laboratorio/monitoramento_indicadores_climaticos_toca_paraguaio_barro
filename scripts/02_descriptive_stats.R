# ==============================================================================
# Script 02: Análise Estatística Descritiva e Distribuição
# Projeto: Monitoramento Indicadores Climáticos - TPO e TB
# Laboratório de Arqueologia e Geociências (LAG)
# ==============================================================================

library(tidyverse)

data_clean <- read_csv("data/processed/dados_limpos.csv")

# Resumo Estatístico por Sítio e Variável
summary_stats <- data_clean %>%
  group_by(sitio) %>%
  summarise(
    n = n(),
    mediana_temp = median(temperatura, na.rm = TRUE),
    iqr_temp = IQR(temperatura, na.rm = TRUE),
    min_temp = min(temperatura, na.rm = TRUE),
    max_temp = max(temperatura, na.rm = TRUE),
    mediana_ur = median(umidade, na.rm = TRUE),
    iqr_ur = IQR(umidade, na.rm = TRUE),
    min_ur = min(umidade, na.rm = TRUE),
    max_ur = max(umidade, na.rm = TRUE)
  )

print(summary_stats)

# Boxplot Comparativo de Temperatura
p1 <- ggplot(data_clean, aes(x = sitio, y = temperatura, fill = sitio)) +
  geom_boxplot() +
  labs(title = "Dispersão e Medianas de Temperatura: TPO vs TB",
       x = "Sítio", y = "Temperatura (°C)") +
  theme_minimal()

ggsave("figures/fig05_boxplot_temperatura.png", plot = p1, width = 6, height = 4)
