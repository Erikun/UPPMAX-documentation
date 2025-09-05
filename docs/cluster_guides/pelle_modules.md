---
tags:
  - module
  - modules
  - software module
  - software modules
  - lmod
---

# Working with environment modules on Pelle

![Working with a computer cluster module system](./img/627409_working_with_a_computer_cluster_module_system_256_x_256.png)

Here we show how to use the environment module system on Pelle

After describing [the background](#background)/reasoning
why such a system is needed,
we show [how to work with the module system](#working-with-the-module-system).

There is a table of [commonly used shorthand syntaxes](#common-shorthand-syntaxes),
as well as [links](#links) to almost all installed software and databases on UPPMAX.

## Background

Pelle is, like the other clusters Rackham and Bianca, a shared Linux computer with all the standard Linux tools installed,
on which all users should be able to do their work independently and undisturbed.

To ensure this, users cannot modify, upgrade or uninstall research software themselves
and instead an [environment module system](https://lmod.readthedocs.io/en/latest/)
(from now on: 'module system') is used.
This allow users to independently use their favorite versions of their
favorite software.

Using a module system keeps installed software hidden by default,
and users have to explicitly tell their [terminal](../software/terminal.md)
which version of which software they need.

To have new software installed on an UPPMAX cluster,
users must explicitly request a version of a piece of software.
As of today, there are nearly
[800+ programs and packages, with multiple versions](../software/overview.md)
available on the older UPPMAX clusters. So far on Pelle there are about 100.
Using explicit versions of software is easy to do
and improves the reproducibility of the scripts written.

!!! info

    - Pelle is set up with completely new research software installations compared to Rackham (and Bianca).
    - The Module tree therefore looks differently.
    - The installation directories also have another structure compared to Rackham
    - There are fewer software and versions of them comapred to Rackham/Bianca
    - Ask support and we installe specific software and version on demand
    
!!! warning

    There is no **bioinfo-tools** module to load. Instead all software is findable directly.

## Working with the module system

!!! info Overview of module commands

    Command                         |Description
    --------------------------------|--------------------------------------
    `module avail`                  |Search for a module that is available
    `module spider`                 |Search for a module
    `module spider [module]`        |Get info about a module, e.g. `module spider cowsay`
    `module load [module]`          |Load a module, e.g. `module load cowsay`
    `module load [module]/[version]`|Load a module of a specific versions, e.g. `module load cowsay/3.03`
    `module list`                   |List all activated modules
    `module help`                   |Show the help for a module
    `module unload [module]`        |Unload the module `[module]`, e.g. `module unload cowsay`

???- question "What is the difference between `module spider` and `module avail`?"

    - `module spider`: search for an installed module,
      also those that are hidden
    - `module avail`: search for a module that is available to load

Working with the module system means:

- searching for a module
- activating ('loading') a module
- deactivate ('unloading') a module

This section describes these steps in more details.

The `module` command is the basic interface to the module system.

To search for a module, use `module spider [module]`,
for example `module spider cowsay`.


???- question "Would you like to see a video instead?"

    Will come


???- question "What is `cowsay`?"

    See [the UPPMAX page on `cowsay`](../software/cowsay.md)

  
!!!- tip "Getting help on a module"

    Run `module help [module]`, e.g. `module help cowsay`
    to get the general help on a module

To unload a module, do `module unload [module]` (e.g. `module unload cowsay`).
This will also unload module that depend on the unloaded one.
For example, `module unload GATK` will unload GCCcore, Java, Python etcetera.

## Using modules in an executable script

Using modules in an executable script is straightforward:
just load the module needed before using the software in that module.

For example, this is a valid bash script:

```text
#!/bin/bash
module load cowsay/3.04
cowsay hello
```

## Conflicting modules

Sometimes some tools cannot be run together, that is working when another module is loaded. Read about this in the page:

- [Conflicting modules](module_conflicts.md)


## Common shorthand syntaxes

Full command            |Shorthand syntax
------------------------|----------------
`module`                |-
`module avail`          |`ml av`
`module spider`         |`ml spider`
`module load [module]`  |`ml [module]`
`module list`           |`ml`
`module unload [module]`|`ml -[module]`


## Examples

???- question "How does the output of `module spider R` look like?"

    ```bash
    ml spider R

    -------------------------------------------------------------------------------------------------------------------------
      R: R/4.4.2-gfbf-2024a
    -------------------------------------------------------------------------------------------------------------------------
        Description:
          R is a free software environment for statistical computing and graphics.
    
    
         Other possible modules matches:
            ADMIXTURE, AdapterRemoval, Armadillo, Arrow, BioPerl, Brotli, Brunsli, CellRanger, Cereal, Exonerate, ...
    
        This module can be loaded directly: module load R/4.4.2-gfbf-2024a
    
        This module provides the following extensions:
    
           askpass/1.2.1 (E), base (E), base64enc/0.1-3 (E), brew/1.0-10 (E), brio/1.1.
    5 (E), bslib/0.8.0 (E), cachem/1.1.0 (E), callr/3.7.6 (E), cli/3.6.3 (E), clipr/
    0.8.0 (E), commonmark/1.9.2 (E), compiler (E), cpp11/0.5.0 (E), crayon/1.5.3 (E),
    credentials/2.0.2 (E), curl/6.0.1 (E), datasets (E), desc/1.4.3 (E), devtools/2.4.5
    (E), diffobj/0.3.5 (E), digest/0.6.37 (E), downlit/0.4.4 (E), ellipsis/0.3.2 (E), e

    ...

    Help:

      Description
      ===========
      R is a free software environment for statistical computing
       and graphics.


      More information
      ================
       - Homepage: https://www.r-project.org/
            
      ...
               
    -------------------------------------------
      To find other possible module matches execute:

          $ module -r spider '.*R.*'

    ```

???- question "What is `R`?"

    `R` is the module for the R programming language.
    R is a free and open-source programming language,
    commonly used in data analysis and visualization.


???- question "How does the output of `module spider samtools` look like?"

    ```bash
    $ module spider samtools

    -------------------------------------------------------------------------------------------------------------------------
     Rsamtools: Rsamtools/2.22.0 (E)
    -------------------------------------------------------------------------------------------------------------------------
       This extension is provided by the following modules. To access the extension you must load one of the following modules.
    Note that any module names in parentheses show the module location in the software hierarchy.


          R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2


    Names marked by a trailing (E) are extensions provided by another module.

    -------------------------------------------------------------------------------------------------------------------------
     SAMtools:
    -------------------------------------------------------------------------------------------------------------------------
       Description:
         SAM Tools provide various utilities for manipulating alignments in the SAM format, including sorting, merging,
         indexing and generating alignments in a per-position format.

        Versions:
           SAMtools/0.1.20-GCC-13.3.0
           SAMtools/1.3.1-GCC-13.3.0
           SAMtools/1.13-GCC-13.3.0
           SAMtools/1.19.2-GCC-13.3.0
           SAMtools/1.21-GCC-13.3.0
           SAMtools/1.22-GCC-13.3.0

    -------------------------------------------------------------------------------------------------------------------------
     For detailed information about a specific "SAMtools" package (including how to load the modules) use the module's full name.
     Note that names that have a trailing (E) are extensions provided by other modules.
     For example:

        $ module spider SAMtools/1.22-GCC-13.3.0
    ------------------------------------------------------------------------------------------------------------------------- 


    ```

???- question "How does the output of `module spider samtools/1.22` look like?"

    ```bash
    $ module spider samtools/1.22

    -------------------------------------------------------------------------------------------------------------------------
      SAMtools: SAMtools/1.22-GCC-13.3.0
    -------------------------------------------------------------------------------------------------------------------------
        Description:
          SAM Tools provide various utilities for manipulating alignments in the SAM format, including sorting, merging,
          indexing and generating alignments in a per-position format.
    
    
        This module can be loaded directly: module load SAMtools/1.22-GCC-13.3.0
    
    ...
    ```

???- question "What is `samtools`?"

    `samtools` is the module for SAMtools. From [wikipedia](https://en.wikipedia.org/wiki/SAMtools):

    > SAMtools is a set of utilities for interacting with
    > and post-processing short DNA sequence read alignments
    > in the SAM (Sequence Alignment/Map), BAM (Binary Alignment/Map)
    > and CRAM formats


If there is an exact match, that module is reported first.
Of the module shown, also the different versions are reported.

!!! note

    - Many module names are slightly different on Pelle compared to the other clusters.
    - Many tools are in **CAPITAL** letters or at least start with a **Capital**.

!!! tip "You are not supposed to load a `module load bioinfo-tools` first"

    ``bioinfo-tools`` module is not required on Pelle. It is not even there so remove that line in you old scripts

???- tip "What to do when `module load` gives an 'Lmod has detected the following error:  These module(s) or extension(s) exist but cannot be loaded as requested' error?"

    Ouch, now it is time to try out many things.

    Do not hesitate to [contact support](../support.md)
    so that you can spend time on your research
    and we figure this out :-)

To load a module, use `module load [module]`,
for example `module load cowsay`.
This will load the default version of that module,
which is almost always the latest version.
Loading a module always results in a helpful message
(such as that it worked fine), however,
it is *not* general help for using the tool itself.

???- question "How can I see which modules I've loaded?"

    Use the command `module list`.

???- question "How does the output of `module list` look like?"

    This is an example of how is looks lik when SAMtols is loaded
    
    ```bash
    $ module list

    Currently Loaded Modules:
      1) GCCcore/13.3.0                 5) bzip2/1.0.8-GCCcore-13.3.0       9) Java/17 -> Java/17.0.15  
      2) zlib/1.3.1-GCCcore-13.3.0      6) ncurses/6.5-GCCcore-13.3.0      10) OpenSSL/3
      3) binutils/2.42-GCCcore-13.3.0   7) XZ/5.4.5-GCCcore-13.3.0         11) cURL/8.7.1-GCCcore-13.3.0
      4) GCC/13.3.0                     8) libdeflate/1.20-GCCcore-13.3.0  12) SAMtools/1.22-GCC-13.3.0
    ```

    In this example case, we can see that the many more modules than SAMtools are loaded. This is the effect of using the installation method that is prevailent in most NAISS clusters.

For reproducible research, however, it is good practice
to load a specific version. The information given by
`module spider` contains the versions of the module.
For example, to load the `SAMtools/1.22` module,
do `module load samtools/1.22<TAB>`.

???- question "How does the output of `module load GATK/4.3.0.0` look like?"

    ```bash
    $ module load GATK/4.3.0.0
    Note that all versions of GATK starting with 4.0.8.0 use a different wrapper
    script (gatk) than previous versions of GATK.  You might need to update your
    jobs accordingly.

    The complete GATK resource bundle is in /sw/data/GATK

    See 'module help GATK/4.3.0.0' for information on activating the GATK Conda
    environment for using DetermineGermlineContigPloidy and similar other tools.
    ```

    This message references the command `module help GATK/4.3.0.0` for additional help with this module.


To see a module-specific help, use `module help [module]` (e.g. `module help cowsay`).

???- question "How does the output of `module help GATK/4.3.0.0` look like?"

    ```bash
    $ module help GATK/4.6.1.0-GCCcore-13.3.0-Java-17

    ------------------------------ Module Specific Help for "GATK/4.6.1.0-GCCcore-13.3.0-Java-17" ------------------------------

    Description
    ===========
    The Genome Analysis Toolkit or GATK is a software package developed at the Broad Institute
     to analyse next-generation resequencing data. The toolkit offers a wide variety of tools,
     with a primary focus on variant discovery and genotyping as well as strong emphasis on
     data quality assurance. Its robust architecture, powerful processing engine and
     high-performance computing features make it capable of taking on projects of any size.
    
    
    More information
    ================
     - Homepage: https://www.broadinstitute.org/gatk/
    ```


## Links

- [Almost all installed software on UPPMAX](../software/overview.md)
- [Almost all installed databases on UPPMAX](../databases/overview.md)
- [Wikipedia page on environment modules](https://en.wikipedia.org/wiki/Environment_Modules_(software))
- [lmod homepage](https://www.tacc.utexas.edu/research/tacc-research/lmod/)
