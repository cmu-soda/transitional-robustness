#!/bin/sh

jarfile="../../bin/LTS-Robustness.jar"

echo "Voting wrt. P_cfm"
echo "-----------------"
echo "time timeout 5m java -Xms6g -jar ${jarfile} --verbose --env env.lts --ctrl sys.lts --prop p_cfm.lts --env-prop envp_v.lts --env-prop envp_correct_seq_back.lts --largest-delta-size --bf"
time timeout 5m java -Xms6g -jar "${jarfile}" --verbose --env env.lts --ctrl sys.lts --prop p_cfm.lts --env-prop envp_v.lts --env-prop envp_correct_seq_back.lts --largest-delta-size --bf
echo

echo "Voting wrt. P_all"
echo "-----------------"
echo "time timeout 5m java -Xms6g -jar ${jarfile} --verbose --env env.lts --ctrl sys.lts --prop p_all.lts --env-prop envp_v.lts --env-prop envp_correct_seq_back.lts --largest-delta-size --bf"
time timeout 5m java -Xms6g -jar "${jarfile}" --verbose --env env.lts --ctrl sys.lts --prop p_all.lts --env-prop envp_v.lts --env-prop envp_correct_seq_back.lts --largest-delta-size --bf
echo
