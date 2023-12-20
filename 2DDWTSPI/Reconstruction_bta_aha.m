function [Reconstruction_Mat] = Reconstruction_bta_aha(specturm,DCcomponent,Contrast,bta_rec,aha_rec)
%BTA0_AHA0 此处显示有关此函数的摘要
%   此处显示详细说明
[mRow, nCol] = size(specturm);
Inten_ReconstructionMat = zeros(mRow, nCol); 

if bta_rec == 1/2 && aha_rec == 0
    [fxMat2, fyMat2] = meshgrid(((0:1:nCol-1)+1/2)/nCol, ((0:1:mRow-1)+1/2)/mRow);  %bta = 1/2
    tic;
    for i = 1:mRow 
        for j = 1:nCol
            fx = fxMat2(i,j);
            fy = fyMat2(i,j);
             [ Pattern ] = getWpattern(mRow, nCol, fx, fy,DCcomponent,Contrast,bta_rec,aha_rec);
             Inten_ReconstructionMat(i,j) = sum(sum(specturm .* Pattern));
        end
    end
    Reconstruction_Mat = ((Inten_ReconstructionMat)/(mRow*nCol)) * sqrt(2);
    toc;
end

if bta_rec == 0 && aha_rec == 1/2
   [fxMat, fyMat] = meshgrid([0:1:nCol-1]/nCol, [0:1:mRow-1]/mRow);
    tic;
    for i = 1:mRow 
        for j = 1:nCol
            fx = fxMat(i,j);
            fy = fyMat(i,j);
             [ Pattern ] = getWpattern(mRow, nCol, fx, fy,DCcomponent,Contrast,bta_rec,aha_rec);
             Inten_ReconstructionMat(i,j) = sum(sum(specturm .* Pattern));
        end
    end
    Reconstruction_Mat = ((Inten_ReconstructionMat)/(mRow*nCol)) * sqrt(2);
    toc;
end

if bta_rec == 0 && aha_rec == 0
   [fxMat, fyMat] = meshgrid([0:1:nCol-1]/nCol, [0:1:mRow-1]/mRow);
    tic;
    for i = 1:mRow 
        for j = 1:nCol
            fx = fxMat(i,j);
            fy = fyMat(i,j);
             [ Pattern ] = getWpattern(mRow, nCol, fx, fy,DCcomponent,Contrast,bta_rec,aha_rec);
             Inten_ReconstructionMat(i,j) = sum(sum(specturm .* Pattern));
        end
    end
    Reconstruction_Mat = ((Inten_ReconstructionMat)/(mRow*nCol)) * sqrt(2);
    toc;
end

end

           


