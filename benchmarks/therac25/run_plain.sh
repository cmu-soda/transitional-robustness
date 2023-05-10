#!/bin/sh

jarfile="../../bin/LTS-Robustness.jar"

# therac-25 w/bug
echo "Therac-25 w/bug"
echo "---------------"
echo "time timeout 5m java -Xms6g -jar ${jarfile} --verbose --env env_safe.lts --ctrl sys.lts --prop p.lts --env-prop envp_term.lts --largest-delta-size --bf"
time timeout 5m java -Xms6g -jar "${jarfile}" --verbose --env env_safe.lts --ctrl sys.lts --prop p.lts --env-prop envp_term.lts --largest-delta-size --bf
echo

# therac-25 w/fix
echo "Therac-25 w/fix"
echo "---------------"
echo "time timeout 5m java -Xms6g -jar ${jarfile} --verbose --env env_safe.lts --ctrl sys_fixed.lts --prop p.lts --env-prop envp_term.lts --largest-delta-size --bf"
time timeout 5m java -Xms6g -jar "${jarfile}" --verbose --env env_safe.lts --ctrl sys_fixed.lts --prop p.lts --env-prop envp_term.lts --largest-delta-size --bf
echo

# therac-20
echo "Therac-20"
echo "---------"
echo "time timeout 5m java -Xms6g -jar ${jarfile} --verbose --env env_safe.lts --ctrl sys_interlock.lts --prop p.lts --env-prop envp_term.lts --largest-delta-size --bf"
time timeout 5m java -Xms6g -jar "${jarfile}" --verbose --env env_safe.lts --ctrl sys_interlock.lts --prop p.lts --env-prop envp_term.lts --largest-delta-size --bf
echo
