function[knn, svm, fknn ,expect]=thyroid(testi)

tmp=importdata('out.txt');
training=tmp(:,1:28);
group=tmp(: , 29);
expect=testi(:,29); 
     tes=testi(1,1:28);
  predict_class_knn = knnclassify(tes,training,group,1);
 
  [y,predict_class_fknn] = f_knn(training,group,tes,1);
 fknn =predict_class_fknn;
 
 

knn=predict_class_knn;

group2=importdata('grp.txt');
SVMStruct = svmtrain(training,group2);
   svm= svmclassify(SVMStruct,tes);


