# BEAST2

BEAST2 is a tool for Bayesian phylogenetic analysis.

???- question "Is BEAST2 a new version of BEAST?"

    No. 

    Although BEAST and BEAST2 achieve a similar goal,
    BEAST and BEAST2 are developed independently.

    Hence, 
    - there are things BEAST can do that BEAST2 cannot, and vice versa
    - one cannot create a BEAST XML file and expect BEAST2 to be able to run it, and vice versa

## 1. Load a `beast2` module

First step is to load a BEAST2 module.

Here is how to find the BEAST2 versions on the UPPMAX clusters:

```
module spider beast2
```

When loading a BEAST2 module, also load `bioinfo-tools`:

```
module load bioinfo-tools beast2/2.7.4
```

???- question "How does that look like?"

    ```
    $ module load bioinfo-tools beast2/2.7.4
    beast2/2.7.4: Also loaded beagle/4.0.0
    beast2/2.7.4: Many Beast packages are available, to see the list, 'packagemanager -list'
    beast2/2.7.4: Use BEAST_XMX to specify the amount of RAM (default 5g), 'export BEAST_XMX=15g'. Do not exceed RAM available to your job.
    ```

## 2. Run `BEAUti`

Next step is to create a BEAST2 configuration file
using `BEAUti`. This graphical tool can be started using:

```
beauti
```

Make sure you have X-forwarding enabled, 
see [Login to Rackham](../getting_started/login_rackham.md)
to see this.

???- question "How does that look like?"

    Starting `BEAUti` results in the following pop-up window:

    ![](./img/beauti.png)

After using `BEAUti`, save the file with your BEAST2 model.

## 3. Run 

A BEAST2 run takes a lot of computing power,
hence do not run it on a login node.
Instead, run it on an interactive node 
or use a script.

???- question "How to start an interactive node?"

    View the UPPMAX documentation
    ['How to start an interactive node on Rackham'](../cluster_guides/start_interactive_node_on_rackham).


On an interactive node, run BEAST2 on the saved BEAST2 model:

```
beast beast2_setup.xml
```

When using a script, put that line in a script.
Below is an example script, called `run_beast2.sh`:

```bash title="run_beast2.sh"
#!/bin/bash
#SBATCH -A uppmax2023-2-25
module load bioinfo-tools beast2/2.7.4
beast beast2_setup.xml
```

 * In line 2, replace `uppmax2023-2-25` with [your UPPMAX project](../getting_started/project.md).
 * In line 3, you may want to replace `beast2/2.7.4` with your favorite BEAST2 version

Then run this script using `sbatch run_beast2.sh`.

Note that this is a *minimal* script.
See [the UPPMAX documentation on Slurm](../cluster_guides/slurm.md)
for ways to improve this script.

