% profile on
clc;clear;close all;
INpath = '../train/';
%% ��ȡ9�ཨ������������txt
for i=1:9
    nameList{i}=getSeleNames(INpath,i);
end
%% ��txt��ȡƥ������ȫ������������� ------ 4-��վ
result = getAllofCertainTypeBuilding(nameList{4}); %4-��վ
%% չʾ��ǰ���ȫ��ͳ������
j=0;
referenceDateNum=datenum([2018,01,01]);
for i=1:length(result)
    if result(i)~=0
        j=j+1;
        timeDateRaw = floor(i/100);
        currDateNum=datenum([(2010+floor(timeDateRaw/10000)),floor(mod(timeDateRaw,10000)/100),mod(timeDateRaw,100)]);
        showingPoints(j,:)= [currDateNum-referenceDateNum,mod(i,100),result(i)];
    end
end
%floor(timeBad/10000-8)*365+floor(mod(timeBad,10000)/100)*30+mod(timeBad,100)


pcshow(pointCloud(showingPoints));
xlabel("����2018.1.1����/day")
ylabel("ʱ��/hour")
zlabel("����/��")
title("��վ")
% trydata = importdata(join([INpath nameList{1}(1)],''));
% getNum = split(trydata);
% getSepDate = split(getNum(1,2),',');
% arrivedIndicator = cell2mat(cellfun(@getIndivialData , getSepDate,'UniformOutput' ,false));
% getIndivialData(getSepDate{2})