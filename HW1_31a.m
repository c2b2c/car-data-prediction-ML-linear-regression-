originX=importdata('X.txt');
originY=importdata('Y.txt');
% X1=transpose(originX)
% X2=inv(originX)
% randint(372,1, [1 ,392])
% originY(1,:)
All(:,1)=originY;
All(:,2:8)=originX;

nRows=size(All,1);
randRows=randperm(nRows);%# generate random ordering of row indices
AllTrain=All(randRows(1:372),:);
AllTest=All(randRows(373:end),:);
YTrain=AllTrain(:,1);
XTrain=AllTrain(:,2:8);
YTest=AllTest(:,1);
XTest=AllTrain(:,2:8);

Wls=inv(transpose(XTrain)*XTrain)*transpose(XTrain)*YTrain