 function [ Pattern ] = getWpattern(mRow, nCol, fx, fy,DCcomponent,Contrast,bta,aha)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
          %linspace(a,b,n)：a表示第1个元素，b表示最后1个元素，n表示元素总数。当n省略时，自动产生100个元素。
    if bta == 0 && aha == 0
        [X,Y]=meshgrid(linspace(0,nCol-1,nCol), linspace(0,mRow-1,mRow));
        Pattern = DCcomponent+Contrast*sin(2*pi*(fx*X+fy*Y)+pi/4);
    end
    if bta == 0 && aha == 1/2
        [X,Y]=meshgrid(linspace(0,nCol-1,nCol), linspace(0,mRow-1,mRow));
        Pattern = DCcomponent+Contrast*sin(2*pi*fx*(X+1/2)+2*pi*fy*(Y+1/2)+pi/4);
    end
    if bta == 1/2 && aha == 0
        [X,Y]=meshgrid(linspace(0,nCol-1,nCol), linspace(0,mRow-1,mRow));  
        Pattern = DCcomponent+Contrast*sin(2*pi*fx*X+2*pi*fy*Y+pi/4);
    end

 end
 
 
%欧拉公式 e.ix = cosx + isinx
%1为直流分量  amp表示对比度
%这里公式里面的/2表示 点的亮度表示波的幅度，也就是波振动的剧烈程度。
%一个强度为1/2的波，它对比度就小一些，点的亮度也低一些。
%这里取real的意思实际中可能由于浮点误差造成有微小的虚部，
%应当忽略。反正虚部很微小，取实部和取模结果都差不多，何不用计算量更小的取实部呢？
    


