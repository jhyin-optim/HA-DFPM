rng('default');%这里说明随机是有效的
for repeats = 1:5
    x0 = (rand(1,1))*11-1;   % x0\in (-1,10)
    disp(x0)
end
