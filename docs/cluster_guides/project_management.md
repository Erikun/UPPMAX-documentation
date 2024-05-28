# Manage you projects


## Check the CPU hours of your project(s)

### On an UPPMAX cluster

To get an overview of how much of your project allocation that has been used, please use the ``projinfo`` command. Please use the command ``projinfo -h`` to get details on usage.

```bash
Usage: projinfo [-OPTIONS [-MORE_OPTIONS]] [--] [PROGRAM_ARG1 ...]

The following single-character options are accepted:
        With arguments: -s -e -M
        Boolean (without arguments): -h -q -v -m -y

```

- With no flags given, projinfo will tell you your usage during the current month.

- Usage in project "testproj" during the current year: ``projinfo -y testproj``

- Usage in project testproj during the specified two months: ``projinfo -s 2010-02 -e 2010-03 testproj``

Usage in your projects today until the moment you run the command: ``projinfo -s today``

### SUPR

Log in to [SUPR](https://supr.naiss.se/) and view your projects there. You can also get information about usage levels, storage levels, membership, etc.

## Storage

- [Disk storage guide](storage/disk_storage_guide.md)
- [Backup](backup.md)

### Display storage quota

- Display your project quota with the command:

```console
$ uquota
```

- Usage

```bash
usage: uquota [-h] [-q] [-d] [-u USER] [-p PROJECTS_FILE] [--include-expired]
              [--random-usage] [--only-expired] [--sort-by-col SORT_BY_COL]
              [-s] [-f]

optional arguments:
  -h, --help            Ask for help
  -q, --quiet           Quiet, abbreviated output
  -d, --debug           Include debug output
  -u USER, --user USER
  -p PROJECTS_FILE, --projects-file PROJECTS_FILE
  --include-expired     Include expired projects
  --random-usage        removed option, don't use
  --only-expired        Only show expired projects
  --sort-by-col SORT_BY_COL
                        Index (0-4) of column to sort by. Default is 0.
  -s, --slow            Deprecated. Previously ran 'du' command
```

- [Display the disk quota on the more detailed level](storage/disk_quota_more.md)

### Other

How do I specify that I do not need my large datasets to be backed up?

???- question "How do I specify that I do not need my large datasets to be backed up?"

    If you create a folder named ``nobackup``, inside _any_ folder, then all data stored inside this folder will not be backed-up. 
    
    Simply move (``mv`` or ``rsync``) your data into a folder with the proper name.

    Also note that all projects  have a separate nobackup folder under the ``/proj/xyz/`` hierarchy (and also under the ``/proj/xyz/private/`` hierarchy) with a separate quota limit than the ordinary backed up project folder. You can read more about this in our [disk storage guide](storage/disk_storage_guide.md).

???- question "What is this 'glob' folder in my home folder?"

    - The glob directory found in your home has been deprecated since early 2017.
    - It is now a normal directory and shared your default 32GByte sized home.
    - The glob directory remains to not interfere with scripts who might reference ~/glob in the source code.

    - Historically, the glob directory was the main storage area for storage of user data.
        - It was shared by all nodes.
        - The directory was used for files needed by all job instances and could house files exceeding the quota of the home directory.
        - Job input and output files was (and can still be) stored here.


## Members
