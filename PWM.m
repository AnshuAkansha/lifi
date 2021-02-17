clc;
close all;
clear all;

 fc=1000;
 fs=10000;
 fm=200;
 
 t=0:1/fs:(2/fm-1/fs);
 mt=0.4*sin(2*pi*fm*t)+0.5;
 st=modulate(mt,fc,fs,'PWM');
 dt=demod(st,fc,fs,'PWM');
 figure
 subplot(3,1,1);
 plot(mt,'r');
 title('message signal');
 xlabel('time period');
 ylabel('amplitude');
 axis([0 50 0 1]);
 subplot(3,1,2);
 plot(st,'r');
 title('modulated signal');
 xlabel('time period');
 ylabel('amplitude');
 axis([0 500 -0.2 1.2]);
 subplot(3,1,3);
 plot(dt,'r');
 title('demodulated signal');
 xlabel('time period');
 ylabel('amplitude');
 axis([0 50 0 1]);
 