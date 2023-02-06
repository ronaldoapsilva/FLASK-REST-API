FROM python:3.10

WORKDIR /app
# copy requirements and install requirements before layer "COPY . ."
# because it will be cached if there is not update to them
COPY requirements.txt .

RUN pip install --no-cache-dir --upgrage -r requirements.txt
RUN pip install gunicorn

COPY . .
CMD ["gunicorn", "--bind". "0.0.0.0:80", "app:create_app()"]