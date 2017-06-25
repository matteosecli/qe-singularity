#!/usr/bin/env bash
singularity create --size 500 qe.img
#sudo singularity bootstrap --notest qe.img Singularity
sudo singularity bootstrap qe.img Singularity
