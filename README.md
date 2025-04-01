# DUNE Simulator

A Docker-based environment for running DUNE (Unified Navigational Environment) simulations for autonomous underwater vehicles.

## Overview

This project provides a containerized setup for running DUNE simulators for underwater vehicle systems like LAUV (Light Autonomous Underwater Vehicles) and Manta. It uses DUNE version 2024.03.00 as the simulation engine.

## Requirements

- Docker
- Bash shell
- DUNE package (included as `dune-2024.03.00-x86-64bit-linux-glibc-gcc114-OMST.tar.bz2`)

## Usage

There are several scripts available for running different simulation configurations:

### Single LAUV Simulator

To run a single LAUV simulator:

```bash
./sim_lauv.sh
```

This script builds the Docker image and runs two simulator instances:
- A LAUV simulator with ID "lauv-simulator-1"
- A Manta OMST simulator with ID "manta-omst-3"

All running simulator containers are stopped when the script completes.

### Gateway Simulator

To run a Manta gateway simulator:

```bash
./sim_gateway.sh
```

This script runs a simulator with the "manta-gateway" system name using the "manta-omst-3" configuration.

### Multiple Simulators

To run multiple LAUV simulators at once:

```bash
./many_simulators.sh <Number of Simulators>
```

For example:
```bash
./many_simulators.sh 5
```

This will start:
- 5 LAUV simulator instances (lauv-simulator-1 through lauv-simulator-5)
- 1 Manta OMST simulator

All running simulator containers are stopped when the script completes.

## Docker Configuration

The simulator is based on Ubuntu 22.04 and runs the DUNE executable with specified system names and configurations. The Dockerfile sets up the environment and the DUNE software is extracted from the included tarball.

## File Structure

- `Dockerfile` - Defines the simulator container environment
- `dune-2024.03.00-x86-64bit-linux-glibc-gcc114-OMST.tar.bz2` - DUNE software package
- `sim_lauv.sh` - Script to run LAUV simulator
- `sim_gateway.sh` - Script to run Manta gateway simulator
- `many_simulators.sh` - Script to run multiple simulator instances
