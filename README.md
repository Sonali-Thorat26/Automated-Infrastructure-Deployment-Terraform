🚀 Automated Infrastructure Deployment using Shell Scripting & Cron Jobs
📖 Overview
This project automates cloud infrastructure deployment using Shell scripting and Terraform. It leverages cron jobs to schedule infrastructure provisioning and updates at specific intervals, minimizing manual effort. The system also includes logging and monitoring mechanisms to track execution results and troubleshoot failures.

🎯 Objectives
Automate infrastructure deployment on AWS
Schedule tasks using cron jobs
Reduce manual intervention in DevOps processes
Implement logging for monitoring and debugging

🛠️ Technologies Used
Linux
Shell Scripting (Bash)
Cron Jobs
Terraform
AWS

⚙️ Features
Automated execution of Terraform scripts
Scheduled deployments using cron jobs
Logging system for tracking execution
Error handling and failure monitoring
Infrastructure provisioning on AWS

⚙️ Setup Instructions
Step-by-step:
1.Clone the repository git clone https://github.com/Sonali-Thorat26/Automated-Infrastructure-Deployment-Terraform.git
2.Navigate to the project folder cd automated-infrastructure-deployment
3.Install Terraform
4.Configure AWS credentials aws configure
5.Run deployment script ./scripts/deploy.sh

⏰ Cron Job Setup
Show how to schedule: crontab -e

Run deployment every day at 2 AM
0 2 * * * /home/ubuntu/main.sh >> /home/ubuntu/new1.log

📊 Logging & Monitoring
Explain briefly: Logs are stored in the logs/ directory. 
Each execution records success/failure status and timestamps.
