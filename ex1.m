
clear all
filename = 'iris.csv';
iris=importdata(filename);
Len=length(iris);
Wid=length(str2num(iris{1}));
data=strings(Len,Wid);
for i=1:Len
data(i,:)=str2num(iris{i});
end
setosa=data([2:51],:);
versicolor=data([52:101],:);
virginca=data([102:151],:);
data([2:51],6)=1;
data([52:101],6)=2;
data([102:151],6)=3;
% save data.mat data;

H_e=-3*(log2(1/3)/3);
data_train=[double(data([2:length(data)],:)),zeros(length(data)-1,1)];
data1=data_train;
k=1;num=0;
[entro,data_train,index,k1]=entropy(data_train,H_e,num,k);
data1([k:k1-1],end)=data_train([k:k1-1],end)
data_train=data_train([k1:end],[[1:index],[index+2:end]]);
num=num+1;
[entro1,data_train,index1,k2]=entropy(data_train,H_e,num,k1);
data1([k1:end],end)=data_train(:,end)


%ÕıÈ·ÂÊ
n1=length(find(data1(:,end-1)==data1(:,end)));
accuracy=n1/(length(data)-1);

for i=2:5
figure(i);
plot(double(setosa(:,i)),'r.');hold on
plot(double(versicolor(:,i)),'g.');hold on
plot(double(virginca(:,i)),'b.')
title(data(1,i));
set(findobj(gcf,'type','line'),'Markersize',8);
end
set(findobj(gcf,'type','line'),'Markersize',8);

