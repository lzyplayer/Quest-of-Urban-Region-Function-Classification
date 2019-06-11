function contaioner = getAllofCertainTypeBuilding(namelist)
%GETALLOFCERTAINTYPEBUILDING 此处显示有关此函数的摘要
%   此处显示详细说明
contaioner = zeros(9123124,1);
for i=1:length(namelist)
    currdata = importdata(join(['../train/' namelist(i)],''));
    if iscell(currdata)
        getNum = split(currdata);
    else
        fid = fopen(join(['../train/' namelist(i)],''));
        tempData = textscan(fid,"%s %s");
        fclose(fid);
        getNum = [tempData{1},tempData{2}];
    end
    if size(getNum,2)<2
        getNum=getNum';
    end
end
fullinOneLine = join(getNum(:,2),',');
getSepDate = split(fullinOneLine,',');
arrivedIndicator = cell2mat(cellfun(@getIndivialData , getSepDate,'UniformOutput' ,false));
contaioner(arrivedIndicator)=ones(length(arrivedIndicator),1);


end

