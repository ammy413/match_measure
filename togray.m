clc
clear all;
addpath('../picture')

p_start = 1;
p_num = 10;
for i =1:1:p_num
    pic = imread([num2str(i+p_start-1) '.jpg']);
    pic = rgb2gray(pic);
%     imwrite(pic,[num2str(i+p_start-1+10) '.jpg'])
    imwrite(pic,['D:\�о�������\ģʽʶ��\picture\' num2str(i+p_start-1+10) '.jpg'])
end