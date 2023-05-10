#!/bin/sh

jarfile="../../bin/LTS-Robustness.jar"

echo "PCA Pump"
echo "--------"
echo "time timeout 5m java -Xms6g -jar ${jarfile} --verbose --env env0.lts --ctrl sys.lts --prop p.lts --env-prop envp_req_order.lts --env-prop envp_line.lts --largest-delta-size --bf"
time timeout 5m java -Xms6g -jar "${jarfile}" --verbose --env env0.lts --ctrl sys.lts --prop p.lts --env-prop envp_req_order.lts --env-prop envp_line.lts --largest-delta-size --bf
echo
