library(ggplot2)
library(dplyr)
library(tidyr)

Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Leer los datos del archivo resultados.csv
data <- read.csv("results.csv")

velocidad_subida <- data$up
velocidad_bajada <- data$down

# Cálculos estadísticos de subida
media_subida <- mean(velocidad_subida, na.rm = TRUE)
moda_subida <- Mode(velocidad_subida)
desviacion_subida <- sd(velocidad_subida, na.rm = TRUE)

# Rangos de velocidad de subida
rango_min_subida <- floor(min(velocidad_subida) / 10) * 10
rango_max_subida <- ceiling(max(velocidad_subida) / 10) * 10
rangos_subida <- seq(rango_min_subida, rango_max_subida, by = 10)

# Tabla de frecuencia de velocidad de subida
tabla_subida <- data.frame(Rango_de_Velocidad = cut(velocidad_subida, breaks = rangos_subida, include.lowest = TRUE)) %>%
  count(Rango_de_Velocidad) %>%
  arrange(Rango_de_Velocidad) %>%
  rename(Frecuencia = n) %>%
  mutate(Frecuencia_Relativa = Frecuencia / sum(Frecuencia),
         Frecuencia_Acumulada = cumsum(Frecuencia))

# Convertir los intervalos de subida a formato de cadena
tabla_subida$Rango_de_Velocidad <- as.character(tabla_subida$Rango_de_Velocidad)

# Gráfica de frecuencia de velocidad de subida
plt_subida <- ggplot(tabla_subida, aes(x = Rango_de_Velocidad, y = Frecuencia)) +
  geom_bar(stat = "identity", width = 0.8) +
  labs(x = "Rango de Velocidad de subida (Mbps)", y = "Frecuencia", title = "Frecuencia de Velocidad de Subida") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Resultados de subida
cat("Estadísticas de Velocidad de Subida:\n")
cat("Media:", media_subida, "\n")
cat("Moda:", moda_subida, "\n")
cat("Desviación estándar:", desviacion_subida, "\n")

# Handle empty download speed data
if (all(is.na(velocidad_bajada))) {
  cat("\nNo hay datos de Velocidad de Bajada.")
} else {
  # Cálculos estadísticos de bajada
  media_bajada <- mean(velocidad_bajada, na.rm = TRUE)
  moda_bajada <- Mode(velocidad_bajada)
  desviacion_bajada <- sd(velocidad_bajada, na.rm = TRUE)

  # Rangos de velocidad de bajada
  rango_min_bajada <- floor(min(velocidad_bajada) / 10) * 10
  rango_max_bajada <- ceiling(max(velocidad_bajada) / 10) * 10
  rangos_bajada <- seq(rango_min_bajada, rango_max_bajada, by = 10)

  # Tabla de frecuencia de velocidad de bajada
  tabla_bajada <- data.frame(Rango_de_Velocidad = cut(velocidad_bajada, breaks = rangos_bajada, include.lowest = TRUE)) %>%
    count(Rango_de_Velocidad) %>%
    arrange(Rango_de_Velocidad) %>%
    rename(Frecuencia = n) %>%
    mutate(Frecuencia_Relativa = Frecuencia / sum(Frecuencia),
           Frecuencia_Acumulada = cumsum(Frecuencia))

  # Convertir los intervalos de bajada a formato de cadena
  tabla_bajada$Rango_de_Velocidad <- as.character(tabla_bajada$Rango_de_Velocidad)

  # Gráfica de frecuencia de velocidad de bajada
  plt_bajada <- ggplot(tabla_bajada, aes(x = Rango_de_Velocidad, y = Frecuencia)) +
    geom_bar(stat = "identity", width = 0.8) +
    labs(x = "Rango de Velocidad de bajada (Mbps)", y = "Frecuencia", title = "Frecuencia de Velocidad de Bajada") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

  # Resultados de bajada
  cat("\nEstadísticas de Velocidad de Bajada:\n")
  cat("Media:", media_bajada, "\n")
  cat("Moda:", moda_bajada, "\n")
  cat("Desviación estándar:", desviacion_bajada, "\n")
}

plt_subida
plt_bajada
