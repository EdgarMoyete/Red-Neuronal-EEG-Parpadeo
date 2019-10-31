%Edgar Moises Hernandez Gonzalez
%Residente INAOE
%Programacion de BCI aplicando analisis multivariable y redes neuronales
%con el fin de ayudar a personas cuadriplejicas
%Asesora: Dra Maria del Pilar Gomez Gil
%Creacion: 30/11/17
%Modificacion: 04/12/17
%Comparar los errores en la salida de una red neuronal con el algoritmo y
%con la simulacion

clear
clc

salidasRed=[]; %matriz de las salidas de la red
datosEEG=load('DatosEEGParpadeo_3.txt'); %datos EEG
%datosEEG=load('eeg.txt'); %datos EEG
entradas=[]; %matriz de las entradas
for i=1:16
    entradas=[entradas datosEEG(:,i)]; %concatenacion de las columnas
end
[f c]=size(datosEEG); %filas y columnas
load('Neuronas7_88.mat'); %cargar red neuronal feedforward entrenada
N=16; %entradas
L=7; %neuronas capa oculta
M=3; %salidas
w1=net.IW{1,1}; %pesos que conectan a las entradas con la capa oculta
w2=net.LW{2,1}; %pesos que conectan a la capa oculta con la salida
b1=net.b{1}; %bias capa entrada
b2=net.b{2}; %bias capa oculta
for iteraciones=1:f
x=entradas(iteraciones,:);
%capa oculta
    for i=1:L
        net1(i)=0;
        for j=1:N
            net1(i)=net1(i)+w1(i,j)*x(j); %sumatoria
        end
        net1(i)=net1(i)+b1(i); %net
        out1(i)=1/(1+exp(-net1(i))); %funcion de activacion sigmoide (logistica)
    end
    out1;
%capa de salida
    for k=1:M
        net2(k)=0;
        for i=1:L
            net2(k)=net2(k)+w2(k,i)*out1(i); %sumatoria
        end
        net2(k)=net2(k)+b2(k); %net
        out2(k)=1/(1+exp(-net2(k))); %funcion de activacion sigmoide (logistica)
    end
    out2;
    salidasRed=[salidasRed;out2]; %Concatenar todas las salidas de la red neuronal de cada iteracion
    [mayor clase] = max(out2); %mayor de la salida de la red y a que clase pertenece
    clases(iteraciones)=clase; %arreglo de las clases
    simulacionIteracion=net(x'); %simulacion para cada iteracion
    [mayorSimula claseSimula] = max(simulacionIteracion); %mayor de la simulacion de la red y a que clase pertenece
    clasesSimula(iteraciones)=claseSimula; %arreglo de las clases de la simulacion
end
simulacion=net(entradas'); %simular con la entrada (transpuesta)
error=abs(simulacion'-salidasRed) %error entre la simulacion y el algortimo del calculo de la salida de una red neuronal
sumaError=sum(sum(error))
errorClases=abs(clasesSimula-clases) %error en las clases con la simulacion y el algoritmo
sumaErrorClases=sum(sum(errorClases))