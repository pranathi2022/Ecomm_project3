# Project 1 – CI/CD for React App using Jenkins + DockerHub (Dev → Prod)

## Overview
This project demonstrates a complete DevOps workflow to build, push, deploy, and monitor a React application using:
- Docker + Docker Compose
- Bash scripting for automation
- Git branching workflow (dev → master)
- Jenkins Multibranch Pipeline CI/CD
- DockerHub (Dev = Public, Prod = Private)
- AWS EC2 deployment
- Open-source monitoring + downtime notification

---

## What I Implemented

### 1) Dockerization
- Created a Dockerfile for the React application.
- Built and tested the docker image locally.
- Verified the application runs correctly on the required port.

---

### 2) Docker Compose
- Created a `docker-compose.yml` to run the application using the built image.
- Tested the deployment using:
  - `docker compose up -d`
- Verified containers are running and the application is accessible.

---

### 3) Bash Scripting (Automation)
Created two scripts to automate build and deployment:

#### `build.sh`
- Builds the docker image.

#### `deploy.sh`
- Pulls the latest image from registry
- Stops/removes old container
- Runs the updated container

This ensures deployments are consistent and repeatable.

---

### 4) Version Control (CLI Only)
- Used Git CLI commands only.
- Created `dev` and `master` branches.
- Added `.gitignore` and `.dockerignore` to avoid pushing unwanted files.
- Pushed code into GitHub and maintained branch workflow.

---

### 5) DockerHub Registry Setup
- Created two DockerHub repositories:
  - Dev repository (Public)
  - Prod repository (Private)
- Ensured correct image tagging and pushing based on branch.

---

### 6) Jenkins Setup + CI/CD Pipeline
- Installed Jenkins and required dependencies on AWS EC2.
- Installed necessary Jenkins plugins.
- Created a Multibranch Pipeline job.
- Connected GitHub to Jenkins with auto-trigger.

Pipeline behavior:
- When code is pushed to `dev` branch:
  - Jenkins builds docker image
  - Pushes image to DockerHub Dev repo
- When `dev` is merged into `master`:
  - Jenkins builds docker image
  - Pushes image to DockerHub Prod repo
  - Deploys application to server

---

### 7) AWS Deployment
- Launched an EC2 instance and deployed the application.
- Configured Security Group rules as required:
  - Application port open to public access
  - SSH access restricted to my IP only

---

### 8) Monitoring + Alerts
- Implemented open-source monitoring for application health.
- Configured health checks to detect downtime.
- Enabled notifications to send alerts only when the application goes down.
- Verified downtime + recovery detection.

---

## Proof / Screenshots Included
The repository includes screenshots for:
- Docker build and run
- Docker compose execution
- Bash scripts
- Git CLI workflow
- DockerHub repositories and tags
- Jenkins installation + multibranch pipeline
- Jenkins pipeline execution (dev + master)
- AWS EC2 instance and Security Group configuration
- Monitoring health status and alert testing

---

## Conclusion
This project successfully demonstrates a complete CI/CD workflow with branch-based DockerHub publishing, automated deployments using Jenkins, secure AWS access rules, and monitoring with downtime alerting.
