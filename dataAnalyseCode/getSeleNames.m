function seleNames = getSeleNames(Inpath,buildNum)
%GETSELENAMES �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

nameTable = struct2table(dir(Inpath));%"./train/"
nameMat = string(cell2mat(nameTable{3:end,1}));
seleNames = nameMat(contains(nameMat,join(["_00",buildNum],'')));

end

