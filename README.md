# Export Neurodata-without-borders files
## archiveMTUtah_moveBlank

This script is the most important one, although it is 95% a blatant copy of the extracellular ephys tutorial on the NWB repository. It actually does the work with the NWB data structures. 

# Metadata Libraries
## paperList

This script defines a structure (papers) that we can include in multiple export scripts so that I never have to look up DOIs for papers more than once. This is usefule because "related publications" is part of the metadata in an NWB file. 

# Helper Functions
## getElectrodeTableFromMapFile

Give it a path to a Utah array map file (and a few other things), and it generates the electrodes "table" for that array. 

## getSpikeTimesFromTrainStruct

This processes the LZ-spikesort special `<filename>_MATSORT.mat` files and makes the spike information NWB-compliant. 
