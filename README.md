# DevOps SRE Platform Lab

A beginner-friendly project for learning and explaining the main skills from a DevOps Engineer / Site Reliability Engineer job description.

This project is designed for interview preparation. It gives you one clear story:

> I built a small platform project that uses AWS infrastructure as code, Ansible configuration management, GitHub Actions CI/CD, Linux automation scripts, monitoring checks, and incident documentation. I also published the project documentation as a GitHub Pages site.

---

## 1. What this project is

This is a **DevOps/SRE learning project**.

It has two parts:

1. **A GitHub Pages website**
   - This is a static website under the `docs/` folder.
   - It shows the project overview, architecture, health checks, incident process, and interview talking points.
   - It can be hosted for free using GitHub Pages.

2. **A platform/infrastructure lab**
   - `cloudformation/` contains AWS infrastructure as code.
   - `ansible/` contains configuration management for a Linux web server.
   - `scripts/` contains Python, Bash, and PowerShell automation examples.
   - `.github/workflows/` contains CI/CD pipelines.
   - `runbooks/` contains operational support and incident notes.

You can show this repository in an interview and explain how each folder maps to the job description.

---

## 2. Job description mapping

| Job requirement | Where this project shows it | Simple meaning |
|---|---|---|
| AWS cloud infrastructure | `cloudformation/platform.yml` | Creates cloud resources using code |
| Infrastructure as Code | `cloudformation/platform.yml` | Infrastructure is written in a file, not clicked manually |
| CloudFormation | `cloudformation/platform.yml` | AWS reads the template and creates resources |
| Ansible configuration management | `ansible/playbooks/webserver.yml` | Makes sure a server is configured correctly |
| Linux administration | `scripts/linux_troubleshooting.sh` and Ansible tasks | Checks services, disk, memory, logs, and web server status |
| CI/CD pipelines | `.github/workflows/ci.yml` and `.github/workflows/pages.yml` | Automatically checks and deploys code |
| Python scripting | `scripts/health_check.py` | Checks if a website is healthy |
| Bash scripting | `scripts/deploy-stack.sh`, `scripts/delete-stack.sh` | Automates AWS deployment and cleanup |
| PowerShell scripting | `scripts/windows_iis_healthcheck.ps1` | Shows basic Windows Server operational checks |
| Git and code review | Branching workflow described below | Code is versioned and changed through pull requests |
| Monitoring and alerting | CloudWatch alarm in CloudFormation and health check script | Detects problems early |
| Incident resolution and RCA | `runbooks/incident-response.md` and `runbooks/root-cause-analysis-template.md` | Explains how to handle production issues |
| Documentation and standards | This README and `docs/` website | Makes the platform easier for teams to use |

---

## 3. Architecture in simple words

Think of this project like a small restaurant.

- **AWS** is the building where the restaurant runs.
- **CloudFormation** is the blueprint used to build the restaurant.
- **Ansible** is the checklist used to set up the kitchen the same way every time.
- **GitHub** is the notebook where every change is stored.
- **GitHub Actions** is the automatic worker that checks and publishes your changes.
- **Monitoring** is the smoke alarm that warns you when something is wrong.
- **Runbooks** are instruction sheets that explain what to do during problems.

---

## 4. Folder structure

```text
devops-sre-platform-lab/
├── .github/workflows/
│   ├── ci.yml
│   └── pages.yml
├── ansible/
│   ├── ansible.cfg
│   ├── group_vars/webservers.yml
│   ├── inventory/example.ini
│   └── playbooks/webserver.yml
├── cloudformation/
│   └── platform.yml
├── docs/
│   ├── index.html
│   └── assets/
│       ├── script.js
│       └── style.css
├── runbooks/
│   ├── incident-response.md
│   └── root-cause-analysis-template.md
├── scripts/
│   ├── delete-stack.sh
│   ├── deploy-stack.sh
│   ├── health_check.py
│   ├── linux_troubleshooting.sh
│   └── windows_iis_healthcheck.ps1
└── README.md
```

---

## 5. What each part does in layman terms

### 5.1 `docs/` — GitHub Pages website

This is the public website for the project.

It is only HTML, CSS, and JavaScript. GitHub Pages can host this easily because it is a static site.

In real companies, DevOps teams often maintain platform documentation. This part proves that you can document a system clearly.

Interview explanation:

> I created a static platform documentation site and deployed it using GitHub Pages and GitHub Actions. This shows CI/CD, documentation, and Git-based deployment.

---

### 5.2 `cloudformation/platform.yml` — AWS infrastructure

This file describes AWS resources using YAML.

It creates:

- A VPC
- Public subnets
- Internet gateway
- Route table
- Security group
- IAM role for Systems Manager
- EC2 Linux server
- CloudWatch alarm for EC2 status check failure

Simple meaning:

Instead of manually clicking buttons in AWS, you write the desired setup in a file. AWS then creates it for you.

Interview explanation:

> I used AWS CloudFormation to define infrastructure as code. This makes the environment repeatable, reviewable, and easier to manage safely.

Important cost note:

This template creates AWS resources. Use a test AWS account and delete the stack after practice.

---

### 5.3 `ansible/` — configuration management

Ansible connects to a server and makes sure it is configured correctly.

This project uses Ansible to:

- Install Nginx
- Start and enable the web service
- Copy the static website files to the server
- Add a simple health page

Simple meaning:

CloudFormation creates the server. Ansible prepares the server.

Interview explanation:

> I used Ansible to configure Linux servers consistently. This avoids manual setup mistakes and helps support repeatable environments.

---

### 5.4 `.github/workflows/ci.yml` — CI checks

This workflow runs when code is pushed or a pull request is opened.

It checks:

- Python script syntax
- CloudFormation template formatting with `cfn-lint`
- Ansible playbook style with `ansible-lint`
- Shell scripts with `shellcheck`

Simple meaning:

Before a change is merged, the robot checks if obvious mistakes exist.

Interview explanation:

> I added CI checks so that infrastructure and automation code is validated before it is merged. This improves quality and reduces production risk.

---

### 5.5 `.github/workflows/pages.yml` — deployment pipeline

This workflow publishes the `docs/` folder to GitHub Pages.

Simple meaning:

When you push changes to `main`, GitHub automatically publishes the website.

Interview explanation:

> I built a deployment pipeline using GitHub Actions. The pipeline publishes the project documentation automatically after changes are merged.

---

### 5.6 `scripts/health_check.py` — Python automation

This script checks if a website is responding.

Example:

```bash
python3 scripts/health_check.py https://example.com
```

It returns:

- HTTP status code
- Response time
- Success or failure

Simple meaning:

It is like asking, “Is the website alive, and did it reply quickly?”

Interview explanation:

> I wrote a Python health check script to test service availability and response time. This is useful in monitoring and troubleshooting.

---

### 5.7 `scripts/linux_troubleshooting.sh` — Linux support

This script collects common Linux troubleshooting information:

- Hostname
- Uptime
- Disk usage
- Memory usage
- Running services
- Nginx status
- Recent logs

Simple meaning:

When a server has a problem, this script gathers the first information an engineer needs.

Interview explanation:

> I created a Linux troubleshooting script to speed up incident investigation and collect basic system health information.

---

### 5.8 `scripts/windows_iis_healthcheck.ps1` — Windows example

The job description says there may be some Windows Server work.

This PowerShell script checks:

- Windows service status
- IIS website status if IIS is installed
- Basic system information

Simple meaning:

It shows that you understand operational scripting on Windows too.

Interview explanation:

> Although my main experience is Linux, I included a PowerShell script to show how I would approach Windows Server health checks.

---

### 5.9 `runbooks/` — incident and RCA documentation

Runbooks explain what to do when something breaks.

This project includes:

- Incident response steps
- Root cause analysis template

Simple meaning:

When there is a production issue, you do not panic. You follow a clear process.

Interview explanation:

> I documented incident response and RCA steps. This supports SRE practices like reliability, ownership, and continuous improvement.

---

## 6. How to run locally

### Open the static website locally

```bash
cd docs
python3 -m http.server 8000
```

Then open:

```text
http://localhost:8000
```

### Run the Python health check

```bash
python3 scripts/health_check.py http://localhost:8000
```

### Run the Linux troubleshooting script

```bash
bash scripts/linux_troubleshooting.sh
```

---

## 7. How to deploy to GitHub Pages

### Step 1: Create a GitHub repository

Create a new repository in GitHub, for example:

```text
devops-sre-platform-lab
```

### Step 2: Push this project

```bash
git init
git add .
git commit -m "Initial DevOps SRE platform lab"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/devops-sre-platform-lab.git
git push -u origin main
```

Replace `YOUR_USERNAME` with your GitHub username.

### Step 3: Enable GitHub Pages

In GitHub:

1. Open your repository.
2. Go to **Settings**.
3. Go to **Pages**.
4. Under **Build and deployment**, choose **GitHub Actions**.
5. Save if needed.

### Step 4: Wait for the workflow

Go to the **Actions** tab.

You should see the `Deploy GitHub Pages site` workflow running.

When it finishes, GitHub will give you a site link like:

```text
https://YOUR_USERNAME.github.io/devops-sre-platform-lab/
```

---

## 8. Optional AWS deployment

Only do this if you have an AWS test account and understand that AWS resources can cost money.

### Prerequisites

Install and configure:

- AWS CLI
- An AWS IAM user or role with CloudFormation, EC2, IAM, and CloudWatch permissions

Check your AWS identity:

```bash
aws sts get-caller-identity
```

### Deploy stack

```bash
bash scripts/deploy-stack.sh
```

### Delete stack after testing

```bash
bash scripts/delete-stack.sh
```

---

## 9. Git workflow for interview explanation

A simple professional workflow:

1. Create a branch:

```bash
git checkout -b feature/add-health-check
```

2. Make changes.

3. Commit changes:

```bash
git add .
git commit -m "Add website health check script"
```

4. Push branch:

```bash
git push origin feature/add-health-check
```

5. Open a pull request.

6. Let CI checks run.

7. Review and merge into `main`.

Simple interview answer:

> I follow a branch-based Git workflow. I make changes in a feature branch, open a pull request, let CI checks run, review the change, and then merge it to main. This protects the main branch and improves code quality.

---

## 10. Interview story using STAR method

### Situation

I wanted to build a practical DevOps/SRE project that covers cloud infrastructure, automation, CI/CD, monitoring, and operational support.

### Task

My goal was to create a small but complete platform lab that could be version-controlled, deployed automatically, and explained clearly in an interview.

### Action

I created an AWS CloudFormation template for infrastructure, Ansible playbooks for server configuration, GitHub Actions pipelines for CI/CD, Python and Bash scripts for health checks and troubleshooting, and runbooks for incident response and root cause analysis.

### Result

The project gave me hands-on practice with DevOps and SRE responsibilities. It also gave me a clear example to explain infrastructure as code, automation, CI/CD, monitoring, and production support during interviews.

---

## 11. Good interview questions this project helps answer

### Q1. What AWS services have you used in this project?

I used EC2 for the Linux server, VPC and subnets for networking, Security Groups for firewall rules, IAM for permissions, Systems Manager for secure server access, and CloudWatch for monitoring.

### Q2. What is CloudFormation?

CloudFormation is AWS infrastructure as code. It lets me write AWS resources in a YAML file and deploy them in a repeatable way.

### Q3. What is Ansible?

Ansible is a configuration management tool. It connects to servers and applies setup steps like installing packages, copying files, and starting services.

### Q4. What is CI/CD?

CI means checking code automatically when changes are made. CD means deploying code automatically after checks pass.

### Q5. How do you troubleshoot production issues?

I first check impact, logs, service status, resource usage, and recent changes. Then I restore service, communicate updates, and write a root cause analysis afterwards.

### Q6. How does this project show SRE thinking?

It includes health checks, monitoring, incident response, RCA, automation, and repeatable infrastructure. These all support reliability and operational excellence.

---

## 12. How to extend this project

To make this project stronger later, you can add:

- Load balancer
- Auto Scaling Group
- RDS database
- CloudWatch dashboard
- SNS email alerting
- Docker container
- Terraform version
- GitLab CI version
- Blue/green deployment example
- More production-style runbooks

---

## 13. Final interview summary

You can say:

> I built a DevOps/SRE platform lab to practise the main skills required for this role. The project includes AWS CloudFormation for infrastructure as code, Ansible for configuration management, GitHub Actions for CI/CD, Linux and Windows automation scripts, monitoring checks, and incident response documentation. I also deployed the project documentation using GitHub Pages, so the whole project is version-controlled and automatically published from GitHub.
