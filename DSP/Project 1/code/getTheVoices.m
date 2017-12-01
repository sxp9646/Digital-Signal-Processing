function getTheVoices(infile)
% Reading and extracting notes from midi file to produced a data
% structure to be used in the synthesis of Music
%
% getTheVoices(infile)
%   infile = name of midi file to read
%
% Requires: midi_lib toolbox
%
% must run set_midi before using
%
% Revised: Juan C. Cockburn 10/26/2014

% The columns are:
%       (1) - note start in beats
%       (2) - note duration in beats
%       (3) - channel
%       (4) - midi pitch (60 --> C4 = middle C)
%       (5) - velocity
%       (6) - note start in seconds
%       (7) - note duration in seconds

%% My music directory - midi files
mididir = 'C:\Users\jcceec\Music\midi\';
%% Read midi file
if nargin==0
  infile='BWV847_Fugue2_Cminor';
end

% add extension to filename and read
  mf=[mididir infile '.mid'];
  fprintf('Reading midi file %s.mid\n',infile);

  note_matrix = readmidi_java(mf);

%% extract notes start, duration and number
%  scalings needed for project
  noteStartBeats=note_matrix(:,1)*4; % temporaty fix
  noteDurationBeats=note_matrix(:,2)/0.25;
  noteNumber=note_matrix(:,4);

%% separate voices (e.g. notes)
  offset=-20;  % need to for project
  Done=0;
  k=0;
  fprintf('Extracting voices ...');
  while ~Done
    k=k+1;
    % extract k^th voice
    [theVoices(k).startPulses,ia]=unique(noteStartBeats,'stable');
    theVoices(k).durations=noteDurationBeats(ia);
    theVoices(k).noteNumbers=noteNumber(ia)+offset;
    % remove voice 
    noteStartBeats(ia)=[];
    noteDurationBeats(ia)=[];
    noteNumber(ia)=[];
    if isempty(noteStartBeats) % check if done
      Done=1;
    end
  end % while  
  k=k-1;
  % Eliminate last voice
  theVoices=theVoices(1:k);
  
  fprintf('%d Voices Extracted\n',k);

  eval(['save ' infile '.mat theVoices']);

  fprintf('Song saved to %s.mat\n',infile);
