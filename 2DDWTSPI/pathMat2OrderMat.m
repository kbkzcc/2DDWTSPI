function OrderMat = pathMat2OrderMat(PathMat)
[mRow,nCol] = size(PathMat);

PathMatMasked = PathMat;
PathMatMaskedArr = reshape(PathMatMasked, [length(PathMatMasked(:)) 1]);
%数组 65536行 1列

[Val, Ind] = sort(PathMatMaskedArr,  'ascend');
%ind是返回的是PathMatMaskedArr位子当中的索引
%val和ind是一一对应的关系  val中第1行也就对应ind中1行 
%ind的第1行这个索引 对应于PathMatMaskedArr当中值的位子

nPoint = length(Ind);  
OrderMat = zeros(nPoint, 2);

for iPoint = 1:nPoint
    if mod(Ind(iPoint), mRow) == 0
        OrderMat(iPoint,2) = Ind(iPoint) / mRow;
        OrderMat(iPoint,1) = mRow;
    else    
            OrderMat(iPoint,2) = floor(Ind(iPoint) / mRow) + 1;  %floor函数：朝负无穷大方向取整    
            OrderMat(iPoint,1) = mod(Ind(iPoint), mRow); %mod取模（取余）运算       
                                                         %将索引值转化为PathMatMasked坐标值存放起来
    end                                                  %将PathMatMasked里面的值从小到大的坐标记录到OrderMat中
                                                       
                                                        
                                                         
end

end
