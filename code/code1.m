path='E:\ѧϰ����\����ͼ����\��5����ҵ\';
img=cell(2,2);
img{1,1}=imread('E:\ѧϰ����\����ͼ����\��5����ҵ\test1.pgm');
img{1,2}='test1';
img{2,1}=imread('E:\ѧϰ����\����ͼ����\��5����ҵ\test2.tif');
img{2,2}='test2';
for num = 1:2
    clear rs
    clear rs2
    I1 = img{num,1};
    I = im2double(I1);
    [M,N]=size(I);
    f=fft2(I);
    f=fftshift(f);
    n=2;
    d0=50;
    n=fix(N/2);
    m=fix(M/2);
    for i=1:M
        for j=1:N
            d=sqrt((i-m)^2+(j-n)^2);
            h=1/(1+0.414*(d/d0)^(2*n));
            rs(i,j)=h*f(i,j);
        end
    end
    rs=ifftshift(rs);
    I_af=ifft2(rs);
    I_af=uint8(255*real(I_af));
    subplot(1,2,1)
    imshow(I1);
    title('ԭͼ��')
    subplot(1,2,2)
    imshow(I_af);
    title('������˹��ͨ�˲���')
    saveas(gcf,[strcat(path,img{num,2},'_������˹��ͨ'),'.jpg'])
    
    S=sum((abs(f)).^2,'all');
    
    S1=sum((abs(rs)).^2,'all');
    L1(num)=S1/S                                          %���㹦���ױ�
    
    
    r=[5,20,50,100,150];
    for k=1:5
        for u=1:M
            for v=1:N
                D=sqrt((u-m)^2+(v-n)^2);
                H=exp(-D^2/(2*r(k)^2));
                rs2(u,v)=f(u,v)*H;
            end
        end
        rs2=ifftshift(rs2);
        I_af2=ifft2(rs2);
        I_af2=uint8(255*real(I_af2));
        subplot(1,2,1)
        imshow(I1);
        title('ԭͼ��')
        subplot(1,2,2)
        imshow(I_af2);
        title(strcat('��˹��ͨ�˲��� r=',num2str(r(k))))
        saveas(gcf,[strcat(path,img{num,2},'_��˹��ͨ','r=',num2str(r(k))),'.jpg'])
        S=sum((abs(f)).^2,'all');
        
        S2=sum((abs(rs2)).^2,'all');
        L2(num,k)=S2/S;
    end
    
    
    
end
