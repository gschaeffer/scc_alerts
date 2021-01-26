#!/bin/bash

# SCC Notifications resources must already be setup (e.g. Topic).

NAME=scc_notification_handler
ENTRY_POINT=scc_notification_handler
LABELS="app=scc_notifications"
MEMORY=256MB
REGION=us-central1
SOURCE_DIR="logger/"
TOPIC=scc_notifications

gcloud functions deploy $NAME \
    --entry-point $ENTRY_POINT \
    --memory $MEMORY \
    --region $REGION \
    --runtime python38 \
    --source $SOURCE_DIR \
    --trigger-topic $TOPIC \
    --update-labels $LABELS \
    --retry 
    