%% simulating single-pixel imaging 

clear all;
close all;
clc
TimeStamp = datestr(now, 'YYmmDD_HHMMSS');          

%% Parameters
DCcomponent = 1;                                                            % DCcomponent         
Contrast = 1;                                                              % Contrast amplitude of sin. pattern
SpectralCoverage =0.05;                                                      % e.g. sampling ratio
SamplingPath = 'circular';                                                 % spiral, diamond, circular
% Get input image
[imgFile,pathname] = uigetfile({'*.bmp;*.jpg;*.tif;*.png;*.gif'','...
    'All Image Files';'*.*','All Files'});                                 
InputImg = im2double(imread([pathname imgFile]));    
figure,imshow(InputImg);title('Input image'); axis image;                

%BTA0_AHA0 此处显示有关此函数的摘要
%   此处显示详细说明
[mRow, nCol] = size(InputImg);

bta_spe = 0;
aha_spe = 1/2;
[bta_rec,aha_rec]= Switch_bta_aha(bta_spe,aha_spe);

specturm = Specturm_bta_aha(InputImg,SamplingPath,SpectralCoverage,DCcomponent,Contrast,bta_spe,aha_spe);
Reconstruction_Mat = Reconstruction_bta_aha(specturm,DCcomponent,Contrast,bta_rec,aha_rec);
figure, specshow(specturm);title('spec origin')
figure, specshow(fftshift(specturm));title('spec center')
figure,imshow((Reconstruction_Mat));title('ReconstructionMat')
% imwrite(Reconstruction_Mat,'baboon_W_5%.bmp');

PSNR = psnr(Reconstruction_Mat, InputImg);      %峰值信噪比                                            
SSIM = ssim(Reconstruction_Mat, InputImg);      %结构相似性  衡量两幅图像相似度的新指标
RMSE = rmse(InputImg, Reconstruction_Mat);      %均方差根   预测值与真实值偏差的平方与观测次数n比值的平方根         
fprintf('PNSR = %f\nSSIM = %f\nRMSE = %f\nSampling = %f\n', PSNR, SSIM, RMSE,SpectralCoverage);



