function [ result ] = get_number( x1,x2 )

[m,n] = size(x1);


s_t = zeros(1,n);
s_r = zeros(1,n);
m_s = zeros(1,n);
m_d = zeros(1,n);
m_k = zeros(1,n);


for j = 1:1:n
    a = x1(:,j)'*x2(:,j);
    b = x1(:,j)'*x1(:,j) - x1(:,j)'*x2(:,j);
    c = x2(:,j)'*x2(:,j) - x1(:,j)'*x2(:,j);
    e = m - x1(:,j)'*x1(:,j) - x2(:,j)'*x2(:,j) + x1(:,j)'*x2(:,j);

    s_t(j) = a/(a+b+c);
    s_r(j) = a/(a+b+c+e);
    m_s(j) = (a+e)/(a+b+c+e);
    m_d(j) = a/(2*a+b+c);
    m_k(j) = a/(b+c);
end

result(1,:) = s_t;
result(2,:) = s_r;
result(3,:) = m_s;
result(4,:) = m_d;
result(5,:) = m_k;
end

