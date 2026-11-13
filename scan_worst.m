function [worst, worst_n, worst_p] = scan_worst(num)

worst = 1;
worst_n = 0;
worst_p = 0;
for n = 1:20
    for p = 0.05:0.05:0.95
        hits = 0;
        for t = 1:4000
            X = double(rand(1, n) < p);
            [a, b] = ci(X, num);
            if a <= p && p <= b
                hits = hits + 1;
            end
        end
        c = hits / 4000;
        if c < worst
            worst = c;
            worst_n = n;
            worst_p = p;
        end
    end
end

end
