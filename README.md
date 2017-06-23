# Quantum ESPRESSO – Singularity container

This repository contains all the files necessary to create a [Singularity](http://singularity.lbl.gov/) container for [Quantum ESPRESSO](https://github.com/QEF/q-e).

## Quick start
- Install Singularity: http://singularity.lbl.gov/install-linux
- Clone this repo and build the image:
```
git clone https://github.com/matteosecli/qe-singularity.git && cd qe-singularity && ./createimage.sh
```
- Run `./qe.img --help` for further instructions.

## TODO
- Link to Singularity Hub to make installation easier
- Write a better doc
- Cleanup the help file
- Use QE v6.1 instead of v6.0
- Build directly in the container?
- Use OpenMPI 2.1.1 and try to use host MPI libraries as much as possible (see http://singularity.lbl.gov/docs-hpc, http://singularity.lbl.gov/tutorial-gpu-drivers-open-mpi-mtls and https://www.open-mpi.org/software/ompi/v2.1/)
