function contaioner = getdataLinePerFile(path)
% 此处显示有关此函数的摘要
%   此处显示详细说明

currdata = importdata(join(['../train/' path],''));
if iscell(currdata)
    getNum = split(currdata);
else
    fid = fopen(join(['../train/'  path],''));
    tempData = textscan(fid,"%s %s");
    fclose(fid);
    getNum = [tempData{1},tempData{2}];
end
if size(getNum,2)<2
    getNum=getNum';
end

%% put all in one line
fullinOneLine = join(getNum(:,2),',');
getSepDate = split(fullinOneLine,',');
allDataInFile = cell2mat(cellfun(@getIndivialData , getSepDate,'UniformOutput' ,false));
%% initial
%{
frist day from 2018.1.1 = 273
days = 182  
hours = 24
data = days * hours = 4368
label =1
nums = 4369
%}
referenceDateNum=datenum([2018,01,01]);
contaioner = zeros(4369,1);
%% sum visit 
timeDateRaw = floor(allDataInFile/100);
currDateNum=datenum([(2010+floor(timeDateRaw/10000)),floor(mod(timeDateRaw,10000)/100),mod(timeDateRaw,100)]);
currTime = (currDateNum-referenceDateNum-273)*24+ mod(allDataInFile,100) ;
%% generate line
for i=1:length(contaioner)
    contaioner(i)=sum(currTime==i);
end
contaioner(end)=str2num(path(10));





