function [x_trace,f_trace] = st(init_vec,sigma,p)
%ST 最速下降法函数
%   输入init_vec为初始点,sigma为终止条件,p为范数形式
%   x_trace,f_trace为下降过程的轨迹
x_trace=[init_vec];
f_trace=[probf(init_vec)];
while(norm(prob1diff(x_trace(:,end)),2)>sigma)
    delta=prob1diff(x_trace(:,end));
    D=zeros(2,1);
    if p==1
        % 1范数最速下降方向
        if abs(delta(1))>abs(delta(2))
            D(1)=sign(-delta(1));
        else
            D(2)=sign(-delta(2));
        end
    elseif p==2
        % 2范数最速下降方向,负梯度方向
        D=-delta./norm(delta,2);
    else
        D=sign(-delta);
    end
    [temp_x,temp_f]=search1d(D,x_trace(:,end),1e-11);
    x_trace=[x_trace,temp_x];
    f_trace=[f_trace,temp_f];
end
end

