#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build --tag=subrockmann/udacity_capstone:v1 .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
docker run -p 5000:8080 subrockmann/udacity_capstone:v1