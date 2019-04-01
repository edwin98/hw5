path='E:\学习资料\数字图像处理\第5次作业\';
img=cell(2,2);
img{1,1}=imread('E:\学习资料\数字图像处理\第5次作业\test3_corrupt.pgm');
img{1,2}='test3';
img{2,1}=imread('E:\学习资料\数字图像处理\第5次作业\test4 copy.bmp');
img{2,2}='test4';
for num = 1:2
    clear rs
    clear rs2
    I = img{num,1};
    f=double(I);
    I_um = imsharpen(I,'Radius',15,'Amount',1.2);
    subplot(1,2,1)
    imshow(I);title('原图像')
    subplot(1,2,2)
    imshow(I_um);title('unsharp masking处理后图像')
    saveas(gcf,strcat(img{num,2},'_unsharp masking','.jpg'))
    
    
    I_Laplace = edge(I,'log');

    subplot(1,2,1)
    imshow(I);title('原图像')
    subplot(1,2,2)
    imshow(I_Laplace);title('Laplace edge detection处理后图像')
    saveas(gcf,strcat(img{num,2},'_Laplace edge detection','.jpg'));
end



