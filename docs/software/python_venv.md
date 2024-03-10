# Python `venv`

`venv` is one of multiple 
[Python virtual environment managers](python_virtual_environments.md).

`venv` is a Python-only environment manager
and is [an official Python library](https://docs.python.org/3/library/venv.html).

Here it is described, using `venv` ...

- how to [create a virtual environment](#create-a-virtual-environment)
- how to [activate a virtual environment](#activate-a-virtual-environment)
- how to [deactivate a virtual environment](#deactivate-a-virtual-environment)

## Create a virtual environment

A virtual environment can be created in multiple ways, 
for example, from scratch, which is not recommended.

Here we discuss the recommended way to create a virtual environment,
which has these steps:
1. Load a Python module or a modules with Python packages
1. Create the virtual environment

### 1. Load a Python module or a modules with Python packages

The first step is described at 
['Loading Python'](http://docs.uppmax.uu.se/software/python/#loading-python)
and 
['Loading Python package modules'](http://docs.uppmax.uu.se/software/python/#loading-python-modules).

???- question "Just show me how to do this"

    Sure, here is how to [load a Python module](http://docs.uppmax.uu.se/software/python/#loading-python):

    ```
    module load python/3.11.8
    ```

    Here is how to [load a Python package module](http://docs.uppmax.uu.se/software/python/#loading-python-modules):

    ```
    module load python_ML_packages/3.11.8-cpu
    ```

### 2. Create the virtual environment

After loading the needed Python modules,
one can create a virtual environment
most efficiently using:

```
python -m venv --system-site-packages [path]/[venv_name]
```

where `[path]` is the path where you want to create your `venv` virtual
environment and `[venv_name]` is the name of the `venv` virtual environment.
For example `python -m venv --system-site-packages ~/my_venvs/example_venv`.

The `-m` flag makes sure that you use the libraries 
from the Python version you are using.
The `--system-site-packages` flags ensure you use
the packages already installed in the 
loaded Python module.

???- question "How long does this step take?"

    This depends. 

    This takes around 10 seconds:

    ```
    module load python/3.11.8
    python -m venv --system-site-packages ~/my_venvs/example_venv
    ```

    This takes around 10 seconds:

    ```
    module load python_ML_packages/3.11.8-cpu
    python -m venv --system-site-packages ~/my_venvs/example_ml_venv
    ```

## Activate a virtual environment

To activate your newly created virtual environment locate the
script called `activate` and execute it:

```
source [path]/[venv_name]/bin/activate
```

where `[path]` is the path where you want to create your `venv` virtual
environment and `[venv_name]` is the name of the `venv` virtual environment.
For example `source ~/my_venvs/example_venv/bin/activate`.

When a `venv` virtual environment is active, 
the prompt is changed to start with the name of your `venv`.

???- question "How does that look like?"

    This is how your changed prompt looks like:

    ```
    [sven@rackham1 ~]$ module load python_ML_packages/3.11.8-cpu
    [sven@rackham1 ~]$ python -m venv --system-site-packages ~/my_venvs/example_venv
    [sven@rackham1 ~]$ source ~/my_venvs/example_venv/bin/activate
    (example_venv) [sven@rackham1 ~]$ 
    ```

With the `venv` virtual environment active,
you can now install and update Python packages
in an isolated way.

## Deactivate a virtual environment

To deactivate a `venv` virtual environment:

```
deactivate
```

You will need to [activate a virtual environment](#activate-a-virtual-environment)
to work with it again.

## Links

- CodeRefinery's course: [Python for Scientific Computing](https://aaltoscicomp.github.io/python-for-scicomp/).
