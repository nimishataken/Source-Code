% Parkinson's data set has 195 instances and 23 attributes including one
% attribute for the class it belongs to.

function [knn ,svm ,fknn,expect]=park_new(sample)

m = zeros(195,22); % 195 by 22 matrix for 22 attributes
g = zeros(195,1);  % 195 by 1 matrix for class lebels

fid1 = fopen('park_train.txt'); % open training data file
%fid2 = fopen('park_test_new.txt'); % open test data file
%reading training gdata file in matrices m and g
s = fscanf(fid1,'%s',1);
for i = 1:195
    
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
    for j = 17:22
        a = fscanf(fid1,'%f',1);
        b = fscanf(fid1,'%c',1);
        m(i,j) = a;
    end
end
fclose(fid1);
%reading training data done

%sample = [119.99200,157.30200,74.99700,0.00784,0.00007,0.00370,0.00554,0.01109,0.04374,0.42600,0.02182,0.03130,0.02971,0.06545,0.02211,21.03300,1,0.414783,0.815285,-4.813031,0.266482,2.301442,0.284654];
training = zeros(194,22);
group = zeros(194,1);
test = zeros(1,22);
for j = 1:16
     test(1,j) = sample(1,j);
end
for j = 17:22
     test(1,j) = sample(1,j+1);
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
    
    disp sample ;disp (i);disp 'expected :' ;disp(sample(1,17));
    expect=sample(1,17);
    
    %SVM
    SVMStruct = svmtrain(training,group);
    predict_class_svm= svmclassify(SVMStruct,test);
    disp 'SVM';disp(predict_class_svm(1,1,1));
    svm=predict_class_svm;
    
    %KNN
    predict_class_knn = knnclassify(test,training,group,1);
    disp 'KNN';disp(predict_class_knn(1,1));
    knn=predict_class_knn;
    
    %FKNN
    [y,predict_class_fknn] = f_knn(training,group,test,1);
    disp 'FKNN';disp(predict_class_fknn(1,1,1));
    fknn=predict_class_fknn;