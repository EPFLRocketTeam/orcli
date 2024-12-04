# orcli
For a documentation on how to setup/use/troubleshoot or how this works from a general perspective, see https://rocket-team.epfl.ch/en/competition/firehorn/flight-dynamics/orcli

The goal of this was to facilitate using OpenRocket (OR) through a command line interface.
As of now, this is what ORCLI does:
- Take 5 arguments from user: `<component>`, `<property>`, `<start>`, `<end>`, `<iterations>`.
An example would be: ./a nosecone length 1 2 6
- Uniformly divide the interval [`<start>`;`<end>`] into `<iterations>` values.
With the same example: [1;2] would be divided into the 6 values: 1, 1.2, 1.4, 1.6, 1.8, 2.
- For a given rocket, run `<iterations>` simulations, each with `<component>`'s `<property>` set to a different value obtained from the previous division.
With the same example: 6 simulations would be run, with nosecone's length set to respectively: 1, 1.2, 1.4, 1.6, 1.8, 2.
- Data from each simulation is saved to a separate Excel sheet of an Excel workbook.

Here, detailed documentation on what the `.ahk` scripts do will be given.
For documentation on AHK itself, see https://www.autohotkey.com/docs/v2/.

# open.ahk
This script takes 1 argument: the (absolute) path to the `.ork` file to be opened. When `open.ahk` is called in `orcli.cpp`, it is called with the argument `FILEPATH`, which must be modified directly in the code before compilation.
In AHK, the first argument can be accessed via `A_Args[1]`, the second by `A_Args[2]`, etc.
In addition, a variable `ORPATH` is initialized with a string containing the path to `OpenRocket.exe`. This will be used later to run OR, in case it is not already open. This path must be modified manually.

First, the script checks whether OR is open. This is because opening OR takes more time to just activating it (switching to an OR window). It then splits into 2 cases.
## OR is open




(in progress)
