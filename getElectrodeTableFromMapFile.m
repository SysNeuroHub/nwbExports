% Function: getElectrodeTableFromMapFile
% Input: mapFile     path to the .cmp file for the array
%        group_link  pass in the reference to general/extracellular
%                       ephys/group_name
%        variables   variables in the electrodes table
%        values      the default values of the variables 
% Output: tbl        a matlab table that can be converted to an nwb table
% Dependencies: NPMK, matnwb
function [tbl] = getElectrodeTableFromMapFile(mapFile, group_link, variables, values)

arrayMap = KTUEAMapFile(mapFile);

tbl = cell2table(cell(0, length(variables)), 'VariableNames', variables);

for ielec = 1:96 % this is a hack, but sometimes the map files are wrong.
    [c, r] = arrayMap.getChannelColumnRow(ielec);
    tbl = [tbl; {c, r, values{3}, values{4}, values{5}, values{6}, ...
        group_link, arrayMap.getChannelLabel(ielec)}];
end
    