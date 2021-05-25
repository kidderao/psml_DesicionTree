function [entro,data,index_v,k1]=entropy(data_train,H_e,num,k)
%二分法 分支
N=length(data_train(1,:))-3;
gain_point=[0 0];
for i=1:N
    [gain,point]=Gain(data_train(:,[i+1,end-1]),H_e)
    gain_point=[gain_point;gain,point];
end
gain_point=gain_point([2:length(gain_point)],:);
[value,index_v]=max(gain_point(:,1));
nodel=gain_point(index_v,2)

%选择属性
for i=k:length(data_train)
    if data_train(i,index_v+1)>=nodel
        data_train(i,end)=2+num;
    else data_train(i,end)=1+num;
    end
end
kk=k-1
for i=1:length(data_train)
    if data_train(i,end)==1+num
        k=k+1;
    end
end
k1=k-kk
[~,idx]=sort(data_train(:,end));
data=data_train(idx,:);

entro_data=data([1:k1-1],:);
n=length(find(entro_data(:,end-1)==1+num));
n1=n/length(entro_data);n2=1-n1;
 if n1==0
        n1=1;
    end
 if n2==0;
        n2=1;
    end
entro=-(n1*log2(n1)+n2*log2(n2));

%进一步修改
if entro~=0
    [data,entro_data,N]=gp(data,entro_data,N,H_e,num,k1);
    n=length(find(entro_data(:,end-1)==entro_data(:,end)));
    n1=n/length(entro_data);n2=1-n1;
 if n1==0
        n1=1;
    end
    if n2==0;
        n2=1;
    end
    entro=-(n1*log2(n1)+n2*log2(n2));
end
[~,idx]=sort(data(:,1));
data=data(idx,:);






