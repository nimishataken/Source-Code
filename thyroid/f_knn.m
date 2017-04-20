function [y,predict_class] = f_knn(tr,tr_memberships,te,k)
%
% FUZZY KNN classification
%
%	[y,predict_class] = f_knn(tr,tr_memberships,te,k)
%
%		tr: a NxD-matrix where N is the number of training samples
%			and D is the dimension of the feature space. Each row is 
%			the representation of a training sample.
%		tr_memberships: a NxC-matrix where N is the number of training
%			samples and C is the number of classes. Each row is the
%			membership vector of the corresponding sample in the vector 
%			representation in the training set, tr. The summation of 
%			each row has to be 1. If the memberships are not fuzzy
%			one entry in each row is one and others are zero.
%		te: a MxD-matrix representing the testing set. Each row is
%			a testing sample. M is the number of testing samples and 
%			D is the dimension of the feature space.
%		k: the k parameter of the k-Nearest Neighbor classifier. It 
%			is a 1D vector where each value is a k-value to make 
%			prediction with.
%
%		y: 3D matrix containing the output memberships. It is a 
%			(MxCxk_n)-matrix where y(i,j,m) represents the membership 
%			of i-th testing sample to j-th class with k(m) as the 
%			parameter k. k_n is the length of k.
%		predicted_class: (Mx1xk_n)-matrix where (i,1,j)-entry shows 
%			the most likely class number that is extracted by y matrix.
%
%	Example:
%
%		tr = rand(100,2);
%		tr_memberships = zeros(100,2);
%		tr_memberships(:,1) = rand(100,1);
%		tr_memberships(:,2) = 1-tr_memberships(:,1);
%		te = rand(20,2);
%		k=[1,3,5];
%		[y,predict_class] = f_knn(tr,tr_memberships,te,k);
%
%   References:
%		J. M. Keller, M. R. Gray, and J. A. Givens, Jr., "A Fuzzy K-Nearest Neighbor Algorithm",
%		IEEE Transactions on Systems, Man, and Cybernetics, Vol. 15, No. 4, pp. 580-585.  
%
% Note: The m parameter (scaling factor) in the fuzzy kNN classifier is taken to be 2.
%
% Cuneyt Mertayak
% e-mail: cuneyt.mertayak@gmail.com
% date: 04/09/2008
%

% scaling factor
m = 2;

[tr_n,class_n] = size(tr_memberships);
te_n = size(te,1);
k_n = length(k);
max_k = max(k);

y = zeros(te_n,class_n,k_n);
predicted_class = zeros(te_n,1,k_n);

% For each testing sample tr(i,:)
for i=1:te_n
	te_sample = te(i,:);

	% Calculate the distance of the testing sample to each sample in the training set
	% and store them in D
	D = sum((tr - repmat(te_sample,[tr_n,1])).^2,2);
	[T,I] = sort(D);

	% The case of a sample to be exactly at the same position of a training set
	if(D(I(1))==0)	
		%warning('Dist 0\n');
		y(i,:,:) = repmat(tr_memberships(I(1),:),[1,1,k_n]);
		continue;
	end

	D = D(I(1:max_k),:);

	% The following line should be 
	% D = D.^(-2/(m-1));
	% But, since the D calculation does not include sqrt expression,
	% it is necessary to keep it as the one below.
	D = D.^(-1/(m-1));
	TR_L = tr_memberships(I(1:max_k),:);

	% Cumulative sum of the distances between the testing sample and the k nearest 
	% ones in the training set is calculated
	CumSum_DIST = cumsum(D,1);
	CumSum_MULT = cumsum(TR_L.*repmat(D,[1,class_n]),1);

	% Membership values are calculated with the help of cumulative sum of the distances
	for k_val=1:k_n
		y(i,:,k_val) = CumSum_MULT(k(k_val),:) / CumSum_DIST(k(k_val));
	end
end

for i=1:k_n
	predict_class(:,1,i) = likelihood2class(y(:,:,i));
end


function classes = likelihood2class(likelihoods)
% LIKELIHOODS TO CLASSES
%
% classes = likelihood2class(likelihoods)
%
%  Find the class assignment of the samples from the likelihoods
%  'likelihoods' an NxD matrix where N is the number of samples and
%  D is the dimension of the feature space. 'likelihoods(i,j)' is
%  the i-th samples likelihood of belonging to class-j.
%
%  'classes' contains the class index of the each sample maximum likelihood

[sample_n,class_n] = size(likelihoods);
maxs = (likelihoods==repmat(max(likelihoods,[],2),[1,class_n]));

classes=zeros(sample_n,1);
for i=1:sample_n
    classes(i) = find(maxs(i,:),1);
end


