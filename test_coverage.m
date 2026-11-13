for num = 1:10
    c = coverage(num, 'uniform', 100, 1000);
    disp([num, c])
end
