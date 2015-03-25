Seg.m
Segmented the target digits area

slidinggH.m
Horizontally sliding through the image, and give out the result of this number  

Lenet.m
Predict the what number it is, and give out the 3 outputs, valide,value,score

Test_32_32_data
Test the slidingH.m on the SVHN gound truth data

Compare.m
Compare the data style from SVHN, Mnist, and Andrew Ng’data 
Try to find out the reason why the final output has a huge error rate at the first try,, after I rotate the image, the result is very accurate.

Test_my_own.m
Test my own hand written digits to see test the accuracy of caffe

/test_Mnist_data/project.m
Test caffe on its own test data

/caffe_andrew/project.m
Test caffe on Hand written digits data from Stanford machine learning online course

Add_noise.m
Try to analysis the original test data which has been added different scale of Gaussian white  noise

normalize.m this is used for normalize the intensity of image proportionaly to 0:255


packge from the internet: soft-thresholding-for-image-segmentation
http://www.mathworks.com/matlabcentral/fileexchange/36918-soft-thresholding-for-image-segmentation

test_32x32 SVHN data cropped house number
http://ufldl.stanford.edu/housenumbers/test_32x32.mat

hand-written digits from Andrew Ng's class, I use this as a test data.
https://www.dropbox.com/s/sh8c6qz0q9y8x08/handwrittendigits.mat?dl=0

Mnist data it has the image and ground truth.
https://www.dropbox.com/s/kt5fpklvyddvwab/mnist_all.mat?dl=0




caffe.mexa64 
caffe mex file for matlab

matcaffe_init.m
help initiat caffe
