# Using VSCodium on Rackham

![VSCodium on another cluster, as VSCodium on Rackham fails](./img/vscodium_on_bianca_480_x_270.png)

> VSCodium on another cluster, as VSCodium on Rackham fails

!!! warning "VSCodium fails, use VSCode instead"

    The approach below will fail
    (note that [using VSCodium on Bianca](vscodium_on_bianca.md) does work).

    Instead, go to the page [Using VSCode on Rackham](vscode_on_rackham.md)

## Introduction

VSCodium is the community edition of Visual Studio Code
and can be used for software development in many languages.

???- tip "What is an IDE?"

    See [the page on IDEs](../software/ides.md).

In this session, we show how to use VSCodium on Rackham,
using Rackham's remote desktop environment.

???- tip "Forgot how to login to a remote desktop environment?"

    See [the 'Logging in to Rackham' page](../getting_started/login_rackham.md).

As VSCodium is a resource-heavy program,
it must be run on an interactive node.

## Procedure to start VSCodium

### 1. Start the Rackham remote desktop environment

???- tip "Forgot how to start Rackham's remote desktop environment?"

    See [the 'Logging in to Rackham' page](../getting_started/login_rackham.md).

### 2. Start an interactive session

Within the Rackham remote desktop environment, start a terminal.
Within that terminal, start an interactive session with 1 core.

???- tip "Forgot how to start an interactive node?"

    See [the 'Starting an interactive node' page](../cluster_guides/start_interactive_node_on_rackham.md).

    Spoiler: use:

    ```bash
    interactive -A uppmax2023-2-25
    ```

### 3. Load the modules needed

VSCodium needs the `VSCodium/latest` module.

In the terminal of the interactive session, do:

```bash
module load VSCodium/latest`
```

### 4. Start VSCodium

With the modules loaded,
in that same terminal,
start VSCodium:


```bash
code
```

VSCodium will give an error?

???- info "How does the VSCodium error look on Rackham?"

    ![VSCodium on Rackham fails](./img/vscodium_on_rackham_error.png)
