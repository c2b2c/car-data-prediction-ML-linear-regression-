originX=importdata('X.txt');
originY=importdata('Y.txt');
% X1=transpose(originX)
% X2=inv(originX)
% randint(372,1, [1 ,392])
% originY(1,:)
originX2=originX.*originX;
originX3=originX2.*originX;
originX4=originX3.*originX;
All(:,1)=originY;
All(:,2:8)=originX;
All(:,9:15)=originX2;
All(:,16:22)=originX3;
All(:,23:29)=originX4;
RMSE=1:1000;

for p=1:4

disp(['P = ',num2str(p),':'])
for i=1:1000
    nRows=size(All,1);
    randRows=randperm(nRows);
    AllTrain=All(randRows(1:372),:);
    AllTest=All(randRows(373:end),:);
    YTrain=AllTrain(:,1);
    XTrain=AllTrain(:,2:7*p+1);
    YTest=AllTest(:,1);
    XTest=AllTrain(:,2:7*p+1);
    Wls=pinv(transpose(XTrain)*XTrain)*transpose(XTrain)*YTrain;
    sum1=0;
    for j=1:20
        sum1=sum1+(YTest(j,:)-XTest(j,:)*Wls)^2;
    end
    RMSE(1,i)=sqrt(sum1/20);
end

sum2=0;
for k=1:1000
    sum2=sum2+RMSE(1,k);
end
RMSE_Mean=sum2/1000;

sum3=0;
for l=1:1000
    sum3=sum3+(RMSE(1,i)-RMSE_Mean)^2;
end
RMSE_StDeviation=sqrt(sum3/1000);

RMSE_Mean
RMSE_StDeviation
end
