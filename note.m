function tone = note(freq, dur, fs)
% generates musical notes of
% frequency, freq
% duration, dur
% sampled at , fs
 
% Time variable
t =0:1/fs:dur;
 
x = t/dur;
envelope =x.*(1-x).*(exp(-8*x)+0.5*x.*(1-x));
 
beat = 0.08;
 
harmonic0=sin(2*pi*freq*t*(1-beat))+sin(2*pi*freq*t*(1+beat));
harmonic1=sin(2*pi*2*freq*t*(1-beat))+sin(2*pi*2*freq*t*(1+beat));
harmonic2=sin(2*pi*3*freq*t*(1-beat))+sin(2*pi*3*freq*t*(1+beat));
 
tone = envelope.*(harmonic0+0.2*harmonic1+0.05*harmonic2);
 
 
tone = tone/max(tone);

% sound(tone);

