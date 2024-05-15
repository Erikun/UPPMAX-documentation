# SSH X forwarding

SSH X forwarding (or simply 'X forwarding')
allows one to use graphics when using an [SSH client](ssh_client.md).

For example, this is how UPPMAX user `sven` would login
to Rackham using [`ssh`](ssh.md) with X forwarding enabled:

```bash
ssh -X sven@rackham.uppmax.uu.se
```

It is the `-X` that allows [ssh](ssh.md) to show graphics.

???- question "What is X?"

    In this context, [the X window system](https://en.wikipedia.org/wiki/X_Window_System).

???- question "How can I verify I allow X forwarding?"

    In a terminal, type:

    ```bash
    xeyes
    ```

    If you have X forwarding enabled, you will see:

    ![](./img/xeyes_with_ssh_x_forwarding.png)

    > SSH X forwarding is enabled, as there are eyes shown in the top-right of the screen

    If you do not have X forwarding enabled, you will get the error:

    ```console
    Error: Can't open display:
    ```

    ![](./img/xeyes_no_ssh_x_forwarding.png)

    > SSH X forwarding is not enabled, as this gives an error message

## UPPMAX clusters that allow SSH with X forwarding

Cluster|Allows SSH with X forwarding
-------|----------------------------
Bianca |No
Rackham|Yes
Snowy  |Yes

## SSH clients

See [SSH clients](../software/ssh_client.md).

## Difference between `ssh -X` and `ssh -Y`

Adapted from [this AskUbuntu answer](https://askubuntu.com/a/35518):

If you need graphics, `ssh -X` is more secure.
However, it may be too secure for your software to run.
In that case, run `ssh -Y`.

```mermaid
flowchart TD
  need_graphics[Need graphics?]
  ssh[Using 'ssh' works]
  try_ssh_x[Try to use 'ssh -X'\n Does it work?]
  ssh_x[Use 'ssh -X']
  ssh_y[Use 'ssh -Y']

  need_graphics --> |no| ssh
  need_graphics --> |yes| try_ssh_x
  try_ssh_x --> |yes| ssh_x
  try_ssh_x --> |no| ssh_y
```

> Flowchart to determine to use `ssh` or `ssh -X` or `ssh -Y`.

???- question "Using `ssh -Y`? Let us know!"

    If you -a user- use `ssh -Y` when `ssh -X` does not work,
    let us know (see the UPPMAX support page [here](../support.md)).
    It helps us choose which option to show at these
    documentation websites.
