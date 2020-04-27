function [x_trace,f_trace] = cg(init_vec,sigma,m)
%CG �����ݶȷ�����
%   ����init_vecΪ��ʼ��,sigmaΪ��ֹ����,mΪ�������
%   x_trace,f_traceΪ�½����̵Ĺ켣
x_trace=[init_vec];
f_trace=[probf(init_vec)];
k=0;
D=zeros(2,1);
while(norm(prob1diff(x_trace(:,end)),2)>sigma)
    if rem(k,2)==0
        D=-prob1diff(x_trace(:,end));
    else
        alpha=0;
        if m==1
            % F-R�����ݶȷ�
            alpha=(norm(prob1diff(x_trace(:,end)),2)/norm(prob1diff(x_trace(:,end-1)),2))^2;
        elseif m==2
            % P-R�����ݶȷ�
            alpha=dot(prob1diff(x_trace(:,end)).',prob1diff(x_trace(:,end))-prob1diff(x_trace(:,end-1)))/norm(prob1diff(x_trace(:,end-1)),2)^2;
        else
            % B-S�����ݶȷ�
            alpha=dot(prob1diff(x_trace(:,end)).',prob1diff(x_trace(:,end))-prob1diff(x_trace(:,end-1)))/dot(D.',prob1diff(x_trace(:,end))-prob1diff(x_trace(:,end-1)));
        end
        D=-prob1diff(x_trace(:,end))+alpha*D;
    end
    k=k+1;
    [temp_x,temp_f]=search1d(D,x_trace(:,end),1e-6);
    x_trace=[x_trace,temp_x];
    f_trace=[f_trace,temp_f];
end
end

