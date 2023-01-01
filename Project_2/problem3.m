% Project 2
% - Problem 3
% - Author : Taewan Ham

w_s = 2*pi*1024;
Hz = w_s / (2*pi);
samples = 2*Hz;  % number of samples 
n = linspace(0, 2, samples);  % sampled time domain
w = linspace(-w_s*0.5, w_s*0.5, samples);

x_t = cos(2*pi*4*n);  % signal x
c_t = cos(2*pi*100*n); % signal c
r_t = x_t.*c_t;  % signal r

x_f = fftshift(fft(x_t));
c_f = fftshift(fft(c_t));
r_f = fftshift(fft(r_t));

% Problem 3-(a)
figure(1);
subplot(3,1,1); stem(n, x_t); xlabel('time'); title('x(t)'); % signals in time domain
subplot(3,1,2); stem(n, c_t); xlabel('time'); title('c(t)');
subplot(3,1,3); stem(n, r_t); xlabel('time'); title('r(t)');

figure(2);
subplot(3,1,1); plot(w, abs(x_f)/samples); xlabel('frequency'); title('|X(jw)|'); % signals in frequency domain
subplot(3,1,2); plot(w, abs(c_f)/samples); xlabel('frequency'); title('|C(jw)|');
subplot(3,1,3); plot(w, abs(r_f)/samples); xlabel('frequency'); title('|R(jw)|');


% Problem 3-(b)
d_t = r_t.*c_t;  % signal d
d_f = fftshift(fft(d_t));

figure(3);
subplot(2,1,1); stem(n, d_t); xlabel('time'); title('d(t)');  % time domain
subplot(2,1,2); plot(w, abs(d_f)/samples); xlabel('frequency'); title('|D(jw)|');  % frequency domain

% Problem 3-(c)
fil_h = [zeros(1,1007) 2*ones(1,35) zeros(1,1006)];  % lowpass filter w = -51~55 
recov_x_f = d_f.*fil_h; % recovered signal
recov_x_t = ifft(ifftshift(recov_x_f));

figure(4);
subplot(3,1,1); plot(w, abs(fil_h)/samples); xlabel('frequency'); title('Lowpass filter');
subplot(3,1,2); plot(w, abs(recov_x_f)/samples); xlabel('frequency'); title('recovered x signal in frequency domain');
subplot(3,1,3); stem(n, recov_x_t); xlabel('time'); title('recovered x signal in time domain');





