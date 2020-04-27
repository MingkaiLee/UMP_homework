function [x_trace,f_trace] = st(init_vec,sigma,p)
%ST �����½�������
%   ����init_vecΪ��ʼ��,sigmaΪ��ֹ����,pΪ������ʽ
%   x_trace,f_traceΪ�½����̵Ĺ켣
x_trace=[init_vec];
f_trace=[probf(init_vec)];
while(norm(prob1diff(x_trace(:,end)),2)>sigma)
    delta=prob1diff(x_trace(:,end));
    D=zeros(2,1);
    if p==1
        % 1���������½�����
        if abs(delta(1))>abs(delta(2))
            D(1)=sign(-delta(1));
        else
            D(2)=sign(-delta(2));
        end
    elseif p==2
        % 2���������½�����,���ݶȷ���
        D=-delta./norm(delta,2);
    else
        D=sign(-delta);
    end
    [temp_x,temp_f]=search1d(D,x_trace(:,end),1e-11);
    x_trace=[x_trace,temp_x];
    f_trace=[f_trace,temp_f];
end
end

