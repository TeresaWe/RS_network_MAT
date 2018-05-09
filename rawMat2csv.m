%%export raw matrices for EC and EO for each frequency band as CSV.
%%%%%%%%%%%%%%%%

%EC
% set cd
cd('G:\EEG RS Preprocessing\zRS_EC_all_rejected_fieldtrip\done')
%read .mat files
load('Results2.mat', 'network_all','network_alpha', 'network_beta','network_delta', 'network_theta', 'network_gamma')
%new folder
cd('G:\EEG RS Preprocessing\zGraph Theory\EC\Matrices\')
%write to csv
csvwrite('rawMAT_network_all.csv',network_all)
csvwrite('rawMAT_network_alpha.csv',network_alpha)
csvwrite('rawMAT_network_beta.csv',network_beta)
csvwrite('rawMAT_network_delta.csv',network_delta)
csvwrite('rawMAT_network_theta.csv',network_theta)
csvwrite('rawMAT_network_gamma.csv',network_gamma)

%EC
% set cd
cd('G:\EEG RS Preprocessing\zRS_EO_all_rejected_fieldtrip\done')
%read .mat files
load('Results2.mat', 'network_all','network_alpha', 'network_beta','network_delta', 'network_theta', 'network_gamma')
%new folder
cd('G:\EEG RS Preprocessing\zGraph Theory\EO\Matrices\')
%write to csv
csvwrite('rawMAT_network_all.csv',network_all)
csvwrite('rawMAT_network_alpha.csv',network_alpha)
csvwrite('rawMAT_network_beta.csv',network_beta)
csvwrite('rawMAT_network_delta.csv',network_delta)
csvwrite('rawMAT_network_theta.csv',network_theta)
csvwrite('rawMAT_network_gamma.csv',network_gamma)



