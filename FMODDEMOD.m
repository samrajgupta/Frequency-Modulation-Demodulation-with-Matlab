clc;
clear all;
%creation of message signal
f1=input("first frequency");
f2=input("second frequency");
fc=input("carrier frequency");
fs=input("sampling frequency");
fd=input("frequency deviation");
dt=1/(4*fc); %sampling interval
t=[0:dt:0.025];
m=sin(2*pi*f1*t)+2*cos(2*pi*f2*t);
subplot (4,1,1);
plot (t, m);				
xlabel('Time');			
ylabel('Amplitude');		
title ('Message Signal');	
grid on;
%carrier signal
c=cos(2*pi*fc*t);			
subplot(4,1,2);			
plot(t,c);				
xlabel('Time');			
ylabel('Amplitude');	
title('Carrier Signal');	
grid on;
%modulation
figure(2);
y=fmmod(m,fc,fs,fd);
disp(y);
plot(t,m,'c',t,y,'b');
xlabel('Time(s)');
ylabel('Amplitude');
legend('Original Signal', 'Modulated Signal');
grid on;
%addition of noise
figure(3);
n = awgn(y,10,'measured','linear');
plot(t,y,'c',t,n,'b');
xlabel('time');
ylabel('amplitude');
title('Noise added Signal');
legend('Modulated Signal', 'Noise Added Signal');
%demodulation
figure(4);
d=fmdemod(n,fc,fs,fd);
plot(t,n,'c',t,d,'b');
xlabel('Time (s)');
ylabel('Amplitude');
title('Demodulated Signal');
legend('Noise Added Signal','Demodulated Signal');
%signal to noise ratio
fprintf('Signal to Noise ratio is\n')
disp(snr(m,d));

