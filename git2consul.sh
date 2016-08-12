#!/bin/bash
# Author: TianChi
# Date: 2016-08-11
# Desc: scrips to sync git project certain dir to consul k/v store, also support git branch for Configuration Management only for Prod
# Requirements: run under pwd; only run for Prod purpose 
git2consul --endpoint mesos-master --port 8500 --config-file ./git2consul-nodejs-demo.json -n

# next sprint to-do list
# Put this git2consul logic to jenkins jobs, introduce git2consul-template to produce config json file internally
# Embracinig dev-ops culture, buiness dev just own their server desc "service.json" when deploying to Prod Env; no need for dev/test purpose
# For tracing config changes,
