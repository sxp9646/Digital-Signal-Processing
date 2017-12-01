function xx = synthandplay(songfile, fs, tuning)
% Synthesize and Play a song encoded in the theVoices
% given piano key number in the well-tempered tuning or 
% just-tempered tuning
%
% usage: xx = synthandplay(songfile, fs, tuning)
% 
% xx = the output sinusoidal waveform
% songfile = the name of the *.mat file to read from
% fs = sampling frequecy
% tuning = 1 for well-tempered tuning, 0 for just-tempered tuning
% 

% Set default values
if nargin == 0
    songfile = 'BWV847_Fugue2_Cminor'; % Default song
    fs = 11025; % default sampling frequency
    tuning = 1;
elseif nargin == 1
    fs = 11025; % default sampling frequency
    tuning = 1;
elseif nargin == 2
    tuning = 1;
end

%% Playback parameters
bpm = 80;
beats_per_second = bpm/60;
seconds_per_beat = 1/beats_per_second;
seconds_per_pulse = seconds_per_beat/4;
samples_per_pulse = fs * seconds_per_pulse;

%% Load music file and find number of voices
eval(['load' ' ''' songfile '.mat''']);
number_of_voices = size(theVoices,2);

%% Process theVoices to generate sinusoids
%% 1. Find last pulse and total duration of piece
for vloop = 1:number_of_voices
    % find # of notes per voice
    number_of_notes(vloop) = length(theVoices(vloop).noteNumbers);
    if number_of_notes(vloop)> 0
        last_pulse(vloop) = theVoices(vloop).startPulses(number_of_notes(vloop));
        last_duration(vloop) = theVoices(vloop).durations(number_of_notes(vloop));
    end
end

%% 2. Synthesize soundtrack one voice at a time (mono version)
% Find size of vector to hold all notes
size_of_soundtrack = (sum(theVoices(1).durations*samples_per_pulse*1.08)...
                          + number_of_notes(1));

soundtrack = zeros(1, round(size_of_soundtrack));

% Synthesize the notes, one voice at a time
fprintf('synthesizing %d voices\n', number_of_voices);
dur = seconds_per_pulse;
one_pulse_rest_note = key2notewt(0,0,dur);

for vloop = 1:number_of_voices % voices loop
    fprintf('voices %d\n', vloop);
    n1 = 1;
    for nloop = 1:number_of_notes(vloop) % notes loop
        % Find duration and key number
        dur = (theVoices(vloop).durations(nloop))*seconds_per_pulse;
        keynum = theVoices(vloop).noteNumbers(nloop);
        
        % Generate waveform, include harmonics and ADSR
        if tuning == 1 
            note = key2notewt(80*exp(j*pi/4),keynum,dur);
        elseif tuning == 0
            note = key2notejt(80*exp(j*pi/4),keynum,dur); 
        end
        enveloped_note = envelope(note);
        
        % Compute where to insert tone
        place_of_tone = theVoices(vloop).startPulses(nloop);
        if nloop == 1
            if place_of_tone ~= 1
                delay = place_of_tone-1;
                for loop = 1:delay
                    n2 = n1 + length(one_pulse_rest_note) - 1;
                    soundtrack(n1:n2) = soundtrack(n1:n2) + one_pulse_rest_note;
                    n1 = n2 + 1;
                end
                n2 = n1 + length(enveloped_note) - 1;
                soundtrack(n1:n2) = soundtrack(n1:n2) + enveloped_note;
                n1 = n2 + 1;
            else
                n2 = n1 + length(one_pulse_rest_note) - 1;
                soundtrack(n1:n2) = soundtrack(n1:n2) + one_pulse_rest_note;
                n1 = n2 + 1;
            end
        else
            % insert voices in soundtrack, in the right place
            pulse_difference = place_of_tone - ...
                               theVoices(vloop).startPulses(nloop-1);
                           
            rest_pulses_needed = pulse_difference - ...
                                 round(theVoices(vloop).durations(nloop-1));
                           
            if rest_pulses_needed > 0
               for loop = 1:rest_pulses_needed
                   n2 = n1 + length(one_pulse_rest_note) - 1;
                   soundtrack(n1:n2) = soundtrack(n1:n2) + one_pulse_rest_note;
                   n1 = n2 + 1;     
               end  
               n2 = n1 + length(enveloped_note) - 1;
               soundtrack(n1:n2) = soundtrack(n1:n2) + enveloped_note;
               n1 = n2 + 1; 
            end     
%             
%             if rest_pulses_needed < 0
%                 n1 = n1 - length(one_pulse_rest_note)*rest_pulses_needed;
%                 n2 = n1 + length(enveloped_note) - 1;
%                 soundtrack(n1:n2) = soundtrack(n1:n2) + enveloped_note;
%                 n1 = n2 + 1 + length(one_pulse_rest_note)*rest_pulses_needed;                    
%             end
%             
            if rest_pulses_needed == 0
                n2 = n1 + length(enveloped_note) - 1;
                soundtrack(n1:n2) = soundtrack(n1:n2) + enveloped_note;
                n1 = n2 + 1; 
            end
            
        end
       
    end
end % for number_of_voices

fprintf('soundtrack done!\n')
% normal_soundtrack = soundtrack/max(abs(soundtrack));
% audiowrite('soundtrack_jt_final.wav', normal_soundtrack, fs);
%% Playback in speaker
soundsc(soundtrack, fs);
