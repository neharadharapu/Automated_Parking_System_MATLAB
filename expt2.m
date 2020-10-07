fs = 1000;
am=0.75;
t = 0:1/fs:10;
%sawtooth signal
x = sawtooth(2*pi*t);
subplot(3,1,1);
plot(t,x);
xlabel('Time-->');
ylabel('Amplitude-->');
title('Sawtooth Signal');
grid ON;
%modulating signal
y = am.*sin(0.5*pi*t);
subplot(3,1,2);
plot(t,y);
xlabel('Time-->');
ylabel('Amplitude-->');
title('Message Signal');
grid ON;
%generation of PMW signal using for-loop
n= length(x);


for i=1:n
    if y(i)>= x(i)
        z(i)=1;
    else
        z(i)=0;
    end 
end
subplot(3,1,3);
plot(t,z);
xlabel('Time-->');
ylabel('Amplitude-->');
title('PWM Signal');
grid ON;