close all;
clear all;
clc;

tmax=8;
step=0.01;
t=0:step:tmax;
f1=1/6;
f2=1;
A=1;
y=A*sin(2*pi*f1*t );
figure;
subplot(6,1,1);
plot(t,y);
grid;
title('message signal');
 xlabel('time period');
 ylabel('amplitude');
 
x=A*sawtooth(2*pi*f2*t);
subplot(6,1,2);
plot(t,x);
grid;
title('sawtooth signal');
 xlabel('time period');
 ylabel('amplitude');
 
z=y-x;
subplot(6,1,3);
plot(t,z);
grid;
title('subtracted signal');
 xlabel('time period');
 ylabel('amplitude');
n = length(t);
PWM = zeros(1,n);
for i=1:n-1
    if z(i)>0
        PWM(i)=1;
elseif z(i)<=0
        PWM(i)=0;
    end
end

subplot(6,1,4);
plot(t,PWM);
grid;
title('pwm');
 xlabel('time period');
 ylabel('amplitude');
notPWM = zeros(1,n);
for i=1:n-1
    if PWM(i)==1
        notPWM(i)=0;
    elseif PWM(i)==0
        notPWM(i)=1;
    end
end

subplot(6,1,5);
plot(t,notPWM);
grid;

PPM =zeros(1,n);
T2=(1/f2);
m=(tmax/T2);
tsample=0;
for i=0:step:T2
    tsample=tsample+1;
end

for j=0:1:m-1
    for i=(j*(tsample-1)+1):1:((j+1)*(tsample-1))
        if notPWM(i)==0
            PPM(i)=0;
        elseif notPWM(i)==1
            PPM(i)=1;
            break;
        end    
    end
    
end

subplot(6,1,6);
plot(t,PPM);
grid;
title('PPM signal');
 xlabel('time period');
 ylabel('amplitude');






