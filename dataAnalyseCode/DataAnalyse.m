tryData = importdata("../train/000000_008.txt");
listTrain = dir("../train/");
myTable = struct2table(listTrain);
line = listTrain(3).name;
strfind(line,'_008')

nameList = cell2mat(myTable{3:end,1});
% (strfind(myTable{3:end,1},'_008'))==7;

%% get sele name Mat
listTrain = dir("./train/");
nameTable = struct2table(listTrain);
nameList = cell2mat(nameTable{3:end,1});
nameMat = string(nameList);

containLogica = contains(nameMat,"_008");

seleNames = nameMat(containLogica);

%% get 
getSepDate = split(getNum(1,2),',');
chaosData = cellfun(@getIndivialData , getSepDate,'UniformOutput' ,false);



