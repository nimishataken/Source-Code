% Parkinson's data set has 195 instances and 23 attributes including one
% attribute for the class it belongs to.
m = zeros(1000,28); % 195 by 22 matrix for 22 attributes
g = zeros(1000,1);  % 195 by 1 matrix for class lebels

fid1 = fopen('out.txt'); % open training data file
fid2 = fopen('test.txt'); % open test data file
%reading training gdata file in matrices m and g
s = fscanf(fid1,'%s',1);
for i = 1:1000
    
    s = fscanf(fid1,'%c',1);
    while(s ~= ',')
        s = fscanf(fid1,'%c',1);
    end
    for j = 1:16
        a = fscanf(fid1,'%f',1);
        b = fscanf(fid1,'%c',1);
        m(i,j) = a;
    end
        a = fscanf(fid1,'%d',1);
        b = fscanf(fid1,'%c',1);
        g(i,1) = a;
    for j = 17:28
        a = fscanf(fid1,'%f',1);
        b = fscanf(fid1,'%c',1);
        m(i,j) = a;
    end
end
fclose(fid1);
%reading training data done
%reading test gdata file in matrices m and g
sample = zeros(40,22); % sample 
samplegrp = zeros(40,1); % known class of samples
for i = 1:40
    s = fscanf(fid2,'%c',1);
    while(s ~= ',')
        s = fscanf(fid2,'%c',1);
    end
    for j = 1:16
        a = fscanf(fid2,'%f',1);
        b = fscanf(fid2,'%c',1);
        sample(i,j) = a;
    end
        a = fscanf(fid2,'%d',1);
        b = fscanf(fid2,'%c',1);
        samplegrp(i,1) = a;
    for j = 17:22
        a = fscanf(fid2,'%f',1);
        b = fscanf(fid2,'%c',1);
        sample(i,j) = a;
    end
end
fclose(fid2);
% reading test data file done in sample and samplegrp matrices
% now start algorithms
%count for keeping track of wrong predictions
count_svm = 0;
count_knn = 0;
count_fknn = 0;
for i = 1:40
    training = zeros(194,22);
    group = zeros(194,1);
    test = zeros(1,22);
    for j = 1:22
        test(1,j) = sample(i,j);
    end
    I = 1;
    for k = 1:195
        for l = 1:22
            if( m(k,l) ~= test(1,l))
                for n = 1:22
                    training(I,n) = m(k,n);
                end
                group(I,1) = g(k,1);
                I = I + 1;
                break
            end
        end
    end
    for k = I:194
        for n = 1:22
            training(k,n) = training(k-1,n);
        end
        group(k,1) = group(k-1,1);
    end
    
    disp sample ;disp (i);disp 'expected :' ;disp(samplegrp(i,1));
    
    %SVM
    SVMStruct = svmtrain(training,group);
    predict_class_svm= svmclassify(SVMStruct,test);
    if(samplegrp(i,1) ~= predict_class_svm(1,1,1)) 
        count_svm = count_svm + 1;
    end
    p_svm(i)=predict_class_svm;
    p_sam(i)=samplegrp(i,1);
    disp 'SVM';disp(predict_class_svm(1,1,1));
    
    %KNN
    predict_class_knn = knnclassify(test,training,group,1);
    if(samplegrp(i,1) ~= predict_class_knn(1,1)) 
    count_knn = count_knn + 1;
    end
    p_knn(i)=predict_class_knn;
     
    disp 'KNN';disp(predict_class_knn(1,1));
    
    %FKNN
    [y,predict_class_fknn] = f_knn(training,group,test,1);
    if(samplegrp(i,1) ~= predict_class_fknn(1,1,1)) 
    count_fknn = count_fknn + 1;
    end
    p_fknn(i)=predict_class_fknn;
    disp 'FKNN';disp(predict_class_fknn(1,1,1));
end

disp('array of knn');
for i=1:40
    disp(p_knn(i));
end;

disp('array of svm');
for i=1:40
    disp(p_svm(i));
end;

disp('array of fknn');
for i=1:40
    disp(p_fknn(i));
end;

figure
xt = 1:1:40;
plot(xt, [p_svm(:) p_fknn(:)  p_knn(:) p_sam(:)])
set(gca, 'XLim',[1 40], 'YLim',[-1 5]);

xlabel('Patient No');
ylabel('YES(1) OR NO(0)');
soilDept = {'SVM', 'KNN', 'FKNN','SAMPLE'};
legend(soilDept, 'Location', 'Northwest');


figure

Y=[p_svm', p_fknn' , p_knn' ,p_sam'];

%disp(Y);

h=bar(Y);

xlabel('Patients');

ylabel('Yes or No'); 

%colormap cool;

set(gca, 'XLim',[1 20], 'YLim',[0 1.5]);
set(h(2),'facecolor','red'); % use color name
set(h(1),'facecolor','cyan'); % or use RGB triple
set(h(4),'facecolor','b'); % 
set(h(3),'facecolor','green');
soilDepth = {'SVM', 'KNN', 'FKNN','SAMPLE'};
legend(soilDepth, 'Location', 'Northwest');


disp 'No. of Wrong predictions out of 50 :';
disp 'SVM' ;disp (count_svm);
disp 'KNN' ;disp (count_knn);
disp 'FKNN' ;disp (count_fknn);

figure
z=[count_svm count_knn count_fknn];
h1=bar(z);
 methods={'SVM','KNN','FKNN'};
    set(gca, 'XTickLabel', methods);
    set(gca,  'YLim',[0 25]);
   % set(hb,'facecolor','cyan');
xlabel('Methods');
ylabel('No. of Wrong predictions out of 50 :');

