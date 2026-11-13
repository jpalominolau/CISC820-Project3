[X, true_mean] = generate_data('uniform', 100000);
disp([true_mean, mean(X), min(X), max(X)])

[X, true_mean] = generate_data('bernoulli05', 100000);
disp([true_mean, mean(X), min(X), max(X)])

[X, true_mean] = generate_data('bernoulli001', 100000);
disp([true_mean, mean(X), min(X), max(X)])
