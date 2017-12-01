Andy Lew

All functions are implemented, but the timing of the synthesized music is not
completely correct. The harmonics are also added in the key2notejt and key2notewt
functions instead of it being its own function.

Installation of musiclab toolbox:
=================================
1. Place musiclab to a directory for extra Matlab Toolboxes, for instance, C:\LocalMatlab\musiclab

2. Copy the file setmlab to a working directory 

3. Edit setmlab and set the variable DIR to match your installation choices

================
To run coscos.m:
================
1. Type in one of the commands below:
[xn,tn] = coscos(2,3,20,1); -- To show error handling
[xn,tn] = coscos(2,3,3,1); -- To output correct values

To run syn_sin.m:
=================
1. Type in one of the commands below:
[xx,tt] = syn_sin(800,100*exp(j*(-pi/3)),11025,0.5,0); -- No errors
[xx,tt] = syn_sin([800,1200],100*exp(j*(-pi/3)),11025,0.5,0); -- To show error handling
[xx,tt] = syn_sin([1200,800],[80*exp(j*(pi/4)),100*exp(j*(-pi/3))],11025,0.8,0); -- 

2. Type in soundsc(xx) to hear the resulting sound from the waveforms

To run key2notewt.m:
====================
1. Type in one of the commands below:
xx = key2notewt(80*exp(j*-pi/3), 37, 1);
xx = key2notewt(80*exp(j*-pi/3), 40, 1);
xx = key2notewt(80*exp(j*-pi/3), 43, 1);

2. Type in soundsc(xx) to hear the resulting sound from the waveforms

To run key2notejt.m:
====================
1. Type in one of the commands below:
xx = key2notejt(80*exp(j*-pi/3), 37, 1);
xx = key2notejt(80*exp(j*-pi/3), 40, 1);
xx = key2notejt(80*exp(j*-pi/3), 43, 1);

2. Type in soundsc(xx) to hear the resulting sound from the waveforms

To run play_scale.m:
====================
1. Type in one of the commands below:
play_scale(37)
play_scale(40)
play_scale(43)

To run synthandplay.m:
====================
1. Type in one of the commands below:
synthandplay('BWV847_Fugue2_Cminor', 11025, 0)
synthandplay('BWV847_Fugue2_Cminor', 11025, 1)

