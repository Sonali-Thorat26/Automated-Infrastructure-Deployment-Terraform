#!/bin/bash

cd /home/ubuntu/cloud1

echo " i am in that folder"

terraform init

echo " initailised"


terraform apply -auto-approve

echo "done"
