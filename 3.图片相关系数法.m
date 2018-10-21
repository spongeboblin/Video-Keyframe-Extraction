clc;clear;clf;
d=dir('images');  %读入"image"文件夹
NOF=max(size(d)-2);
img_sim=zeros(NOF-1,1);
imglist=d(3:NOF+2);

for i=1:NOF-1  %按顺序遍历所有帧文件
    img_i=imread(strcat('images\',imglist(i).name));
    img_i_plus=imread(strcat('images\',imglist(i+1).name));
	%计算前后两帧的相关系数
    img_sim(i)=corr2(img_i(:,:,1),img_i_plus(:,:,1))+corr2(img_i(:,:,2),img_i_plus(:,:,2))+corr2(img_i(:,:,3),img_i_plus(:,:,3));
    img_sim(i)=img_sim(i)/3;
end;
Threshold=0.05;  %设定阈值，可根据实际需要改变
for i=1:length(img_sim)  %如果前后两帧的相关程度小于阈值，则判断为发生较大变化，即边缘镜头
    if(img_sim(i)<Threshold)
       fprintf('%d\n',i);  %输出符合条件的帧编号，即为边缘镜头的帧编号
   end;
end;