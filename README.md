# Kubernetes Microservices Deployment

A complete Docker-based microservices architecture orchestrated with Kubernetes. This project demonstrates a modern, scalable web application infrastructure with four independent microservices, each with its own database, connected through an API Gateway.

## 📋 Table of Contents

- [Architecture Overview](#-architecture-overview)
- [Services](#-services)
- [Prerequisites](#-prerequisites)
- [Quick Start](#-quick-start)
- [Manual Deployment](#-manual-deployment)
- [Accessing the Application](#-accessing-the-application)
- [API Endpoints](#-api-endpoints)
- [Monitoring](#-monitoring)
- [CI/CD Pipeline](#-cicd-pipeline)
- [Troubleshooting](#-troubleshooting)
- [Cleanup](#-cleanup)

## 🏗️ Architecture Overview

This project implements a microservices architecture using Kubernetes for orchestration. The system consists of independent services that communicate through REST APIs, with each service having its own dedicated database.

```mermaid
graph TB
    Client["Client (Web Browser)"]
    
    subgraph KubernetesCluster[Kubernetes Cluster]
        Ingress[Ingress Controller]
        
        subgraph WebAppNamespace[Webapp Namespace]
            NGINX[NGINX API Gateway]
            
            subgraph Microservices[Microservices]
                Auth[Auth Service:3001]
                User[User Service:3002]
                Product[Product Service:3003]
                Order[Order Service:3004]
            end

            subgraph DataStores[Data Stores & Cache]
                PostgresAuth[(Postgres: Auth)]
                PostgresUser[(Postgres: User)]
                MongoDB[(MongoDB: Product)]
                PostgresOrder[(Postgres: Order)]
                Redis[(Redis Cache)]
            end
        end

        Ingress --> NGINX
        NGINX --> Auth
        NGINX --> User
        NGINX --> Product
        NGINX --> Order

        Auth --> PostgresAuth
        User --> PostgresUser
        Product --> MongoDB
        Order --> PostgresOrder

        Auth --> Redis
        User --> Redis
        Product --> Redis
    end
    Client --> Ingress

