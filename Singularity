Bootstrap: docker
From: ubuntu:16.04

## Bootstrapping from Docker is faster, but if you want
## to install a vanilla Ubuntu decomment these lines
#BootStrap: debootstrap
#OSVersion: xenial
#MirrorURL: http://us.archive.ubuntu.com/ubuntu/

%labels
    Maintainer secli.matteo@gmail.com
    Version 0.1

%runscript
    exec runhelper "$@"

%setup
    cp runhelper $SINGULARITY_ROOTFS/usr/bin/runhelper
    cp quantum-espresso* $SINGULARITY_ROOTFS/home/

%post
    export DEBIAN_FRONTEND=noninteractive
    echo "Creating qe user..."
    useradd -m -s /bin/bash qe
    passwd -d qe
    echo "Installing Quantum ESPRESSO and dependencies..."
    apt-get -y -qq update
    apt-get -y -qq install wget jq
    chmod +x /usr/bin/runhelper
    cd /home/qe
    wget -q http://people.sissa.it/~inno/qe/qe.tgz && tar xvzf qe.tgz && rm pw.x qe.tgz
    apt-get -y -qq install libgfortran3 liblapack3 libblas3 openmpi-bin
    apt-get -y -qq clean
    dpkg -i /home/quantum-espresso*
    rm /home/quantum-espresso*
    apt-get -y -qq install -f
    apt-get -y -qq clean
    echo "To run, ./qe.img pw.x -in relax.in"

%test
    echo "Running a simple test..."
    cd /home/qe
    pw.x -in relax.in
    rm -r pwscf.save pwscf.wfc1
