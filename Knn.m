function [ val ] = Knn
testi=importdata('tet.txt');
test=testi(8,1:28);
abcd=importdata('abcd.txt');
efgh=importdata('efgh.txt');
k=importdata('k.txt');

[m n]=size(abcd);
mean=zeros(1,28);
for i= 1:m
    for j=1:n
        mean(j)= mean(j)+abcd(i,j);
    end
end
for i=1:n
    mean(i)=mean(i)/m;
end
dist=0;
for i=1:n
    dist=dist+((mean(i)-test(i))*(mean(i)-test(i)));
end
dist=sqrt(dist);
min_dist=dist;
val='abcd';

[m n]=size(efgh);
mean=zeros(1,28);
for i= 1:m
    for j=1:n
        mean(j)=mean(j)+efgh(i,j);
    end
end
for i=1:n
    mean(i)=mean(i)/m;
end
dist=0;
for i=1:n
    dist=dist+((mean(i)-test(i))*(mean(i)-test(i)));
end
dist=sqrt(dist);
if dist < min_dist
    min_dist=dist;
    val='efgh';
end

[m n]=size(k);
mean=zeros(1,28);
for i= 1:m
    for j=1:n
        mean(j)=mean(j)+k(i,j);
    end
end
for i=1:n
    mean(i)=mean(i)/m;
end
dist=0;
for i=1:n
    dist=dist+((mean(i)-test(i))*(mean(i)-test(i)));
end
dist=sqrt(dist);
if dist < min_dist
    min_dist=dist;
    val='k';
end

end

