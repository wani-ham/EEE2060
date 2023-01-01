% Project 2
% - Problem 1
% - Author : Taewan Ham

[t_1, t_2, samples] = make_domain(5);
t = [t_1, t_2];  % time domain
w = linspace(-pi*256, pi*256, samples);  % angular frequency domain

x_t = [cos(2*pi*t_1), 0*t_2];  % sampled function in time domain
x_f = fftshift(fft(x_t));  % sampled functin in frequenct domain

% Problem 1-(a)
figure(1);
subplot(2,1,1); stem(t, x_t); xlabel('time'); title('f(t) in time domain');
subplot(2,1,2); plot(w, abs(x_f)/samples); xlabel('angular frequency domain'); title('f(t) in frequency domain');

% Problem 1-(b)
[t_1_20, t_2_20, samples_20] = make_domain(20);  % T = 20
[t_1_40, t_2_40, samples_40] = make_domain(40);  % T = 40

t_20 = [t_1_20, t_2_20];  % time domain with T = 20
t_40 = [t_1_40, t_2_40];  % time domain with T = 40
w_20 = linspace(-pi*256, pi*256, samples_20);  % angular frequency domain with T = 20
w_40 = linspace(-pi*256, pi*256, samples_40);  % angular frequency domain with T = 40


x_t_20 = [cos(2*pi*t_1_20), 0*t_2_20];  % sampled function in time domain
x_f_20 = fftshift(fft(x_t_20));  % sampled functin in frequenct domain
x_t_40 = [cos(2*pi*t_1_40), 0*t_2_40];  % sampled function in time domain
x_f_40 = fftshift(fft(x_t_40));  % sampled functin in frequenct domain

figure(2);
subplot(3,1,1); stem(t, x_t); xlabel('time'); title('T = 5');
subplot(3,1,2); stem(t, x_t_20); xlabel('time'); title('T = 20');
subplot(3,1,3); stem(t, x_t_40); xlabel('time'); title('T = 40');

figure(3);
subplot(3,1,1); plot(w, abs(x_f)/samples); xlabel('angular frequency domain'); title('T = 5');
subplot(3,1,2); plot(w, abs(x_f_20)/samples_20); xlabel('angular frequency domain'); title('T = 20');
subplot(3,1,3); plot(w, abs(x_f_40)/samples_40); xlabel('angular frequency domain'); title('T = 40');


function [t_1, t_2, samples] = make_domain(T)
    r = T / (40);  % ratio
    samples = 256 * 40;  % 256 (samples per second) * 40 seconds
    
    t_1 = linspace(0, T, samples*r);
    t_2 = linspace(T, 40, samples*(1-r));
end