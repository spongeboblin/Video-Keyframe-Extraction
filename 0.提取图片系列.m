video=VideoReader('test.avi','Tag','Reader');  %读取视频文件test.avi,可根据实际文件名进行更改
NOF=video.NumberOfFrames;  %读取视频的帧的总数，便于后续的循环与搜索
Img_diff=zeros(NOF-1,1);
mkdir([cd,'/images']);  %在当前文件夹下创建"images"文件夹，用于保存所有帧的图像
directory=[cd,'/images/'];
for i=1:NOF  %提取视频的每一帧，按顺序命名，并将其保存为.jpg格式
    Img_I=read(video,i);
    imwrite(Img_I,[directory,[num2str(i) '.jpg'];]);
end; 