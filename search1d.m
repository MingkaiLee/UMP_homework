function [x,val] = search1d(D,a,sigma)
%SEARCH1D һά����������ʹ��0.618��
%   ����DΪ�ݶȷ���,aΪ������ʼ��,sigmaΪ��������
%   ���xΪ���ŵ�,fΪ����ֵ

% ȷ����������
f=probf(a);
t=1;
while probf(a+t*D)<f
    t = t+1;
end
b=a+t.*D;
% �����������̽����
t1=b-0.618*(b-a);
t2=a+0.618*(b-a);
% ������ɱ�־λ
flag=0;
val1=probf(t1);
val2=probf(t2);
while(flag==0)
    if val1<val2
        % ��ά�ϵ����侫�ȶ���ת����һά
        delta=t2-a;
        if min(delta./D)<sigma
            % ��λ���
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

