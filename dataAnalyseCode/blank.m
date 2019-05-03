INpath = './train/';
for i=1:9
    nameList{i}=getSeleNames(INpath,i);
end
trydata = importdata(join([INpath nameList{1}(1)],''));
getNum = split(trydata);
getSepDate = split(getNum(1,2),',');
%% 分解单个数据
inputStr = getSepDate{9};
N=(length(inputStr)-8)/3;
result = split(inputStr,'&');
currDate = result{1};
currHours = split(result{2},'|');
hourLines = cell2mat(currHours);   
str2num([repmat(currDate(1,4:end),N,1),hourLines])