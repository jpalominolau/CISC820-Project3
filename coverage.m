function c = coverage(num, dist_name, n, trials)

hits = 0;
for t = 1:trials
    [X, true_mean] = generate_data(dist_name, n);
    [a, b] = ci(X, num);
    if a <= true_mean && true_mean <= b
        hits = hits + 1;
    end
end
c = hits / trials;

end
