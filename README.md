# Graph Theory and Connectivity on Resting State
(All files including the  part "rb" within the filename belong to the work of Richard Bethlehem, 
(ARC, University of Cambridge) and have only been slightly adapted) 

## Useful for
* preprocessing of EEG Resting State files using fieldtrip 
or
* preprocessing within eeglab and export to fieldtrip
* preprocessing of PAT-EEG with fieldtrip (still in progress
* calculation of connectivity matrices
* calculation of graph theoretical network parameters (and thresholded adjacency matrices)
* export of matlab structures or matrices as .csv for statistics in R

## Current conditions
* 28 electrodes
* 5 min Resting State, 4s epoching

## Necessary Matlab Toolboxes
* (eeglab)
* Fieldtrip
* BCT (Brain Connectivity Toolbox)
* (Matlab BGL, Boost Graph Library) for graphics of graphs (better in R)
* (Psychtoolbox 3) for experiments (better in Python/Psychopy)
* BrainNet Viewer

## Frequent error messages
try:
* is fieldtrip on the search path?
* if yes, is fieldtrip/external/signal/hack(..)... path removed? 
* are all scripts (including rb_makeSymmetric.m) on search path?

## order of processing

1. preprocessing eeglab or fieldtrip
2. (if 1. eeglab): eeglab_fieldtrip_loop.m
3. rb_EEG_Conn2.m (if error, try rb_EEG_Conn.m)
4. rb_EEG_Network2.m (makes use of rb_maeSymmetric.m)
5. export: networkparameters2csv2.m, matrices2csv.m (binary), matrices2csv2.m (raw matrices) --> statistics in R (https://github.com/TeresaWe/EEG_RS_Statistics)
6. permutation_stats_Matrices an permutation_statsZMatrices calculate single connection differences across groups (subjects raw matrices vs. z-standardised matrices). Makes use of FDR.m and permutation_2tailed
7. Take any averaged, single subject or FDR difference Matrix and plot as graphs via igraph (R) or with electrode positions using BrainNetViewer (writeNodes.m, to convert data into .node & .edge files for BrainNetViewer; this needs writefiles_BrainNet.m). 


