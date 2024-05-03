# Slurm

The UPPMAX clusters are a shared resource.
To ensure fair use, UPPMAX uses a scheduling system.
A scheduling system decides at what time which calculation is done.
The software used is called Slurm.

???- question "Why not write SLURM?"

    Indeed, Slurm started as an abbreviation of 'Simple Linux Utility 
    for Resource Management'. However, 
    the [Slurm homepage](https://slurm.schedmd.com/) uses 'Slurm'
    to describe the tool, hence we use Slurm too.

This page describes how to use Slurm in general.
See [optimizing jobs](optimizing_jobs.md)
how to optimize Slurm jobs.
See [Slurm troubleshooting](slurm_troubleshooting.md)
how to fix Slurm errors.

For information specific to clusters, see:

- [Slurm on Bianca](slurm_on_bianca.md)
- [Slurm on Rackham](slurm_on_rackham.md)
- [Slurm on Snowy](slurm_on_snowy.md)

## Slurm Commands

The Slurm system is accessed using the following commands:

* `interactive` - Start an interactive session. This is described
  in-depth for [Bianca](start_interactive_node_on_bianca.md)
  and [Rackham](start_interactive_node_on_rackham.md)
* `sbatch` - Submit and run a batch job script
* `srun` - Typically used inside batch job scripts for running parallel jobs
  (See examples further down)
* `scancel` - Cancel one or more of your jobs.

```mermaid
flowchart TD
  subgraph sub_inside[IP inside SUNET]
    subgraph sub_cluster_env[Cluster environment]
      login_node(User on login node)
      interactive_node(User on interactive node)
      computation_node(Computation node):::calculation_node
    end
  end

  login_node --> |move user, interative|interactive_node
  login_node ==> |submit jobs, sbatch|computation_node
  computation_node -.-> |can become| interactive_node
```

> The different types of nodes an UPPMAX cluster has.
> White nodes: nodes a user can interact with.
> Blue nodes: nodes a user cannot interact with.
> The thick edge shows the topic of this page:
> how to submit jobs to a computation node.

## Job parameters

This session describes how to specify a Slurm job:

- [Getting started](#getting-started) redirects to the cluster-specific pages
- [Partitions](#partitions) specify the type of job

### Getting started

To let Slurm schedule a job, one uses `sbatch`, like:

```bash
sbatch -A [project_code] [script_filename]
```

for example:

``` bash
sbatch -A sens2017625 my_script.sh
```

Minimal and complete examples of using `sbatch` is described at the respective cluster guides:

- [Bianca](http://docs.uppmax.uu.se/cluster_guides/slurm_on_bianca/#sbatch-and-interactive-on-bianca)
- [Rackham](http://docs.uppmax.uu.se/cluster_guides/slurm_on_rackham/#sbatch-and-interactive-on-rackham)
- [Snowy](http://docs.uppmax.uu.se/cluster_guides/slurm_on_snowy/#sbatch-and-interactive-on-snowy)

### Partitions

Partitions are a way to tell what type of job you are submitting, 
e.g. if it needs to reserve a whole node, or part of a node.

To let Slurm schedule a job using a partition, 
use the `--partition` (or `-p`) flag like this:

```bash
sbatch -A [project_code] --partition [partition_name] [script_filename]
```

for example:

```bash
sbatch -A sens2017625 --partition core my_script.sh
```

These are the partition names and their descriptions:

Partition name|Description
--------------|----------------------------------
`core`        |Use one or more cores
`node`        |Use a full node's set of cores
`devel`       |Development job
`devcore`     |Development job

#### The `core` partition

The `core` partition allows one to use one or more cores.

Here is the minimal use for one core:

```bash
sbatch -A [project_code] --partition core [script_filename]
```

For example:

```bash
sbatch -A sens2017625 --partition core my_script.sh
```

To specify multiple cores, use `--ntasks` (or `-n`) like this:


```bash
sbatch -A [project_code] --partition core --ntasks [number_of_cores] [script_filename]
```

For example:

```bash
sbatch -A sens2017625 --partition core --ntasks 2 my_script.sh
```

Here, two cores are used.

???- question "What is the relation between `ntasks` and number of cores?"

    Agreed, the flag `ntasks` only indicates the number of threads.
    However, by default, the number of tasks per core is set to one.
    One can make this link explicit by using:

    ```bash
    sbatch -A [project_code] --partition core --ntasks [number_of_cores] --ntasks-per-core 1 [script_filename]
    ```




This is especially important if you might adjust core usage 
of the job to be something less than a full node.

### The `node` partition

Whenever -p node is specified, an entire node is used, 
no matter how many cores are specifically requested with -n [no_of_cores]. 

For example, some bioinformatics tools show minimal increase in performance 
when more than 8-10 cores/job; in this case, specify "-p core -n 8" 
to ensure that only 8 cores (less than a single node) are allocated for such a job.

### The `devel` partition

### The `devcore` partition



### Specifying job parameters

Whether you use the UPPMAX clusters interactively or in batch mode, you always
have to specify a few things, like number of cores needed, running time etc.
These things can be specified in two ways:

Either as flags sent to the different Slurm commands (`sbatch`, `srun`, the
`interactive` command, etc.), like so:

``` bash
sbatch -A p2012999 -p core -n 1 -t 12:00:00 -J some_job_name my_job_script_file.sh
```

or, when using the `sbatch` command, it can be specified inside the job script
file itself, by using special `SBATCH` comments, for example:

``` bash title="job_script.sh"
#!/bin/bash -l
 
#SBATCH -A p2012999
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 12:00:00
#SBATCH -J some_job_name

```

If doing this, then one will only need to start the script like so, without any
flags:

``` bash
sbatch job_script.sh
```

## Links

- [Older Slurm user guide](https://www.uppmax.uu.se/support/user-guides/slurm-user-guide/)
