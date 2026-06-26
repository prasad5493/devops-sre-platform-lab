# DevOps SRE Platform Lab

This is a small DevOps/SRE learning project created by Prasad Bhor.

The project covers:

- AWS EC2
- AWS CloudFormation
- Linux server setup
- Nginx web server
- GitHub Actions
- GitHub Pages
- Basic health check script
- Monitoring and runbook documentation

## What this project does

This project creates a simple web server on AWS using CloudFormation.

The server runs Linux and uses Nginx to show a basic web page.

I also created a GitHub Pages site to explain the project and show evidence such as screenshots.

## Why I made this project

I made this project to show how DevOps works in a more practical way. Instead of only reading about AWS, CI/CD, Linux, and monitoring, I wanted to build a small project where I could actually show how these concepts are used in real time.

## Main folders

cloudformation/   AWS infrastructure template
scripts/          Small automation and health check scripts
docs/             GitHub Pages website
ansible/          Example Ansible configuration
runbooks/         Support and incident notes

## How I tested it

I tested the website locally first using Git Bash:

python -m http.server 8000 -d docs

Then I opened this URL in my browser:

http://localhost:8000

After that I deployed the AWS CloudFormation stack and confirmed that the EC2 website was working in the browser. Once testing was complete, I deleted the AWS resources to avoid unnecessary cost.

