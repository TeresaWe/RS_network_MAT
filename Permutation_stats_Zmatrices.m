%permutation statitics on raw matrices, which are z-standardised 
%(across all electrode pairs within one subject) before processing!
%BETA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('G:\EEG RS Preprocessing')
%load group membership data (AP vs.RP)
groups=readtable('EEG_order_groups.csv')
%raw matrices are (seperate for EO and EC) within folder "done",choose folder of frequency band
cd('G:\EEG RS Preprocessing\zRS_EO_all_rejected_fieldtrip\done\networks_beta') 

%load 'Net2_Results.mat' --> Results{1,subject}.ConnMat (Connectivity
%Matrices
load('Net2_Results.mat', 'Results')

%creat matrix1 (AP) and matrix2 (RP) 28*28*nsub
AP=[]
nAP=1
RP=[]
nRP=1
for i=1:size(groups,1)
    currenttable=Results{1,i}.ConnMat
    triangular_up= triu(currenttable,1)
    mean_M=sum(triangular_up(:))/((28*28/2)-28)
    sd_M=sqrt(sum((triangular_up(:)-mean_M).^2)/((28*28/2)-28-1))
    currenttable=((currenttable-mean_M)/sd_M)
    currenttable(logical(eye(size(currenttable)))) = 1
    if (groups.group(i)==1)&&(groups.exclude_1el(i)~=1)
        AP(:,:,nAP)=currenttable;
        nAP=nAP+1
    elseif (groups.group(i)==0) && (groups.exclude_1el(i)~=1)
        RP(:,:,nRP)=currenttable
        nRP=nRP+1
    end
    i=i+1
end

%rb_compareMatrices.m (needs permutation_2tailed.m,FDR.m)

[outP outFDR p_fdr outD]=rb_compareMatrices2(AP, RP, 100000) %the higher the n of 
%permutations, the better the symmetry of matrices

cd('G:\Backup PC Cambridge\Teresa\files\EEG Statistics\zGraph Theory\single_connection_test') 
csvwrite('outP_beta_z.csv',outP)
csvwrite('FDR_beta_z.csv',outFDR)
csvwrite('p_fdr_beta_z.csv',p_fdr)
csvwrite('outD_beta_z.csv',outD)


%DELTA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('G:\EEG RS Preprocessing')
%load group membership data (AP vs.RP)
groups=readtable('EEG_order_groups.csv')
%raw matrices are (seperate for EO and EC) within folder "done",choose folder of frequency band
cd('G:\EEG RS Preprocessing\zRS_EC_all_rejected_fieldtrip\done\networks_delta') 

%load 'Net2_Results.mat' --> Results{1,subject}.ConnMat (Connectivity
%Matrices
load('Net2_Results.mat', 'Results')

%creat matrix1 (AP) and matrix2 (RP) 28*28*nsub
AP=[]
nAP=1
RP=[]
nRP=1
for i=1:size(groups,1)
    currenttable=Results{1,i}.ConnMat
    triangular_up= triu(currenttable,1)
    mean_M=sum(triangular_up(:))/((28*28/2)-28)
    sd_M=sqrt(sum((triangular_up(:)-mean_M).^2)/((28*28/2)-28-1))
    currenttable=((currenttable-mean_M)/sd_M)
    currenttable(logical(eye(size(currenttable)))) = 1
    if (groups.group(i)==1)&&(groups.exclude_1el(i)~=1)
        AP(:,:,nAP)=currenttable;
        nAP=nAP+1
    elseif (groups.group(i)==0) && (groups.exclude_1el(i)~=1)
        RP(:,:,nRP)=currenttable
        nRP=nRP+1
    end
    i=i+1
end

%rb_compareMatrices.m (needs permutation_2tailed.m,FDR.m)

[outP outFDR p_fdr outD]=rb_compareMatrices2(AP, RP, 100000) %the higher the n of 
%permutations, the better the symmetry of matrices
cd('G:\Backup PC Cambridge\Teresa\files\EEG Statistics\zGraph Theory\single_connection_test') 
csvwrite('outP_delta_z.csv',outP)
csvwrite('FDR_delta_z.csv',outFDR)
csvwrite('p_fdr_delta_z.csv',p_fdr)
csvwrite('outD_delta_z.csv',outD)



