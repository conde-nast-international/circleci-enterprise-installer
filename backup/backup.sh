#!/bin/bash -e

export AWS_DEFAULT_REGION="eu-west-1"

## CLEAN OLD SNAPSHOTS
# get all circleci images
aws ec2 describe-images --filters "Name=tag:service,Values=circleci" > circleci_services_images.json
# get list of the oldest if more than X
# deregister images
# IMAGE_ID="ami-06a70aa2a2f70c764"
# aws ec2 deregister-image --image-id $IMAGE_ID
# delete snapshots of that image
# SNAP_ID="snap-0cabae5434d8e92b5"
# aws ec2 delete-snapshot --snapshot-id $SNAP_ID

## CREATE IMAGE (BACKUP)
# get circleci_services instances
# aws ec2 describe-instances --filters "Name=tag:Name,Values=circleci_services" > circleci_services_instances.json
INSTANCE_ID="i-0e1c3feb30e80075f" # Reservations[0].Instances[0].InstanceId
NAME="circleci-services-automated-test-$(date -u +%Y%m%dT%H%M%SZ)"
# create image with name
# aws ec2 create-image --no-reboot --instance-id $INSTANCE_ID --name $NAME
# tag image
IMAGE_ID="ami-0bbf4e2c092bc60c9"
# aws ec2 create-tags --resources $IMAGE_ID --tags "Key=service,Value=circleci"
