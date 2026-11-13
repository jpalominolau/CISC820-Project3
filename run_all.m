trials = 10000;
names = {'uniform', 'bernoulli05', 'bernoulli001'};
sizes = [10 100 1000 10000];

for d = 1:3
    disp(names{d})
    for num = 1:10
        row = zeros(1, 4);
        for k = 1:4
            row(k) = coverage(num, names{d}, sizes(k), trials);
        end
        disp([num, row])
    end
end
