# Dardel Migration

![Dardel server racks](./img/dardel_racks.png)

This page describes how to transfer files to Dardel,
the HPC cluster at PDC in Stockholm.

## Why do I need this?

The Rackham cluster will be decommissioned at the end of 2024 
so all projects have to migrate their data and calculations to other resources. 
The plan from NAISS is that all Rackham users 
will move to the Dardel cluster at PDC. 

To facilitate this move we have created Darsync, 
a tool that can inspect your files 
and make suggestions to make the transfer easier, 
as well as generating a script file you can submit to [SLURM](slurm.md) 
to perform the actual file transfer. 
[Read more about how to use Darsync here]

## How do I do this?

First, we are here to help.
Please [contact support](../support.md) if you run into problems
when trying the guide below.

This migration consists of a couple of steps summarized below. 
Press the links to get more detailed explanation of each step.
Note that step 1 requires some hours of waiting
and step 2 requires an overnight wait.

```mermaid
flowchart TD
  get_supr_project[1. Access to a SUPR project with Dardel]
  get_pdc_account[2. Access to a PDC account]
  create_ssh_key[3. Create SSH key pair]
  add_ssh_key[4. Add the SSH keyto the PDC Login Portal]
  run_darsync[5. Run Darsync]
  slurm[6. Submit the script created by Darsync]
  check_logs[7. Check logs]
  delete_ssh_keys[8. Delete the SSH key]

  get_supr_project --> |needed for| get_pdc_account

  create_ssh_key --> |needed for| add_ssh_key
  get_pdc_account --> |needed for| add_ssh_key
  add_ssh_key --> |needed for| run_darsync
  run_darsync --> |needed for| slurm
  slurm --> |needed for| check_logs
  check_logs --> |needed for| delete_ssh_keys
```

> Overview of the migration process.
> Note that step 1 requires some hours of waiting
> and step 2 requires an overnight wait.

### 1. Get access to a SUPR project with Dardel

First step is to get get access to a SUPR project with Dardel.
This is described at [PDC's page on getting access to Dardel](https://www.pdc.kth.se/support/documents/getting_access/get_access.html).
You will get an email when you are added to a project,
this can take some hours.

???- question "How do I know I have access to a Dardel project?"

    Login to [https://supr.naiss.se/](https://supr.naiss.se/).
    If there is a PDC project,
    you may have access to a project with Dardel.

    ![](./img/supr_naiss_dardel_project.png)

    > Example user that has access to a PDC project

    If you may a PDC project that does not use Dardel,
    click on the project to go the the project overview.

    ![](./img/supr_naiss_dardel_project_overview.png)

    > Example PDC project overview

    From there, scroll down to 'Resources'.
    If you see 'Dardel' among the compute resources, 
    you have confirmed you have access to a Dardel project.

    ![](./img/naiss_project_dardel_resources.png)

    > Resources from an example PDC project

### 2. Get a PDC account via SUPR

Get a PDC account via SUPR.
This is described at [the PDC page on getting access](https://www.pdc.kth.se/support/documents/getting_access/get_access.html#supr-account).
You will get a PDC account overnight.

???- question "How do I know I have a PDC account?"

    Login to [https://supr.naiss.se/](https://supr.naiss.se/).
    and click on 'Accounts' in the main menu bar at the left.

    If you see 'Dardel' among the resources, and status 'Enabled'
    in the same row, you have a PDC account!

    ![](./img/supr_naiss_dardel_account.png)

    > Example of a user having an account at PDC's Dardel HPC cluster

### 3. Create SSH key pair

Create SSH key and add it to the PDC Login Portal.

- Create the password less SSH key in a terminal logged into Rackham:

```bash
# generate the key
ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25519-pdc
```

### 4. Add the public key to the PDC Login Portal

View the public SSH key in a terminal logged into Rackham:

```
cat ~/.ssh/id_ed25519-pdc.pub
```

???- question "How does that look like?"

    The text will look similar to this:

    ```
    ssh-ed25519 AAAA69Nz1C1lZkI1NdE5ABAAIA7RHe4jVBRTEvHVbEYxV8lnOQl22N+4QcUK+rDv1gPS user@rackham2.uppmax.uu.se
    ```

Open the [PDC Login Portal](https://loginportal.pdc.kth.se/).

???- question "How does that look like?"

    That will look like this:

    ![](pdc_key_management_no_keys.png)

    > Example PDC login portal without any SSH keys yet.
    > We will need to add an SSH key that allows 
    > access from UPPMAX to PDC

Follow [PDC:s instructions on how to add SSH keys](https://www.pdc.kth.se/support/documents/login/ssh_login.html#in-the-login-portal).

???- question "How does adding an SSH key pair look like?"

    That will look like this:

    ![](./img/pdc_add_new_key_user_ip_only.png)

    > Example of the first step of adding an SSH key pair to the PDC portal.
    > The 'SSH public key' is copy-pasted 
    > from `cat ~/.ssh/id_ed25519-pdc.pub` on Rackham.
    > The 'Key name' can be chosen freely.
    > Note that this SSH key cannot be used yet for UPPMAX,
    > as it only allows one IP address.

???- question "How does it look like when the key is added?"

    That will look like this:

    ![](./img/pdc_key_management_rackham_key.png)

    > Example PDC login portal with one key. 
    > Note that the second column only has one IP address
    > and is still missing `*.uppmax.uu.se`.

Once you have added you key you have to 
[add UPPMAX as allowed to use the key](../dardel_ssh-keys/#optional-adding-uppmax-to-addresses). 
Click on `Add address` for it and add `*.uppmax.uu.se`

???- question "How does it look like to edit an SSH key so that can be used for UPPMAX?"

    That will look like this:

    ![](./img/pdc_add_new_key_uppmax.png)

    > Example of the second step of adding an SSH key pair to the PDC portal.
    > Here the custom address `*.uppmax.uu.se` is added,
    > so that this SSH key can be used for UPPMAX.

???- question "How does it look like to have a key that can be used for UPPMAX?"

    That will look like this:

    ![](./img/pdc_key_management_uppmax_key.png)

    > Example PDC login portal with one key. Note the `*.uppmax.uu.se`
    > at the bottom of the second column.

### 5. Run Darsync

Run the migration tool [Darsync](../darsync.md):

```bash
module load darsync

darsync check --local-dir /path/to/dir
# fix any errors the check step found
darsync gen --local-dir /path/to/dir --outfile ~/dardel_transfer_script.sh
```

### 6. Submit the script created by Darsync

Submit the transfer script created by Darsync to SLURM.

```bash
sbatch --output=~/dardel_transfer.out --error=~/dardel_transfer.err ~/dardel_transfer_script.sh
```

### 7. Check logs

Once the submitted job has finished, have a look at the log file produced by the job and make sure it did not end in a error message.

```bash
tail ~/dardel_transfer.out
tail ~/dardel_transfer.err
```

### 8. Delete the SSH key

Delete the SSH key you created after the migration has completed.

```bash
rm ~/.ssh/id_ed25519-pdc*
```
