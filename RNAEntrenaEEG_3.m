%Edgar Moises Hernandez Gonzalez
%Residente INAOE
%Programacion de BCI aplicando analisis multivariable y redes neuronales
%con el fin de ayudar a personas cuadriplejicas
%Asesora: Dra Maria del Pilar Gomez Gil
%Creacion: 08/11/17
%Modificacion: 23/11/17
%Entrenamiento de red neuronal Feedforward para clasificacion del parpadeo
%de ojos (derecho izquierdo y ambos) Experimento 3

clear all
close all
clc

%Datos
entrena=load('EEGEntrena_3.txt'); %contiene el 75% de los datos EEG
[x t]=FDatosRNA(entrena, 16, 3);

% %Crear red neuronal feedforward metodo 1
% %(numCapas y f(x) de entrenamiento) por defecto (10,'trainlm')
% net=feedforwardnet(4);

%Crear red neuronal feedforward metodo 2
%minimo y maximo de cada columna (entradas)
%numero de neuronas en la capa oculta y en la capa de salida
%funciones de activacion en la capa oculta y en la capa de salida
net = newff(minmax(x),[7,3],{'logsig','logsig'});

%Entrenar
net = train(net,x,t);

%Matriz de Confusion
[confusion, correctos, reconocimiento]=FMatrizConfusion(x, t, net, 3)

%save('nombreRed','net'); %descomentar para guardar la red