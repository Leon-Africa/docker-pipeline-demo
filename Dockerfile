FROM python:3.11-slim AS builder

WORKDIR /app

# Install minimal build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends build-essential gcc && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --user --no-cache-dir -r requirements.txt

# Production stage
FROM python:3.11-slim

RUN useradd -m -u 1000 appuser

WORKDIR /app

COPY --from=builder /root/.local /home/appuser/.local

COPY --chown=appuser:appuser main.py .

ENV PATH=/home/appuser/.local/bin:$PATH

RUN mkdir -p /app/data && chown appuser:appuser /app/data

USER appuser

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8080/docs')" || exit 1

CMD ["python", "main.py"]
