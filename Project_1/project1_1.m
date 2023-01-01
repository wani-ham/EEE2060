n = -1000 : 1000;   % n = -1000 ~ 1000, 2001 points
l = length(n);
w = linspace(-pi, pi, l); % w = -pi ~ pi

% Generating signal in each domain
x_t = cos(pi*0.2*n) + cos(pi*0.4*n) + cos(pi*0.6*n);   % Added final signal in time domain
x_f = fftshift(fft(x_t)); % Added final signal in angular frequency domain


figure(1);
subplot(4,1,1); plot(w,abs(fftshift(fft(cos(pi*0.2*n))))); xlabel('n'); title('cos(pi*0.2*n)');
subplot(4,1,2); plot(w,abs(fftshift(fft(cos(pi*0.4*n))))); xlabel('n'); title('cos(pi*0.4*n)');
subplot(4,1,3); plot(w,abs(fftshift(fft(cos(pi*0.6*n))))); xlabel('n'); title('cos(pi*0.6*n)');
subplot(4,1,4); plot(w,abs(x_f)/l); xlabel('w'); title('x');


% (1-a) Plotting signal in each domain
figure(2); 
subplot(2,1,1); plot(n,x_t); xlabel('n'); title('time domain') % plotting signal in time domain
subplot(2,1,2); plot(w,abs(x_f)/l); xlabel('w'); ylabel('magnitude'); title('angular frequency domain'); % plotting signal in frequency domain

% (1-b) Convolution with FIR filter
h_lpf1 = firceqrip(100,1/pi,[0.00057565 1e-4],'passedge'); % FIR lowpass filter with pass angular frequency w = -1 ~ 1
fil_h = fftshift(fft(h_lpf1));
figure(4); plot(linspace(-pi, pi, length(fil_h)), abs(fil_h)); % plotting filter in frequency domain

y = conv_filter(x_t, h_lpf1);  % filtering by using convolution

% plotting filtered signal in each domain
figure(5); 
subplot(2,1,1); plot(linspace(-2000,2000,length(y)), y); title('filterd signal in time domain')
subplot(2,1,2); plot(linspace(-pi, pi, length(x_t)+length(h_lpf1)-1), abs(fftshift(fft(y)))); title('filtered signal in frequency domain');

% convolution function
function [y] = conv_filter(x, h)
    m = length(x);
    n = length(h);
    X = [x, zeros(1,n-1)];
    H = [h, zeros(1,m-1)];
    y = zeros(1, m+n-1);

    % using the definition of linear convolution
    for i = 1:m+n-1
        for j = 1:i
             y(i) = y(i) + X(j)*H(i-j+1);
        end
    end
end
