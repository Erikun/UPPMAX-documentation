# Using Slurm on Bianca

This page describes how to use Slurm on Bianca.

???- question "What is Slurm?"

    See the general page on Slurm [here](slurm.md)

???- question "What is Bianca?"

    See the general page on Bianca [here](bianca.md)

## `sbatch` (and `interactive`) on Bianca

`sbatch` (and `interactive`) work the same as on other clusters,
the only difference is that one need specify one want to use
the Bianca computer nodes.

???- question "Want to start an interactive job?"

    See how to start an interactive job on Bianca [here](start_interactive_job_on_bianca.md)

Here it is shown how to submit a job with:

- command-line Slurm parameters
- Slurm parameters in the script

## `sbatch` a script with command-line Slurm parameters

The minimal command to use `sbatch` with command-line Slurm parameters is:

``` bash
sbatch -A [project_code] [script_filename]
```

where `[project_code]` is the project code, and `[script_filename]`
the name of a bash script, for example:

``` bash
sbatch -A sens2023598 my_script.sh
```

???- question "Forgot your Bianca project?"

    One can go to the SUPR NAISS pages to see one's projects,

    ![](./img/naiss_supr_project_2023_2_25.png)

    > Example of the Bianca project called 'UPPMAX 2023/2-25'

    On the SUPR NAISS pages, projects are called 'UPPMAX [year]/[month]-[day]',
    for example, 'UPPMAX 2023/2-25'.
    The UPPMAX project name, as to be used on Bianca, 
    has a slightly different name:
    the account name to use on Bianca is `uppmax[year]-[month]-[day]`,
    for example, `sens2023598`

???- question "What is in the script file?"

    The script file `my_script.sh` is a minimal example script.
    Such a minimal example script could be:

    ```bash
    #!/bin/bash
    echo "Hello"
    ```

Again, what is shown here is a minimal use of `sbatch`.
See the general page on Slurm [here](slurm.md).

## `sbatch` a script with Slurm parameters in script

The minimal command to use `sbatch` with Slurm parameters in the script:

``` bash
sbatch [script_filename]
```

where `[script_filename]` the name of a bash script, for example:

``` bash
sbatch my_script.sh
```

The script must contain at least the following lines:

```
#SBATCH -A [project_code]
```

where `[project_code]` is the project code, for example:

```bash
#SBATCH -A sens2023598
```

???- question "Forgot your Bianca project?"

    One can go to the SUPR NAISS pages to see one's projects,

    ![](./img/naiss_supr_project_2023_2_25.png)

    > Example of the Bianca project called 'UPPMAX 2023/2-25'

    On the SUPR NAISS pages, projects are called 'UPPMAX [year]/[month]-[day]',
    for example, 'UPPMAX 2023/2-25'.
    The UPPMAX project name, as to be used on Bianca, 
    has a slightly different name:
    the account name to use on Bianca is `uppmax[year]-[month]-[day]`,
    for example, `sens2023598`

A full example script would be:

```bash
#!/bin/bash
#SBATCH -A sens2023598
echo "Hello"
```

Again, what is shown here is a minimal use of `sbatch`.
See the general page on Slurm [here](slurm.md).
