%this script changes all eeglab files into matlab files

% open eeglab
eeglab
% select folder (EO vs. EC)
% EO

cd 'G:\EEG RS Preprocessing\zRS_EO_all' 
% load file
filelist=dir('*.mat')
for i=1:63 %number of files in folder
currentfile=filelist(i,1)
filename=currentfile.name
EEG = pop_loadset(filename,'G:\EEG RS Preprocessing\zRS_EO_all')
% run script eeglab2fieldtrip.m
data_iccleaned = eeglab2fieldtrip(EEG,'preprocessing', 'none') %data_iccleaned because of later scripts bz Richard Bethlehem
% save result 
cd 'G:\EEG RS Preprocessing\zRS_EO_all_fieldtrip'
save(filename, 'data_iccleaned')
% clear workspace and go into new folder
cd 'G:\EEG RS Preprocessing\zRS_EO_all'
i=i+1
clear filename currentfile EEG data_iccleaned
end

%EC
clear 

cd 'G:\EEG RS Preprocessing\zRS_EC_all'
% load file
filelist=dir('*.mat')
for i=1:63 %number of files in folder
currentfile=filelist(i,1)
filename=currentfile.name
EEG = pop_loadset(filename,'G:\EEG RS Preprocessing\zRS_EC_all')
% run script eeglab2fieldtrip.m
data_iccleaned = eeglab2fieldtrip(EEG,'preprocessing', 'none') %data_iccleaned because of later scripts bz Richard Bethlehem
% save result 
cd 'G:\EEG RS Preprocessing\zRS_EC_all_fieldtrip'
save(filename, 'data_iccleaned')
% clear workspace
cd 'G:\EEG RS Preprocessing\zRS_EC_all'
i=i+1
clear filename currentfile EEG data_iccleaned
end

clear


% same for files after additional rejection of artefacts!


cd 'G:\EEG RS Preprocessing\zRS_EO_all_rejected'
% load file
filelist=dir('*.mat')
for i=1:63 %number of files in folder
currentfile=filelist(i,1)
filename=currentfile.name
EEG = pop_loadset(filename,'G:\EEG RS Preprocessing\zRS_EO_all_rejected')
% run script eeglab2fieldtrip.m
data_iccleaned = eeglab2fieldtrip(EEG,'preprocessing', 'none') %data_iccleaned because of later scripts bz Richard Bethlehem
% save result 
cd 'G:\EEG RS Preprocessing\zRS_EO_all_rejected_fieldtrip'
save(filename, 'data_iccleaned')
% clear workspace
cd 'G:\EEG RS Preprocessing\zRS_EO_all_rejected'
i=i+1
clear filename currentfile EEG data_iccleaned
end

clear

% same for files after additional rejection of artefacts!
%EC
cd 'G:\EEG RS Preprocessing\zRS_EC_all_rejected'
% load file
filelist=dir('*.mat')
for i=1:63 %number of files in folder
currentfile=filelist(i,1)
filename=currentfile.name
EEG = pop_loadset(filename,'G:\EEG RS Preprocessing\zRS_EC_all_rejected')
% run script eeglab2fieldtrip.m
data_iccleaned = eeglab2fieldtrip(EEG,'preprocessing', 'none') %data_iccleaned because of later scripts bz Richard Bethlehem
% save result 
cd 'G:\EEG RS Preprocessing\zRS_EC_all_rejected_fieldtrip'
save(filename, 'data_iccleaned')
% clear workspace
cd 'G:\EEG RS Preprocessing\zRS_EC_all_rejected'
i=i+1
clear filename currentfile EEG data_iccleaned
end

clear
