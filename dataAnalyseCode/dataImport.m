% profile on
clc;clear;close all;
INpath = '../train/';
%% 获取9类建筑的所有所属txt
for i=1:9
    nameList{i}=getSeleNames(INpath,i);
end
%% 从txt获取匹配整合全部该类别建筑数据 ------ 4-火车站
for target=[5:9]
    result = getAllofCertainTypeBuilding(nameList{target}); %4-火车站
    %% 展示当前类别全部统计数据
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
    xlabel("距离2018.1.1天数/day")
    ylabel("时间/hour")
    zlabel("人数/人")
    title(num2str(target))
    saveas(gcf,['../dataAnalyseResult/' num2str(target) '.fig'])
    save( [ num2str(target) '.mat'] ,'showingPoints');
    close all
end
% trydata = importdata(join([INpath nameList{1}(1)],''));
% getNum = split(trydata);
% getSepDate = split(getNum(1,2),',');
% arrivedIndicator = cell2mat(cellfun(@getIndivialData , getSepDate,'UniformOutput' ,false));
% getIndivialData(getSepDate{2})