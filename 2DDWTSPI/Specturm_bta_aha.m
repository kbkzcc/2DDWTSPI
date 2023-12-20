function [specturm] = Specturm_bta_aha(InputImg,SamplingPath,SpectralCoverage,DCcomponent,Contrast,bta_spe,aha_spe)
%BTA0_AHA0 此处显示有关此函数的摘要
%   此处显示详细说明
[mRow, nCol] = size(InputImg);

OrderMat =  getOrderMat(mRow, nCol, SamplingPath);                       
[nCoeft,tmp] = size(OrderMat);                                            
nCoeft = round(nCoeft * SpectralCoverage);                             
IntensityMat = zeros(mRow, nCol);    
snr = -15;



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
            ValueAddNoise = sum(sum(InputImg .* Pattern)); 
           % ValueAddNoise = awgn(ValueAddNoise,snr);
            IntensityMat(iRow, jCol) = ValueAddNoise;        
        end   
        
        Zhen_geshu = sum(sum(IntensityMat~=0));
        Zh_IntensityMat = IntensityMat;
        Zh_IntensityMat(Zh_IntensityMat~=0) = 1;
        AverageMat = (sum(sum(IntensityMat)))/(Zhen_geshu);
        Mat_Average = Zh_IntensityMat .* AverageMat;

        specturm_c = (IntensityMat - Mat_Average) * sqrt(2);
        specturm = ifftshift(specturm_c);
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
            IntensityMat(iRow, jCol) = sum(sum(InputImg .* Pattern));        
        end  
        
        Zhen_geshu = sum(sum(IntensityMat~=0));
        Zh_IntensityMat = IntensityMat;
        Zh_IntensityMat(Zh_IntensityMat~=0) = 1;
        AverageMat = (sum(sum(IntensityMat)))/(Zhen_geshu);
        Mat_Average = Zh_IntensityMat .* AverageMat;

        specturm_c = (IntensityMat - Mat_Average) * sqrt(2);
        specturm = ifftshift(specturm_c);
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
            IntensityMat(iRow, jCol) = sum(sum(InputImg .* Pattern));        
        end   
        
        Zhen_geshu = sum(sum(IntensityMat~=0));
        Zh_IntensityMat = IntensityMat;
        Zh_IntensityMat(Zh_IntensityMat~=0) = 1;
        AverageMat = (sum(sum(IntensityMat)))/(Zhen_geshu);
        Mat_Average = Zh_IntensityMat .* AverageMat;

        specturm_c = (IntensityMat - Mat_Average) * sqrt(2);
        specturm = ifftshift(specturm_c);
        toc;
end



