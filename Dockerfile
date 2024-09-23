# Dockerfile

# Use the official Python image as a base
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files into the container
COPY . .

# Run migrations and collect static files before starting the app
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
