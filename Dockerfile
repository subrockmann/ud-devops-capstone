FROM python:3.7.3-stretch

## Step 1:


## Step 1b:
# Add requirements.txt before rest of repo for caching
COPY requirements.txt /app/

## Step 2:
# Copy source code to working directory
# COPY . src/* /app
COPY /src/* /app/

# Create a working directory
WORKDIR /app

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt


## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]
