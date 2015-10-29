function [ gu,extre_map ] = gu_initial( image, coordinate_flag)
% ���룺ͼ��image�����б�־coordinate_flag���Ŵ���scale
%   Detailed explanation goes here
scale = 2;%Ĭ�ϷŴ���Ϊ2
[m,n] = size(image);
gu = zeros(scale*m,scale*n);
extre_map = zeros(scale*m,scale*n);
if strcmp(coordinate_flag , 'hor')
    for i=scale:scale:m*scale
        [ pos_extre,val_extre] = estimate_extremum(image(i,:));
        temp = pos_extre*2;
        temp(1) = 1;
        for j=1:n*scale
            gu(i,j) = interp1(temp,val_extre,j,'linear');
        end
    end
    
elseif strcmp(coordinate_flag , 'ver')
    for i=1:n
        [ pos_extre,val_extre] = estimate_extremum(image(:,i)');
        temp = pos_extre*2;
        temp(1) = 1;
        for j=1:m*scale
            gu(j,i) = interp1(temp,val_extre,j,'linear');
        end
    end 
else
    display('the coordinate flag is wrong!');
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
end

