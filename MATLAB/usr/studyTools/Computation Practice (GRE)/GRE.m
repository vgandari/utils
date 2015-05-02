clear all
mTable = makeMtable(20, 20);
[multSumEx, prodKey, sumKey] = makeMultSumEx(20, 20, 100);
repTable = makeRootExpTable(14, 10, 6000);
[expEx powKey] = makePowEx(14, 10, 6000, 100);
% [factorEx, factorKey, pFactorKey] = makeFactorTable(1, 20);
[factorEx, factorKey] = makeFactorTable(1, 20);
[rootApprox] = makeRootApproxTable(20^2)
save GRE.mat

xlswrite('MultExS1.xls', mTable, 'Multiplication Table', 'A1');
xlswrite('MultExS2.xls', multSumEx, 'Exercise', 'A1');
xlswrite('MultExS3.xls', prodKey, 'Product Key', 'A1');
xlswrite('MultExS4.xls', sumKey, 'Sum Key', 'A1');

xlswrite('ExpPowExS1.xls', repTable, 'Root Exponent Power Table', 'A1');
xlswrite('ExpPowExS2.xls', expEx, 'Exercise', 'A1');
xlswrite('ExpPowExS3.xls', powKey, 'Power Key', 'A1');

xlswrite('FactorExS1.xls', factorEx, 'Products', 'A1');
xlswrite('FactorExS2.xls', factorKey, 'Factors', 'A1');

xlswrite('RootApprox.xls', rootApprox, 'Root Approximations', 'A1');


