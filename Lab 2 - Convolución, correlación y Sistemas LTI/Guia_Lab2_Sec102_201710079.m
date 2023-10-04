%% EL5002 - Análisis de Señales y Sistemas
% Autor: Alejandro Muñoz Zevallos
% Código: 201710079

%% Pregunta 1
%Inciso a
clear all; close all; clc;

Fs=4000;
Ts=1/Fs;
t=0:Ts:0.2;
t1=0:Ts:0.1;


% Frecuencia para las notas

A = 880;
D = 587;
E = 659;
F = 698;
G = 784;

% Sonido para las notas

AS = sin(2*pi*A*t);
DS = sin(2*pi*D*t);
ES = sin(2*pi*E*t);
FS = sin(2*pi*F*t);
GS = sin(2*pi*G*t);

% Silencios

SILEN = zeros(1, length(t1));

% Melodía

melodia = [DS SILEN DS SILEN ES SILEN DS SILEN GS SILEN FS SILEN DS SILEN DS SILEN ES SILEN DS SILEN AS SILEN GS SILEN];

figure;

na=0:1:length(melodia)-1;
ta=Ts*na;


plot(ta,melodia,'r-'); axis([0 3.5 -1 1]); title('Melodia creada'); xlabel('Tiempo(s)'), ylabel('Amplitud');

%sound(melodia,Fs);

% Inciso b
%numero de muestras de n
n=0:310;

%definimos las 2 respuestas al impulso
h1f= sinc(0.3193*(n-155))*0.3193;


h2f= ((n-155)==0) - sinc(0.3193*(n-155))*0.3193;

stem(n,h1f); hold on; axis([0 300 -0.3 0.7]); 
stem(n,h2f); hold off;

% Inciso c
%Se crea la convolucion para cada una de las respuestas al impulso

 xf1=conv(melodia,h1f,'same');
 xf2=conv(melodia,h2f,'same');
%sabemos que n*Ts=t, encontes obtenemos los tf1 y tf2 de nuestra señal
 nf1=0:length(xf1)-1;
 nf2=0:length(xf2)-1;
 tf1=nf1*Ts;
 tf2=nf2*Ts;
 
 subplot(3,2,[1,2])
 plot(ta,melodia,'g'); axis([0 3.5 -1 1]); title('Melodia original'); xlabel('Tiempo(s)'), ylabel('Amplitud');
 subplot(3,2,[3,4])
 plot(tf1,xf1,'b'); axis([0 3.5 -1 1]); title('Melodia conv hf1'); xlabel('Tiempo(s)'), ylabel('Amplitud');
 subplot(3,2,[5,6])
 plot(tf2,xf2,'r'); axis([0 3.5 -1 1]); title('Melodia conv hf2'); xlabel('Tiempo(s)'), ylabel('Amplitud');
 
 %% Pregunta 2
 clear all; close all; clc;
 
 % Inciso b
 
 % Ecuación de diferencias
 n=0:39;
 %Creamos un impulso
 X=((n)==0);
 A1=[1 -1.9 1.31 -0.389 0.042]; %valores de y
 B1=[0.06 -0.535 1.655 -2.15 1]; %valores de x
 %respuesta para T
 Y1=filter(B1,A1,X)%nos permite determinar la respuesta de cualquier tipo de sistema
 subplot(3,2,[1,2])
 stem(n,Y1,'g'); title('Respuesta al impulso de T'); xlabel('Tiempo(s)'), ylabel('Amplitud');
 %Para el sistema T1 y T2
 %Respuesta para T1
 AT1=[1 -0.8 0.15];
 BT1=[0.3 -1.1 1];
 Y2=filter(BT1,AT1,X)
 subplot(3,2,[3,4])
 stem(n,Y2,'b'); title('Respuesta al impulso de T1'); xlabel('Tiempo(s)'), ylabel('Amplitud');
%Respuesta para T2
 AT2=[1 -1.1 0.28];
 BT2=[0.2 -1.05 1];
 Y3=filter(BT2,AT2,X);
 subplot(3,2,[5,6])
 stem(n,Y3,'r'); title('Respuesta al impulso de T2'); xlabel('Tiempo(s)'), ylabel('Amplitud');

 
%% Inciso c
 n=0:39;
 X=((n)==0);
 A1c=[1 -1.9 1.31 -0.389 0.042]; %valores de y
 B1c=[0.06 -0.535 1.655 -2.15 1]; %valores de x
 %respuesta para T
 Y1=filter(B1c,A1c,X)%nos permite determinar la respuesta de cualquier tipo de sistema
 subplot(3,2,[1,2])
 stem(n,Y1,'g'); title('Respuesta al impulso de T'); xlabel('Tiempo(s)'), ylabel('Amplitud');
 %Respuesta intermedia r(t)
 AT1c=[1 -0.8 0.15];
 BT1c=[0.3 -1.1 1];
 Y2=filter(BT1c,AT1c,X)
 subplot(3,2,[3,4])
 stem(n,Y2,'b'); title('Respuesta intermedia r(t)'); xlabel('Tiempo(s)'), ylabel('Amplitud');
%Respuesta del sistema en cascada
 AT2c=[1 -1.1 0.28];
 BT2c=[0.2 -1.05 1];
 Y3=filter(BT2c,AT2c,Y2);
 subplot(3,2,[5,6])
 stem(n,Y3,'r'); title('Respuesta del sistema en cascada'); xlabel('Tiempo(s)'), ylabel('Amplitud');

 
 %% Reto
clear all; close all; clc;

%Inciso a
 FS=8000;
 %Cargamos el audio usando audioread y muestreamos con 8KHZ
Y= audioread('DTMF_tone.wav');

Y1=length(Y);
TS=1/FS;
t=0:TS:TS*Y1-TS;
%ploteamos la señal a analizar
plot(t,Y,'b'); title('Melodia DTMF'); xlabel('Tiempo(s)'), ylabel('Amplitud');


%Inciso b
%Digitos de DTMF
 AC=1633;
 AR=697;
 DC=1633;
 DR=941;
 CC=1633;
 CR=852;
 XC=1209;
 XR=941;
 MC=1477;
 MR=941;
 DOSC=1336;
 DOSR=697;
 TRESC=1477; 
 TRESR=697;
 CEROC=1336;
 CEROR=697;

 %tiempo de cada tono
 t=0:TS:0.1;
 % Sonido para las notas

AS = sin(2*pi*AC*t)+sin(2*pi*AR*t);
DS = sin(2*pi*DC*t)+sin(2*pi*DR*t);
CS = sin(2*pi*CC*t)+sin(2*pi*CR*t);
XS = sin(2*pi*XC*t)+sin(2*pi*XR*t);
MS = sin(2*pi*MC*t)+sin(2*pi*MR*t);
DOSS = sin(2*pi*DOSC*t)+sin(2*pi*DOSR*t);
TRESS = sin(2*pi*TRESC*t)+sin(2*pi*TRESR*t);
CEROS = sin(2*pi*CEROC*t)+sin(2*pi*CEROR*t);

% Silencios

SILEN = zeros(1, length(t));

%Inciso c
%Realizamos la correlación de la señal Y con AS
[Corr1,pos1]=xcorr(Y,AS);

subplot(4,2,1)
plot(pos1,Corr1,'r'); title('Correlación con el digito "A"'); xlabel('Tiempo(s)'), ylabel('Amplitud');



%Realizamos la correlación de la señal Y con DS
[Corr2,pos2]=xcorr(Y,DS);

subplot(4,2,2)
plot(pos2,Corr2,'b'); title('Correlación con el digito "D" '); xlabel('Tiempo(s)'), ylabel('Amplitud');
 

%Realizamos la correlación de la señal Y con CS
[Corr3,pos3]=xcorr(Y,CS);

subplot(4,2,3)
plot(pos3,Corr3,'g'); title('Correlación con el digito "C" '); xlabel('Tiempo(s)'), ylabel('Amplitud');
 
%Realizamos la correlación de la señal Y con XS
[Corr4,pos4]=xcorr(Y,XS);

subplot(4,2,4)
plot(pos4,Corr4,'y'); title('Correlación con el digito "*" '); xlabel('Tiempo(s)'), ylabel('Amplitud');
  

%Realizamos la correlación de la señal Y con MS
[Corr5,pos5]=xcorr(Y,MS);

subplot(4,2,5)
plot(pos5,Corr5,'k'); title('Correlación con el digito "#" '); xlabel('Tiempo(s)'), ylabel('Amplitud');
 


%Realizamos la correlación de la señal Y con CEROS
[Corr6,pos6]=xcorr(Y,CEROS);

subplot(4,2,6)
plot(pos6,Corr6,'b'); title('Correlación con el digito "0" '); xlabel('Tiempo(s)'), ylabel('Amplitud');
 
 
%Realizamos la correlación de la señal Y con DOSS
[Corr7,pos7]=xcorr(Y,DOSS);

subplot(4,2,7)
plot(pos7,Corr7,'c'); title('Correlación con el digito "2" '); xlabel('Tiempo(s)'), ylabel('Amplitud');
 

%Realizamos la correlación de la señal Y con TRESS
[Corr8,pos8]=xcorr(Y,TRESS);

subplot(4,2,8)
plot(pos8,Corr8,'r'); title('Correlación con el digito "3" '); xlabel('Tiempo(s)'), ylabel('Amplitud');
 

% Inciso D
%Debido a que realizamos convolución con cada digito individualmente con
%respecto a la tono de entrada, podemos saber el orden en la que dichos
%digitos fueron presionados, esto debido a los picos maximos generados por
%la multiplicación de una señal consigo misma.

Hs=[AS DS CS XS MS CEROS DOSS TRESS];
th=0:length(Hs)-1;
%Ahora, realizamos un plot de ambas señales

plot(th,Hs,'b'); title('Melodia recompuesta en base a tonos'); xlabel('Tiempo(s)'), ylabel('Amplitud');

A=resample(Hs,FS,FC);