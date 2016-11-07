
clc
clear all;
% 匹配测度算法的实现
% wh 2016/11/3

%% 样本
% s_t 分别为 0.5 0.666 1 0
x1 = [
    0,1,0,1,1,0
    1,1,1,1,1,1
    0,0,1,1,1,1
    0,0,1,1,1,1
    ]';
x2 = [
    0,0,1,1,1,0
    0,0,1,1,1,1
    0,0,1,1,1,1
    1,1,0,0,0,0
    ]';

[m,n] = size(x1);


s_t = zeros(1,n);
s_r = zeros(1,n);
m_s = zeros(1,n);
m_d = zeros(1,n);
m_k = zeros(1,n);


%% Tanimoto
for j = 1:1:n
    a = x1(:,j)'*x2(:,j);
    b = x1(:,j)'*x1(:,j) - x1(:,j)'*x2(:,j);
    c = x2(:,j)'*x2(:,j) - x1(:,j)'*x2(:,j);
    e = m - x1(:,j)'*x1(:,j) - x2(:,j)'*x2(:,j) + x1(:,j)'*x2(:,j);

    s_t(j) = a/(a+b+c);
    s_r(j) = a/(a+b+c+e);
    m_s(j) = (a+e)/n;
    m_d(j) = a/(2*a+b+c);
    m_k(j) = a/(b+c);
end
disp('从上至下 样本分别为6个中3个相同')
disp('6个中4个相同 6个全部相同 6个全部不相同')
disp('对应的Tanimoto测度分别为')
for j = 1:1:n
    	disp(num2str(s_t(j)));
end
disp('对应的Rao测度分别为')
for j = 1:1:n
    	disp(num2str(s_r(j)));
end
disp('对应的简单匹配系数分别为')
for j = 1:1:n
    	disp(num2str(m_s(j)));
end
disp('对应的Dice系数分别为')
for j = 1:1:n
    	disp(num2str(m_d(j)));
end
disp('对应的Kulzinsky系数分别为')
for j = 1:1:n
    	disp(num2str(m_k(j)));
end