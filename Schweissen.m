clc
clear
close all

%%%%Konstanten%%%%
P=21 *1e6; %Leistung in Watt

%%%%%Variablen%%%%%%
KA= 1.1; %Anwendungsfaktor
alpha_wd=0.5; % Dynamischer Abminderungsfaktor
beta= 1; %Eigenspannungsfaktor( bei rundnähten 1)
Sd=2; %Sicherheitsfaktor (Normal:2)
alpha_0=0.8; %= Schweißnahtgütefaktor (Güteklasse B)


n=14050; %Drehzahl
r_aussen=209.8;
r_innen=203.87;
anzuschweissende_stufe=3; %Es wird immer die mit der kleineren nummer verwendet bsp 5-6 -> 5






%Materialwerte
tau_zul=382;%MPa
dichte=4.5;%g/cm^3
pzul= 600; %Mpa

%Annahme: Durchgeschweißte V-Naht, über die gesamte dicke des Materials
%%%Berechnung%%%%
%Aw=pi*(r_aussen^2-r_innen^2);
n=n/60; %in sekunden umrechen
P=P*(anzuschweissende_stufe/10);
Moment=P/(2*pi*n);
Moment=Moment*1000;%In Nmm umrechnen
W_wb=(pi*(r_aussen^4- r_innen^4))/(32*r_aussen);
W_wt=2*W_wb;

tau_wt=Moment/W_wt;

tau_w_zul=alpha_wd*alpha_0*beta*(tau_zul/Sd); %Dynamische Festigkeit

disp("Sicherheit Schweißnaht")

sicherheit=tau_w_zul/tau_wt

