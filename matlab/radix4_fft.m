% SEACAS 2023
% Courtesy of Amey Kulkarni
% Module Name:  radix4_fft
% Project Name: Fast Fourier Transform (16-point)

function result = radix4_fft(in)

N = 16;
len_W = 10;

W = zeros(0, len_W);

for n = 0:len_W-1
    W(n+1) = exp((-j * 2 * pi * n) / N);
    % fprintf ('W[%d] = %.14f + %.14fj\n', n, real(W(n+1)), imag(W(n+1)));
end

a = zeros(0, N);
a1 = zeros(0, N);
a2 = zeros(0, N);
a3 = zeros(0, N);
a4 = zeros(0, N);

a(1) = 0;
a(2) = 4;
a(3) = 8;
a(4) = 12;
a(5) = 1;
a(6) = 5;
a(7) = 9;
a(8) = 13;
a(9) = 2;
a(10) = 6;
a(11) = 10;
a(12) = 14;
a(13) = 3;
a(14) = 7;
a(15) = 11;
a(16) = 15;

% Stage 1
for n=1:4:N
    a1(n)   = in(a(n)+1) + in(a(n+1)+1) *W(1) *( 1) + in(a(n+2)+1) *W(1) *( 1) + in(a(n+3)+1) *W(1) *( 1);
    a1(n+1) = in(a(n)+1) + in(a(n+1)+1) *W(1) *(-i) + in(a(n+2)+1) *W(1) *(-1) + in(a(n+3)+1) *W(1) *( i);
    a1(n+2) = in(a(n)+1) + in(a(n+1)+1) *W(1) *(-1) + in(a(n+2)+1) *W(1) *( 1) + in(a(n+3)+1) *W(1) *(-1);
    a1(n+3) = in(a(n)+1) + in(a(n+1)+1) *W(1) *( i) + in(a(n+2)+1) *W(1) *(-1) + in(a(n+3)+1) *W(1) *(-i);
end

% Stage 2
a2( 1) = a1( 1)*W( 1) + a1( 5)*W( 1)*( 1) + a1( 9)*W( 1)*( 1) + a1(13)*W( 1)*( 1);
a2( 5) = a1( 1)*W( 1) + a1( 5)*W( 1)*(-i) + a1( 9)*W( 1)*(-1) + a1(13)*W( 1)*( i);
a2( 9) = a1( 1)*W( 1) + a1( 5)*W( 1)*(-1) + a1( 9)*W( 1)*( 1) + a1(13)*W( 1)*(-1);
a2(13) = a1( 1)*W( 1) + a1( 5)*W( 1)*( i) + a1( 9)*W( 1)*(-1) + a1(13)*W( 1)*(-i);
a2( 2) = a1( 2)*W( 1) + a1( 6)*W( 2)*( 1) + a1(10)*W( 3)*( 1) + a1(14)*W( 4)*( 1);
a2( 6) = a1( 2)*W( 1) + a1( 6)*W( 2)*(-i) + a1(10)*W( 3)*(-1) + a1(14)*W( 4)*( i);
a2(10) = a1( 2)*W( 1) + a1( 6)*W( 2)*(-1) + a1(10)*W( 3)*( 1) + a1(14)*W( 4)*(-1);
a2(14) = a1( 2)*W( 1) + a1( 6)*W( 2)*( i) + a1(10)*W( 3)*(-1) + a1(14)*W( 4)*(-i);
a2( 3) = a1( 3)*W( 1) + a1( 7)*W( 3)*( 1) + a1(11)*W( 5)*( 1) + a1(15)*W( 7)*( 1);
a2( 7) = a1( 3)*W( 1) + a1( 7)*W( 3)*(-i) + a1(11)*W( 5)*(-1) + a1(15)*W( 7)*( i);
a2(11) = a1( 3)*W( 1) + a1( 7)*W( 3)*(-1) + a1(11)*W( 5)*( 1) + a1(15)*W( 7)*(-1);
a2(15) = a1( 3)*W( 1) + a1( 7)*W( 3)*( i) + a1(11)*W( 5)*(-1) + a1(15)*W( 7)*(-i);
a2( 4) = a1( 4)*W( 1) + a1( 8)*W( 4)*( 1) + a1(12)*W( 7)*( 1) + a1(16)*W(10)*( 1);
a2( 8) = a1( 4)*W( 1) + a1( 8)*W( 4)*(-i) + a1(12)*W( 7)*(-1) + a1(16)*W(10)*( i);
a2(12) = a1( 4)*W( 1) + a1( 8)*W( 4)*(-1) + a1(12)*W( 7)*( 1) + a1(16)*W(10)*(-1);
a2(16) = a1( 4)*W( 1) + a1( 8)*W( 4)*( i) + a1(12)*W( 7)*(-1) + a1(16)*W(10)*(-i);

result = a2;