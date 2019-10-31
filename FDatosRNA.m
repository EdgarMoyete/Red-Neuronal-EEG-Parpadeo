%Edgar Moises Hernandez Gonzalez
%Residente INAOE
%Programacion de BCI aplicando analisis multivariable y redes neuronales
%con el fin de ayudar a personas cuadriplejicas
%Asesora: Dra Maria del Pilar Gomez Gil
%Creacion: 27/11/17
%Modificacion: 27/11/17
%Matrices de entradas y de salidas deseadas para entrenamiento de RNA
function [x, t]=FDatosRNA(archivo, numEntradas, numClases)
    [f c]=size(archivo);
    x=[]; %matriz de las entradas
    t=[]; %matriz de las salidas deseadas
    for i=1:numEntradas
        x=[x archivo(:,i)]; %concatenacion de las columnas
    end
    x=x'; %transpuesta de las entradas
    for i=numEntradas+1:c
        t=[t archivo(:,i)]; %concatenacion de las columnas
    end
    t=t'; %transpuesta de las salidas deseadas
end