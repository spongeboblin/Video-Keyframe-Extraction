clc;clear;clf;
d=dir('images');  %����"image"�ļ���
NOF=max(size(d)-2);
img_sim=zeros(NOF-1,1);
imglist=d(3:NOF+2);

Threshold1 = 800000;  %�趨��ֵ1��Ϊ���ر仯֮��
for i=1:NOF-1  %��˳���������֡�ļ�
    img_i=imread(strcat('images\',imglist(i).name));  %����һ֡�ļ�
    img_i_plus=imread(strcat('images\',imglist(i+1).name));  %������һ֡�ļ�
	%����ǰ����֡�����ر仯֮��
    img_diff(i)=norm(double(img_i(:,:,1)-img_i_plus(:,:,1)))+norm(double(img_i(:,:,2)-img_i_plus(:,:,2)))+norm(double(img_i(:,:,3)-img_i_plus(:,:,3)));
	%�����ز������ֵ1�ĵ��������
	if (img_diff(i)>Threshold1) count(i)++;
end;
Threshold=mean(img_diff)*1.5;  %�趨��ֵ���ɸ���ʵ����Ҫ�ı䣬���ｫ��ֵ�趨Ϊƽ��ֵ��1.5��
for i=2:NOF-2  %���ǰ����֡�����ص����������ֵ2�����ж�Ϊ�����ϴ�仯������Ե��ͷ
   if(img_diff(i)>img_diff(i-1)&&img_diff(i)>img_diff(i+1)&&img_diff(i)>Threshold)
       fprintf('%d\n',i);  %�������������֡��ţ���Ϊ��Ե��ͷ��֡���
   end;
end; 