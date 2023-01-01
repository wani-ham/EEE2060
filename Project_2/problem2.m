% Project 2
% - Problem 2
% - Author : Taewan Ham

% sampling frequency = w_s
% w_s > 2*w1 = 2*2*pi*100
% let sampling frequency w_s = 6*pi*100 (300Hz)

w_s = 2*pi*100;
samples = 2*w_s / (2*pi);  % number of samples 
n = linspace(0, 2, samples);  % sampled time domain
w = linspace(-w_s*0.5, w_s*0.5, samples);  % frequency domain

m_t = cos(2*pi*100*n);
m_f = fftshift(fft(m_t));  % ft

figure(1);
subplot(2,1,1); stem(n, m_t);  % signal in time domain
subplot(2,1,2); plot(w, abs(m_f));  % signal in frequency domain