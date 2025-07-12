#!/bin/bash

# Installation des dépendances système pour Tesseract OCR
apt-get update
apt-get install -y tesseract-ocr tesseract-ocr-fra tesseract-ocr-eng tesseract-ocr-deu tesseract-ocr-spa tesseract-ocr-ita tesseract-ocr-por

# Installation des dépendances Python
pip install -r requirements.txt