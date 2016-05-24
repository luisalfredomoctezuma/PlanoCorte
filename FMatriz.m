function Mat=FMatriz(Mat)
%dSimplex=0;
[r c]=size(Mat);

for i=c
    for j=2:r
        if Mat(j,i)-fix(Mat(j,i))~=0
            disp('************************** Fracciones **************************')
            PEntera=fix(Mat(j,:))
            PFraccion=-1*(Mat(j,:)-fix(Mat(j,:)))
            Mat(j,:)=PEntera;    Mat(r+1,:)=PFraccion;            
            
            
            Mat(:,c+1)=Mat(:,i); % pasar costos a nueva matriz
            Mat(:,c)=0;  Mat(r+1,c)=1;
            Mat
            
             if PFraccion(:,end)<0
                disp('*******Dual Simplex*******')
                Mat=dualSimplex(Mat)
             else
                 break;
             end
             if (Mat(j+1,end)-fix(Mat(j+1,end))~=0)
             disp('Volver a iterar')
             Mat=FMatriz(Mat);
             else
                 break;
             end
        end
    end
end


end

