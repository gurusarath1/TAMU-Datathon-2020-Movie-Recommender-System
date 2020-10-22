clear all
load 'my_model.mat'


valset = imread(valset);
%valset = imread('C:\Users\gurus\Desktop\Movie_poster\Validation\2.3_82815.jpg');
valset = imresize(valset, [30, 30]);
valset = reshape(valset, [1, 2700]);
valset = double(valset);
encoded_images_val = encode(autoenc, valset');
encoded_images_val = encoded_images_val';
num_images_val = size(valset);
num_images_val = num_images_val(1);
num_images_train = size(dataset);
num_images_train = num_images_train(1);
errors = zeros(num_images_train, 1);
selected_val_image = 1;

for i = 1:num_images_train
    errors(i,1) = sum( (encoded_image(i,:) - encoded_images_val(selected_val_image,:)).^2 );
end

figure(1);
img = readimage(imds_2, selected_val_image);
imshow(img);

figure(2);
[x , best_image_index] = min(errors);
img = readimage(imds, best_image_index);
imshow(img);
errors(best_image_index) = max(errors) + 1;
