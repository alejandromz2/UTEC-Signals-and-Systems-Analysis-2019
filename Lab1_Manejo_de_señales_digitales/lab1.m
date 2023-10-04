%% EL5002 - Análisis de Señales y Sistemas
% Autor: Alejandro Muñoz Zevallos
% Universidad: Universidad de Ingeniería y Tecnología

%% Pregunta 1   

clear all; close all; clc;
%a)
n=-30:30;

x1=7*((n+15)==0)+((-2*n+10)>=0);
subplot(2,4,1)
stem(n,x1,'filled','r'); title('Señal a)'); xlabel('Tiempo(s)'), ylabel('Amplitud');


%b)
x2=3*((4*n+4)==0)+5*((2*n-18)==0);
subplot(2,4,2)
stem(n,x2,'filled','b'); title('Señal b)'); xlabel('Tiempo(s)'), ylabel('Amplitud');

%c)
k=-28:2:14;
%definimos las siguientes condiciones para nuestra señal
x3=((n>=-28)&(n<=14)& mod(n,2)==0);
subplot(2,4,3)
stem(n,x3,'filled','k');title('Señal c)'); xlabel('Tiempo(s)'), ylabel('Amplitud');

%d) 

x4=0.95*exp(1).^(-n+3).*((n-8)>=0);
subplot(2,4,4)
stem(n,x4,'filled','g'); title('Señal d)'); xlabel('Tiempo(s)'), ylabel('Amplitud');


%e)
x5= 0.8.^abs(n)+abs(n/30).*(n/30).^2;
subplot(2,4,5)
stem(n,x5,'filled','r'); title('Señal e)'); xlabel('Tiempo(s)'), ylabel('Amplitud');


%f)
x6=(sin(0.26*n)+cos(0.12*n)).*sin(0.1*n);
subplot(2,4,6)
stem(n,x6,'filled','b'); title('Señal f)'); xlabel('Tiempo(s)'), ylabel('Amplitud');

%g) 
x7=sinc((n-15)/(2*pi)).*((n+15)>=0).*sign(-n);
subplot(2,4,7)
stem(n,x7,'filled','k'); title('Señal g)'); xlabel('Tiempo(s)'), ylabel('Amplitud');



%h)
%Creamos 3 señales y las unimos concatenando vectores en un x8f
n1=[-30:-24];
x8a=0.2*(-n1+27);
n2=[-23:-1];
x8b=ones(1,length(n2)); 
n3=[0:30];
x8c=sin(0.08*n3);
x8f=[x8a,x8b,x8c];
subplot(2,4,8)
stem(n,x8f,'filled','g'); title('Señal h)'); xlabel('Tiempo(s)'), ylabel('Amplitud');






%% Pregunta 2
clear all; close all; clc;
[Y, FS] = audioread('llegoelinvierno.m4a');

%Duración del audio = s

Y1=119808;
TS=1/FS;
t=0:TS:TS*Y1-TS;

%figure, plot(t,Y); %Graficar el audio
%title('Señal de voz'); xlabel('Tiempo(s)'), ylabel('Amplitud');



%Crear señal recortada
[y,f]= audioread('llegoelinvierno.m4a');
Y0=y(23600:103000);
YR=length(Y0);
TR=1/f;
tr=0:TR:TR*YR-TR;

%c)

%Canario
[YC,FC]=audioread('canario.wav');

Y2=35000;
TC=1/FC;

tc= 0:TC:TC*Y2-TC;
%figure, plot(tc,YC); title('Señal Canario'), xlabel('Tiempo(s)'); ylabel('Amplitud');


figure,

subplot(3,1,1);
plot(t,Y,'r'); title('Señal de voz'); xlabel('Tiempo(s)'), ylabel('Amplitud');
subplot(3,1,2);
plot(tr,Y0,'b');title('Señal recortada'); xlabel('Tiempo(s)'), ylabel('Amplitud');
subplot(3,1,3);
plot(tc,YC,'g'); title('Señal Canario'), xlabel('Tiempo(s)'); ylabel('Amplitud');



%e) 
%Invertimos las señales Y0 y YC
Y0I=flip(Y0);
YCI=flip(YC);

%graficamos un subplot con las 4 señales
figure,
subplot(2,2,1);
plot(tr,Y0,'r'); title('Señal recortada'); xlabel('Tiempo(s)'), ylabel('Amplitud');
subplot(2,2,2);
plot(tr,Y0I,'b');title('Señal recortada invertida'); xlabel('Tiempo(s)'), ylabel('Amplitud');
subplot(2,2,3);
plot(tc,YC,'g'); title('Señal Canario'), xlabel('Tiempo(s)'); ylabel('Amplitud');
subplot(2,2,4);
plot(tc,YCI,'P'); title('Señal Canario invertida'), xlabel('Tiempo(s)'); ylabel('Amplitud');


% f)


A=resample(YC,FS,FC);

Y0A=[zeros(30299,1); Y0; zeros(30300,1)];
Y0AL=length(Y0A);

YF=(Y0A+A)/2;

TF=1/FS;

YFL=length(YF);
tf= 0:TF:TF*YFL-TF;

t0A=0:TF:TF*Y0AL-TF;
subplot(2,2,1);
plot(t0A,Y0A,'r'); title('Señal recortada'); xlabel('Tiempo(s)'), ylabel('Amplitud');
subplot(2,2,2);
plot(tc,YC,'g'); title('Señal Canario'), xlabel('Tiempo(s)'); ylabel('Amplitud');
subplot(2,2,[3,4]);
plot(tf,YF,'b'); title('Señales Mezcladas'), xlabel('Tiempo(s)'); ylabel('Amplitud');

