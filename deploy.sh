#!/bin/bash

AWS_ACCOUNT_ID="509784656095"
AWS_REGION="us-east-1"
ECR_REPO_NAME="lambda-final"
IMAGE_NAME="lambda-final"
ECR_URI="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"

echo ">>> Autenticando en ECR..."
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_URI}

echo ">>> Creando repositorio ECR (si no existe)..."
aws ecr create-repository --repository-name ${ECR_REPO_NAME} --region ${AWS_REGION} 2>/dev/null || echo "El repositorio ya existe."

echo ">>> Construyendo imagen Docker..."
docker build --provenance=false --platform linux/amd64 -t ${IMAGE_NAME} .

echo ">>> Asignando etiqueta latest..."
docker tag ${IMAGE_NAME}:latest ${ECR_URI}/${ECR_REPO_NAME}:latest

echo ">>> Subiendo imagen a ECR..."
docker push ${ECR_URI}/${ECR_REPO_NAME}:latest

echo ">>> Imagen publicada exitosamente!"
echo "URI: ${ECR_URI}/${ECR_REPO_NAME}:latest"
