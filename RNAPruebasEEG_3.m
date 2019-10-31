%Edgar Moises Hernandez Gonzalez
%Residente INAOE
%Programacion de BCI aplicando analisis multivariable y redes neuronales
%con el fin de ayudar a personas cuadriplejicas
%Asesora: Dra Maria del Pilar Gomez Gil
%Creacion: 15/11/17
%Modificacion: 23/11/17
%Pruebas con diferentes redes neuronales Feedforward para evaluarlas en la
%clasificacion del parpadeo de ojos (derecho izquierdo y ambos)
%Experimento 3

clear all
close all
clc

%Datos
pruebas=load('EEGPruebas_3.txt'); %contiene el 25% de los datos EEG
[x t]=FDatosRNA(pruebas, 16, 3);

%Cargar Red Neuronal
% load('Neuronas3_96.mat');
% load('Neuronas4_95.mat');
% load('Neuronas4_95_2.mat');
% load('Neuronas4_96.mat');
%load('Neuronas4_96_2.mat');
% load('Neuronas5_94_3.mat');
% load('Neuronas7_96.mat');
load('Neuronas7_88.mat');

%Matriz de Confusion
[confusion, correctos, reconocimiento]=FMatrizConfusion(x, t, net, 3)