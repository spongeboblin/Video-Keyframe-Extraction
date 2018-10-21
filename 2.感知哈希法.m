clc;clear;clf;
d=dir('images');  %读入"image"文件夹
NOF=max(size(d)-2);
imglist=d(3:NOF+2);
Threshold=6;  %设定阈值，可根据实际需要改变
count=zeros(NOF-1,1);
for i=1:NOF-1  %按顺序遍历所有帧文件
    img_i=imread(strcat('images\',imglist(i).name));  %读入一帧文件
    img_i_plus=imread(strcat('images\',imglist(i+1).name));  %读入下一帧文件
    imbw_i=im2bw(rgb2gray(imresize(img_i,[8,8])));
    imbw_i_plus=im2bw(rgb2gray(imresize(img_i_plus,[8,8])));
    for j=1:8  %将图片的宽分为八等份
        for k=1:8  %将图片的高分为八等份
            if(imbw_i(j,k)~=imbw_i_plus(j,k))  %在1/64区域内搜索和前一帧的同一区域的图片
                count(i)=count(i)+1;  %将识别出的不同结果作为变换图像，即判断为边缘镜头
            end;
        end;
    end; 
end;
for i=1:NOF-2  %找出吻合度大于阈值的帧
    if(count(i)>Threshold)
       fprintf('%d\n',i);  %输出符合条件的帧编号，即为边缘镜头的帧编号
   end;
end; 