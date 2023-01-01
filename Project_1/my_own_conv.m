% My own convolution function
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
