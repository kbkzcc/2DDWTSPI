function OrderMat = getOrderMat(mRow, nCol, PathStr)
switch PathStr
case 'spiral'
	[PathMat] = getSpiralMat(mRow, nCol);
case 'circular'
	[PathMat] = getCircularMat(mRow, nCol);
otherwise
	error('Unsupported sampling path %s\n', PathStr);
end

OrderMat = pathMat2OrderMat(PathMat);

