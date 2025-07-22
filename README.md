# Bookstore API

A RESTful API for managing a bookstore inventory built with FastAPI

#### Run the application [Docker]

```bash
COMPOSE_BAKE=true docker compose up --build
```
````
````

#### Run the application [Helm]
```bash
minikube start
helm repo add bitnami https://charts.bitnami.com/bitnami
helm dependency build ./bookstore
helm upgrade --install bookstore ./bookstore -f ./bookstore/values.yaml
```
Once the pods are up:
````
kubectl get pods
NAME                         READY   STATUS    RESTARTS      AGE
bookstore-7dc8cf5777-4x8p9   1/1     Running   4 (82s ago)   2m39s
bookstore-postgresql-0       1/1     Running   0             2m39s
````
````
kubectl port-forward svc/bookstore 8080:8080
````

# Check Docs
http://localhost:8080/docs — Swagger UI

http://localhost:8080/redoc — ReDoc UI


## API Endpoints

| Method | Endpoint           | Description                |
| ------ | ------------------ | -------------------------- |
| POST   | `/books/`          | Create a new book          |
| GET    | `/books/`          | List all books (paginated) |
| GET    | `/books/{book_id}` | Get a specific book        |
| PUT    | `/books/{book_id}` | Update a book              |
| DELETE | `/books/{book_id}` | Delete a book              |


## Configuration

| Variable          | Default                                            | Description                                         |
| ----------------- | -------------------------------------------------- | --------------------------------------------------- |
| `DATABASE_URL`    | `postgresql://postgres:postgres@db:5432/bookstore` | PostgreSQL connection string                        |
| `LOG_LEVEL`       | `INFO`                                             | Logging level (`DEBUG`, `INFO`, `WARNING`, `ERROR`) |
| `PAGE_SIZE`       | `10`                                               | Items per page for pagination                       |
| `APP_ENV`         | `development`                                      | App environment label                               |
| `HOST`            | `0.0.0.0`                                          | Server host binding                                 |
| `PORT`            | `8080`                                             | Server port                                         |
| `RELOAD`          | `False`                                            | Enables auto-reload (development only)              |
| `ALLOWED_ORIGINS` | `http://localhost:3000`                            | Comma-separated list of allowed CORS origins        |
| `DB_POOL_SIZE`    | `10`                                               | SQLAlchemy DB connection pool size                  |
| `DB_MAX_OVERFLOW` | `20`                                               | Maximum overflow connections beyond pool size       |
