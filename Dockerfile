# ──────────────────────────────────────────────
# Base: official slim Python image
# ──────────────────────────────────────────────
FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1 \
    APP_HOME=/back-end \
    PATH="/root/.cargo/bin:$PATH"

WORKDIR $APP_HOME

# ──────────────────────────────────────────────
# Install minimal system dependencies in one layer
# ──────────────────────────────────────────────
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential python3-dev libffi-dev libssl-dev pkg-config curl \
    gcc g++ make cargo \
    libxcb-cursor0 libxcb-xinerama0 '^libxcb.*-dev' \
    libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev \
    libxkbcommon-dev libxkbcommon-x11-dev libgl1 libegl1 \
 && rm -rf /var/lib/apt/lists/*

# ──────────────────────────────────────────────
# Install Rust (non-interactive)
# ──────────────────────────────────────────────
RUN curl -fsSL https://sh.rustup.rs | bash -s -- -y --default-toolchain stable

# ──────────────────────────────────────────────
# Upgrade pip & build essentials
# ──────────────────────────────────────────────
RUN pip install --no-cache-dir --upgrade pip setuptools wheel build

# ──────────────────────────────────────────────
# Install Python dependencies
# ──────────────────────────────────────────────
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Optional: only if you really need PyTorch
RUN pip install --no-cache-dir torch==2.8.0 --index-url https://download.pytorch.org/whl/cpu

# ──────────────────────────────────────────────
# Copy application files
# ──────────────────────────────────────────────
COPY . .

# ──────────────────────────────────────────────
# Permissions for Cloud Run’s rootless runtime
# ──────────────────────────────────────────────
RUN chmod -R 755 flaskapp \
 && addgroup --system app && adduser --system --ingroup app appuser

USER appuser:app

# ──────────────────────────────────────────────
# Run the app
# ──────────────────────────────────────────────
CMD ["gunicorn", "--bind", "0.0.0.0:${PORT}", "--workers", "1", "--threads", "8", "--timeout", "0", "flaskapp.flask_app:app"]
