%#####################################
% === Processamento Digital de Sinais
% === Trabalho Computacional
% === Prof.: Carlos Alexandre
% === Aluna: Brena Lima 
% === Matr�cula: 359971
%#####################################

close all;
clear all;
clc;

%=== Leitura arquivo .mat ou .txt ===
file = matfile(fullfile('database_QRS', '115m.mat'), 'Writable', false);

%========== Par�metros ==============
base = 1024;           % 1024 pontos de deslocamento
ganho = 200;           % 200 vezes
periodo = 0.96;        % Per�odo card�aco, em segundos
Fs = 360;              % Frequ�ncia de amostragem, em hertz
tamanho = 1:2000;      % Vetor tamanho usado para plotar

ecg = (file.val(1,:)- base)/ganho;

%====== Remove Baseline Drift =======
     %Filtro passa-alta
ordem = 4;
freq_corte = 0.0055; %Frequencia de corte de 1Hz.
[b,a] = butter(ordem,freq_corte,'high');
ecg_fil = filter(b,a,ecg);

%=========== Aplicar DWT ============
[C,L] = wavedec(ecg_fil,4,'db6'); % decomposi��o wavelet do sinal ecg
[d1,d2,d3,d4] = detcoef(C,L,[1,2,3,4]); % Recomposi��o nas escalas 2^1 2^2 2^3 2^4.
sinal = d4.^2; % processamento do sinal.

%##############################
% Detecta todos os picos do sinal analisado. Distingue os picos da 
% onda R dos outros picos do sinal usando um limiar de 15% do m�ximo 
% valor do sinal D4^2
threshold = 0.15*max(sinal); %Limiar de 15% do maximo valor do sinal decomposto
val_picoR = 1:length(sinal);
[picoR, indiceR] = findpeaks(sinal(tamanho), 'MinPeakHeight', threshold); %Localiza os picos e os �ndices da onda R
val_picoR(indiceR) = [];%Guarda os valores R que est�o acima do limiar
sinal(val_picoR) = 0;


%############################## 
%=== Frequ�ncia Card�aca ===
intervalo_Tempo_R = 16*diff(indiceR);% decomposi��o em pot�nca de 2, logo 2^4 = 16, compress�o temporal.
FreqCard = conv(intervalo_Tempo_R, ones(1, 5)/5, 'valid');% Calcula a partir da media movel, diferen�a entre valores de picos adjacentes
minima = ceil(min(60*Fs./FreqCard)) %Calcula frequ�ncia card�aca m�xima
maxima = ceil(max(60*Fs./FreqCard))
media  = ceil(mean(60*Fs./FreqCard))

%##############################
% Estado de sa�de do Paciente
% Freq > 90 pode significar Taquicardia 
% Freq < 60 pode significar Bradicardia 
if media>90 
    fprintf('Paciente com taquicardia\n Frequ�ncia Card�aca M�dia: %.f BPM\n', media)
elseif media < 60
    fprintf('Paciente com bradicardia\n Frequ�ncia Card�aca M�dia:  %.f BPM\n', media)
elseif media>=60 && media<=90
    fprintf('Paciente sem arritmia\n Frequ�ncia Card�aca M�dia:  %.f BPM\n', media)
end
%##############################
%########GR�FICOS##############

  figure;
  plot(ecg(tamanho));title('Sinal original');xlabel('Tempo (s)'); ylabel('Tens�o (mV)');
  figure;
  plot(ecg_fil(tamanho));title('Sinal com baseline removida');xlabel('Tempo (s)'); ylabel('Tens�o (mV)');
  figure;
  subplot(2, 2, 1); plot(d1(tamanho));title('Nivel de detalhamento D1');xlabel('Tempo (s)'); ylabel('Tens�o (mV)');
  subplot(2, 2, 2); plot(d2(tamanho));title('Nivel de detalhamento D2');xlabel('Tempo (s)'); ylabel('Tens�o (mV)');
  subplot(2, 2, 3); plot(d3(tamanho));title('Nivel de detalhamento D3');xlabel('Tempo (s)'); ylabel('Tens�o (mV)');
  subplot(2, 2, 4); plot(d4(tamanho));title('Nivel de detalhamento D4');xlabel('Tempo (s)'); ylabel('Tens�o (mV)');
  figure;
  plot(sinal(1:500)); title('Sinal DWT D4^2 com picos R detectados');xlabel('Tempo (s)'); ylabel('Tens�o (mV)');
  figure;
  plot(d4(tamanho));title('Nivel de detalhamento D4');xlabel('Tempo (s)'); ylabel('Tens�o (mV)'); 
  figure;hold on;
  plot(indiceR, picoR);title('D4^2: Picos detectados acima do limiar de 15%');xlabel('Tempo (s)'); ylabel('Tens�o (mV)');
  scatter(indiceR,picoR,'*')
  