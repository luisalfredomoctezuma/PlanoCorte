function Mat=dualSimplex(Mat)
[r c]=size(Mat);
%Sale pos
[valor pos]=min(Mat(:,end));


SiIterar=0;
% Entra
jj=1; entra=zeros(1,c);
for i=1:c-1
    if Mat(pos,i)<0
        entra(i)=Mat(1,i)/Mat(pos,i);
        maximoVal(jj)=entra(i);
        jj=jj+1;
        SiIterar=1;
    end
end
if SiIterar==1
    for i=1:c-1
        if entra(i)==max(maximoVal);indice=i;end
    end

    Mat(pos,:)=Mat(pos,:)./Mat(pos,indice);

    for i=1:r
        if i~=pos
            if Mat(i,indice)<=0
                Mat(i,:)=Mat(i,:)+abs(Mat(i,indice)).*Mat(pos,:);
            elseif Mat(i,indice)>0
                Mat(i,:)=Mat(i,:)-abs(Mat(i,indice)).*Mat(pos,:);
            end
        end
    end
end
end

