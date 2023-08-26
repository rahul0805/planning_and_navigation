%% Defining parameters
clear all;
clc ;
p1 = [0,0,0];
p2 = [4,2,0];
p3 = [1,4,0];
p_ori = [2.5,2,0];
%%
theta1 = get_thetas(p_ori,p1);
theta2 = get_thetas(p_ori,p2);
theta3 = get_thetas(p_ori,p3);
%%
runs = 100000;
avgs = [];
percents = [];
for jj =1:10
    sigma = jj*0.1;
    count = 0;
    solns = [];
    for i = 1:runs
        noise1 = sigma*randn();
        noise2 = sigma*randn();
        noise3 = sigma*randn();
        [p_sol, p_sol1, p_sol2, p_sol3] = get_pos(p1,theta1+noise1, p2, theta2+noise2, p3, theta3+noise3);
        flag = isInside(p_sol1, p_sol2, p_sol3,p_ori);
        err = norm(p_sol-p_ori(1:2)');
        solns = [solns,err];
        count = count + flag;
    end
    percents = [percents,count/runs];
    avgs = [avgs,mean(solns)];
end
%%
plot(percents);
fig = figure();
plot(avgs);
