%export matrices of each subject from Reults Structure to .csv.
%go into folder and change!
cd('G:\EEG RS Preprocessing\zRS_EC_all_rejected_fieldtrip\done\networks_gamma') %change folder to next freq band
prefix='gamma_'  %change prefix
%load
load('Net2_Results.mat', 'Results','Results.filename')
%get all fieldnames of structure
n = size(Results,2) 
%write csv
for i=1:n
    currenttable=Results{1,i}.s.Matrices
    filename=Results{1,i}.s.filename
    cd('G:\EEG RS Preprocessing\zGraph Theory\EC\Matrices\gamma') %change EC/EO
    csvwrite(strcat(prefix,'MAT_',filename,'.csv'),currenttable) % 
    cd('G:\EEG RS Preprocessing\zRS_EC_all_rejected_fieldtrip\done\networks_gamma') %change folder
    i=i+1
end
