function formatData = getIndivialData(inputStr)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%% �ֽⵥ������
N=(length(inputStr)-8)/3;
result = split(inputStr,'&');
currDate = result{1};
currHours = split(result{2},'|');
hourLines = cell2mat(currHours);  
formatData = str2num([repmat(currDate(1,4:end),N,1),hourLines]);
end

