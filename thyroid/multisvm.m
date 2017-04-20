function [val]=multisvm
%multisvm function to detect emotion 
testi=importdata('tet.txt');
test=testi(8,1:28);
abcd=importdata('abcd.txt');
efgh=importdata('efgh.txt');
k=importdata('k.txt');

label_abcd=importdata('label_abcd.txt');
label_efgh=importdata('label_efgh.txt');
label_k=importdata('label_k.txt');

train=[abcd;efgh];
label=[label_abcd;label_efgh];

svmstruct=svmtrain(train,label);
val=svmclassify(svmstruct,test);
val
%if strcmp(val,'1')
 %   train=[abcd;k];
   % label=[label_abcd;label_k];
%else
  %  train=[efgh;k];
  %  label=[label_efgh;label_k];
%end

%svmstruct=svmtrain(train,label);
%val=svmclassify(svmstruct,test);

end