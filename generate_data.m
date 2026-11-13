function [X, true_mean] = generate_data(dist_name, n)

if strcmp(dist_name, 'uniform')
    X = rand(1, n);
    true_mean = 0.5;
elseif strcmp(dist_name, 'bernoulli05')
    X = double(rand(1, n) < 0.5);
    true_mean = 0.5;
elseif strcmp(dist_name, 'bernoulli001')
    X = double(rand(1, n) < 0.01);
    true_mean = 0.01;
end

end
