# 🐍 Django + DRF Backend (Products API)

This is the **backend service** for the multi-tier web application project.  
It’s built with **Django 5**, **Django REST Framework**, and uses **SQLite** by default (switchable to PostgreSQL/RDS later).  
The API exposes a simple **Products CRUD** endpoint for the frontend (Next.js).

---

## 📦 Features
- Django + DRF backend
- Products API (list, create, update, delete)
- Dockerized for development and production
- SQLite for local dev (Postgres-ready for AWS RDS)
- Gunicorn for production server

---

## 🚀 Getting Started

### 1. Clone repo
```bash
git clone <your-repo-url>
cd backend
```

### 2. Create virtualenv (optional if running outside Docker)
```bash
python -m venv venv
source venv/bin/activate  # Linux/macOS
venv\Scripts\activate     # Windows
```

### 3. Install dependencies
```bash
pip install -r requirements.txt
```

### 4. Run migrations
```bash
python manage.py migrate
```

### 5. Start dev server
```bash
python manage.py runserver
```

---

## 🐳 Docker Setup

### Build dev image (Django runserver + SQLite)
```bash
docker build -t backend-dev -f Dockerfile.dev .
```

Run container:
```bash
docker run --name backend-dev-container -p 8000:8000 backend-dev
```

---

### Build prod image (Gunicorn)
```bash
docker build -t backend-prod .
```

Run container:
```bash
docker run --name backend-prod-container -p 8000:8000 backend-prod
```

---

## 📡 API Endpoints

Base URL: `http://localhost:8000/api/`

- `GET /products/` → List all products
- `POST /products/` → Create a product
- `GET /products/{id}/` → Get product details
- `PUT /products/{id}/` → Update product
- `DELETE /products/{id}/` → Delete product

Example product JSON:
```json
{
  "name": "Laptop",
  "description": "Lightweight business laptop",
  "price": "1299.99"
}
```

---

## 📂 Project Structure
```
backend/
│── backend/           # Django project root
│── products/          # Products app (models, views, serializers)
│── requirements.txt   # Python dependencies
│── Dockerfile         # Production Dockerfile (Gunicorn)
│── Dockerfile.dev     # Development Dockerfile (runserver)
│── README.md          # Project docs
```

---

## 🛠️ Environment Variables
| Name        | Default     | Description              |
|-------------|-------------|--------------------------|
| DEBUG       | `True`      | Django debug mode        |
| SECRET_KEY  | `changeme`  | Django secret key        |
| DATABASE_URL| sqlite:///  | DB connection (change to Postgres/RDS later) |


---

## 📜 License
MIT
