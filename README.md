# Bookstore API

A RESTful API for managing a bookstore inventory built with FastAPI


#### Run the application

```bash
COMPOSE_BAKE=true docker compose up --build
```

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

All configuration is handled via environment variables in docker-compose.yml:

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

# Clean

````
docker compose down -v
````
