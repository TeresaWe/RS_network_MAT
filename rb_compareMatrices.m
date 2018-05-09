function [outP outFDR p_fdr outD] = rb_compareMatrices(matrix1, matrix2, nperm)

%preallocate an output matrix
outP = nan(size(matrix1,2),size(matrix1,2));
outD = nan(size(matrix1,2),size(matrix1,2));

for i = 1:size(matrix1,1)
    for j = 1:size(matrix1,2)
       x = squeeze(matrix1(i,j,:));
       y = squeeze(matrix2(i,j,:));
       outP(i,j) = permutation_2tailed(x,y,nperm);
       outD(i,j) = cohens_d(x,y,1,0);
    end
end

temp = triu(outP,1);
temp = temp(:);
[p_fdr, p_masked] = fdr(temp, 0.05);
mask = outP(outP>p_fdr);

outFDR = outP;
outFDR(outFDR>p_fdr) = NaN;
outFDR(outFDR<=p_fdr) = 1;
outFDR(isnan(outFDR)) = 0;
outFDR = logical(outFDR);

end