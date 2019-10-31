%Edgar Moises Hernandez Gonzalez
%Residente INAOE
%Programacion de BCI aplicando analisis multivariable y redes neuronales
%con el fin de ayudar a personas cuadriplejicas
%Asesora: Dra Maria del Pilar Gomez Gil
%Creacion: 27/11/17
%Modificacion: 27/11/17
%Matriz de Confusion
function [confusion, correctos, reconocimiento]=FMatrizConfusion(x, t, net, numClases)
    simula = net(x); %simulacion con la red neuronal
    confusion=zeros(numClases); %matriz de confusion de nxn llena de 0
    correctos = 0;
    incorrectos = 0;
    [f c] = size(simula); %filas y columnas
    for i=1:c
        [maxSimula claseSimula] = max(simula(:,i)); %nos retorna el maximo y su posicion (clase) de las salidas de la red neuronal (simulacion)
        [maxDeseado claseDeseada] = max(t(:,i)); %nos retorna el maximo y su posicion (clase) de las salidas deseadas
        if (claseSimula == claseDeseada) %si clasificacion correcta
            correctos = correctos+1;
        else
            incorrectos= incorrectos + 1;
        end
            confusion(claseDeseada,claseSimula)=confusion(claseDeseada,claseSimula)+1; %llenado de la matriz de confusion
    end
    reconocimiento = 100*correctos/c;
end