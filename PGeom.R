# Cargar el paquete necesario para leer archivos CSV
library(readr)

# Leer el archivo CSV
datos <- read_csv("results.csv")

# Obtener los vectores de velocidad de subida y bajada
velocidad_subida <- datos$up
velocidad_bajada <- datos$down

# Obtener el vector de distancia
distancia <- datos$distancia

# Calcular la media y desviación estándar de las velocidades de subida
media_subida <- mean(velocidad_subida, na.rm = TRUE)
desviacion_subida <- sd(velocidad_subida, na.rm = TRUE)

# Calcular la media y desviación estándar de las velocidades de bajada
media_bajada <- mean(velocidad_bajada, na.rm = TRUE)
desviacion_bajada <- sd(velocidad_bajada, na.rm = TRUE)

# Calcular la media y desviación estándar de la distancia
media_distancia <- mean(distancia, na.rm = TRUE)
desviacion_distancia <- sd(distancia, na.rm = TRUE)

cat("Media de velocidades de subida:", media_subida, "\n")
cat("Desviación estándar de velocidades de subida:", desviacion_subida, "\n")
cat("Media de velocidades de bajada:", media_bajada, "\n")
cat("Desviación estándar de velocidades de bajada:", desviacion_bajada, "\n")

cat("Media de distancia:", media_distancia, "\n")
cat("Desviación estándar de distancia:", desviacion_distancia, "\n")

# Definir las tolerancias como múltiplos de la desviación estándar
multiplo_tolerancia <- 1
tolerancia_subida <- multiplo_tolerancia * desviacion_subida
tolerancia_bajada <- multiplo_tolerancia * desviacion_bajada
tolerancia_distancia <- multiplo_tolerancia * desviacion_distancia

probabilidad_dentro_tolerancia_subida <- pnorm(media_subida + tolerancia_subida, mean = media_subida, sd = desviacion_subida) - pnorm(media_subida - tolerancia_subida, mean = media_subida, sd = desviacion_subida)
probabilidad_fuera_tolerancia_subida <- 1 - probabilidad_dentro_tolerancia_subida

probabilidad_dentro_tolerancia_bajada <- pnorm(media_bajada + tolerancia_bajada, mean = media_bajada, sd = desviacion_bajada) - pnorm(media_bajada - tolerancia_bajada, mean = media_bajada, sd = desviacion_bajada)
probabilidad_fuera_tolerancia_bajada <- 1 - probabilidad_dentro_tolerancia_bajada

probabilidad_dentro_tolerancia_distancia <- pnorm(media_distancia + tolerancia_distancia, mean = media_distancia, sd = desviacion_distancia) - pnorm(media_distancia - tolerancia_distancia, mean = media_distancia, sd = desviacion_distancia)
probabilidad_fuera_tolerancia_distancia <- 1 - probabilidad_dentro_tolerancia_distancia

# Cargar el paquete necesario para leer archivos CSV
library(readr)

# Leer el archivo CSV
datos <- read_csv("results.csv")

# Obtener los vectores de velocidad de subida y bajada
velocidad_subida <- datos$up
velocidad_bajada <- datos$down

# Obtener el vector de distancia
distancia <- datos$distancia

# Calcular la media y desviación estándar de las velocidades de subida
media_subida <- mean(velocidad_subida, na.rm = TRUE)
desviacion_subida <- sd(velocidad_subida, na.rm = TRUE)

# Calcular la media y desviación estándar de las velocidades de bajada
media_bajada <- mean(velocidad_bajada, na.rm = TRUE)
desviacion_bajada <- sd(velocidad_bajada, na.rm = TRUE)

# Calcular la media y desviación estándar de la distancia
media_distancia <- mean(distancia, na.rm = TRUE)
desviacion_distancia <- sd(distancia, na.rm = TRUE)

cat("Media de velocidades de subida:", media_subida, "\n")
cat("Desviación estándar de velocidades de subida:", desviacion_subida, "\n")
cat("Media de velocidades de bajada:", media_bajada, "\n")
cat("Desviación estándar de velocidades de bajada:", desviacion_bajada, "\n")

cat("Media de distancia:", media_distancia, "\n")
cat("Desviación estándar de distancia:", desviacion_distancia, "\n")

# Definir las tolerancias como múltiplos de la desviación estándar
multiplo_tolerancia <- 1
tolerancia_subida <- multiplo_tolerancia * desviacion_subida
tolerancia_bajada <- multiplo_tolerancia * desviacion_bajada
tolerancia_distancia <- multiplo_tolerancia * desviacion_distancia

probabilidad_dentro_tolerancia_subida <- pnorm(media_subida + tolerancia_subida, mean = media_subida, sd = desviacion_subida) - pnorm(media_subida - tolerancia_subida, mean = media_subida, sd = desviacion_subida)
probabilidad_fuera_tolerancia_subida <- 1 - probabilidad_dentro_tolerancia_subida

probabilidad_dentro_tolerancia_bajada <- pnorm(media_bajada + tolerancia_bajada, mean = media_bajada, sd = desviacion_bajada) - pnorm(media_bajada - tolerancia_bajada, mean = media_bajada, sd = desviacion_bajada)
probabilidad_fuera_tolerancia_bajada <- 1 - probabilidad_dentro_tolerancia_bajada

probabilidad_dentro_tolerancia_distancia <- pnorm(media_distancia + tolerancia_distancia, mean = media_distancia, sd = desviacion_distancia) - pnorm(media_distancia - tolerancia_distancia, mean = media_distancia, sd = desviacion_distancia)
probabilidad_fuera_tolerancia_distancia <- 1 - probabilidad_dentro_tolerancia_distancia

# Calcula la probabilidad de que necesitemos hacer más de 20 mediciones antes de encontrar una medición fuera de tolerancias
probabilidad <- 1 - pgeom(20, probabilidad_fuera_tolerancia_bajada)
cat("Probabilidad de que necesitemos hacer más de 20 mediciones antes de encontrar una medición fuera de tolerancias:", probabilidad, "\n")

# Calcula la probabilidad de que necesitemos hacer más de 25 mediciones antes de encontrar una medición fuera de tolerancias
probabilidad <- 1 - pgeom(25, probabilidad_fuera_tolerancia_bajada)
cat("Probabilidad de que necesitemos hacer más de 25 mediciones antes de encontrar una medición fuera de tolerancias:", probabilidad, "\n")

# Calcula la probabilidad de que necesitemos hacer más de 15 mediciones antes de encontrar una medición fuera de tolerancias
probabilidad <- 1 - pgeom(15, probabilidad_fuera_tolerancia_distancia)
cat("Probabilidad de que necesitemos hacer más de 15 mediciones antes de encontrar una medición fuera de tolerancias:", probabilidad, "\n")
