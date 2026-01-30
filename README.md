
---

# 🚀 Netflix Clone – DevSecOps CI/CD Pipeline

**Jenkins · Docker · Kubernetes · Security · Monitoring**

---

## 📌 Project Overview

This repository demonstrates a **production-style DevSecOps CI/CD pipeline** for a Netflix-style frontend application.

The project showcases:

* CI/CD automation using Jenkins
* Security integrated inside the pipeline (DevSecOps)
* Docker image build & scanning
* Kubernetes deployment
* Monitoring with Prometheus & Grafana

This repository is intentionally structured so a **recruiter can clone, deploy, and validate my DevOps skills end-to-end**.

---

## 📁 Repository Structure

```text
netflix-devops-project/
│
├── app/                    # Application source code
│
├── docker/                 # Docker image configuration
│   ├── Dockerfile
│   └── .dockerignore
│
├── jenkins/                # Jenkins CI/CD pipeline
│   └── Jenkinsfile
│
├── k8s/                    # Kubernetes manifests
│   ├── deployment.yaml
│   ├── service.yaml
│   └── namespace.yaml
│
├── monitoring/             # Monitoring configuration
│   ├── prometheus.yml
│   └── grafana-dashboard.json
│
├── security/               # Security & quality configs
│   ├── sonar-project.properties
│   └── owasp-dependency-check.xml
│
├── scripts/                # Automation scripts
│   ├── install-jenkins.sh
│   ├── install-docker.sh
│   ├── install-trivy.sh
│   ├── install-prometheus.sh
│   ├── install-grafana.sh
│   ├── install-node-exporter.sh
│   └── setup-k8s.sh
│
├── .env.example
├── .gitignore
├── README.md
└── LICENSE
```

---

## 🚀 Deployment Flow (Step-by-Step)

### Step 1️⃣ Clone Repository

```bash
git clone <your-repo-url>
cd netflix-devops-project
```

---

### Step 2️⃣ Configure Environment Variables

```bash
cp .env.example .env
```

Edit `.env`:

```env
TMDB_V3_API_KEY=your_tmdb_api_key_here
```

---

### Step 3️⃣ Install Jenkins

```bash
cd scripts
bash install-jenkins.sh
```

Access Jenkins:

```
http://<jenkins-server-ip>:8080
```

---

### Step 4️⃣ Install Docker

```bash
bash install-docker.sh
```

---

### Step 5️⃣ Install Trivy (Security Scanning)

```bash
bash install-trivy.sh
```

---

### Step 6️⃣ Install Monitoring Stack

```bash
bash install-prometheus.sh
bash install-node-exporter.sh
bash install-grafana.sh
```

Access:

* Prometheus → `http://<server-ip>:9090`
* Grafana → `http://<server-ip>:3000`

---

### Step 7️⃣ Run SonarQube

```bash
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
```

Access:

```
http://<server-ip>:9000
```

---

### Step 8️⃣ Configure Jenkins Pipeline

* Create a **Pipeline job** in Jenkins
* Use the pipeline definition from:

```
jenkins/Jenkinsfile
```

Pipeline stages include:

* SonarQube analysis
* OWASP dependency scan
* Trivy filesystem scan
* Docker image build & scan
* Docker image push
* Kubernetes deployment
* Email notifications

---

### Step 9️⃣ Build & Deploy (via Jenkins)

Trigger the Jenkins pipeline.

The pipeline will:

* Build Docker image using `docker/Dockerfile`
* Push image to Docker Hub
* Deploy container for validation
* Deploy application to Kubernetes

---

### Step 🔟 Setup Kubernetes Cluster

```bash
bash setup-k8s.sh
```

---

### Step 1️⃣1️⃣ Deploy to Kubernetes

Executed automatically by Jenkins using:

```bash
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

---

### Step 1️⃣2️⃣ Access Application

```
http://<kubernetes-node-ip>:<service-port>
```

---

## 🔐 Security Integrated in CI/CD

Security checks are enforced **inside the pipeline**:

* SonarQube Quality Gates
* OWASP Dependency-Check
* Trivy filesystem scan
* Trivy Docker image scan

---

## 📊 Monitoring Coverage

* Jenkins metrics via Prometheus plugin
* Node metrics via Node Exporter
* Kubernetes node metrics
* Grafana dashboards for visualization

---

## 🎯 What This Project Demonstrates

* End-to-end DevSecOps ownership
* CI/CD automation with security
* Docker & Kubernetes production flow
* Monitoring as a first-class component
* Clean, scalable repository structure

---

## 👨‍💻 Author

**Harshal **
DevOps | Cloud | CI/CD | Security | Monitoring

* GitHub: [https://github.com/harshal019](https://github.com/harshal019)
* LinkedIn: [www.linkedin.com/in/harshalgharat01/](https://www.linkedin.com/in/harshalgharat01/)

---

## ⭐ Support

If this project helped you understand **real-world DevSecOps**, please ⭐ **star the repository**.

---


