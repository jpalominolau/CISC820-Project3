sizes = [10 100 1000 10000];

disp('Function 1')
same = 0;
for t = 1:1000
    X = rand(1, 50);
    [a, b] = ci(X, 1);
    if a == min(X) && b == max(X)
        same = same + 1;
    end
end
fprintf('Times a is the min and b is the max: %d of 1000\n', same);
fprintf('Chance of at least one 1 in Bernoulli(0.01): n = 10 is %.3f, n = 100 is %.3f, n = 1000 is %.5f\n', 1 - 0.99^10, 1 - 0.99^100, 1 - 0.99^1000);

disp(' ')
disp('Function 2')
[a, b] = ci(rand(1, 100000), 2);
fprintf('Uniform with n = 100000: [%.3f, %.3f]\n', a, b);
[a, b] = ci(double(rand(1, 10000) < 0.01), 2);
fprintf('Bernoulli(0.01) with n = 10000: [%.3f, %.3f] and the true mean is 0.01\n', a, b);

disp(' ')
disp('Function 3')
for k = 1:4
    n = sizes(k);
    X = rand(1, n);
    [a, b] = ci(X, 3);
    center = (a + b) / 2;
    half = (b - a) / 2;
    fprintf('n = %d: distance from center to mean is %.6f, half width divided by sigma/sqrt(n) is %.4f\n', n, abs(center - mean(X)), half / (std(X, 1) / sqrt(n)));
end
[a, b] = ci(zeros(1, 10), 3);
fprintf('Ten zeros: [%.3f, %.3f]\n', a, b);

disp(' ')
disp('Function 4')
[a, b] = ci(rand(1, 10), 4);
fprintf('10 uniform values: [%.3f, %.3f]\n', a, b);
[a, b] = ci(rand(1, 10000), 4);
fprintf('10000 uniform values: [%.3f, %.3f]\n', a, b);
[a, b] = ci(zeros(1, 50), 4);
fprintf('50 zeros: [%.3f, %.3f]\n', a, b);
[a, b] = ci(ones(1, 50), 4);
fprintf('50 ones: [%.3f, %.3f]\n', a, b);

disp(' ')
disp('Function 5')
X = rand(1, 20);
for t = 1:8
    [a, b] = ci(X, 5);
    fprintf('Same dataset, call %d: [%.3f, %.3f]\n', t, a, b);
end
full = 0;
point = 0;
other = 0;
for t = 1:100000
    X = rand(1, 10);
    [a, b] = ci(X, 5);
    if a == 0 && b == 1
        full = full + 1;
    elseif abs(a - b) < 1e-12 && abs(a - mean(X)) < 1e-12
        point = point + 1;
    else
        other = other + 1;
    end
end
fprintf('Out of 100000 datasets: [0, 1] was %.4f, one point at the mean was %.4f, other was %.4f\n', full / 100000, point / 100000, other / 100000);

disp(' ')
disp('Function 6')
for m = [0 0.01 0.03 0.04 0.049 0.051 0.06 0.1 0.5]
    ones_count = round(m * 1000);
    X = [ones(1, ones_count) zeros(1, 1000 - ones_count)];
    [a, b] = ci(X, 6);
    fprintf('Sample mean %.3f: [%.3f, %.3f]\n', mean(X), a, b);
end
X = rand(1, 30);
for t = 1:5
    [a, b] = ci(X, 6);
    fprintf('Same dataset, call %d: [%.3f, %.3f]\n', t, a, b);
end

disp(' ')
disp('Function 7')
for k = 1:4
    n = sizes(k);
    X = rand(1, n);
    [a, b] = ci(X, 7);
    Y = double(rand(1, n) < 0.01);
    [c, d] = ci(Y, 7);
    half = (b - a) / 2;
    alpha = 2 * exp(-2 * n * half^2);
    fprintf('n = %d: distance from center to mean is %.6f, half width is %.4f for uniform and %.4f for Bernoulli(0.01), alpha from Hoeffding is %.3f\n', n, abs((a + b) / 2 - mean(X)), half, (d - c) / 2, alpha);
end
[worst, worst_n, worst_p] = scan_worst(7);
fprintf('Worst coverage for n from 1 to 20 and Bernoulli(p): %.3f at n = %d and p = %.2f\n', worst, worst_n, worst_p);

disp(' ')
disp('Function 8')
[a, b] = ci(rand(1, 100000), 8);
fprintf('Uniform with n = 100000: [%.3f, %.3f]\n', a, b);
[a, b] = ci(rand(1, 1000000), 8);
fprintf('Uniform with n = 1000000: [%.3f, %.3f]\n', a, b);
[a, b] = ci(double(rand(1, 10000) < 0.01), 8);
fprintf('Bernoulli(0.01) with n = 10000: [%.3f, %.3f] and the true mean is 0.01\n', a, b);

disp(' ')
disp('Function 9')
for k = 1:4
    n = sizes(k);
    X = rand(1, n);
    [a, b] = ci(X, 9);
    center = (a + b) / 2;
    half = (b - a) / 2;
    fprintf('n = %d: distance from center to mean is %.6f, half width divided by sigma/sqrt(n) is %.4f\n', n, abs(center - mean(X)), half / (std(X, 1) / sqrt(n)));
end
[a, b] = ci(zeros(1, 10), 9);
fprintf('Ten zeros: [%.3f, %.3f]\n', a, b);

disp(' ')
disp('Function 10')
for n = [10 100 1000 10000 100000]
    X = rand(1, n);
    [a, b] = ci(X, 10);
    Y = double(rand(1, n) < 0.01);
    [c, d] = ci(Y, 10);
    half = (b - a) / 2;
    fprintf('n = %d: distance from center to mean is %.6f, half width is %.4f for uniform and %.4f for Bernoulli(0.01), half width times sqrt(n) is %.4f\n', n, abs((a + b) / 2 - mean(X)), half, (d - c) / 2, half * sqrt(n));
end
fprintf('Alpha from Hoeffding with half width 1/sqrt(n) is 2/exp(2) = %.3f so the level is %.3f\n', 2 * exp(-2), 1 - 2 * exp(-2));
[worst, worst_n, worst_p] = scan_worst(10);
fprintf('Worst coverage for n from 1 to 20 and Bernoulli(p): %.3f at n = %d and p = %.2f\n', worst, worst_n, worst_p);
