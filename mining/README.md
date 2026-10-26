# Agents

This is a collection of experiments in mining.

## mlab
A simple lab for experimenting with strategic value optimisation. The Excel spreadsheet model has a fixed set of required sheets and input parameters. The Golang CLI uses the spreadsheet to perform the simulation. The results are fed back into the spreadsheet. The CLI watches for any changes to the spreadsheet, when a change is detected the lab is rerun. This experiment does not include an optimisation loop.