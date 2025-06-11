---
tags:
  - login
  - log in
  - Dardel
---

# Log in to Dardel

There are multiple clusters one can [log in to](../getting_started/login.md).
Here it is described how to login to Dardel.

## Procedure

???- question "Prefer a video?"

    Go to [a YouTube video on how to log in to Dardel](https://youtu.be/I8cNqiYuA-4)
    to view what to do from step 3 and onwards.

First, we are here to help.
Please [contact support](../support.md) if you run into problems
when trying the guide below.

Note that step 1 requires some hours of waiting
and step 2 requires an overnight wait.

```mermaid
flowchart TD
  get_supr_project[1.Access to a SUPR project with Dardel]
  get_pdc_account[2.Access to a PDC account]
  create_ssh_key[3.Create temporary SSH keys]
  add_ssh_key[4.Add the SSH keys to the PDC Login Portal]
  login[5.Login]

  get_supr_project --> |needed for| get_pdc_account

  create_ssh_key --> |needed for| add_ssh_key
  get_pdc_account --> |needed for| add_ssh_key
  add_ssh_key --> |needed for| login
```

> Overview of the migration process.
> Note that step 1 requires some hours of waiting
> and step 2 requires an overnight wait.

### 1. Get access to a SUPR project with Dardel

First step is to get get access to a SUPR project with Dardel.
This is described at
[PDC's page on getting access to Dardel](https://support.pdc.kth.se/doc/getting_access/get_access/).
You will get an email when you are added to a project,
this can take some hours.

???- question "How do I know I have access to a Dardel project?"

    Login to [https://supr.naiss.se/](https://supr.naiss.se/).
    If there is a PDC project,
    you may have access to a project with Dardel.

    ![Example user that has access to a PDC project](../cluster_guides/img/supr_naiss_dardel_project.png)

    > Example user that has access to a PDC project

    If you may a PDC project that does not use Dardel,
    click on the project to go the the project overview.

    ![Example PDC project overview](../cluster_guides/img/supr_naiss_dardel_project_overview.png)

    > Example PDC project overview

    From there, scroll down to 'Resources'.
    If you see 'Dardel' among the compute resources,
    you have confirmed you have access to a Dardel project.

    ![Resources from an example PDC project](../cluster_guides/img/naiss_project_dardel_resources.png)

    > Resources from an example PDC project

### 2. Get a PDC account via SUPR

Get a PDC account via SUPR.
This is described at
[the PDC page on getting an account](https://support.pdc.kth.se/doc/getting_access/get_access/#applying-for-an-account).
You will get a PDC account overnight.

???- question "How do I know I have a PDC account?"

    Login to [https://supr.naiss.se/](https://supr.naiss.se/).
    and click on 'Accounts' in the main menu bar at the left.

    If you see 'Dardel' among the resources, and status 'Enabled'
    in the same row, you have a PDC account!

    ![Example of a user having an account at PDC's Dardel HPC cluster](../cluster_guides/img/supr_naiss_dardel_account.png)

    > Example of a user having an account at PDC's Dardel HPC cluster

???- question "How do I find out my PDC username?"

    In [the PDC login portal](https://loginportal.pdc.kth.se), after logging
    in, you can see your Dardel username in the top-right corner:

    ![PDC login portal with username and key](./img/pdc_login_portal_with_username_and_key.png)

    > Example screenshot of the PDC login portal.
    > The Dardel username of this user is `svenbi`

### 3. Create SSH key pair

Create SSH key and add it to the PDC Login Portal.

- Create the password less SSH key in a Linux [terminal](../software/terminal.md) (e.g. from Rackham):

```bash
module load darsync
```

```bash
darsync sshkey
```

### 4. Add the public key to the PDC Login Portal

When creating the SSH key pair, `darsync` will already
display the public key.

If, however, you missed it,
you can view the public SSH key again; in a terminal logged into Rackham:

```bash
cat ~/id_ed25519_pdc.pub
```

???- question "How does that look like?"

    The text will look similar to this:

    ```console
    ssh-ed25519 AAAA69Nz1C1lZkI1NdE5ABAAIA7RHe4jVBRTEvHVbEYxV8lnOQl22N+4QcUK+rDv1gPS user@rackham2.uppmax.uu.se
    ```

Open the [PDC Login Portal](https://loginportal.pdc.kth.se/).

Follow our [step-by-step instructions on how to add SSH keys](../software/ssh_key_use_dardel.md).

### 5. Login

- the [PDC documentation on 'SSH login'](https://support.pdc.kth.se/doc/basics/quickstart/#how-to-log-in)

On a terminal, do:

```bash
ssh [username]@dardel.pdc.kth.se
```

where `[username]` is your PDC username, for example `ssh sven@dardel.pdc.kth.se`.
