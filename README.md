# Linnovate's home task
The task essentially automates the building, pushing, and deploying of an Nginx PHP application using Docker and Kubernetes through GitHub Actions CI/CD. Here's a suggested description:

## Project Description
This project is a simple "Hello World" application served by an Nginx server running PHP-FPM. The application is Dockerized and can be automatically deployed to a Kubernetes cluster using a Continuous Integration/Continuous Deployment (CI/CD) pipeline.

## CI/CD Pipeline
The CI/CD pipeline for this project is implemented using GitHub Actions. It is designed to:

Build a Docker image whenever a new commit is pushed to the develop or master branches. The Docker image includes an Nginx server with PHP-FPM and serves the "Hello World" PHP application.

Push the Docker image to Docker Hub (replace with your preferred Docker Registry).

Deploy the Docker image to a Kubernetes cluster, specifically, a local Minikube environment. The Kubernetes configuration is defined in the k8s/deployment.yaml file and includes a Deployment and a Service.

## Workflow
For the 'develop' branch, every new commit will trigger the CI/CD pipeline and deploy the updated application to the Kubernetes cluster.

For the 'master' branch, a new commit will trigger the build and push stages of the pipeline. A manual action is required to deploy the application to the Kubernetes cluster.

## Project Setup
To use this project, you'll need to set your DockerHub (or your preferred Docker Registry) username and token in the GitHub repository secrets (DOCKERHUB_USERNAME and DOCKERHUB_TOKEN). You'll also need to replace placeholders in the GitHub Actions workflow and Kubernetes configuration files with your actual information.

Remember to install and configure kubectl and helm on your local system, and ensure that your Minikube cluster is running.

