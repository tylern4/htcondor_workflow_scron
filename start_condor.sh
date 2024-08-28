#!/bin/bash


condor_master -f &

sleep 1

tail -f /var/log/condor/*Log