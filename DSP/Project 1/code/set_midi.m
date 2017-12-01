% SET_MIDI_LIB
%   Run to setup Matlab to run the midi_lib properly
%
% Rev: JCCK 2015

% Directory where you installed the midi_lib
  MIDI_LIB_DIR = 'G:/Local/LocalMatlab/v7/teaching/midi_lib';

% Add midi_lib path to matlab path
  CMD = ['genpath(''' MIDI_LIB_DIR ''');']';
  x=eval(CMD);
  addpath(x);
% Add the following to Matlab's java class path
  CMD = ['javaclasspath(''' MIDI_LIB_DIR '/KaraokeMidiJava.jar'');'];
  x=eval(CMD);
