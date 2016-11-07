
clc
clear all;
% ƥ�����㷨��ʵ��
% wh 2016/11/3

%% ����
% s_t �ֱ�Ϊ 0.5 0.666 1 0
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
disp('�������� �����ֱ�Ϊ6����3����ͬ')
disp('6����4����ͬ 6��ȫ����ͬ 6��ȫ������ͬ')
disp('��Ӧ��Tanimoto��ȷֱ�Ϊ')
for j = 1:1:n
    	disp(num2str(s_t(j)));
end
disp('��Ӧ��Rao��ȷֱ�Ϊ')
for j = 1:1:n
    	disp(num2str(s_r(j)));
end
disp('��Ӧ�ļ�ƥ��ϵ���ֱ�Ϊ')
for j = 1:1:n
    	disp(num2str(m_s(j)));
end
disp('��Ӧ��Diceϵ���ֱ�Ϊ')
for j = 1:1:n
    	disp(num2str(m_d(j)));
end
disp('��Ӧ��Kulzinskyϵ���ֱ�Ϊ')
for j = 1:1:n
    	disp(num2str(m_k(j)));
end