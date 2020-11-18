clc;clear;close all;
%taking the parameters from user for frequency,phase and amplitude of m(t) 
am=input('Enter the amplitude of m(t): '); 
fm=input('Enter the frequency of m(t): '); 
phm=input('Enter the phase of m(t): ');
%taking the parameters from user for frequency,phase and amplitude of c(t)
ac=input('Enter the amplitude of c(t): '); 
fc=input('Enter the frequency of c(t): ');
phc=input('Enter the phase of c(t): ');
%defining time interval
t=0:1/(10*fc):0.0025;
%defining message and carrier signal in time domain
msg = am*cos(2*pi*fm*t+phm); 
cr=ac*cos(2*pi*fc*t+phc);
%calculating the ka amplitude sensitivity
ka=1/ac;
%amplitude modulation
%calculating amplitude modulated signal in time domain
s=ammod(msg,fc,fc*10,phm,ac); plot(t,msg);xlabel('TIME(sec)');ylabel('AMPLITUDE(v)');title('MESSAGE SIGNAL (m(t))'); figure;plot(t,cr);xlabel('TIME(sec)');ylabel('AMPLITUDE(v)');title('CARRIER SIGNAL (c(t))'); figure;plot(t,s);xlabel('TIME(sec)');ylabel('AMPLITUDE(v)');title('MODULATED SIGNAL (s(t))');
%calculating message and carrier signal in frequency domain( frequency %spectrum)
%fftshift is used to shift the magnitudes around zero axes for better
%visualization 
n=length(t);
f=[-fc*5:fc*10/n:fc*5-(fc*10)/n]; 
msgf=fft(msg)/n;
figure;plot(f,abs(fftshift(msgf)));xlabel('FREQUENCY(hz)');ylabel('AMPLITUDE(v)');title('FREQUENCY SPECTRUM OF MESSAGE SIGNAL (M(f))');

crf=fft(cr)/n;
figure;plot(f,abs(fftshift(crf)));xlabel('FREQUENCY(hz)');ylabel('AMPLITUDE(v)');title('FREQUENCY SPECTRUM OF CARRIER SIGNAL (C(f))');
%calculating modulated signal in frequency domain 
sf=fft(s)/n;
figure;plot(f,abs(fftshift(sf)));xlabel('FREQUENCY(hz)');ylabel('AMPLITUDE(v)');title('FREQUE NCY SPECTRUM OF MODULATED SIGNAL (S(f))');
%amplitude demodulation
msg_recovered=amdemod(s,fc,fc*10);figure;plot(t,msg_recovered);xlabel('TIME(sec)');ylabel('AMPLITUDE(v)');title('MESSAGE SIGNAL RECOVERED THROUGH DEMODULATION');
