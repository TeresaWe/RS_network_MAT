%export combined results of network analysis (all subjects within one table
%per parameter) as csv. 
%go into folder and change!
cd('G:\EEG RS Preprocessing\zRS_EO_all_rejected_fieldtrip\done\networks_theta') %change folder to next freq band
prefix='theta_'  %change prefix

%load
load('Net_ResultsCombined.mat', 'Combined') 
%get all fieldnames of structure
fns = fieldnames(Combined)
%write csv
for i=1:size(fns)
    currenttable=Combined.(fns{i})
    cd('G:\EEG RS Preprocessing\zGraph Theory')
    csvwrite(strcat(prefix,fns{i},'.csv'),currenttable) % 
    cd('G:\EEG RS Preprocessing\zRS_EO_all_rejected_fieldtrip\done\networks_all')
    i=i+1
end
