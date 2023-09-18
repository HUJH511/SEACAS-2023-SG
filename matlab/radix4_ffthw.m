% SEACAS 2023
% Courtesy of Amey Kulkarni
% Module Name:  radix4_ffthw
% Project Name: Fast Fourier Transform (16-point)

function result = radix4_ffthw(input)

N = 16;
len_W = 10;

w_lut = zeros(0, len_W);

for n = 0:len_W-1
    w_lut(n+1) = exp((-j * 2 * pi * n) / N);
    w_lut(n+1) = round(w_lut(n+1) * (2^14))/(2^14);
    % fprintf ('W[%d] = %.14f + %.14fj\n', n, real(W(n+1)), imag(W(n+1)));
end

read_addr_lut = [0 4 8 12 1 5 9 13 2 6 10 14 3 7 11 15; ...
                 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15];             

w_addr_lut_b = [0 0 0 0; ...
              0 1 2 3];

w_addr_lut_c = [0 0 0 0; ...
              0 2 4 6];

w_addr_lut_d = [0 0 0 0; ...
              0 3 6 9];

for stage = 1:2
    
    for butterfly = 1:N/4
        
        % Determine the addresses of the values for this stage/butterfly.
        a_addr = read_addr_lut(stage, 4*butterfly-3) + 1;
        b_addr = read_addr_lut(stage, 4*butterfly-2) + 1;
        c_addr = read_addr_lut(stage, 4*butterfly-1) + 1;
        d_addr = read_addr_lut(stage, 4*butterfly) + 1;
        w_addr_b = w_addr_lut_b(stage, butterfly) + 1;
        w_addr_c = w_addr_lut_c(stage, butterfly) + 1;
        w_addr_d = w_addr_lut_d(stage, butterfly) + 1;
        
        % Get the values of a, b, c, d, and w_b, w_c, w_d.
        a = input(a_addr);
        b = input(b_addr);
        c = input(c_addr);
        d = input(d_addr);
        w_b = w_lut(w_addr_b);
        w_c = w_lut(w_addr_c);
        w_d = w_lut(w_addr_d);
        
        % Multiply b,c, d by w_b, w_c, w_d and truncate the result.
        p_b = floor( b*w_b * 2^20)/2^20;
        p_c = floor( c*w_c * 2^20)/2^20;
        p_d = floor( d*w_d * 2^20)/2^20;
        p_b_j = floor( p_b*1i * 2^20)/2^20;
        p_d_j = floor( p_d*1i * 2^20)/2^20;
        
        % Calculate the full 32-bit output values.
        out_1_full = a + p_b + p_c + p_d;
        out_2_full = a - p_b_j - p_c + p_d_j;
        out_3_full = a - p_b + p_c - p_d;
        out_4_full = a + p_b_j - p_c - p_d_j;
        
        % Saturate the output values down to 16 bits.
        out_1 = saturate(out_1_full);
        out_2 = saturate(out_2_full);
        out_3 = saturate(out_3_full);
        out_4 = saturate(out_4_full);
        
        % Save the new values back to the array.
        input(a_addr) = out_1;
        input(b_addr) = out_2;
        input(c_addr) = out_3;
        input(d_addr) = out_4;
    end
    
end

% Output the results in the correct order.
result = zeros(1, N);

for i = 1:16
    result(1, i) = input(read_addr_lut(1, i)+1)*256;
%     fprintf('result[%d] = %g %g\n', i, ...
%         real(input(read_addr_lut(1, i)+1))*256, ...
%         imag(input(read_addr_lut(1, i)+1))*256);
end