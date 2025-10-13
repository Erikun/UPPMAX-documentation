---
tags:
  - Pelle
  - file
  - transfer
  - data
---

# File transfer to/from Pelle

There are multiple ways to transfer files to/from [Pelle](pelle.md):

Method                                                        |Features
--------------------------------------------------------------|---------------------------------------------
[Using a graphical program](#using-a-graphical-program)       |Graphical interface, intuitive, for small amounts of data only
[Using rsync](#using-rsync)                                   |Terminal, easy to learn, can be used in scripts, efficient for backups
[Using SCP](#using-scp)                                       |Terminal, easy to learn, can be used in scripts
[Using SFTP](#using-sftp)                                     |Terminal, easy to learn, secure
[Using transit](#using-transit)                               |Terminal, easy to learn, secure, can transfer between HPC clusters

Each of these methods is discussed below.

## Using a graphical program

One can transfer files to/from Pelle using a graphical program.
A graphical interface is intuitive to most users.
However, it can be used for small amounts of data only
and whatever you do cannot be automated.

See [Pelle file transfer using a graphical program](pelle_file_transfer_using_gui.md)
for a step-by-step guide how to transfer files using
a graphical tool.

## Using `rsync`

One can transfer files to/from Pelle
using [rsync](../software/rsync.md)
in a [terminal](../software/terminal.md).
This works similar to a regular copy of files,
except that a remote (instead of a local) address needs to be specified.
`rsync` can be used in scripts for regular file transfer.
However, `rsync` shines by providing a so-called 'delta' file transfer:
when you transfer files twice, `rsync` will only transfer the files that have
changed. This is ideal for backups.

See [Pelle file transfer using rsync](../software/pelle_file_transfer_using_rsync.md)
for a step-by-step guide how to transfer files using `rsync`.

## Using SCP

One can transfer files to/from Pelle
using SCP in a [terminal](../software/terminal.md).
This works similar to a regular copy of files,
except that a remote address needs to be specified.
The advantage of SCP is that is can be used in scripts.

See [Pelle file transfer using SCP](../software/pelle_file_transfer_using_scp.md)
for a step-by-step guide how to transfer files using SCP.

## Using SFTP

One can transfer files to/from Pelle using SFTP in a [terminal](../software/terminal.md).
One connects a local and a remote folder,
after which one can upload and download files.
SFTP is considered a secure file transfer protocol.

See [Pelle file transfer using SFTP](../software/pelle_file_transfer_using_sftp.md)
for a step-by-step guide how to transfer files using SFTP.

## Using `transit`

One can transfer files to/from Pelle using the UPPMAX `transit` server.
One connects a local folder and the `transit` server,
after which one can upload and download files.

See [Pelle file transfer using `transit`](pelle_file_transfer_using_transit.md)
for a step-by-step guide how to transfer files using the `transit` UPPMAX server.

### Overview

```mermaid
flowchart TD

    %% Give a white background to all nodes, instead of a transparent one
    classDef node fill:#fff,color:#000,stroke:#000

    %% Graph nodes for files and calculations
    classDef file_node fill:#fcf,color:#000,stroke:#f0f
    classDef calculation_node fill:#ccf,color:#000,stroke:#00f
    classDef transit_node fill:#fff,color:#000,stroke:#fff

    subgraph sub_inside[SUNET]
      direction LR
      user(User)
      user_local_files(Local user files):::file_node

      subgraph sub_transit_env[Transit]
        transit_login(Transit login):::calculation_node
        files_on_transit(Files posted to Transit):::transit_node
      end
      subgraph sub_pelle_shared_env[Pelle]
          pelle_login(Pelle login node):::calculation_node
          files_in_pelle_home(Files in Pelle home folder):::file_node
      end
    end

    %% Shared subgraph color scheme
    %% style sub_outside fill:#ccc,color:#000,stroke:#ccc
    style sub_inside fill:#ccc,color:#000,stroke:#000
    style sub_transit_env fill:#cfc,color:#000,stroke:#000
    style sub_pelle_shared_env fill:#fcc,color:#000,stroke:#000

    user --> |has|user_local_files
    user --> |logs in |transit_login
    user --> |logs in |pelle_login

    user_local_files <--> |graphical tool|files_in_pelle_home
    user_local_files <--> |SCP|files_in_pelle_home
    user_local_files <--> |SFTP|files_in_pelle_home
    user_local_files <--> |graphical tool|files_on_transit
    user_local_files <--> |SFTP|files_on_transit

    pelle_login --> |can use|files_in_pelle_home

    transit_login --> |can use|files_on_transit
    files_on_transit <--> |transfer|files_in_pelle_home

    files_in_pelle_home ~~~ transit_login
```

> Overview of file transfer on Pelle
> The purple nodes are about file transfer,
> the blue nodes are about 'doing other things'.
> The user can be either inside or outside SUNET.
