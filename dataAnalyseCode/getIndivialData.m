function formatData = getIndivialData(inputStr)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
%% 分解单个数据
N=(length(inputStr)-8)/3;
result = split(inputStr,'&');
currDate = result{1};
currHours = split(result{2},'|');
hourLines = cell2mat(currHours);  
formatData = str2num([repmat(currDate(1,4:end),N,1),hourLines]);
end

