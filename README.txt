# Koeye stream timeseries

koeye-stream-data

Welcome to the Koeye River time-series data repository. This repository corresponds to the metadata record located at [insert DOI here]

The complete data file that's ready for analysis is called 'koeye-timeseries-2023.csv.' Each row represents the quality level, flag, and value associated with a measurement variable. 

CHANGELOG

Here we track what changes between different versions of the dataset. Different versions of the data set will be tagged on github with a release tag showing the version (eg. v1.2.0) that should be cited when using these data to be clear which version of the data you used for an analysis.

Data dictionary

In the data dictionary we aim to provide definitions of all the core tables. Definitions of variables in sample result data may have there own separate data dictionary or readme file in the raw_data folder and sub folders.
License

This repository is public and so the data and code are licensed under the Creative Commons By Attribution 4.0 (CC BY4) license. Download the data files you'd like or clone this Git repository and copy the data to your computer but you must attribute the work to the authors. To cite this work please see [DOI here] Please collaborate with the authors of this dataset if you plan to analyze it. They represent a significant public resource, and time investment.

What's in the supplemental material?
Data folders

raw_data

In the raw_data folder you will find the raw sensor data downloaded from the Hakai Sensor Network. 

Scripts

The koeye_sensor_qc.Rmd script performs various quality checks and integrates the data into the koeye-sensor-qc markdown document. The data-cleaning script performs various wrangling tasks to transform the default sensor network data format into a more workable format. 


Reports

These are qc reports generated annually.


