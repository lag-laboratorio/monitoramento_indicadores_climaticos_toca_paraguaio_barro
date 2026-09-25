# Monitoramento de Indicadores Climáticos nos Sítios Arqueológicos Toca do Paraguaio e Toca do Barro

Este repositório contém os dados, scripts em R e documentação referentes à análise microclimática e de variabilidade climática (incluindo o impacto de eventos ENSO: *El Niño* e *La Niña*) em sítios arqueológicos no Parque Nacional Serra da Capivara (Piauí, Brasil).

---

## 📌 Visão Geral

O acervo de arte rupestre no bioma Caatinga enfrenta desafios contínuos de conservação preventiva devido a processos de intemperismo físico-químico, eflorescências salinas e desplacamentos rochosos. Este projeto analisa a variabilidade microclimática (temperatura e umidade relativa do ar) registrada entre **2017 e 2025** nos sítios:
* **Toca do Paraguaio (TPO)**
* **Toca do Barro (TB)**

Ambos os sítios estão situados no Desfiladeiro da Capivara e são monitorados continuamente a cada hora por dataloggers instalados próximos aos painéis rupestres.

---

## 📊 Estrutura do Repositório

```text
├── data/
│   ├── raw/                  # Dados brutos coletados pelos dataloggers AKSO AK172
│   └── processed/            # Dados limpos, padronizados e organizados em CSV
├── scripts/
│   ├── 01_data_cleaning.R    # Padronização e organização das séries temporais
│   ├── 02_descriptive_stats.R # Estatísticas descritivas, densidade e boxplots
│   ├── 03_lomb_scargle.R     # Análise de Sazonalidade Multiescala (Periodograma de Lomb-Scargle)
│   ├── 04_correlation.R      # Correlação de Pearson e detecção de anomalias de covariação
│   └── 05_homogeneity_tests.R # Testes de homogeneidade (Pettitt, Buishand, SNHT)
├── figures/                  # Gráficos gerados pelas análises
├── LICENSE                   # Licença Open Source (MIT)
└── README.md                 # Descrição do projeto e diretrizes
```

---

## 🧪 Metodologia e Funcionalidades

1. **Tratamento de Dados e Lacunas:** Tratamento de *gaps* decorrentes de limitações operacionais (como o período da pandemia de COVID-19) utilizando técnicas adequadas para dados não uniformes.
2. **Análise de Sazonalidade Multiescala (Periodograma de Lomb-Scargle):**
   * Avaliação do **ciclo anual** (~365 dias / 8760 horas).
   * Avaliação do **ciclo diário** (~24 horas), principal modulador da radiação solar.
3. **Correlação Térmica e Anomalias:**
   * Cálculo da correlação de Pearson ($r \approx -0.68$) entre Temperatura e Umidade Relativa.
   * Identificação de episódios anômalos de covariação positiva (subida simultânea de $T$ e $UR$).
4. **Testes de Homogeneidade:**
   * Aplicação dos testes de Pettitt, Buishand e SNHT para identificação de quebras estruturais (mudança significativa registrada em meados de 2023, coincidindo com a transição La Niña / Super El Niño).

---

## 🛠️ Requisitos e Dependências

As análises foram desenvolvidas em **R (RStudio)**. Pacotes recomendados para execução dos scripts:

```R
install.packages(c("tidyverse", "lomb", "trend", "ggplot2"))
```

---

## 📜 Referência Normativa e Institucional

Esta pesquisa alinha-se às diretrizes da **Carta Brasileira do Patrimônio Cultural e Mudanças Climáticas (ICOMOS-Br, 2025)**, ressaltando o monitoramento contínuo como ferramenta essencial para a conservação preventiva e gestão de riscos em acervos patrimoniais.

**Realização:** Laboratório de Arqueologia e Geociências (LAG).
