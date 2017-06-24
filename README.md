# Quantum ESPRESSO – Singularity container

This repository contains all the files necessary to create a [Singularity](http://singularity.lbl.gov/) container for [Quantum ESPRESSO](https://github.com/QEF/q-e).


## Quick start

- Install Singularity
	- Linux: http://singularity.lbl.gov/install-linux
	- Mac: http://singularity.lbl.gov/install-mac
- Pull the image:

		singularity pull --name qe.img shub://matteosecli/qe-singularity
		
- Alternatively, clone this repo and build the image:

		git clone https://github.com/matteosecli/qe-singularity.git && cd qe-singularity && ./createimage.sh

- Run `./qe.img --help` for further instructions or take a look at the [Usage](#usage) section below.


## Usage

- To run a Quantum ESPRESSO executable, e.g. `pw.x`, use:

		./qe.img pw.x -in relax.in | tee relax.out
		
- To run an MPI calculation with `mpirun`, use:

		mpirun -np 4 ./qe.img pw.x -in relax.in | tee relax.out
	if you have, e.g. 4 processors. Note that the command

		./qe.img mpirun -np 4 pw.x -in relax.in | tee relax.out
	will run through the `mpirun` binary inside the container, not the local one on your machine.
    
- To access an interactive Bash shell inside the container, use:

		singularity shell qe.img
	A testcase is available in `/home/qe`. You can run it via:

		cd /home/qe && pw.x -in relax.in

- To run an automated test in order to check that the container works properly, run

		singularity test qe.img
    
- To access this help message, use:

		./qe.img --help
	`-help` or nothing at all are also valid.

---

Still not convinced it's easy enough? Watch the video below:

[![asciicast](https://asciinema.org/a/126122.png)](https://asciinema.org/a/126122)


## TODO

- [x] Link to Singularity Hub to make installation easier
- [x] Write a better doc
- [ ] Cleanup and comment the Singularity file
- [ ] Cleanup the help file
- [ ] Use QE v6.1 instead of v6.0
- [ ] Build directly in the container (?)
- [ ] Use OpenMPI 2.1.1 and try to use host MPI libraries as much as possible (see http://singularity.lbl.gov/docs-hpc, http://singularity.lbl.gov/tutorial-gpu-drivers-open-mpi-mtls and https://www.open-mpi.org/software/ompi/v2.1/)
