FROM python:3.11-slim

# Variables d'environnement
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Créer le dossier de travail
WORKDIR /app

# Installer les dépendances système pour Tesseract
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    tesseract-ocr-fra \
    tesseract-ocr-eng \
    tesseract-ocr-spa \
    tesseract-ocr-deu \
    tesseract-ocr-ita \
    tesseract-ocr-por \
    && rm -rf /var/lib/apt/lists/*

# Copier les fichiers requirements
COPY requirements.txt .

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code de l'application
COPY . .

# Créer le dossier static
RUN mkdir -p static

# Exposer le port
EXPOSE $PORT

# Commande pour démarrer l'application
CMD gunicorn app:app --bind 0.0.0.0:$PORT