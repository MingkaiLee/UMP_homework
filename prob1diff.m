function [outputArg] = prob1diff(vec_x)
%PROB1DIFF ��ȡUMP�����һ��ƫ����
%   ����Ϊĳһ���������
outputArg = zeros(2,1);
outputArg(1) = 2*(vec_x(1)-1)-8*vec_x(1)*(vec_x(2)-vec_x(1)^2);
outputArg(2) = 4*(vec_x(2)-vec_x(1)^2);
end

