function [outputArg] = probf(vec_x)
%PROBF UMP问题的原函数
%   输入为UMP的某一点的列向量
outputArg = (1-vec_x(1))^2+2*(vec_x(2)-vec_x(1)^2)^2;
end

