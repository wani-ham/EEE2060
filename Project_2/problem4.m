% Project 2
% - Problem 4
% - Author : Taewan Ham

n = 1 : 1000;  % 1000 points
w = linspace(-pi, pi, 1000);

x_n = [0*[1:199], 2*cos(0.3*pi*[200:300]), 0*[301:399], 3*cos(0.7*pi*[400:600]), 0*[601:1000]];
x_f = fftshift(fft(x_n));

% Problem 4-(a)
figure(1);
subplot(2,1,1); stem(n, x_n); xlabel('time'); title('x[n]');
subplot(2,1,2); plot(w, abs(x_f)); xlabel('frequency'); title('|X(e\^jw)|');

% Problem 4-(b)
h1_f = 0.5*(exp(-j*400*w));
y_f = x_f.*h1_f;
h1_t = ifft(ifftshift(h1_f));
y_t = ifft(ifftshift(y_f));
figure(2);
subplot(3,1,1); plot(w, abs(h1_f));  % h1의 frequency domain plot
subplot(3,1,2); stem(n, abs(h1_t));  % h1의 time domain plot
subplot(3,1,3); stem(n, real(y_t));  % signal y in time domain

% Problem 4-(c)
h2_f = [0.5*(exp(j*400*w(1:249))), exp(-j*400*w(250:751)), 0.5*exp(j*400*w(752:1000))];  % h2 in frequency domain
y2_f = x_f.*h2_f;  % y2 in frequency domain
h2_t = ifft(ifftshift(h2_f));
y2_t = ifft(ifftshift(y2_f));

figure(3);
subplot(3,1,1); stem(n, abs(y2_t)); xlabel('time'); title('absolute value y[n]');  % gain
subplot(3,1,2); stem(n, real(y2_t)); xlabel('time'); title('real part of y[n]'); % real
subplot(3,1,3); plot(w, abs(y2_f)); xlabel('frequency'); title('Y(e\^jw)');

