%edited by JBR
%data. 2020.5.1
%% ������ʵ�顪����������
clear;clc;
i1=(1:20);
Z=Z.*1000; %ת��Ϊ��mΪ��λ�ĸ߶�ֵ
X=[1900;-10]; %��ʼ�۲�״̬���߶�Ϊ1900m���ٶ�Ϊ10m/s
P=[100 0;0 2]; %��ʼ״̬Э�������
A=[1 1;0 1]; %״̬ת�ƾ���ÿ�����һ�Σ�?t=1
C=[1 0];%�۲����,�������۲�߶ȣ����۲��ٶ�
R=1; %�۲���������
X_=A*X+[0;-9.8];
P_= A*P*A';
K=P_*C'/(C*P_*C'+R);
X=X_+K*(Z(1)-C*X_);
XX=X;
P=(eye(2)-K*C)*P_; %eye(2) 2*2��λ����
for i=2:20 %20�ε���
    X_=A*X+[0;-9.8];
    P_= A*P*A';
    K=P_*C'/(C*P_*C'+R);
    X=X_+K*(Z(i)-C*X_);
    XX=[XX,X_+K*(Z(i)-C*X_)];
    P=(eye(2)-K*C)*P_; %eye(2) 2*2��λ����
end
figure;
plot(i1,Z,'r.',i1,XX(1,:),'b.'); %���㣬����ʱ�䣬����߶�
xlabel('ʱ��(s)');ylabel('�߶�(m)');
legend('�۲�ֵ','Ԥ��ֵ');
title('ʱ��-�߶�ͼ��');
figure;
plot(i1,XX(2,:),'r.'); %���㣬�˲��󣬺���ʱ�䣬����߶�
xlabel('ʱ��(s)');ylabel('�ٶ�(m/s)');
title('ʱ��-�ٶ�ͼ��');
ess=XX(1,:)-Z;
figure;
plot(i1,ess,'.');
xlabel('ʱ��(s)');ylabel('�߶�(m)');
title('ʱ��-�߶����ͼ��');