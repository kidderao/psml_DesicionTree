function [data,entro_data,N]=gp(data,entro_data,N,H_e,num,k1)
%     N=3;H_e=1.5850;
%     load entro_data.mat;
%   
    N=N-1;
    gain_point1=[0 0];
    for i=1:N
    [gain,point]=Gain(entro_data(:,[i+1,end-1]),H_e);
    gain_point1=[gain_point1;gain,point];
    end
    gain_point1=gain_point1([2:length(gain_point1)],:);
    [value,index_v]=max(gain_point1(:,1));
    nodel=gain_point1(index_v,2);
    
    for i=1:length(entro_data)
    if entro_data(i,index_v+1)>=nodel 
        entro_data(i,end)=2+num;
%     else entro_data(i,end)=1+num;
    end
    end
%     data([1:k1-1],end)=entro_data(:,end);
%     entro_data=data([1:k1-1],[[1:index_v],[index_v+2:end]]);
% %     entro_data;
    