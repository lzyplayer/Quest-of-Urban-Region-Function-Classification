% profile on
clc;clear;close all;
Inpath = '../train/';

nameTable = struct2table(dir(Inpath));%"./train/"
nameMat = string(cell2mat(nameTable{3:end,1}));
% 4000 data 4368 hours 1 label
visitDataSet = zeros(40000,4369);
parfor i=1:40000
    visitDataSet(i,:) = getdataLinePerFile( nameMat(i));
end