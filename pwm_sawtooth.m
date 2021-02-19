clc;
close all;
clear all;
t=0:0.001:1;
s=sawtooth(2*pi*10*t+pi);
m=0.75*sin(2*pi*1*t);
n=length(s);
for i=1:n
    if m(i)>=s(i)
        pwm(i)=1;
    else if m(i)<=s(i)
            pwm(i)=0;
        end
    end
end
    plot(t,pwm);
    grid on;
    ylabel('Amplitude');
    xlabel('time index');
    title('PWM wave');
    axis([0 1 -1.5 1.5]);
    t = (-1:0.01:1)';

impulse = t==0;
unitstep = t>=0;
ramp = t.*unitstep;
quad = t.^2.*unitstep;