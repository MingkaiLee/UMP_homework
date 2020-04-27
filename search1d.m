function [x,val] = search1d(D,a,sigma)
%SEARCH1D 一维搜索函数，使用0.618法
%   输入D为梯度方向,a为搜索起始点,sigma为搜索精度
%   输出x为最优点,f为最优值

% 确定搜索区间
f=probf(a);
t=1;
while probf(a+t*D)<f
    t = t+1;
end
b=a+t.*D;
% 计算最初两个探索点
t1=b-0.618*(b-a);
t2=a+0.618*(b-a);
% 搜索完成标志位
flag=0;
val1=probf(t1);
val2=probf(t2);
while(flag==0)
    if val1<val2
        % 多维上的区间精度度量转换到一维
        delta=t2-a;
        if min(delta./D)<sigma
            % 置位输出
            flag=1;
        else
            b=t2;
            t2=t1;
            t1=b-0.618*(b-a);
            val2=val1;
            val1=probf(t1);
        end
    else
        delta=b-t1;
        if min(delta./D)<sigma
            flag=2;
        else
            a=t1;
            t1=t2;
            t2=a+0.618*(b-a);
            val1=val2;
            val2=probf(t2);
        end
    end
end
if flag==1
    x=t1;
    val=probf(t1);
else
    x=t2;
    val=probf(t2);
end
end

