#!/bin/sh

read -p "Enter the cluster Name: " cluster_name
KIND_CLUSTER_NAME=$cluster_name
KIND_NODE_VERSION=v1.23.12

reg_name='kind-registry'
reg_port='5001'

mkdir -p out
