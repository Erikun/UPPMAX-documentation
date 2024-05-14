# Starting an interactive node on Snowy

![](./img/login_rackham4_via_terminal_terminal_395_x_204.png)

This page describes how to start an interactive node on [Snowy](snowy.md),
unlike the [general information on starting an interactive node](start_interactive_node.md).

To use an interactive node, in a terminal, type:

```bash
interactive -A [project name] -M snowy
```

For example:

```bash
interactive -A uppmax2023-2-25 -M snowy
```

This starts an interactive session using project `uppmax2023-2-25`
that has a default duration of 1 hours.

???- tip "Forgot your Snowy project?"

    One can go to the SUPR NAISS pages to see one's projects,

    ![](./img/naiss_supr_project_2023_2_25.png)

    > Example of the Snowy project called 'UPPMAX 2023/2-25'

    On the SUPR NAISS pages, projects are called 'UPPMAX [year]/[month]-[day]',
    for example, 'UPPMAX 2023/2-25'.
    The UPPMAX project name, as to be used on Snowy,
    has a slightly different name:
    the account name to use on Snowy is `uppmax[year]-[month]-[day]`,
    for example, `uppmax2023-2-25`

To increase the duration of the interactive session,
add the use of `-t`:

```bash
interactive -A [project name] -M snowy -t [session_duration]
```

For example:

```bash
interactive -A uppmax2023-2-25 -M snowy -t 8:00:00
```

This starts an interactive session using project `uppmax2023-2-25`
that has a maximum duration of 8 hours.

!!! note "Has Snowy frozen?"

    It can take tens of seconds before an interactive node is allocated.

    Snowy has not frozen, just be a bit more patient.
