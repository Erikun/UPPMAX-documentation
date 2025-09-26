---
tags:
  - MATLAB
  - IDE
  - GUI
  - Pelle
---

# Using the MATLAB IDE on Pelle

 ![MATLAB IDE on Pelle](./img/matlab_on_pelle_via_website.png)

## Introduction

[MATLAB](../software/matlab.md) is an [IDE](../software/ides.md)
specialized for the [MATLAB](../software/matlab.md) programming language

In this session, we show how to use MATLAB on Pelle,
using Pelle's remote desktop environment.

???- tip "Forgot how to login to a remote desktop environment?"

    See [the 'Logging in to Pelle' page](../getting_started/login_pelle.md).

    Spoiler: go to [https://pelle.uppmax.uu.se/](https://pelle.uppmax.uu.se/)

As MATLAB is a resource-heavy program,
it must be run on an interactive session.

???- tip "Forgot how to start an interactive session?"

    See [the 'Starting an interactive session' page](../cluster_guides/start_interactive_session_on_pelle.md).

## Procedure to start MATLAB

Below is a step-by-step procedure to start MATLAB on Pelle.

??? question "Prefer a video?"

    Watch
    [the YouTube Video 'Using the MATLAB IDE on Pelle'](https://youtu.be/3wPynWzI9DQ)

## 1. Start a Pelle remote desktop environment

This can be either:

- [Login to the Pelle remote desktop environment using the website](../getting_started/login_pelle_remote_desktop_website.md)
- [Login to the Pelle remote desktop environment using a local ThinLinc client](../getting_started/login_pelle_remote_desktop_local_thinlinc_client.md)

## 2. Start an interactive session

Within the Pelle remote desktop environment, start a [terminal](../software/terminal.md).
Within that terminal, [start an interactive session](../cluster_guides/start_interactive_session_on_pelle.md)
with 2 cores:

```bash
interactive -A [naiss_project_id] -t [duration]
```

Where:

- `[naiss_project_id]` is an [UPPMAX project code](../getting_started/project.md).
  Use [`projinfo`](projinfo.md) to see which
  [UPPMAX projects](../getting_started/project.md) you have access to
  on Pelle.
- `[duration]` is the duration of the interactive session

Resulting in, For example:

```bash
interactive -A naiss2024-22-310 -t 8:00:00
```

???- tip "What is an interactive session?"

    See [start an interactive session](../cluster_guides/start_interactive_session_on_pelle.md)

## 3. Load the modules needed

In the terminal of the interactive session, do:

```bash
module load MATLAB/2024a
```

## 4. Start MATLAB

With the modules loaded, start MATLAB from the terminal (on the
interactive session):

```bash
matlab
```
