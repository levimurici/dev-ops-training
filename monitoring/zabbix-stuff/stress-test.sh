#!/bin/bash
for i in {1..10000}; do
  curl 192.168.1.6:3000/alarm/pull
  sleep $1
done
