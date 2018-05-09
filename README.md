# Graph Theory and Connectivity on Resting State
(All files including the  part "rb" within the filename belong to the work of Richard Bethlehem, 
(ARC, University of Cambridge) and have only been slightly adapted) 

## Useful for
* preprocessing of EEG Resting State files using fieldtrip 
or
* preprocess within eeglab and export to fieldtrip
* preprocessin of PAT-EEG with fieldtrip (still in progress
* calculation of connectivity matrices
* calculation of graph theoretical network parameters (and thresholded adjacency matrices)
* export of matlab structures or matrices as .csv for statistics in R

## Current conditions
* 28 electrodes
* 5 min Resting State, 4 epoching

## Necessary Matlab Toolboxes
* (eeglab)
* Fieldtrip
* BCT (Brain Connectivity Toolbox)
* (Matlab BGL, Boost Graph Library) for graphics of graphs (better in R)
* (Psychtoolbox 3) for experiments (better in Python/Psychopy)

## Frequent error messages
* is fieldtrip on the search path?
* if yes, is fieldtrip/external/signal/hack(..)... path removed? 
* are all scripts (including rb_makeSymmetric.m) on search path?

## order of processing

1. preprocessing eeglab or fieldtrip
2. (if 1. eeglab): eeglab_fieldtrip_loop.m
3. rb_EEG_Conn2.m (if error, try rb_EEG_Conn.m)
4. rb_EEG_Network2.m (makes use of rb_maeSymmetric.m)
5. export: networkparameters2csv2.m, matrices2csv.m (binary), matrices2csv2.m (raw matrices)


