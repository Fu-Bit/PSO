clc
clear

%����������ر���
popsize=2000;%��������
degree=100;%ѭ������

[popmax,vmax]=Init(popsize);%��ʼ�������ֵȺ���λ�ú��ٶ�
[popmin,vmin]=Init(popsize);%��ʼ������СֵȺ���λ�ú��ٶ�

%�����ʼȺ�����Ӧ��,Ⱥ�����Ÿ���
[value_max,gbestvaluemax,gbestmax]=calfitvaluemax(popmax);
[value_min,gbestvaluemin,gbestmin]=calfitvaluemin(popmin);

%��������ʷ��������Ϊ��ʼ��ֵ
pbestmax=popmax;
pbestmin=popmin;

%����ͼ
set(gcf,'doublebuffer','on')
set(gcf,'Name','����Ⱥ�㷨PSO��ʾ')
axis([1 6 2 9])
grid on

for i=1:degree
    %�����µ�λ��
    [newpopmax,newvmax]=updatepop(popmax,vmax,pbestmax,gbestmax);
    [newpopmin,newvmin]=updatepop(popmin,vmin,pbestmin,gbestmin);
    
    %�����ٶ�ֵ
    vmax=newvmax;
    vmin=newvmin;
    
    %����λ��ֵ
    popmax=newpopmax;
    popmin=newpopmin;
    
    %�����µ���Ӧ��ֵ���ô�ѭ���е�Ⱥ������
    [newvalue_max,newgbestvaluemax,newgbestmax]=calfitvaluemax(newpopmax);
    [newvalue_min,newgbestvaluemin,newgbestmin]=calfitvaluemin(newpopmin);
    
    %���¸�����ʷ����
    for j=1:popsize
        if newvalue_max(j)>value_max(j)
            pbestmax(:,j)=newpopmax(:,j);
        end
        if newvalue_min(j)<value_min(j)
            pbestmin(:,j)=newpopmin(:,j);
        end      
    end
    
    %����Ⱥ������
    if newgbestvaluemax>gbestvaluemax
        gbestvaluemax=newgbestvaluemax;
        gbestmax=newgbestmax;
    end
    
    if newgbestvaluemin<gbestvaluemin
        gbestvaluemin=newgbestvaluemin;
        gbestmin=newgbestmin;
    end
    
    %���ƶ�̬�˶�ɢ��ͼ
    plot(newpopmax(1,:),newpopmax(2,:),'r*',newpopmin(1,:),newpopmin(2,:),'go');
    drawnow
    
end
