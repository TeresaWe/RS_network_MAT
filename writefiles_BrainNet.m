%write node and edges files for BrainNet-Viewer
%create empty amtrix/array/table with this functions
% nodes = {};
% edges = [];

%%%%%%%insert data into empty array/matrix

nameN = '*.node'; %change name
nameE = '*.edge'; % change name
cd('G:\EEG RS Preprocessing\zGraph Theory\BrainNetViewer') %output folder
writeNodes(nodes, nameN, edges, nameE)