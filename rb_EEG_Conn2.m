%% standard functions to load preprocessed fieldtrip mat-files and create WPLI matrices
function [] = rb_EEG_Conn2(directory)

epochLength = 4;
cd(directory);
filelist=dir('*.mat')

h = waitbar(0,'Running Network Analysis');
for i = 1:63 % number of subjects
    
    waitbar(i/63);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    currentfile=filelist(i,1)
    filename=currentfile.name
    load(strcat(fullfile(directory,filename)));
    disp(strcat('Working on file ', filename));
    
    %% Segment and reset timeline
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% redefine segments
    cfg_cut = [];
    cfg_cut.length = epochLength;
    cfg_cut.overlap = 0;
    %data_iccleaned = rmfield(data_iccleaned,'trialinfo'); % clear the original trialinfo to be able to redefine 
    data_iccleaned = ft_redefinetrial(cfg_cut, data_iccleaned); % cut it into little pieces
    %% reset the time-axis for the segmented epochs to avoid issues later on
    stepSize = 1/data_iccleaned.fsample;
    timeVector = 0:stepSize:(epochLength-stepSize);
    for j = 1:size(data_iccleaned.time,2)
        data_iccleaned.time{:,j} = timeVector;
    end
    
    
    %% Set up frequency split using wavelet
    cfg_freq = [];
    cfg_freq.method = 'mtmfft';
    cfg_freq.output = 'powandcsd';
    cfg_freq.channel = 1:28;
    cfg_freq.keeptrials ='yes'; %do not return an average of all trials for subsequent wpli analysis
    
    cfg_freq.taper = 'hanning';
    %delta
    %cfg_freq.tapsmofrq = 0.25;
    cfg_freq.foilim = [2 4];
    %cfg_freq.foi = exp(linspace(log(2),log(4),20));
    [freq_data.delta] = ft_freqanalysis(cfg_freq, data_iccleaned);
    
    %theta
    %cfg_freq.foi = exp(linspace(log(4),log(7),10));
    cfg_freq.foilim = [4 7];
    [freq_data.theta] = ft_freqanalysis(cfg_freq, data_iccleaned);
    
    
    cfg_freq.taper = 'dpss';
    cfg_freq.tapsmofrq = 1;
    %alpha
    %cfg_freq.foi = exp(linspace(log(7),log(13),10));
    cfg_freq.foilim = [7 13];
    [freq_data.alpha] = ft_freqanalysis(cfg_freq, data_iccleaned);
    
    cfg_freq.tapsmofrq = 2;
    %beta
    %cfg_freq.foi = exp(linspace(log(13),log(30),10));
    cfg_freq.foilim = [13 30];
    [freq_data.beta] = ft_freqanalysis(cfg_freq, data_iccleaned);
    
    cfg_freq.tapsmofrq = 4;
    %gamma
    %cfg_freq.foi = exp(linspace(log(30),log(60),10));
    cfg_freq.foilim = [30 60];
    [freq_data.gamma] = ft_freqanalysis(cfg_freq, data_iccleaned);
    
    %all
    %cfg_freq.foi = exp(linspace(log(2),log(60),10));
    cfg_freq.foilim = [2 60];
    [freq_data.all] = ft_freqanalysis(cfg_freq, data_iccleaned);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% connectivity analysis
    %% this is not the most elegant way, but it seems to work... Once we have the subject*freq matrices, just use the BCT
    cfg_conn = [];
    cfg_conn.method = 'wpli';
    
    conn.delta = ft_connectivityanalysis(cfg_conn, freq_data.delta);
    conn.delta = ft_checkdata(conn.delta, 'cmbrepresentation', 'full','datatype','freq');
    network_delta(i,:,:) = squeeze(nanmean(conn.delta.wplispctrm,3));
    
    conn.theta = ft_connectivityanalysis(cfg_conn, freq_data.theta);
    conn.theta = ft_checkdata(conn.theta, 'cmbrepresentation', 'full','datatype','freq');
    network_theta(i,:,:) = squeeze(nanmean(conn.theta.wplispctrm,3));
    
    conn.alpha = ft_connectivityanalysis(cfg_conn, freq_data.alpha);
    conn.alpha = ft_checkdata(conn.alpha, 'cmbrepresentation', 'full','datatype','freq');
    network_alpha(i,:,:) = squeeze(nanmean(conn.alpha.wplispctrm,3));
    
    conn.beta = ft_connectivityanalysis(cfg_conn, freq_data.beta);
    conn.beta = ft_checkdata(conn.beta, 'cmbrepresentation', 'full','datatype','freq');
    network_beta(i,:,:) = squeeze(nanmean(conn.beta.wplispctrm,3));
    
    conn.gamma = ft_connectivityanalysis(cfg_conn, freq_data.gamma);
    conn.gamma = ft_checkdata(conn.gamma, 'cmbrepresentation', 'full','datatype','freq');
    network_gamma(i,:,:) = squeeze(nanmean(conn.gamma.wplispctrm,3));
    
    conn.all = ft_connectivityanalysis(cfg_conn, freq_data.all);
    conn.all = ft_checkdata(conn.all, 'cmbrepresentation', 'full','datatype','freq');
    network_all(i,:,:) = squeeze(nanmean(conn.all.wplispctrm,3));
    
    %% Do some clean-up and save
    savename = strcat('w_',filename,'.mat');
    savename2 = strcat('pow_',filename,'.mat');
    save(savename, 'conn');
    save(savename2, 'freq_data');
    
end
close(h)

save(fullfile(donedir,'Results2.mat'), 'network_all', 'network_alpha', 'network_beta', 'network_delta', 'network_gamma', 'network_theta','filelist');

end