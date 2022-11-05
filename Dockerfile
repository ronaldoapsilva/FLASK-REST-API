FROM python:3.10
EXPOSE 5000
WORKDIR /app
# copy requirements and install requirements before layer "COPY . ."
# because it will be cached if there is not update to them
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["flask", "run", "--host", "0.0.0.0"]