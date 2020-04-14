#!/bin/bash

kubectl apply -f defaultQueue.demo

sleep 5

kubectl apply -f q1.yaml
kubectl apply -f q2.yaml
kubectl apply -f q1.demo
kubectl apply -f q2.demo


sleep 2

kubetl delete -f defaultQueue.demo
