# `nextflow` & `nf-core` on UPPMAX

[https://www.nextflow.io](https://www.nextflow.io)  

- Official documentation: [https://www.nextflow.io/docs/latest/index.html](https://www.nextflow.io/docs/latest/index.html)


## `nextflow` from the module system

- latest `nextflow`

```bash
module load bioinfo-tools
module load Nextflow/latest  # this also loads java as reqirement

nextflow -v
nextflow version 24.04.4.5917
```

- alternative versions

```bash
export NXF_VER=23.10.1

nextflow -v
nextflow version 23.10.1.5891
```

```bash
# To check the available versions on Rackham and Bianca
ls /sw/bioinfo/Nextflow/latest/rackham/nxf_home/framework/
20.04.1  20.10.0  21.10.6  22.10.1  22.10.3  22.10.8  23.04.2  23.04.4  23.10.1  24.04.2  24.04.4
20.07.1  21.04.3  22.10.0  22.10.2  22.10.4  23.04.1  23.04.3  23.10.0  24.04.1  24.04.3
```

---

## `nf-core` from the module system

[https://nf-co.re](https://nf-co.re)
> `nf-core` and and all other required modules are available on the `transit` server as well.

```bash
module load bioinfo-tools
module load nf-core   # this also load the nextflow and java as requirements
```

---

## `nf-core` pipelines on Bianca

<!-- Due to the combination of indented code (that needs to be surrounded by -->
<!-- empty lines and a numbered list (that needs no empty lines), there -->
<!-- is no way to satisfy markdownlint -->
<!-- markdownlint-disable MD029 -->

1. Login to `transit.uppmax.uu.se` - [documentation](../cluster_guides/transfer_bianca.md#transit-server)  
2. Mount the `wharf` of your project.

    ```bash
    user@transit:~$ mount_wharf sens2023531
    Mounting wharf (accessible for you only) to /home/<user>/sens2023531
    <user>-sens2023531@bianca-sftp.uppmax.uu.se's password: 
    ```

3. Navigate to your `wharf` folder
4. Disable Singularity cache

   ```bash
   export SINGULARITY_DISABLE_CACHE=true
   export APPTAINER_DISABLE_CACHE=true
   unset NXF_SINGULARITY_CACHEDIR
   ```

5. Load nf-core software module

   ```bash
   module load uppmax bioinfo-tools nf-core
   ```

6. Run `nf-core` to download the pipeline.

<!-- markdownlint-enable MD029 -->

    ```bash
    nf-core download pixelator
                                          ,--./,-.
          ___     __   __   __   ___     /,-._.--~\
    |\ | |__  __ /  ` /  \ |__) |__         }  {
    | \| |       \__, \__/ |  \ |___     \`-._,-`-,
                                          `._,._,'

    nf-core/tools version 2.11.1 - https://nf-co.re

    WARNING  Could not find GitHub authentication token. Some API requests may fail.                                                    
    ? Select release / branch: 1.0.2  [release]
    ? Include the nf-core's default institutional configuration files into the download? Yes

    In addition to the pipeline code, this tool can download software containers.
    ? Download software container images: singularity

    Nextflow and nf-core can use an environment variable called $NXF_SINGULARITY_CACHEDIR that is a path to a directory where remote 
    Singularity images are stored. This allows downloaded images to be cached in a central location.
    ? Define $NXF_SINGULARITY_CACHEDIR for a shared Singularity image download folder? [y/n]: n

    If transferring the downloaded files to another system, it can be convenient to have everything compressed in a single file.
    This is not recommended when downloading Singularity images, as it can take a long time and saves very little space.
    ? Choose compression type: none
    INFO     Saving 'nf-core/pixelator'                                                                                                 
              Pipeline revision: '1.0.2'                                                                                                
              Use containers: 'singularity'                                                                                             
              Container library: 'quay.io'                                                                                              
              Output directory: 'nf-core-pixelator_1.0.2'                                                                               
              Include default institutional configuration: 'True'                                                                       
    INFO     Downloading centralised configs from GitHub                                                                                
    INFO     Downloading workflow files from GitHub                                                                                     
    INFO     Processing workflow revision 1.0.2, found 4 container images in     total.
    Downloading singularity images ???????????????????????????????????????????????????????????????????????????????? 100% ? 4/4 completed
    ```

7. Running on Bianca

    ```bash
    module load bioinfo-tools Nextflow
    nextflow run ... -profile uppmax --project sens-XXXX-XX .... 
    ```

Note: you might need `-c configs/conf/uppmax.config`,  make sure you have the file (it is an option to download it during the pipeline download process).  
[https://github.com/nf-core/configs/blob/master/conf/uppmax.config](https://github.com/nf-core/configs/blob/master/conf/uppmax.config)  
[https://nf-co.re/configs/uppmax](https://nf-co.re/configs/uppmax)

## Common problems

- **Task is running out of resources (memory or time)**

Add lines to your configuration that overrides the settings for the problematic task, for example:

```python
process {
    withName: 'NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:STAR_ALIGN' {
        cpus   = 12
        memory = '72.GB'
        time   = '24.h'
    }
}
```

More: [https://www.nextflow.io/docs/latest/config.html#process-selectors](https://www.nextflow.io/docs/latest/config.html#process-selectors)

## **[Troubleshooting](https://nf-co.re/docs/usage/troubleshooting/overview)** - nf-core
