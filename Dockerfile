# Usar una imagen base con Chrome y ChromeDriver
FROM selenium/standalone-chrome:latest

WORKDIR /app

# Instalar Python y dependencias
RUN apt-get update && apt-get install -y python3 python3-pip
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copiar el resto de los archivos
COPY . .

# Configurar el puerto
ENV PORT=8000

# Ejecutar la aplicación
CMD ["python3", "app.py"]
