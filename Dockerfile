# Usar una imagen base con Chrome y ChromeDriver
FROM selenium/standalone-chrome:128.0

WORKDIR /app

# Configurar repositorios de paquetes válidos
RUN echo "deb http://deb.debian.org/debian bullseye main" > /etc/apt/sources.list \
    && echo "deb http://deb.debian.org/debian-security bullseye-security main" >> /etc/apt/sources.list \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && apt-get update --fix-missing \
    && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-dev \
        build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copiar requirements.txt e instalar dependencias
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copiar el resto de los archivos
COPY . .

# Configurar el puerto
ENV PORT=8000

# Ejecutar la aplicación
CMD ["python3", "app.py"]
