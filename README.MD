# Safe Environmental Envelopes of Discrete Systems

This repository contains a tool for calculating transition-based robustness of discrete systems.
This tool is the artifact for the paper "Safe Environmental Envelopes of Discrete Systems", accepted to CAV'23.


## Structure and Content

This project contains the following folders:
- bin: contains the executable jar for our tool, LTS-Robustness.jar.
- benchmarks: contains the case studies from our paper, as well as scripts to run them.
- robustifier: contains the source files we used to build this project.


## Set Up

### Set up from OVA file
Install VirtualBox.
Open SafeEnvEnvelopes.ova with VirtualBox.
Once the desktop appears, open the terminal, and change the directory to “transitional-robustness-main”.
You are now in the project’s root folder.
No more set up is required; we have already built the tool and packaged it into bin/LTS-Robustness.jar.

### Local set up from git
Clone this repository to your local machine.
No more set up is required; we have already built the tool and packaged it into bin/LTS-Robustness.jar.


## System Requirements

### Java Version
Our tool requires Java version >= 11. We have tested the tool under two different Java environments:
```
openjdk 11.0.18 2023-01-17
OpenJDK Runtime Environment (build 11.0.18+10-post-Ubuntu-0ubuntu122.04)
OpenJDK 64-Bit Server VM (build 11.0.18+10-post-Ubuntu-0ubuntu122.04, mixed mode, sharing)
```
and
```
java 18.0.2.1 2022-08-18
Java(TM) SE Runtime Environment (build 18.0.2.1+1-1)
Java HotSpot(TM) 64-Bit Server VM (build 18.0.2.1+1-1, mixed mode, sharing)
```

### Resource Requirements
4 (virtual) cores, 6GB RAM, and 25 GB hard drive.


## Replicating Results from the Paper

### Instructions
We have provided two shell scripts for replicating the results from Table 1 in the paper.
Both scripts are located in the benchmarks/ folder:
```
cd benchmarks
```
To run Algorithm 1 with our heuristic ("Wall Heur" in Table 1):
```
./run_heur.sh
```
To run Algorithm 1 without the heuristic ("Wall Plain" in Table 1):
```
./run_plain.sh
```

### Sample
Here is a sample for the expected result from running Algorithm 1 with our heuristic:
```
$ ./run_heur.sh
~/Documents/CMU/tolerance-permissiveness/LTS-Robustness/benchmarks/running_example ~/Documents/CMU/tolerance-permissiveness/LTS-Robustness/benchmarks

Running Example
---------------
time java -jar ../../bin/LTS-Robustness.jar --verbose --env env.lts --ctrl ctrl.lts --prop p.lts --largest-delta-size
WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
# states in E: 4
# states in C: 2
# states in P: 4
#alpha: 2
#W: 6
#delta: 3
Size of largest delta element: 13

real	0m0.396s
user	0m0.560s
sys	0m0.058s

~/Documents/CMU/tolerance-permissiveness/LTS-Robustness/benchmarks
~/Documents/CMU/tolerance-permissiveness/LTS-Robustness/benchmarks/therac25 ~/Documents/CMU/tolerance-permissiveness/LTS-Robustness/benchmarks
.
.
.
```

The output above is a "sample" because there will be more output (from running the rest of the benchmarks).
From top to bottom, here is how to interpret the output:
- The script is changing directories to running_example.
- The script is now calculating robustness for the benchmark "Running Example".
- The script is executing the tool using the command: "time java -jar ../../bin/LTS-Robustness.jar --verbose --env env.lts --ctrl ctrl.lts --prop p.lts --largest-delta-size".
- The tool detects 4 states in the environment, 2 states in the controller, and 4 states in the safety property.
- The tool detects 2 actions between all FSP inputs.
- The size of the winning set is 6.
- After calculating robustness, the size of delta is 3, and the largest maximal robust deviation has size 13.
- The wall time for the tool is 0.396 seconds ("real" indicates wall time).
- The script is changing to the therac25 directory to continue running.


## Using the Tool

### Help Menu
We provide a help menu for the tool.
Here is the result of printing the help menu from the root directory of this project:
```
$ java -jar bin/LTS-Robustness.jar --help
Usage: tolerance-app [OPTIONS]

Options:
  --env TEXT            FSP file for the environment.
  --ctrl TEXT           FSP file for the controller.
  --prop TEXT           FSP file for the property.
  --env-prop TEXT       FSP file for an environment property. This arg is
                        allowed multiple times.
  --bf                  Will run brute-force version of the algorithm.
  --naive-bf            Will run naive brute-force version of the algorithm.
  --rand                Will run randomized version of the algorithm.
  --rand-iters INT      Number of iterations to run in randomized mode.
  --silent              Will not print results to stdout. Mutually exclusive
                        with verbose mode.
  --print-dot           Print the contents of delta in DOT format. Default is
                        set format.
  --print-fsp           Print the contents of delta in FSP format. Default is
                        set format.
  --largest-delta-size  Print the size of the largest element of delta.
  --num-print INT       Number of items in delta to print. Default is 3.
  --verbose             Prints extra information about the run, including |W|.
                        Mutually exclusive with silent mode.
  --compare-ctrl        Compares the robustness of two controllers. Mutually
                        exclusive with property comparison.
  --compare-prop        Compares the robustness w/respect to two properties.
                        Mutually exclusive with controller comparison.
  -h, --help            Show this message and exit
```
By default, the tool uses Algorithm 1 with our heuristic to compute robustness.
The "--bf" option will use the "plain" version of Algorithm 1 to calculate robustness.

### Basic Usage
In this section we will show to to calculate robustness for a controller ctrl.lts, environment env.lts, and safety property p.lts.
The .lts extension indicates that the file contains a valid [FSP](https://www.doc.ic.ac.uk/~jnm/LTSdocumention/FSP-notation.html) program.
FSP is the language used to specify automaton in [LTSA](https://www.doc.ic.ac.uk/ltsa/).

To calculate robustness for a ctrl.lts, env.lts, and p.lts, use the following command:
```
$ java -jar bin/LTS-Robustness.jar --ctrl ctrl.lts --env env.lts --prop p.lts
```

It is also possible to add one or more environment properties (denoted as P_env in the paper).
For example, if we want to include (the conjunction of) two environment properties envp1.lts and envp2.lts, then we use the following command:
```
$ java -jar bin/LTS-Robustness.jar --ctrl ctrl.lts --env env.lts --prop p.lts --env-prop envp1.lts --env-prop envp2.lts
```

By default, the tool displays robustness in a set format.
The tool can also display robustness using DOT and FSP format, using the --print-dot and --print-fsp flags respectively.
The tool can also print the size of the largest maximal robust deviation using the flag --largest-delta-size.

The tool can also be used to compare robustness between controllers and properties.
For example, if we want to compare the robustness of ctrl.lts to the robustness of a different controller ctrl2.lts, then we could use the following command:
```
$ java -jar bin/LTS-Robustness.jar --ctrl ctrl.lts --env env.lts --prop p.lts --ctrl ctrl2.lts --compare-ctrl
```

### Therac-25 Example
In this section we will provide an example of how to manually run the Therac-25 case study, including comparing its robustness to the Therac-20.
To compute the robustness of the Therac-25, begin by changing to the Therac-25 benchmark directory.
From the root directory:
```
cd benchmarks/therac25
```

The following example calculates robustness for the Therac-25:
```
$ java -jar ../../bin/LTS-Robustness.jar --env env_safe.lts --ctrl sys.lts --prop p.lts --env-prop envp_term.lts
WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
#delta: 4
  {(2, b, 3), (0, e, 1), (0, e, 3), (0, enter, 0), (0, enter, 3), (1, enter, 1), (1, enter, 2), (1, enter, 3), (2, enter, 1), (2, enter, 2), (2, enter, 3), (0, up, 0), (0, up, 3), (1, up, 1), (1, up, 3), (2, up, 1), (2, up, 3), (0, x, 1), (0, x, 3)}
  {(2, b, 3), (0, e, 1), (0, e, 3), (1, e, 1), (1, e, 3), (0, enter, 0), (0, enter, 3), (1, enter, 2), (1, enter, 3), (2, enter, 2), (2, enter, 3), (0, up, 0), (0, up, 3), (1, up, 1), (1, up, 3), (2, up, 1), (2, up, 3), (0, x, 1), (0, x, 3), (1, x, 3)}
  {(2, b, 3), (0, e, 1), (0, e, 3), (0, enter, 3), (1, enter, 1), (1, enter, 2), (1, enter, 3), (2, enter, 1), (2, enter, 2), (2, enter, 3), (0, up, 0), (0, up, 3), (1, up, 1), (1, up, 3), (2, up, 1), (2, up, 3), (0, x, 0), (0, x, 1), (0, x, 3)}
```
The output indicates that there are are four maximal robust deviations in delta; the tool displays three of them in set format.
The tool can display all four maximal robust deviations (use --num-print) and can display each deviation in a different format (use --print-dot or --print-fsp).

The following example compares robustness between the Therac-25 against the Therac-20:
```
$ java -jar ../../bin/LTS-Robustness.jar --env env_safe.lts --ctrl sys.lts --prop p.lts --env-prop envp_term.lts --ctrl sys_interlock.lts --compare-ctrl
WARNING: sun.reflect.Reflection.getCallerClass is not supported. This will impact performance.
Comparison result: delta1 strictly LESS robust than delta2
```
This output matches the results from section 6.2 in our paper.


## Code Dependencies

This project depends on the Automatalib project.
We use version 0.10.0 of Automatalib which can be verified with the following command:
```
$ grep -A 2 'automatalib' robustifier/pom.xml
```

This is the latest version of Automatalib as of 4/26/2023, which can be verified [here](https://github.com/LearnLib/automatalib/releases).


## Source Code Highlights

### Algorithm 1 -- Plain
The implementation can be found at robustifier/src/main/kotlin/cmu/isr/tolerance/delta/DeltaDFS.kt.
The following table summarizes the correspondence between the source for the implementation and Algorithm 1 in the paper:

| Description | Line number in source code | Line number in Algorithm 1 |
| ----- | ---- | ---- |
| create meta-system F | 25 | 2 |
| create winning set W | 36 | 4 |
| for each subset of W | 50,79 | 5 |
| create del | 68 | 7 |

### Algorithm 1 -- Heuristic
The implementation can be found at robustifier/src/main/kotlin/cmu/isr/tolerance/delta/DeltaDFSEnvProp.kt.
The following table summarizes the correspondence between the source for the implementation and Algorithm 1 in the paper:

| Description | Line number in source code | Line number in Algorithm 1 |
| ----- | ---- | ---- |
| create meta-system F | 34 | 2 |
| create winning set W | 45 | 4 |
| DFS over W | 81,108,118 | NA |
| create del | 98 | 7 |
