function [gain_e,point]=Gain(data,H_e)
% data=double(data);
compa=[0 0];
for i=1:length(data)
    Dmor=[0 0];Dles=[0 0];
    gain=0;
    key=data(i,1);
    for j=1:length(data)
        if data(j,1)>=key
            Dmor=[Dmor;data(j,:)];
        else Dles=[Dles;data(j,:)];
        end
    end
    
    Dmor=Dmor([2:length(Dmor(:,1))],:);
    Dles=Dles([2:length(Dles(:,1))],:);
    if length(Dles(:,1))==0
        Dles=[0 0];
    end
    if length(Dmor(:,1))==0
        Dmor=[0 0];
    end
    %gain_Dmor
    k1=0;k2=0;k3=0;gain1=0;
    for j=1:length(Dmor(:,1))
        if Dmor(j,2)==1
            k1=k1+1;
        elseif Dmor(j,2)==2
            k2=k2+1;
        else k3=k3+1;
        end
    end
    k1=k1/length(Dmor(:,1)); k2=k2/length(Dmor(:,1)); k3=k3/length(Dmor(:,1));
    if k1==0
        k1=1;
    end
    if k2==0;
        k2=1;
    end
    if k3==0;
        k3=1;
    end
    
    gain1=-(k1*log2(k1)+k2*log2(k2)+k3*log2(k3));
    %gain_Dles
    k1=0;k2=0;k3=0;gain2=0;
    
    for j=1:length(Dles(:,1))
        if Dles(j,2)==1
            k1=k1+1;
        elseif Dles(j,2)==2
            k2=k2+1;
        else k3=k3+1;
        end
    end
    
    
     k1=k1/length(Dles(:,1)); k2=k2/length(Dles(:,1)); k3=k3/length(Dles(:,1));
    if k1==0
        k1=1;
    end
    if k2==0;
        k2=1;
    end
    if k3==0;
        k3=1;
    end
    gain2=-(k1*log2(k1)+k2*log2(k2)+k3*log2(k3));
    gain=H_e-(length(Dmor(:,1))*gain1+length(Dles(:,1))*gain2)/length(data);
    compa=[compa;[gain key]];
end
[gain_e,index]=max(compa(:,1));
point=compa(index,2);