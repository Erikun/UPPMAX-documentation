# File transfer to/from Rackham, using a graphical tool

![](./img/filezilla_login_to_rackham_480_x_270.png)

> FileZilla connected to Rackham

## Overview

As a user, we need to transfer files
between our local computer and Rackham.
The many ways to transfer files to/from Rackham 
are discussed [here](transfer_rackham.md).
On this page, we learn how to transfer files
to Rackham using a graphical tool/program.

```mermaid
flowchart TD

    %% Give a white background to all nodes, instead of a transparent one
    classDef node fill:#fff,color:#000,stroke:#000

    %% Graph nodes for files and calculations
    classDef file_node fill:#fcf,color:#000,stroke:#f0f
    classDef calculation_node fill:#ccf,color:#000,stroke:#00f

    user(User)
      user_local_files(Files on user computer):::file_node

    subgraph sub_inside[SUNET]
      subgraph sub_rackham_shared_env[Rackham]
          login_node(login/calculation/interactive node):::calculation_node
          files_in_rackham_project(Files in Rackham project folder):::file_node
      end
      files_on_transit(Files on transit):::file_node
      files_on_other_clusters(Files on other HPC clusters):::file_node
    end

    %% Shared subgraph color scheme
    %% style sub_outside fill:#ccc,color:#000,stroke:#ccc
    style sub_inside fill:#fcc,color:#000,stroke:#fcc
    style sub_rackham_shared_env fill:#ffc,color:#000,stroke:#ffc

    user --> |logs in |login_node
    user --> |uses| user_local_files
    user_local_files <--> |transfer files|files_on_transit
    files_on_transit <--> |transfer files|files_on_other_clusters
    login_node --> |can use|files_in_rackham_project
    user_local_files <==> |transfer files|files_in_rackham_project
```

> Overview of file transfer on Rackham, when using a graphical tool.
> The purple nodes are about file transfer,
> the blue nodes are about 'doing other things'.
> The user can be either inside or outside SUNET.

Here, we show how to transfer files using a graphical tool called FileZilla.

## Using FileZilla

![FileZilla logo, from https://en.wikipedia.org/wiki/FileZilla#/media/File:FileZilla_logo.svg](./img/filezilla_logo_240_x_240.png)

> The FileZilla logo

???- question "Would you like a video?"

    If you like to see how to do file tranfer from/to Rackham
    using FileZilla, watch the video 
    [here](https://youtu.be/V-iPQLjvByc?si=OMyH3REu-SoFQeI9)

FileZilla is a secure file transfer tool that works under Linux, Mac and Windows.

To transfer files to/from Rackham using FileZilla, do:

- Start FileZilla
- From the menu, select 'File | Site manager'

???- tip "Where is that?"

    It is here:

    ![](./img/filezilla_file_site_manager.png)
    
    > The FileZilla 'File' menu contains the item 'Site manager'

- Click 'New site'

???- tip "Where is that?"

    It is here:

    ![](./img/filezilla_site_manager.png)

- Create a name for the site, e.g. `rackham`.
- For that site, use all standards, except:
    - Set protocol to 'SFTP - SSH File Transfer Protocol'
    - Set host to `rackham-sftp.uppmax.uu.se`
    - Set user to `[username]`, e.g. `richel`

???- tip "How does that look like?"

    It looks similar to this:

    ![](./img/filezilla_setup_rackham_richel.png)

- Click 'Connect'
- You will be asked for your password, hence
  type `[your password]`, e.g. `VerySecret`.
  You can save the password.

???- tip "How does that look like?"

    It looks similar to this:

    ![](filezilla_enter_password_rackham.png)

Now you can transfer files between your local computer and Rackham.

???- tip "How does that look like?"

    It looks like this:

    ![](./img/filezilla_login_to_rackham.png)

## Where do my files end up?

They end up in your personal home folder.

Its location is at `/home/[user_name]`,
for example, at `/home/sven`.

???- tip "How does that look like?"

    It looks like this:

    ![](./img/filezilla_file_on_rackham.png)

## Extra material

### WinSCP

WinSCP is a secure file transfer tool that works under Windows.

To transfer files to/from Rackham using WinSCP, do:

- Start WinSCP
- Create a new site
- For that site, use all standards, except:
    - Set file protocol to 'SFTP'
    - Set host name to `rackham-sftp.uppmax.uu.se`
    - Set user name to `[username]`, e.g. `richel`

### File transfer overview

```mermaid
flowchart TD

    %% Give a white background to all nodes, instead of a transparent one
    classDef node fill:#fff,color:#000,stroke:#000

    %% Graph nodes for files and calculations
    classDef file_node fill:#fcf,color:#000,stroke:#f0f
    classDef calculation_node fill:#ccf,color:#000,stroke:#00f

    user(User)
      user_local_files(Files on user computer):::file_node

    subgraph sub_inside[SUNET]
      subgraph sub_rackham_shared_env[Rackham]
          login_node(login/calculation/interactive node):::calculation_node
          files_in_rackham_project(Files in Rackham project folder):::file_node
      end
      files_on_transit(Files on transit):::file_node
      files_on_other_clusters(Files on other HPC clusters):::file_node
    end

    %% Shared subgraph color scheme
    %% style sub_outside fill:#ccc,color:#000,stroke:#ccc
    style sub_inside fill:#fcc,color:#000,stroke:#fcc
    style sub_rackham_shared_env fill:#ffc,color:#000,stroke:#ffc

    user --> |logs in |login_node
    user --> |uses| user_local_files
    user_local_files <--> |transfer files|files_on_transit
    files_on_transit <--> |transfer files|files_on_other_clusters
    login_node --> |can use|files_in_rackham_project
    user_local_files <--> |transfer files|files_in_rackham_project
```

> Overview of file transfer on Rackham
> The purple nodes are about file transfer,
> the blue nodes are about 'doing other things'.
> The user can be either inside or outside SUNET.
