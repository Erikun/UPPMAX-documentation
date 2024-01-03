# Data transfer to/from Transit

There are multiple ways to transfer files to/from Transit:

Method                                                             |Features
-------------------------------------------------------------------|---------------------------------------------
:no-entry: [Using a graphical program](#using-a-graphical-program) |Does not work
:no-entry: [Using SCP](#using-SCP)                                 |Does not work
:no-entry: [Using SFTP](#using-SFTP)                               |Does not work

Each of these methods is discussed below.

## Using a graphical program

One cannot transfer files to/from Transit using a graphical program.

For completion, a step-by-step guide how to transfer files using a graphical tool
is present at [Transit file transfer using a graphical program](transit_file_transfer_using_gui.md).
It looks as if it works, yet it does not.

## Using SCP

One cannot transfer files to/from Transit using SCP.

For completion, a step-by-step guide how to transfer files using a graphical tool
is present at [Transit file transfer using SCP](transit_file_transfer_using_scp.md).
It looks as if it works, yet it does not.

## Using SFTP

One cannot transfer files to/from Transit using SFTP.

For completion, a step-by-step guide how to transfer files using a graphical tool
is present at [Transit file transfer using SFTP](transit_file_transfer_using_sftp.md).
It looks as if it works, yet it does not.

## Overview

```
flowchart TD

    %% Give a white background to all nodes, instead of a transparent one
    classDef node fill:#fff,color:#000,stroke:#000

    subgraph sub_inside[IP inside SUNET]
      subgraph sub_bianca_shared_env[Bianca]
        files_in_wharf(Files in wharf)
      end
      subgraph sub_rackham_env[Rackham]
        files_on_rackham(Files on Rackham)
      end
      user_local_files(Files on user computer)
      subgraph sub_transit_env[Transit]
        files_on_transit(Files on transit)
      end
      files_on_other_clusters(Files on other HPC clusters):::file_node
    end

    %% Shared subgraph color scheme
    %% style sub_outside fill:#ccc,color:#000,stroke:#ccc
    style sub_inside fill:#ccc,color:#000,stroke:#999
    style sub_bianca_shared_env fill:#cfc,color:#000,stroke:#090
    style sub_rackham_env fill:#fcc,color:#000,stroke:#900
    style sub_transit_env fill:#ccf,color:#000,stroke:#009

    user_local_files -.- files_in_wharf
    user_local_files ~~~ files_on_transit
    user_local_files -.- files_on_rackham
    files_on_transit <==> |transfer files|files_in_wharf
    files_on_transit <==> |transfer files|files_on_rackham
    files_on_transit -.- |transfer files|files_on_other_clusters
```

> Overview of file transfer on Transit
