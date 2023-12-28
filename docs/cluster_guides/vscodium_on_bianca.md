# Using VSCodium on Bianca

![](./img/vscodium_on_bianca_480_x_270.png)

## Introduction

VSCodium is the community edition of Visual Studio Code
and can be used for software development in many languages.

???- tip "What is an IDE?"

    See [the page on IDEs](ides.md).

In this session, we show how to use VSCodium on Bianca,
using Bianca's remote desktop environment.

???- tip "Forgot how to login to a remote desktop environment?"

    See [the 'Logging in to Bianca' page](../getting_started/login_bianca.md).

As VSCodium is a resource-heavy program,
it must be run on an interactive node.

## Procedure to start VSCodium


### 1. Get within SUNET

???- tip "Forgot how to get within SUNET?"

    See [the 'Logging in to Bianca' page](../getting_started/login_bianca.md).

### 2. Start the Bianca remote desktop environment

???- tip "Forgot how to start Bianca's remote desktop environment?"

    See [the 'Logging in to Bianca' page](../getting_started/login_bianca.md).

### 3. Start an interactive session

Within the Bianca remote desktop environment, start a terminal.
Within that terminal, start an interactive session with 1 core.

???- tip "Forgot how to start an interactive node?"

    See [the 'Starting an interactive node' page](start_interactive_node_on_bianca.md).

    Spoiler: use:

    ```
    interactive -A sens2023598 -n 1 -t 8:00:00
    ```

### 4. Load the modules needed

VSCodium needs the `VSCodium/latest` module.

In the terminal of the interactive session, do:

```
module load VSCodium/latest`
```

### 5. Start VSCodium

With the modules loaded, 
in that same terminal, 
start VSCodium:


```
code
```

VSCodium starts up quickly.

???- info "How does VSCodium look on Bianca?"

    ![](./img/vscodium_on_bianca.png)
