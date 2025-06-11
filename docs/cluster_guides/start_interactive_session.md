---
tags:
  - start
  - interactive
  - session
---

# Starting an interactive session

![Logged in to Bianca via a terminal](./img/login_bianca_via_terminal_terminal_462_x_202.png)

Below we describe the general ideas of using an interactive session:

- [the types of nodes](#types-of-nodes)
- [When to use an interactive session](#when-to-use-an-interactive-session)

To start an interactive session on specific cluster:

- [Start an interactive session on Bianca](start_interactive_session_on_bianca.md)
- [Start an interactive session on Rackham](start_interactive_session_on_rackham.md)
- [Start an interactive session on Snowy](start_interactive_session_on_snowy.md)

## Types of nodes

The UPPMAX HPC clusters have three types of nodes:

???- tip "What are nodes?"

    See [the UPPMAX page about nodes](uppmax_cluster.md).

- **[login nodes](../cluster_guides/login_node.md)**:
  nodes where a user enters and interacts with the system
- **calculation nodes**: nodes that do the calculations

???- tip "Requesting a calculation to run"

    Requesting a calculation is described
    [at the UPPMAX page about our job scheduler](slurm.md).

???- tip "How can I find out on which node I am?"

    In a [terminal](../software/terminal.md), type `hostname`:

    - the [login node](../cluster_guides/login_node.md)
      has name `rackham[number]`,
      where `[number]` is the number of the login node
    - an interactive session has name `r[number]`,
      where `[number]` is the compute node number

As a login is shared with all users,
there is a simple rule to use it fairly:

> Only do short and light things on the login node

Examples of short and light things are:

- Editing files
- Copying, deleting, moving files
- Scheduling jobs
- Starting an interactive session

Examples of heavy things are:

- Running code with big calculations
- Develop code with big calculations line-by-line

???- tip "Develop code with big calculations line-by-line "

    This usage is typically done an interactive session

### When to use an interactive session

Some users develop computer code on an HPC cluster
in a line-by-line fashion.
These users typically want to run a (calculation-heavy)
script frequently, to test
if the code works.

However, scheduling each new line is too slow, as it
can take minutes before the new code is run.
Instead, there is a way to directly work
with such code: use an interactive session.

An interactive session is a type of calculation node,
where one can run heavy calculations directly.

```mermaid
flowchart TD
    UPPMAX(What to run on which node?)
    operation_type[What type of operation/calculation?]
    interaction_type[What type of interaction?]
    login_node(Work on login node)
    interactive_session(Work on interactive session)
    calculation_node(Schedule for calculation node)

    UPPMAX-->operation_type
    operation_type-->|light,short|login_node
    operation_type-->|heavy,long|interaction_type
    interaction_type-->|Direct|interactive_session
    interaction_type-->|Indirect|calculation_node
```
