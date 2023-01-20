# UPPMAX Userguide

This repository contains the source code for the [UPPMAX
documentation](https://uppmax.github.io/UPPMAX-userguide/)

## Contributing

Everyone is welcome to contribute either by creating a new issue or solving an
[existing one](https://github.com/UPPMAX/UPPMAX-userguide/issues) by submitting
a pull request. The recommended workflow for collaborators when working on an
issue is to:

1. Clone the [repository](https://github.com/UPPMAX/UPPMAX-userguide/issues)
2. Create a new branch where you add your changes
3. Push and submit a pull request
4. If the change is accepted after review it will be merged into the main
   branch

## Working on the documentation locally

To work on the website locally first create a virtual environment and install
the required dependencies

``` bash
python -m venv uppmax_venv
source uppmax_venv/bin/activate
pip install -r requirements.txt
```

Then activate the environment and serve the website on localhost

``` bash
mkdocs serve
```

If you wish to display the software table run

``` bash
python sw_table.py
```

located under `/scripts`

### Text-to-speech

The script `md_to_speech.py` takes an `.md` file, parses the text and generates
an mp3 using [`gTTS`](https://gtts.readthedocs.io/en/latest/). Run it by

```
python md_to_speech.py --input txt.md --lang en
```

## Credits

The website is created using
[mkdocs-material](https://squidfunk.github.io/mkdocs-material). The landing
page and layout was inspired by the documentation of the HPC cluster
[LUMI](https://docs.lumi-supercomputer.eu/). 
