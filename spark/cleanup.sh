#!/bin/bash
kubectl delete sparkapplications pyspark-pi
kubectl delete serviceaccount spark
kubectl delete clusterrolebinding spark-cluster-rule

kubectl delete role spark-role
kubectl delete rolebinding spark-role-binding
k get clusterrolebinding |grep spark|awk {'print $1'} |xargs kubectl delete clusterrolebinding
k get clusterrole |grep spark|awk {'print $1'} |xargs kubectl delete clusterrole

kubectl delete ns spark-operator

kubectl delete crd sparkapplications.sparkoperator.k8s.io
kubectl delete crd scheduledsparkapplications.sparkoperator.k8s.io
