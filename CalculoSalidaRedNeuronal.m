%Edgar Moises Hernandez Gonzalez
%Residente INAOE
%Programacion de BCI aplicando analisis multivariable y redes neuronales
%con el fin de ayudar a personas cuadriplejicas
%Asesora: Dra Maria del Pilar Gomez Gil
%Creacion: 24/10/17
%Modificacion: 23/11/17
%Algoritmo para el calculo de la salida de una red neuronal feedforward con
%un nivel escondido, comparar con las salidas de la simulacion

clear all
close all
clc

load('Neuronas7_88.mat'); %cargar red neuronal feedforward entrenada
N=16; %entradas
L=7; %neuronas capa oculta
M=3; %salidas
x=input('Ingrese los valores: ');
w1=net.IW{1,1}; %pesos que conectan a las entradas con la capa oculta
w2=net.LW{2,1}; %pesos que conectan a la capa oculta con la salida
b1=net.b{1}; %bias capa entrada
b2=net.b{2}; %bias capa oculta

%capa oculta
for i=1:L
    net1(i)=0;
	for j=1:N
        net1(i)=net1(i)+w1(i,j)*x(j); %sumatoria
    end
	net1(i)=net1(i)+b1(i); %net
    out1(i)=1/(1+exp(-net1(i))); %funcion de activacion sigmoide (logistica)
end
out1
%capa de salida
for k=1:M
    net2(k)=0;
	for i=1:L
        net2(k)=net2(k)+w2(k,i)*out1(i); %sumatoria
    end
	net2(k)=net2(k)+b2(k); %net
    out2(k)=1/(1+exp(-net2(k))); %funcion de activacion sigmoide (logistica)
end
out2

simulacion=net(x') %simular con la entrada (transpuesta)
[mayor clase] = max(out2); %mayor de la salida de la red y a que clase pertenece
clase