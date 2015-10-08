originX=importdata('X.txt');
originY=importdata('Y.txt');
% X1=transpose(originX)
% X2=inv(originX)
% randint(372,1, [1 ,392])
% originY(1,:)
All(:,1)=originY;
All(:,2:8)=originX;
MAE=1:1000;

for i=1:1000
    nRows=size(All,1);
    randRows=randperm(nRows);%# generate random ordering of row indices
    AllTrain=All(randRows(1:372),:);
    AllTest=All(randRows(373:end),:);
    YTrain=AllTrain(:,1);
    XTrain=AllTrain(:,2:8);
    YTest=AllTest(:,1);
    XTest=AllTrain(:,2:8);
    Wls=inv(transpose(XTrain)*XTrain)*transpose(XTrain)*YTrain;
    sum1=0;
    for j=1:20
        sum1=sum1+abs(YTest(j,:)-XTest(j,:)*Wls);
    end
    MAE(1,i)=sum1/20;
end

sum2=0;
for k=1:1000
    sum2=sum2+MAE(1,k);
end
MAE_Mean=sum2/1000;

sum3=0;
for l=1:1000
    sum3=sum3+(MAE(1,i)-MAE_Mean)^2;
end
MAE_StDeviation=sqrt(sum3/1000);

MAE_Mean
MAE_StDeviation

