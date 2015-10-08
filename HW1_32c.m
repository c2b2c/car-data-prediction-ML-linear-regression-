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
Error=20:1000;

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
    for j=1:20
        Error(j,i)=YTest(j,:)-XTest(j,:)*Wls;
    end
end

% figure; hist(Error(:),50);
sum1=0;
sum2=0;

for j=1:1000
    for i=1:20
        sum1=sum1+Error(i,j);
    end
end
mean=sum1/20000

for j=1:1000
    for i=1:20
        sum1=sum1+(Error(i,j)-mean)^2;
    end
end
variance=sum1/20000

end