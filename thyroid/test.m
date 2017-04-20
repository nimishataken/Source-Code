tmp=importdata('out.txt');
tmp;
training=tmp(:,1:28);
group=tmp(: , 29);
testi=[15 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0.839667 0 4.70616 1 188 1 0.73 1 258 0 24 1
57 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0.25 1 4.2 1 236 1 0.7 1 337 0 24 1

58 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0.3 1 4.1 1 202 1 0.8 1 253 0 24 1

62 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0.3 1 6.6 1 169 1 0.86 1 197 0 24 1

34 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.3 1 4.7 1 242 1 1.02 1 237 0 24 1

53 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 15.3 1 1.5 1 44 1 0.98 1 45 0 25 2

24 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 430 1 0.4 1 6 1 1.04 1 6 0 25 2

65 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 213 1 0.9 1 43 1 0.95 1 45 0 25 2

24 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 37 0 1.45268 1 47 1 0.95 1 49 0 25 2

43 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 216 0 1.45268 1 4 1 1.28 1 3 0 25 2

52 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.5 1 0.7 1 90 1 1.07 1 84 0 25 3

76 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.1 1 0.4 1 88 1 0.86 1 102 0 25 3

77 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 3.3 1 0.9 1 108 1 0.91 1 119 0 25 3
];
expect=testi(:,29);
for i=1 :13 
     tes=testi(i,1:28);
  predict_class_knn(i) = knnclassify(tes,training,group,1);
  [y,predict_class_fknn] = f_knn(training,group,tes,1);
 ansfknn(i)=predict_class_fknn;
end;
predict_class_knn
ansfknn
expect=expect'
expect
count_error_fknn =0;
count_error_knn =0;
for i=1:13
    if expect(i)~=predict_class_knn(i) 
        count_error_knn=count_error_knn+1;
    end;
    if expect(i)~=predict_class_knn(i) 
        count_error_fknn=count_error_fknn+1;
    end;
end;
    
size(group);
   for i=1:size(group)
       if group(i)== 2
           group(i)=1 
       end;
           
   end;
 %  group
   
for i=1 :13       
    tes=testi(i,1:28);
SVMStruct = svmtrain(training,group);
   predict_class_svm(i)= svmclassify(SVMStruct,tes);
end;

predict_class_svm

