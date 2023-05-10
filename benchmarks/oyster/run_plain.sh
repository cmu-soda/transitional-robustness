#!/bin/sh

jarfile="../../bin/LTS-Robustness.jar"

echo "Oyster"
echo "------"
echo "time timeout 5m java -Xms6g -jar ${jarfile} --verbose --env human.lts --ctrl gates.lts --prop p.lts --env-prop envp_in_then_out.lts --largest-delta-size --bf"
time timeout 5m java -Xms6g -jar "${jarfile}" --verbose --env human.lts --ctrl gates.lts --prop p.lts --env-prop envp_in_then_out.lts --largest-delta-size --bf
echo
