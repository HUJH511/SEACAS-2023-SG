clc;
clear;

N = 16;

input = [0 32767 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

ans_1 = radix4_fft(input);
ans_2 = radix4_ffthw(input);
ans_baseline = fft(input);

err1_r = abs(real(ans_1) - real(ans_baseline));
err1_i = abs(imag(ans_1) - imag(ans_baseline));

err2_r = abs(real(ans_2) - real(ans_baseline));
err2_i = abs(imag(ans_2) - imag(ans_baseline));

err1_r_pt = abs(real(ans_1) - real(ans_baseline))./abs(real(ans_baseline));

err2_r_pt = abs(real(ans_2) - real(ans_baseline))./abs(real(ans_baseline));

figure;
plot([1:1:16], err1_r, "b");
plot([1:1:16], err1_i, "r");
title("(Float version) - (Baseline)");

figure;
plot([1:1:16], err2_r, "b");
plot([1:1:16], err2_i, "r");
title("(Fixed version) - (Baseline)");

figure;
plot([1:1:16], err1_r_pt, "b");
title("[(Float version) - (Baseline)]/Baseline");

figure;
plot([1:1:16], err2_r_pt, "b");
title("[(Fixed version) - (Baseline)]/Baseline");
