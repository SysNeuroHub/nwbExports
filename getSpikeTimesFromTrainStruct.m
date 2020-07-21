% Function: getSpikeTimesFromTrainStruct
% This is a very specific-purpose function that converts one of my old data
% files into a nwb-ready format. 
% - It concatenates multi and single units into one sequence.
% - It converts the spike train format (ms resolution) to spike times (s). 
% Input: spikeTrains LZ-brand data type. This data structure has subfields:
%                       .MUchan | .SUchan channels on which each unit was recorded
%                       .MU | .SU spike trains where rows correspond to
%                       units
%                    Usually the file that has this data has a _MATSORT
%                    suffix. 
% Output: spikes     a cell array of spike times where each entry is a unit
%         allCh      a list of the electrodes each unit was recorded on
%         unitTypes  whether the unit was classed as MU or SU. 
% Dependencies: nwbmatlab
function [spikes, allCh, unitTypes] = getSpikeTimesFromTrainStruct(spikeTrains)
    
    nMU = length(spikeTrains.MUchan);
    nSU = length(spikeTrains.SUchan);

    for iCh = 1:nMU
        spikes{iCh} = find(spikeTrains.MU(iCh, :))/1000; % spike times in seconds

    end
    for iCh = 1:nSU
        spikes{nMU+iCh} = find(spikeTrains.SU(iCh, :))/1000; % spike times in seconds
    end

    unitTypes = [zeros(nMU,1); ones(nSU, 1)];
    allCh = [spikeTrains.MUchan spikeTrains.SUchan];