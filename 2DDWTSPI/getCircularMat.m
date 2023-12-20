
function [ CircularMat ] = getCircularMat( mRow, nCol)
xArr = [1:nCol];
yArr = [1:mRow];
CenterX = round(nCol/2) + 1;
CenterY = round(mRow/2) + 1;

[xGrid, yGrid] = meshgrid(xArr, yArr);

xGrid = xGrid - CenterX;
yGrid = yGrid - CenterY;

[thetaGrid, rhoGrid] = cart2pol(xGrid, yGrid);                             %[THETA,RHO,Z] = cart2pol(X,Y,Z)  
                                                                           %THETA是沿逆时针方向与X轴正方向的夹角，
                                                                           %RHO是点(X,Y,Z)在OXY平面上的投影与原点的距离，
                                                                           %Z是(X,Y,Z)坐标距OXY平面的高度。

WeightGrid = 10000 * rhoGrid + thetaGrid;
[Val, Ind] = sort(WeightGrid(:));

CircularMat = zeros(mRow,nCol);
for index = 1:mRow*nCol
   CircularMat(Ind(index)) = index;    
end





