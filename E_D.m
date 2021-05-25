%数据可视化，准备绘树状图

filename = 'iris.csv';
iris=importdata(filename);
Len=length(iris);
Wid=length(str2num(iris{1}));
data=strings(Len,Wid);
for i=1:Len
data(i,:)=str2num(iris{i});
end
data=double(data([2:end],:));
data([1:50],6)=1;
data([51:100],6)=2;
data([101:150],6)=3;
E=0;
for i=1:3
    n=length(find(data(:,end)==i));
    p=n/length(data);
    E=E-p*log2(p);
end
E;

