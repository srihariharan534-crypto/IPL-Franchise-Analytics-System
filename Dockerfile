# ── IPL Franchise Analytics System — Multi-stage Dockerfile ──
# Stage 1: Base Python image
FROM python:3.11-slim as base

# System deps
RUN apt-get update && apt-get install -y \
    gcc g++ default-libmysqlclient-dev curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . .

# Create logs directory
RUN mkdir -p logs reports data/raw data/processed

# ── Stage 2: API ─────────────────────────────────────────────
FROM base as api
EXPOSE 8000
ENV PYTHONPATH=/app
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1
CMD ["uvicorn", "api.app:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "2"]

# ── Stage 3: Dashboard ────────────────────────────────────────
FROM base as dashboard
EXPOSE 8501
ENV PYTHONPATH=/app
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:8501/_stcore/health || exit 1
CMD ["streamlit", "run", "streamlit_app/main.py", \
     "--server.port=8501", "--server.address=0.0.0.0", \
     "--server.headless=true", "--browser.gatherUsageStats=false"]

# ── Stage 4: ETL ─────────────────────────────────────────────
FROM base as etl
ENV PYTHONPATH=/app
CMD ["python", "etl/orchestration/master_pipeline.py", "--target", "all"]

# ── Stage 5: Monitoring ───────────────────────────────────────
FROM base as monitoring
EXPOSE 8502
ENV PYTHONPATH=/app
CMD ["python", "monitoring/pipeline_health_monitor.py"]
