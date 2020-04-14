#!/bin/bash

kubectl create ns spark-operator
kubectl apply -f https://raw.githubusercontent.com/TommyLike/spark-operator-volcano-demo/master/hack/spark-operator-crds/sparkoperator.k8s.io_sparkapplications.yaml
kubectl apply -f https://raw.githubusercontent.com/TommyLike/spark-operator-volcano-demo/master/hack/spark-operator-crds/sparkoperator.k8s.io_scheduledsparkapplications.yaml
helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
helm install --generate-name incubator/sparkoperator --namespace spark-operator --set enableBatchScheduler=true --version 0.3.1 --set operatorImageName=tommylike/spark-operator --set operatorVersion=0.0.5 --set enableWebhook=true
kubectl create serviceaccount --namespace default spark
kubectl create clusterrolebinding spark-cluster-rule --clusterrole=cluster-admin --serviceaccount=default:spark
