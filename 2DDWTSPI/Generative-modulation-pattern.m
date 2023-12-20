clear all
close all;
TimeStamp = datestr(now, 'YYmmDD_HHMMSS');

%%
% Get input image
[imgFile,pathname] = uigetfile({'*.bmp;*.jpg;*.tif;*.png;*.gif'','...
    'All Image Files';'*.*','All Files'});                                 
InputImg = im2double(imread([pathname imgFile]));    
figure,imshow(InputImg);title('Input image'); axis image;                

[mRow, nCol] = size(InputImg);                                           
SpectralCoverage = 0.1;
SamplingPath = 'circular'; 
DCcomponent = 1;
Contrast = 1;
bta_spe = 0;
aha_spe = 1/2;

OrderMat =  getOrderMat(mRow, nCol, SamplingPath);                       
[nCoeft,tmp] = size(OrderMat);                                            
nCoeft = round(nCoeft * SpectralCoverage);                                                      

if bta_spe == 0 &&  aha_spe == 1/2
    [fxMat, fyMat] = meshgrid([0:1:nCol-1]/nCol, [0:1:mRow-1]/mRow);     
    fxMat1 = fftshift(fxMat);                                                 
    fyMat1 = fftshift(fyMat);   
        tic;                                                              
        for i = 1:nCoeft                                                      
            iRow = OrderMat(i,1);                                             
            jCol = OrderMat(i,2);                                             
            fx = fxMat1(iRow,jCol);                                            
            fy = fyMat1(iRow,jCol);      
            
            [ Pattern ] = getWpattern(mRow, nCol, fx, fy,DCcomponent,Contrast,bta_spe,aha_spe);
            Patter = zeros(1140,912);
            Patter(442:697,328:583) = Pattern;  %256x256
            %figure,imshow(Patter);   

            Pattern_Path_name = ['C:\Users\Administrator\Desktop\admin\822\Patter',num2str(i),'.bmp'];
            imwrite(Patter,Pattern_Path_name);  
        end   
        toc;
end


if bta_spe == 1/2 &&  aha_spe == 0
    [fxMat, fyMat] = meshgrid(((0:1:nCol-1)+1/2)/nCol, ((0:1:mRow-1)+1/2)/mRow); 
    fxMat2 = fftshift(fxMat);                                                 
    fyMat2 = fftshift(fyMat); 
    tic;                                                                       
        for i = 1:nCoeft                                                      
            iRow = OrderMat(i,1);                                             
            jCol = OrderMat(i,2);                                             
            fx = fxMat2(iRow,jCol);                                            
            fy = fyMat2(iRow,jCol);      

            [ Pattern ] = getWpattern(mRow, nCol, fx, fy,DCcomponent,Contrast,bta_spe,aha_spe);
            Patter = zeros(1140,912);
            Patter(442:697,328:583) = Pattern;  %256x256
            %figure,imshow(Patter);   

            Pattern_Path_name = ['C:\Users\Administrator\Desktop\admin\822\Patter',num2str(i),'.bmp'];
            imwrite(Patter,Pattern_Path_name);      
        end  
       
        toc;
end

if bta_spe == 0 &&  aha_spe == 0
    [fxMat, fyMat] = meshgrid([0:1:nCol-1]/nCol, [0:1:mRow-1]/mRow);     
    fxMat1 = fftshift(fxMat);                                                 
    fyMat1 = fftshift(fyMat);   
        tic;                                                                       
        for i = 1:nCoeft                                                      
            iRow = OrderMat(i,1);                                             
            jCol = OrderMat(i,2);                                             
            fx = fxMat1(iRow,jCol);                                            
            fy = fyMat1(iRow,jCol);      

            [ Pattern ] = getWpattern(mRow, nCol, fx, fy,DCcomponent,Contrast,bta_spe,aha_spe);
            Patter = zeros(1140,912);
            Patter(442:697,328:583) = Pattern;  %256x256
            %figure,imshow(Patter);   

            Pattern_Path_name = ['C:\Users\Administrator\Desktop\admin\822\Patter',num2str(i),'.bmp'];
            imwrite(Patter,Pattern_Path_name);       
        end   
       
        toc;
end


                                                                   
                                                               

