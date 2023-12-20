function specshow(spec)
     imagesc(log(abs(spec)+1).^(1/3)); axis image; 
            %这个是目的是将复数变成实数，并压缩数据范围     %imagesc(b):将数组b中的数据显示为一个图像，该图像使用颜色图中的全部颜色。
                                                          %b中的每个元素指定图像的一个像素的颜色。生成图像是m*n的像素网格，
                                                          %其中m,n分别为c中的行数和列数。
end