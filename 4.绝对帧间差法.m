clc;clear;clf;
d=dir('images');  %读入"image"文件夹
NOF=max(size(d)-2);
img_sim=zeros(NOF-1,1);
imglist=d(3:NOF+2);

for i=1:NOF-1  %按顺序遍历所有帧文件
    img_i=imread(strcat('images\',imglist(i).name));  %读入一帧文件
    img_i_plus=imread(strcat('images\',imglist(i+1).name));  %读入下一帧文件
	%计算前后两帧的亮度之差
    img_diff(i)=norm(double(img_i(:,:,1)-img_i_plus(:,:,1)))+norm(double(img_i(:,:,2)-img_i_plus(:,:,2)))+norm(double(img_i(:,:,3)-img_i_plus(:,:,3)));
end;
Threshold=mean(img_diff)*1.1;  %设定阈值，可根据实际需要改变，这里将阈值设定为平均值的1.1倍
for i=2:NOF-2  %如果前后两帧的亮度之差大于阈值，则认为发生较大变化，即判断为边缘镜头
   if(img_diff(i)>img_diff(i-1)&&img_diff(i)>img_diff(i+1)&&img_diff(i)>Threshold)
       fprintf('%d\n',i);  %输出符合条件的帧编号，即为边缘镜头的帧编号
   end;
end; 