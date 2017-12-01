% Set MUSICLAB directories
here = cd; % save current directory
DIR = ('C:/Users/Andy/Documents/Fall Semester 2016/DSP/musiclab'); % MUSICLAB directory
chdir(DIR); % go to MUSICLAB directory
addpath(genpath(pwd)); % add to path directory and subdirectories
DIR = ('C:/Users/Andy/Documents/Fall Semester 2016/DSP/spfirst'); % spfirst directory
chdir(DIR); % go to spfirst directory
addpath(genpath(pwd)); % add to path directory and subdirectories
chdir(here) % return to where you were