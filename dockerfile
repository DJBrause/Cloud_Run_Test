# Użyj oficjalnego obrazu Python jako obrazu bazowego
FROM python:3.10-slim

# Ustaw zmienną środowiskową, aby Python nie buforował stdout/stderr
ENV PYTHONUNBUFFERED True

# Ustaw katalog roboczy w kontenerze
WORKDIR /app

# Skopiuj plik zależności i zainstaluj je
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Skopiuj kod aplikacji do katalogu roboczego
COPY ./main.py .

# Uruchom aplikację Uvicorn.
# Cloud Run domyślnie nasłuchuje na porcie 8080 (lub tym podanym w zmiennej $PORT).
# 0.0.0.0 jest potrzebne, aby aplikacja była dostępna z zewnątrz kontenera.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
