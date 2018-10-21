clc;clear;clf;
d=dir('images');  %读入"image"文件夹
NOF=max(size(d)-2);
img_diff=zeros(NOF-1,1);
imglist=d(3:NOF+2);
Threshold=0.45;  %设定阈值，可根据实际需要改变
for i=1:NOF-1  %按顺序遍历所有帧文件
    img_i=imread(strcat('images\',imglist(i).name));  %读入一帧文件
    img_i_plus=imread(strcat('images\',imglist(i+1).name));  %读入下一帧文件
    Hist1=imhist(rgb2gray(img_i));  %提取第一帧文件的rgb2gray值
    Hist2=imhist(rgb2gray(img_i_plus));  %提取下一帧文件的rgb2gray值
    S=min(Hist1(1),Hist2(1));  %取hist较小的那一帧
    for j=2:length(Hist1)
        S=S+min(Hist1(j),Hist2(j));
    end;
    H=sum(Hist1);
    img_diff(i)=S/H;  %求出直方图所代表的值，将其保存到img_diff数组中
end;
for i=1:length(img_diff)  %找出img_diff数组中直方图差小于阈值的帧
    if(img_diff(i)<Threshold)
       fprintf('%d\n',i);  %输出符合条件的帧编号，即为边缘镜头的帧编号
   end;
end; 