#!/bin/bash
sudo yum install -y prometheus
sudo systemctl start prometheus
sudo systemctl enable prometheus
