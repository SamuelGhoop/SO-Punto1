# Punto 1 - Despliegue FastAPI en AWS Lambda con Docker
Link Chat: https://claude.ai/share/20fa21b4-a01a-4fb6-b069-793a45575012

## Descripción
Despliegue de una aplicación FastAPI empaquetada en Docker y desplegada en AWS Lambda usando ECR como container registry.

## Archivos

| Archivo | Descripción |
|---|---|
| `app.py` | Aplicación FastAPI con Mangum para compatibilidad con Lambda |
| `requirements.txt` | Dependencias del proyecto |
| `Dockerfile` | Imagen Docker compatible con AWS Lambda |
| `deploy.sh` | Script Bash para build, tag y push a ECR |

## Tecnologías
- Python 3.11
- FastAPI
- Mangum
- Docker
- AWS Lambda
- AWS ECR

## Endpoints

| Método | Ruta | Descripción |
|---|---|---|
| GET | `/` | Mensaje de estado de la API |
| GET | `/api/hello?name=X` | Saludo personalizado |

## Despliegue

### 1. Construir y subir imagen a ECR
```bash
chmod +x deploy.sh
./deploy.sh
```

### 2. Crear función Lambda
- AWS Console → Lambda → Create function → Container image
- Seleccionar imagen desde ECR (`lambda-final:latest`)
- Arquitectura: x86_64

### 3. Configurar Function URL
- Configuration → Function URL → Create → Auth type: NONE

### 4. Probar
```bash
curl https://TU-URL.lambda-url.us-east-1.on.aws/
curl "https://TU-URL.lambda-url.us-east-1.on.aws/api/hello?name=Samuel"
```

## Autor
Samuel - Universidad EIA - Sistemas Operativos 2026-1
