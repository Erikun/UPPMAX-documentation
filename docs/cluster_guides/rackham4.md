# Rackham4 and Rocky9

!!! info

    - UPPMAX are phasing out the old operating system **CentOS**, that has been installed on all UPPMAX clusters.
    - In the future systems (Pelle and Maja) the Operating System **Rocky9** will be used instead.
    - The transition has started with the Login node ``Rackham4``
    - We are also preparing for building software for several computer architectures; procedures to be used on the future systems.
    - We invite "power users" to test their work here.

!!! warning

    Please inform us of every bug you find, or about missing software.

## About

- The **Rocky9** OS works somewhat differently than **CentOS** and the same "system files" that we had before will not automatically be available directly under Rocky9.
- This will cause some of our earlier installed software to break.
- We hope that we have identified most of them and that you will not notice any changes.

## Modules

- We have added many modules built by the tool EasyBuild.
- Presently they are found in a separate tree.
- [FIX]

## Slurm

- As of today you need to allocate compute nodes with Rocky9 installed with the flag `--res=rocky9`.
    - Not necessary any longer
- Running interactive sessions only work with the `salloc` command.
- [FIX]
