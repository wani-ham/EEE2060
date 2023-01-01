[music, fs] = audioread('pj_music.wav');   % read audio file
t = (1 : length(music)) / fs;   % make time interval for plotting in time domain
w = linspace(-pi, pi, length(music));
music_f = fftshift(fft(music));   % music signal in frequency domain

% (2-a) Plotting music in each domain
figure(1); 
subplot(2,1,1); plot(t, music); xlabel('time'); title('time domain'); % plotting in time domain
subplot(2,1,2); plot(w, abs(music_f)); xlabel('frequency'); title('frequency domain') % plotting in frequency domain

% (2-b) Convolution with low-pass filter
h_lpf2 = firceqrip(1000,0.1/pi,[0.00057565 1e-4],'passedge');   % FIR lowpass filter with pass angular frequency w = -0.1 ~ 0.1
h_f = fftshift(fft(h_lpf2)); % low-pass filter in frequency domain

% plotting low-pass filter 
figure(2); 
subplot(2,1,1); plot(linspace(0,1500,length(h_lpf2)), h_lpf2); title('filter in time domain');
subplot(2,1,2); plot(linspace(-pi,pi,length(h_f)), abs(h_f)); title('filter in frequency domain');

fil_music_t = conv(music, h_lpf2);   % filtered music in time domain with low-pass filter
fil_music_f = fftshift(fft(fil_music_t));   % filtered music in frequency domain with low-pass filter
t_f = (1 : length(fil_music_t)) / fs;   % time domain
w_f = linspace(-pi, pi, length(fil_music_f));   % angular frequency domain

% plotting results of filtering in time and frequency domain
figure(3); 
subplot(2,1,1); plot(t_f, fil_music_t); xlabel('time'); title('filtered in time domain');
subplot(2,1,2); plot(w_f, abs(fil_music_f)); xlabel('frequency'); title('filtered in frequency domain');

% write filtered music file to wav audio file
audiowrite('filtered_result.wav',fil_music_t,fs);
