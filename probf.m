function [outputArg] = probf(vec_x)
%PROBF UMP�����ԭ����
%   ����ΪUMP��ĳһ���������
outputArg = (1-vec_x(1))^2+2*(vec_x(2)-vec_x(1)^2)^2;
end

