clc 
fs = 1200; 
t = 0: 1/fs: 1; 

x = 5*sin(2*pi*50*t) + 3*sin(2*pi*50*t) + 2*sin(2*pi*150*t); 

y =  x + randn(size(t)) ; 

% Plotting 
subplot(3,1,1)

plot(y(1:100))
title('Noisy time signal')
xlabel('time t')
ylabel('Amplitude')

% convert signal from time domain to freq domain using fft
Y = fft(y,256); % 256 pt fft 
Pyy = Y.*conj(Y)/300 ; % gives power spectral density (PDS)
% PDS expresses power in terms of the frequency 
% 300 is just a scaling factor to reduce the amplitudes values


f= fs/256*(0:127); % 0:127 is the no. of points to display

subplot(3,1,2)
plot(f, Pyy(1:128)); 
title('Power Spectral density')
xlabel('Frequency (Hz)')


subplot(3,1,3)
plot(f(1:40), Pyy(1:40)) % plotting 40 points to zoom in on beginning of PDS




