function seleNames = getSeleNames(Inpath,buildNum)
%GETSELENAMES 此处显示有关此函数的摘要
%   此处显示详细说明

nameTable = struct2table(dir(Inpath));%"./train/"
nameMat = string(cell2mat(nameTable{3:end,1}));
seleNames = nameMat(contains(nameMat,join(["_00",buildNum],'')));

end

